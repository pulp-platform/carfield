// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Yvan Tortorella <yvan.tortorella@unibo.it>

`include "register_interface/typedef.svh"

module hyperbus_wrap #(
  parameter int unsigned NumChips        = -1,
  parameter int unsigned NumPhys         = 2,
  parameter int unsigned IsClockODelayed = 0,
  parameter int unsigned AxiAddrWidth    = -1,
  parameter int unsigned AxiDataWidth    = -1,
  parameter int unsigned AxiIdWidth      = -1,
  parameter int unsigned AxiUserWidth    = -1,
  parameter int unsigned AxiMaxTrans     = 0 ,
  parameter type         axi_req_t       = logic,
  parameter type         axi_rsp_t       = logic,
  parameter type         axi_w_chan_t    = logic,
  parameter type         axi_b_chan_t    = logic,
  parameter type         axi_ar_chan_t   = logic,
  parameter type         axi_r_chan_t    = logic,
  parameter type         axi_aw_chan_t   = logic,
  parameter int unsigned RegAddrWidth    = -1,
  parameter int unsigned RegDataWidth    = -1,
  parameter type         reg_req_t       = logic,
  parameter type         reg_rsp_t       = logic,
  parameter type reg_addr_t              = logic [RegAddrWidth-1:0],
  parameter type reg_data_t              = logic [RegDataWidth-1:0],
  parameter type reg_strb_t              = logic [RegDataWidth/8-1:0],
  // The below have sensible defaults, but should be set on integration!
  parameter int unsigned RxFifoLogDepth  = 2,
  parameter int unsigned TxFifoLogDepth  = 2,
  parameter logic [RegDataWidth-1:0] RstChipBase  = 'h0,      // Base address for all chips
  parameter logic [RegDataWidth-1:0] RstChipSpace = 'h1_0000, // 64 KiB: Current maximum H
                                                              // yperBus device size
  parameter int unsigned PhyStartupCycles = 300 * 200, /* us*MHz */
                                                       // Conservative maximum
                                                       // frequency estimate
  parameter int unsigned AxiLogDepth     = 3,
  parameter int unsigned AxiSlaveArWidth = 0,
  parameter int unsigned AxiSlaveAwWidth = 0,
  parameter int unsigned AxiSlaveBWidth  = 0,
  parameter int unsigned AxiSlaveRWidth  = 0,
  parameter int unsigned AxiSlaveWWidth  = 0
)(
  input  logic clk_i         ,
  input  logic rst_ni        ,
  input  logic test_mode_i   ,
  // AXI bus
  input  logic [AxiSlaveArWidth-1:0] axi_slave_ar_data_i,
  input  logic [      AxiLogDepth:0] axi_slave_ar_wptr_i,
  output logic [      AxiLogDepth:0] axi_slave_ar_rptr_o,
  input  logic [AxiSlaveAwWidth-1:0] axi_slave_aw_data_i,
  input  logic [      AxiLogDepth:0] axi_slave_aw_wptr_i,
  output logic [      AxiLogDepth:0] axi_slave_aw_rptr_o,
  output logic [ AxiSlaveBWidth-1:0] axi_slave_b_data_o,
  output logic [      AxiLogDepth:0] axi_slave_b_wptr_o,
  input  logic [      AxiLogDepth:0] axi_slave_b_rptr_i,
  output logic [ AxiSlaveRWidth-1:0] axi_slave_r_data_o,
  output logic [      AxiLogDepth:0] axi_slave_r_wptr_o,
  input  logic [      AxiLogDepth:0] axi_slave_r_rptr_i,
  input  logic [ AxiSlaveWWidth-1:0] axi_slave_w_data_i,
  input  logic [      AxiLogDepth:0] axi_slave_w_wptr_i,
  output logic [      AxiLogDepth:0] axi_slave_w_rptr_o,
  // Reg bus
  input  reg_addr_t                   rbus_req_addr_i,
  input  logic                        rbus_req_write_i,
  input  reg_data_t                   rbus_req_wdata_i,
  input  reg_strb_t                   rbus_req_wstrb_i,
  input  logic                        rbus_req_valid_i,
  output reg_data_t                   rbus_rsp_rdata_o,
  output logic                        rbus_rsp_ready_o,
  output logic                        rbus_rsp_error_o,
  // Physical interace: HyperBus PADs
  inout  [NumPhys-1:0][NumChips-1:0] pad_hyper_csn,
  inout  [NumPhys-1:0]               pad_hyper_ck,
  inout  [NumPhys-1:0]               pad_hyper_ckn,
  inout  [NumPhys-1:0]               pad_hyper_rwds,
  inout  [NumPhys-1:0]               pad_hyper_reset,
  inout  [NumPhys-1:0][7:0]          pad_hyper_dq
);

reg_req_t   reg_req;
reg_rsp_t   reg_rsp;

typedef struct packed {
  logic [31:0]             idx;
  logic [AxiAddrWidth-1:0] start_addr;
  logic [AxiAddrWidth-1:0] end_addr;
} addr_rule_t;

axi_req_t hyper_req;
axi_rsp_t hyper_rsp;

axi_cdc_dst      #(
  .LogDepth       ( AxiLogDepth   ),
  .aw_chan_t      ( axi_aw_chan_t ),
  .w_chan_t       ( axi_w_chan_t  ),
  .b_chan_t       ( axi_b_chan_t  ),
  .ar_chan_t      ( axi_ar_chan_t ),
  .r_chan_t       ( axi_r_chan_t  ),
  .axi_req_t      ( axi_req_t     ),
  .axi_resp_t     ( axi_rsp_t     )
) i_hyper_cdc_dst (
  // asynchronous slave port
  .async_data_slave_aw_data_i ( axi_slave_aw_data_i ),
  .async_data_slave_aw_wptr_i ( axi_slave_aw_wptr_i ),
  .async_data_slave_aw_rptr_o ( axi_slave_aw_rptr_o ),
  .async_data_slave_w_data_i  ( axi_slave_w_data_i  ),
  .async_data_slave_w_wptr_i  ( axi_slave_w_wptr_i  ),
  .async_data_slave_w_rptr_o  ( axi_slave_w_rptr_o  ),
  .async_data_slave_b_data_o  ( axi_slave_b_data_o  ),
  .async_data_slave_b_wptr_o  ( axi_slave_b_wptr_o  ),
  .async_data_slave_b_rptr_i  ( axi_slave_b_rptr_i  ),
  .async_data_slave_ar_data_i ( axi_slave_ar_data_i ),
  .async_data_slave_ar_wptr_i ( axi_slave_ar_wptr_i ),
  .async_data_slave_ar_rptr_o ( axi_slave_ar_rptr_o ),
  .async_data_slave_r_data_o  ( axi_slave_r_data_o  ),
  .async_data_slave_r_wptr_o  ( axi_slave_r_wptr_o  ),
  .async_data_slave_r_rptr_i  ( axi_slave_r_rptr_i  ),
  // synchronous master port
  .dst_clk_i                  ( clk_i     ),
  .dst_rst_ni                 ( rst_ni    ),
  .dst_req_o                  ( hyper_req ),
  .dst_resp_i                 ( hyper_rsp )
);

logic [NumPhys-1:0][NumChips-1:0] hyper_cs_n_wire;
logic [NumPhys-1:0][NumChips-1:0] hyper_cs_pen_wire;
logic [NumPhys-1:0][NumChips-1:0] hyper_cs_pad_out;
logic [NumPhys-1:0]               hyper_ck_wire;
logic [NumPhys-1:0]               hyper_ck_out_wire;
logic [NumPhys-1:0]               hyper_ck_pen_wire;
logic [NumPhys-1:0]               hyper_ck_n_wire;
logic [NumPhys-1:0]               hyper_ck_n_out_wire;
logic [NumPhys-1:0]               hyper_ck_n_pen_wire;
logic [NumPhys-1:0]               hyper_rwds_o;
logic [NumPhys-1:0]               hyper_rwds_i;
logic [NumPhys-1:0]               hyper_rwds_oe;
logic [NumPhys-1:0]               hyper_rwds_pen;
logic [NumPhys-1:0][7:0]          hyper_dq_i;
logic [NumPhys-1:0][7:0]          hyper_dq_o;
logic [NumPhys-1:0][7:0]          hyper_dq_pen;
logic [NumPhys-1:0]               hyper_dq_oe;
logic [NumPhys-1:0]               hyper_reset_n_wire;
logic [NumPhys-1:0]               hyper_rst_n_out_wire;
logic [NumPhys-1:0]               hyper_rst_n_pen_wire;

assign reg_req.addr         = rbus_req_addr_i;
assign reg_req.write        = rbus_req_write_i;
assign reg_req.wdata        = rbus_req_wdata_i;
assign reg_req.wstrb        = rbus_req_wstrb_i;
assign reg_req.valid        = rbus_req_valid_i;
assign rbus_rsp_rdata_o     = reg_rsp.rdata;
assign rbus_rsp_ready_o     = reg_rsp.ready;
assign rbus_rsp_error_o     = reg_rsp.error;

hyperbus           #(
  .NumChips         ( NumChips         ),
  .NumPhys          ( NumPhys          ),
  .IsClockODelayed  ( IsClockODelayed  ),
  .AxiAddrWidth     ( AxiAddrWidth     ),
  .AxiDataWidth     ( AxiDataWidth     ),
  .AxiIdWidth       ( AxiIdWidth       ),
  .AxiUserWidth     ( AxiUserWidth     ),
  .axi_req_t        ( axi_req_t        ),
  .axi_rsp_t        ( axi_rsp_t        ),
  .RegAddrWidth     ( RegAddrWidth     ),
  .RegDataWidth     ( RegDataWidth     ),
  .reg_req_t        ( reg_req_t        ),
  .reg_rsp_t        ( reg_rsp_t        ),
  .axi_rule_t       ( addr_rule_t      ),
  .RxFifoLogDepth   ( RxFifoLogDepth   ),
  .TxFifoLogDepth   ( TxFifoLogDepth   ),
  .RstChipBase      ( RstChipBase      ),
  .RstChipSpace     ( RstChipSpace     ),
  .PhyStartupCycles ( PhyStartupCycles ),
  .AxiLogDepth      ( AxiLogDepth      )
) i_hyperbus        (
  .clk_phy_i        ( clk_i              ),
  .rst_phy_ni       ( rst_ni             ),
  .clk_sys_i        ( clk_i              ),
  .rst_sys_ni       ( rst_ni             ),
  .test_mode_i      ( test_mode_i        ),
  .axi_req_i        ( hyper_req          ),
  .axi_rsp_o        ( hyper_rsp          ),
  .reg_req_i        ( reg_req            ),
  .reg_rsp_o        ( reg_rsp            ),
  .hyper_cs_no      ( hyper_cs_n_wire    ),
  .hyper_ck_o       ( hyper_ck_wire      ),
  .hyper_ck_no      ( hyper_ck_n_wire    ),
  .hyper_rwds_o     ( hyper_rwds_o       ),
  .hyper_rwds_i     ( hyper_rwds_i       ),
  .hyper_rwds_oe_o  ( hyper_rwds_oe      ),
  .hyper_dq_i       ( hyper_dq_i         ),
  .hyper_dq_o       ( hyper_dq_o         ),
  .hyper_dq_oe_o    ( hyper_dq_oe        ),
  .hyper_reset_no   ( hyper_reset_n_wire )
);

for (genvar i = 0 ; i<NumPhys; i++) begin : gen_hyper_phy
  for (genvar j = 0; j<NumChips; j++) begin : gen_hyper_cs
    pad_functional_pd padinst_hyper_csno (
      .OEN ( 1'b0                    ),
      .I   ( hyper_cs_n_wire[i][j]   ),
      .O   ( hyper_cs_pad_out[i][j]  ),
      .PEN ( hyper_cs_pen_wire[i][j] ),
      .PAD ( pad_hyper_csn[i][j]     )
    );
  end
  pad_functional_pd padinst_hyper_ck (
    .OEN ( 1'b0                 ),
    .I   ( hyper_ck_wire[i]     ),
    .O   ( hyper_ck_out_wire[i] ),
    .PEN ( hyper_ck_pen_wire[i] ),
    .PAD ( pad_hyper_ck[i]      )
  );
  pad_functional_pd padinst_hyper_ckno   (
    .OEN ( 1'b0                   ),
    .I   ( hyper_ck_n_wire[i]     ),
    .O   ( hyper_ck_n_out_wire[i] ),
    .PEN ( hyper_ck_n_pen_wire[i] ),
    .PAD ( pad_hyper_ckn[i]       )
  );
  pad_functional_pd padinst_hyper_rwds0  (
    .OEN (~hyper_rwds_oe[i]  ),
    .I   ( hyper_rwds_o[i]   ),
    .O   ( hyper_rwds_i[i]   ),
    .PEN ( hyper_rwds_pen[i] ),
    .PAD ( pad_hyper_rwds[i] )
  );
  pad_functional_pd padinst_hyper_resetn (
    .OEN ( 1'b0                    ),
    .I   ( hyper_reset_n_wire[i]   ),
    .O   ( hyper_rst_n_out_wire[i] ),
    .PEN ( hyper_rst_n_pen_wire[i] ),
    .PAD ( pad_hyper_reset[i]      )
  );
  for (genvar j = 0; j < 8; j++) begin : gen_hyper_dq
    pad_functional_pd padinst_hyper_dqio0  (
      .OEN (~hyper_dq_oe[i]     ),
      .I   ( hyper_dq_o[i][j]   ),
      .O   ( hyper_dq_i[i][j]   ),
      .PEN ( hyper_dq_pen[i][j] ),
      .PAD ( pad_hyper_dq[i][j] )
    );
  end
end

endmodule: hyperbus_wrap
