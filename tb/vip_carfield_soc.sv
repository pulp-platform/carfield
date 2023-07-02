// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

// collects all existing verification ip (vip) for carfield SoC

module vip_carfield_soc
  import carfield_pkg::*;
  import cheshire_pkg::*;
#(
  // DUT
  parameter cheshire_cfg_t DutCfg = carfield_pkg::CarfieldCfgDefault,
  parameter type         axi_slv_ext_req_t = logic,
  parameter type         axi_slv_ext_rsp_t = logic,
  parameter int unsigned HypNumPhys  = 2,
  parameter int unsigned HypNumChips = 2,
  // Timing
  parameter time         ClkPeriodSys      = 5ns,
  parameter time         ClkPeriodJtag     = 20ns,
  parameter time         ClkPeriodRtc      = 30518ns,
  parameter int unsigned RstCycles         = 5,
  parameter real         TAppl             = 0.1,
  parameter real         TTest             = 0.9,
  // External AXI ports
  parameter int unsigned NumAxiExtSlvPorts = 4,
  // Serial Link
  parameter int unsigned SlinkMaxWaitAx    = 100,
  parameter int unsigned SlinkMaxWaitR     = 5,
  parameter int unsigned SlinkMaxWaitResp  = 20,
  parameter int unsigned SlinkBurstBytes   = 1024,
  parameter bit          SlinkAxiDebug     = 0,
  // Derived Parameters; *do not override*
  parameter int unsigned AxiStrbWidth      = DutCfg.AxiDataWidth/8,
  parameter int unsigned AxiStrbBits       = $clog2(DutCfg.AxiDataWidth/8)
) (
  output logic       clk_vip,
  output logic       rst_n_vip,
  // Hyperbus interface
  wire [HypNumPhys-1:0][HypNumChips-1:0] pad_hyper_csn,
  wire [HypNumPhys-1:0]                  pad_hyper_ck,
  wire [HypNumPhys-1:0]                  pad_hyper_ckn,
  wire [HypNumPhys-1:0]                  pad_hyper_rwds,
  wire [HypNumPhys-1:0]                  pad_hyper_reset,
  wire [HypNumPhys-1:0][7:0]             pad_hyper_dq,
  // External virtual AXI ports
  input  axi_slv_ext_req_t [NumAxiExtSlvPorts-1:0] axi_slvs_req,
  output axi_slv_ext_rsp_t [NumAxiExtSlvPorts-1:0] axi_slvs_rsp,
  // Multiplexed virtual AXI ports
  output axi_slv_ext_req_t axi_muxed_req,
  input  axi_slv_ext_rsp_t axi_muxed_rsp
);

  `include "cheshire/typedef.svh"
  `include "axi/assign.svh"

  `CHESHIRE_TYPEDEF_ALL(, DutCfg)

  ///////////////////////////////
  //  SoC Clock, Reset, Modes  //
  ///////////////////////////////

  logic clk, rst_n;
  assign clk_vip   = clk;
  assign rst_n_vip = rst_n;

  clk_rst_gen #(
    .ClkPeriod    ( ClkPeriodSys ),
    .RstClkCycles ( RstCycles )
  ) i_clk_rst_sys (
    .clk_o  ( clk   ),
    .rst_no ( rst_n )
  );

  //////////////
  // Hyperbus //
  //////////////

  for (genvar i=0; i<HypNumPhys; i++) begin : hyperrams
    for (genvar j=0; j<HypNumChips; j++) begin : chips
      s27ks0641 #(
        /*.mem_file_name ( "s27ks0641.mem"    ),*/
        .TimingModel ( "S27KS0641DPBHI020"    )
      ) dut (
        .DQ7      ( pad_hyper_dq[i][7]  ),
        .DQ6      ( pad_hyper_dq[i][6]  ),
        .DQ5      ( pad_hyper_dq[i][5]  ),
        .DQ4      ( pad_hyper_dq[i][4]  ),
        .DQ3      ( pad_hyper_dq[i][3]  ),
        .DQ2      ( pad_hyper_dq[i][2]  ),
        .DQ1      ( pad_hyper_dq[i][1]  ),
        .DQ0      ( pad_hyper_dq[i][0]  ),
        .RWDS     ( pad_hyper_rwds[i]   ),
        .CSNeg    ( pad_hyper_csn[i][j] ),
        .CK       ( pad_hyper_ck[i]     ),
        .CKNeg    ( pad_hyper_ckn[i]    ),
        .RESETNeg ( pad_hyper_reset[i]  )
      );
    end
  end

  for (genvar p=0; p<HypNumPhys; p++) begin : sdf_annotation
     for (genvar l=0; l<HypNumChips; l++) begin : sdf_annotation
        initial begin
           automatic string sdf_file_path = "./tb/hyp_vip/s27ks0641_verilog.sdf";
           $sdf_annotate(sdf_file_path, hyperrams[p].chips[l].dut);
           $display("Mem (%d,%d)",p,l);
        end
    end
  end

  //////////////////////////////////////
  // AXI multiplexing and Serial Link //
  //////////////////////////////////////

  axi_mst_req_t slink_axi_mst_req, slink_axi_slv_req;
  axi_mst_rsp_t slink_axi_mst_rsp, slink_axi_slv_rsp;

  localparam int unsigned AxiMstMuxIdWidth = DutCfg.AxiMstIdWidth + $clog2(NumAxiExtSlvPorts);
  `AXI_TYPEDEF_ALL(slink_axi_mst_mux, logic[DutCfg.AddrWidth-1:0], logic[AxiMstMuxIdWidth-1:0],  logic[DutCfg.AxiDataWidth-1:0], logic[DutCfg.AxiDataWidth/8-1:0], logic[DutCfg.AxiUserWidth-1:0])

  slink_axi_mst_mux_req_t  slink_axi_mst_mux_req;
  slink_axi_mst_mux_resp_t slink_axi_mst_mux_rsp;

  axi_mux #(
    .SlvAxiIDWidth ( DutCfg.AxiMstIdWidth ),
    .slv_aw_chan_t ( axi_mst_aw_chan_t ),
    .mst_aw_chan_t ( slink_axi_mst_mux_aw_chan_t ),
    .w_chan_t      ( slink_axi_mst_mux_w_chan_t  ),
    .slv_b_chan_t  ( axi_mst_b_chan_t ),
    .mst_b_chan_t  ( slink_axi_mst_mux_b_chan_t ),
    .slv_ar_chan_t ( axi_mst_ar_chan_t ),
    .mst_ar_chan_t ( slink_axi_mst_mux_ar_chan_t ),
    .slv_r_chan_t  ( axi_mst_r_chan_t ),
    .mst_r_chan_t  ( slink_axi_mst_mux_r_chan_t ),
    .slv_req_t     ( axi_mst_req_t ),
    .slv_resp_t    ( axi_mst_rsp_t ),
    .mst_req_t     ( slink_axi_mst_mux_req_t ),
    .mst_resp_t    ( slink_axi_mst_mux_resp_t ),
    .NoSlvPorts    ( NumAxiExtSlvPorts ),
    .MaxWTrans     ( 8 ),
    .FallThrough   ( 1 )
  ) i_axi_mux_to_slink (
    .clk_i  ( clk ),
    .rst_ni ( rst_n ),
    .test_i ( '0 ),
    .slv_reqs_i  ( axi_slvs_req ),
    .slv_resps_o ( axi_slvs_rsp ),
    .mst_req_o   ( slink_axi_mst_mux_req ),
    .mst_resp_i  ( slink_axi_mst_mux_rsp )
  );

  // Remap ID width of the multiplexer output
  axi_id_remap #(
    .AxiSlvPortIdWidth    ( AxiMstMuxIdWidth ),
    .AxiSlvPortMaxUniqIds ( DutCfg.SlinkMaxUniqIds   ),
    .AxiMaxTxnsPerId      ( DutCfg.SlinkMaxTxnsPerId ),
    .AxiMstPortIdWidth    ( DutCfg.AxiMstIdWidth     ),
    .slv_req_t            ( slink_axi_mst_mux_req_t  ),
    .slv_resp_t           ( slink_axi_mst_mux_resp_t ),
    .mst_req_t            ( axi_mst_req_t ),
    .mst_resp_t           ( axi_mst_rsp_t )
  ) i_id_remap_slink (
    .clk_i      ( clk ),
    .rst_ni     ( rst_n ),
    .slv_req_i  ( slink_axi_mst_mux_req ),
    .slv_resp_o ( slink_axi_mst_mux_rsp ),
    .mst_req_o  ( axi_muxed_req ),
    .mst_resp_i ( axi_muxed_rsp )
  );

endmodule

module vip_carfield_soc_tristate import carfield_pkg::*; # (
  parameter int unsigned HypNumPhys  = 2,
  parameter int unsigned HypNumChips = 2
) (
  // Hyperbus pad IO
  input  logic [HypNumPhys-1:0][HypNumChips-1:0] hyper_cs_no,
  output logic [HypNumPhys-1:0]                  hyper_ck_i,
  input  logic [HypNumPhys-1:0]                  hyper_ck_o,
  output logic [HypNumPhys-1:0]                  hyper_ck_ni,
  input  logic [HypNumPhys-1:0]                  hyper_ck_no,
  input  logic [HypNumPhys-1:0]                  hyper_rwds_o,
  output logic [HypNumPhys-1:0]                  hyper_rwds_i,
  input  logic [HypNumPhys-1:0]                  hyper_rwds_oe_o,
  output logic [HypNumPhys-1:0][7:0]             hyper_dq_i,
  input  logic [HypNumPhys-1:0][7:0]             hyper_dq_o,
  input  logic [HypNumPhys-1:0]                  hyper_dq_oe_o,
  input  logic [HypNumPhys-1:0]                  hyper_reset_no,
  // Hyperbus wires
  wire [HypNumPhys-1:0][HypNumChips-1:0] pad_hyper_csn,
  wire [HypNumPhys-1:0]                  pad_hyper_ck,
  wire [HypNumPhys-1:0]                  pad_hyper_ckn,
  wire [HypNumPhys-1:0]                  pad_hyper_rwds,
  wire [HypNumPhys-1:0]                  pad_hyper_reset,
  wire [HypNumPhys-1:0][7:0]             pad_hyper_dq
);

  for (genvar i = 0 ; i<HypNumPhys; i++) begin : gen_hyper_phy
    for (genvar j = 0; j<HypNumChips; j++) begin : gen_hyper_cs
      pad_functional_pd padinst_hyper_csno (
        .OEN ( 1'b0                 ),
        .I   ( hyper_cs_no[i][j]    ),
        .O   (                      ),
        .PEN (                      ),
        .PAD ( pad_hyper_csn[i][j]  )
      );
    end
    pad_functional_pd padinst_hyper_ck (
      .OEN ( 1'b0            ),
      .I   ( hyper_ck_o[i]   ),
      .O   (                 ),
      .PEN (                 ),
      .PAD ( pad_hyper_ck[i] )
    );
    pad_functional_pd padinst_hyper_ckno   (
      .OEN ( 1'b0              ),
      .I   ( hyper_ck_no[i]    ),
      .O   (                   ),
      .PEN (                   ),
      .PAD ( pad_hyper_ckn[i]  )
    );
    pad_functional_pd padinst_hyper_rwds0  (
      .OEN (~hyper_rwds_oe_o[i] ),
      .I   ( hyper_rwds_o[i]    ),
      .O   ( hyper_rwds_i[i]    ),
      .PEN (                    ),
      .PAD ( pad_hyper_rwds[i]  )
    );
    pad_functional_pd padinst_hyper_resetn (
      .OEN ( 1'b0               ),
      .I   ( hyper_reset_no[i]  ),
      .O   (                    ),
      .PEN (                    ),
      .PAD ( pad_hyper_reset[i] )
    );
    for (genvar j = 0; j < 8; j++) begin : gen_hyper_dq
      pad_functional_pd padinst_hyper_dqio0  (
        .OEN (~hyper_dq_oe_o[i]   ),
        .I   ( hyper_dq_o[i][j]   ),
        .O   ( hyper_dq_i[i][j]   ),
        .PEN (                    ),
        .PAD ( pad_hyper_dq[i][j] )
      );
    end
  end : gen_hyper_phy

endmodule
