// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// L2 Memory Wrapper
// Yvan Tortorella <yvan.tortorella@unibo.it>

`include "axi/typedef.svh"
module l2_wrap
  import carfield_pkg::*;
  import axi_pkg::*;
  import dyn_mem_pkg::*;
#(
  parameter cheshire_pkg::cheshire_cfg_t Cfg = CarfieldCfgDefault,
  /// AXI Ports settings
  parameter int unsigned NumPort      = 2,
  parameter int unsigned AxiAddrWidth = 48,
  parameter int unsigned AxiDataWidth = 64,
  parameter int unsigned AxiIdWidth   = 5,
  parameter int unsigned AxiUserWidth = 1,
  parameter int unsigned AxiMaxTrans  = 8,
  parameter int unsigned LogDepth     = 3,
  parameter int unsigned CdcSyncStages  = 2,
  parameter int unsigned L2MaxReadTxns  = 8,
  parameter int unsigned L2MaxWriteTxns = 8,
  parameter int unsigned AxiUserAmoMsb  = 1,
  parameter int unsigned AxiUserAmoLsb  = 0,
  parameter int unsigned L2AmoNumCuts   = 1,
  /// ECC Reg Bus
  parameter type         l2_ecc_reg_req_t = logic,
  parameter type         l2_ecc_reg_rsp_t = logic,
  /// Mapping rules
  parameter int unsigned NumRules   = dyn_mem_pkg::NUM_MAP_TYPES * NumPort,
  /// L2 Memory settings
  parameter int unsigned L2MemSize  = 2**20,
  /// Non-changable parameters
  localparam int unsigned AxiStrbWidth    = AxiDataWidth / 8,
  // CDC Parameters
  localparam int unsigned AwWidth =
                         (2**LogDepth)*axi_pkg::aw_width(AxiAddrWidth,
                                                         AxiIdWidth  ,
                                                         AxiUserWidth),
  localparam int unsigned WWidth  =
                          (2**LogDepth)*axi_pkg::w_width(AxiDataWidth,
                                                         AxiUserWidth),
  localparam int unsigned RWidth  =
                          (2**LogDepth)*axi_pkg::r_width(AxiDataWidth,
                                                         AxiIdWidth  ,
                                                         AxiUserWidth),
  localparam int unsigned BWidth  =
                          (2**LogDepth)*axi_pkg::b_width(AxiIdWidth  ,
                                                         AxiUserWidth),
  localparam int unsigned ArWidth =
                          (2**LogDepth)*axi_pkg::ar_width(AxiAddrWidth,
                                                          AxiIdWidth  ,
                                                          AxiUserWidth)
)(
  input  logic                            clk_i            ,
  input  logic                            rst_ni           ,
  input  logic                            pwr_on_rst_ni    ,
  input  logic [NumPort-1:0][ArWidth-1:0] slvport_ar_data_i,
  input  logic [NumPort-1:0][ LogDepth:0] slvport_ar_wptr_i,
  output logic [NumPort-1:0][ LogDepth:0] slvport_ar_rptr_o,
  input  logic [NumPort-1:0][AwWidth-1:0] slvport_aw_data_i,
  input  logic [NumPort-1:0][ LogDepth:0] slvport_aw_wptr_i,
  output logic [NumPort-1:0][ LogDepth:0] slvport_aw_rptr_o,
  output logic [NumPort-1:0][ BWidth-1:0] slvport_b_data_o ,
  output logic [NumPort-1:0][ LogDepth:0] slvport_b_wptr_o ,
  input  logic [NumPort-1:0][ LogDepth:0] slvport_b_rptr_i ,
  output logic [NumPort-1:0][ RWidth-1:0] slvport_r_data_o ,
  output logic [NumPort-1:0][ LogDepth:0] slvport_r_wptr_o ,
  input  logic [NumPort-1:0][ LogDepth:0] slvport_r_rptr_i ,
  input  logic [NumPort-1:0][ WWidth-1:0] slvport_w_data_i ,
  input  logic [NumPort-1:0][ LogDepth:0] slvport_w_wptr_i ,
  output logic [NumPort-1:0][ LogDepth:0] slvport_w_rptr_o ,
  input  logic                            l2_ecc_reg_async_mst_req_i,
  output logic                            l2_ecc_reg_async_mst_ack_o,
  input  l2_ecc_reg_req_t                 l2_ecc_reg_async_mst_data_i,
  output logic                            l2_ecc_reg_async_mst_req_o,
  input  logic                            l2_ecc_reg_async_mst_ack_i,
  output l2_ecc_reg_rsp_t                 l2_ecc_reg_async_mst_data_o,
  output logic                            ecc_error_o
);

// verilog_lint: waive-start line-length
`AXI_TYPEDEF_ALL_CT(axi_async, axi_async_req_t, axi_async_rsp_t, logic [AxiAddrWidth-1:0], logic [  AxiIdWidth-1:0], logic [AxiDataWidth-1:0], logic [AxiStrbWidth-1:0], logic [AxiUserWidth-1:0])
// verilog_lint: waive-stop line-length

axi_async_req_t [NumPort-1:0] axi_async_req;
axi_async_rsp_t [NumPort-1:0] axi_async_rsp;

for (genvar i = 0; i < NumPort; i++) begin: gen_cdc_fifos
  axi_cdc_dst #(
    .LogDepth   ( LogDepth            ),
    .SyncStages ( CdcSyncStages       ),
    .aw_chan_t  ( axi_async_aw_chan_t ),
    .w_chan_t   ( axi_async_w_chan_t  ),
    .b_chan_t   ( axi_async_b_chan_t  ),
    .ar_chan_t  ( axi_async_ar_chan_t ),
    .r_chan_t   ( axi_async_r_chan_t  ),
    .axi_req_t  ( axi_async_req_t     ),
    .axi_resp_t ( axi_async_rsp_t     )
  ) i_dst_cdc   (
    // asynchronous slave port
    .async_data_slave_aw_data_i ( slvport_aw_data_i [i] ),
    .async_data_slave_aw_wptr_i ( slvport_aw_wptr_i [i] ),
    .async_data_slave_aw_rptr_o ( slvport_aw_rptr_o [i] ),
    .async_data_slave_w_data_i  ( slvport_w_data_i  [i] ),
    .async_data_slave_w_wptr_i  ( slvport_w_wptr_i  [i] ),
    .async_data_slave_w_rptr_o  ( slvport_w_rptr_o  [i] ),
    .async_data_slave_b_data_o  ( slvport_b_data_o  [i] ),
    .async_data_slave_b_wptr_o  ( slvport_b_wptr_o  [i] ),
    .async_data_slave_b_rptr_i  ( slvport_b_rptr_i  [i] ),
    .async_data_slave_ar_data_i ( slvport_ar_data_i [i] ),
    .async_data_slave_ar_wptr_i ( slvport_ar_wptr_i [i] ),
    .async_data_slave_ar_rptr_o ( slvport_ar_rptr_o [i] ),
    .async_data_slave_r_data_o  ( slvport_r_data_o  [i] ),
    .async_data_slave_r_wptr_o  ( slvport_r_wptr_o  [i] ),
    .async_data_slave_r_rptr_i  ( slvport_r_rptr_i  [i] ),
    // synchronous master port
    .dst_clk_i  ( clk_i             ),
    .dst_rst_ni ( pwr_on_rst_ni     ),
    .dst_req_o  ( axi_async_req [i] ),
    .dst_resp_i ( axi_async_rsp [i] )
  );
end

l2_ecc_reg_req_t l2_ecc_reg_req;
l2_ecc_reg_rsp_t l2_ecc_reg_rsp;

reg_cdc_dst #(
    .CDC_KIND ( "cdc_4phase" ),
    .req_t     ( l2_ecc_reg_req_t ),
    .rsp_t     ( l2_ecc_reg_rsp_t )
 ) i_reg_cdc_dst (
     .dst_clk_i   ( clk_i                       ),
     .dst_rst_ni  ( pwr_on_rst_ni               ),
     .dst_req_o   ( l2_ecc_reg_req              ),
     .dst_rsp_i   ( l2_ecc_reg_rsp              ),

     .async_req_i ( l2_ecc_reg_async_mst_req_i  ),
     .async_ack_o ( l2_ecc_reg_async_mst_ack_o  ),
     .async_data_i( l2_ecc_reg_async_mst_data_i ),

     .async_req_o ( l2_ecc_reg_async_mst_req_o  ),
     .async_ack_i ( l2_ecc_reg_async_mst_ack_i  ),
     .async_data_o( l2_ecc_reg_async_mst_data_o )
 );

typedef struct packed {
  int unsigned             idx;
  logic [AxiAddrWidth-1:0] start_addr;
  logic [AxiAddrWidth-1:0] end_addr;
} map_rule_t;

localparam map_rule_t [NumRules-1:0] MappingRules = '{
  '{idx       : dyn_mem_pkg::INTERLEAVE  ,
    start_addr: L2Port0Base             ,
    end_addr  : L2Port0Base + L2MemSize},
  '{idx       : dyn_mem_pkg::NONE_INTER           ,
    start_addr: L2Port0NonInterlBase             ,
    end_addr  : L2Port0NonInterlBase + L2MemSize},
  '{idx       : dyn_mem_pkg::INTERLEAVE ,
    start_addr: L2Port1Base            ,
    end_addr  : L2Port1Base + L2MemSize},
  '{idx       : dyn_mem_pkg::NONE_INTER          ,
    start_addr: L2Port1NonInterlBase            ,
    end_addr  : L2Port1NonInterlBase + L2MemSize}
};

dyn_mem_top #(
  .NUM_PORT            ( NumPort         ),
  .AXI_ADDR_WIDTH      ( AxiAddrWidth    ),
  .AXI_DATA_WIDTH      ( AxiDataWidth    ),
  .AXI_ID_WIDTH        ( AxiIdWidth      ),
  .AXI_USER_WIDTH      ( AxiUserWidth    ),
  .NUM_MAP_RULES       ( NumRules        ),
  .L2_MEM_SIZE_IN_BYTE ( L2MemSize       ),
  .map_rule_t          ( map_rule_t      ),
  .ATM_MAX_READ_TXN    ( L2MaxReadTxns   ),
  .ATM_MAX_WRIT_TXN    ( L2MaxWriteTxns  ),
  .ATM_USER_AS_ID      ( 1               ),
  .ATM_USER_ID_MSB     ( AxiUserAmoMsb   ),
  .ATM_USER_ID_LSB     ( AxiUserAmoLsb   ),
  .ATM_RISCV_WORD      ( 64              ),
  .ATM_NUM_CUTS        ( L2AmoNumCuts    ),
  .AXI_USER_ECC_ERR    ( 1'b1            ),
  .AXI_USER_ECC_ERR_BIT( Cfg.AxiUserErrLsb ),
  .l2_ecc_reg_req_t    ( l2_ecc_reg_req_t),
  .l2_ecc_reg_rsp_t    ( l2_ecc_reg_rsp_t),
  .axi_req_t           ( axi_async_req_t ),
  .axi_resp_t          ( axi_async_rsp_t )
) i_l2_top             (
  .clk_i               ( clk_i           ),
  .rst_ni              ( rst_ni          ),
  .mapping_rules_i     ( MappingRules    ),
  .axi_req_i           ( axi_async_req   ),
  .axi_resp_o          ( axi_async_rsp   ),
  .l2_ecc_reg_req_i    ( l2_ecc_reg_req  ),
  .l2_ecc_reg_rsp_o    ( l2_ecc_reg_rsp  )
);

// Signal tied to avoid changing the interface
assign ecc_error_o = '0;

endmodule: l2_wrap
