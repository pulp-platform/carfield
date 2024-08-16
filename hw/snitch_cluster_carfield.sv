// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Cyril Koenig <cykoenig@iis.ee.ethz.ch>

`include "axi/typedef.svh"
`include "register_interface/assign.svh"
`include "register_interface/typedef.svh"
`include "common_cells/registers.svh"

module snitch_cluster_carfield
 #(
  parameter int unsigned AxiAddrWidth     = 48,
  parameter int unsigned AxiDataWidth     = 64,
  parameter int unsigned AxiUserWidth     = 10,
  parameter int unsigned AxiInIdWidth     = 6,
  parameter int unsigned AxiOutIdWidth    = 2,
  parameter int unsigned IwcAxiIdOutWidth = 3, // Unused
  parameter int unsigned LogDepth         = 3,
  parameter int unsigned CdcSyncStages    = 2,
  parameter int unsigned SyncStages       = 3,
  parameter int unsigned AxiMaxOutTrans   = 4,
  // In channel
  parameter type axi_in_resp_t    = logic,
  parameter type axi_in_req_t     = logic,
  parameter type axi_in_aw_chan_t = logic,
  parameter type axi_in_w_chan_t  = logic,
  parameter type axi_in_b_chan_t  = logic,
  parameter type axi_in_ar_chan_t = logic,
  parameter type axi_in_r_chan_t  = logic,
  // Out channel
  parameter type axi_out_resp_t    = logic,
  parameter type axi_out_req_t     = logic,
  parameter type axi_out_aw_chan_t = logic,
  parameter type axi_out_w_chan_t  = logic,
  parameter type axi_out_b_chan_t  = logic,
  parameter type axi_out_ar_chan_t = logic,
  parameter type axi_out_r_chan_t  = logic,
  // AXI Master
  parameter int unsigned AsyncAxiOutAwWidth = (2**LogDepth)*
                                               axi_pkg::aw_width(AxiAddrWidth ,
                                                                 AxiOutIdWidth,
                                                                 AxiUserWidth ),
  parameter int unsigned AsyncAxiOutWWidth  = (2**LogDepth)*
                                               axi_pkg::w_width(AxiDataWidth,
                                                                AxiUserWidth),
  parameter int unsigned AsyncAxiOutBWidth  = (2**LogDepth)*
                                               axi_pkg::b_width(AxiOutIdWidth,
                                                                AxiUserWidth ),
  parameter int unsigned AsyncAxiOutArWidth = (2**LogDepth)*
                                               axi_pkg::ar_width(AxiAddrWidth ,
                                                                 AxiOutIdWidth,
                                                                 AxiUserWidth ),
  parameter int unsigned AsyncAxiOutRWidth  = (2**LogDepth)*
                                               axi_pkg::r_width(AxiDataWidth ,
                                                                AxiOutIdWidth,
                                                                AxiUserWidth ),
  // AXI Slave
  parameter int unsigned AsyncAxiInAwWidth = (2**LogDepth)*
                                              axi_pkg::aw_width(AxiAddrWidth,
                                                                AxiInIdWidth,
                                                                AxiUserWidth),
  parameter int unsigned AsyncAxiInWWidth  = (2**LogDepth)*
                                              axi_pkg::w_width(AxiDataWidth,
                                                               AxiUserWidth),
  parameter int unsigned AsyncAxiInBWidth  = (2**LogDepth)*
                                              axi_pkg::b_width(AxiInIdWidth,
                                                               AxiUserWidth),
  parameter int unsigned AsyncAxiInArWidth = (2**LogDepth)*
                                              axi_pkg::ar_width(AxiAddrWidth,
                                                                AxiInIdWidth,
                                                                AxiUserWidth),
  parameter int unsigned AsyncAxiInRWidth  = (2**LogDepth)*
                                              axi_pkg::r_width(AxiDataWidth,
                                                               AxiInIdWidth,
                                                               AxiUserWidth),
  // Local parameters
  localparam int unsigned AxiStrbWidth = AxiDataWidth / 8
)(
  input  logic                clk_i,
  input  logic                rst_ni,
  input  logic [9-1:0] debug_req_i,

  input  logic [9-1:0] meip_i,
  input  logic [9-1:0] mtip_i,
  input  logic [9-1:0] msip_i,
  output logic                          cluster_probe_o,
  input  logic axi_isolate_i,
  output logic axi_isolated_o,
  input  logic                          pwr_on_rst_ni,

  // AXI Master port
  output logic [AsyncAxiOutAwWidth-1:0] async_axi_out_aw_data_o,
  output logic [LogDepth:0]             async_axi_out_aw_wptr_o,
  input  logic [LogDepth:0]             async_axi_out_aw_rptr_i,
  output logic [AsyncAxiOutWWidth-1:0]  async_axi_out_w_data_o,
  output logic [LogDepth:0]             async_axi_out_w_wptr_o,
  input  logic [LogDepth:0]             async_axi_out_w_rptr_i,
  input  logic [AsyncAxiOutBWidth-1:0]  async_axi_out_b_data_i,
  input  logic [LogDepth:0]             async_axi_out_b_wptr_i,
  output logic [LogDepth:0]             async_axi_out_b_rptr_o,
  output logic [AsyncAxiOutArWidth-1:0] async_axi_out_ar_data_o,
  output logic [LogDepth:0]             async_axi_out_ar_wptr_o,
  input  logic [LogDepth:0]             async_axi_out_ar_rptr_i,
  input  logic [AsyncAxiOutRWidth-1:0]  async_axi_out_r_data_i,
  input  logic [LogDepth:0]             async_axi_out_r_wptr_i,
  output logic [LogDepth:0]             async_axi_out_r_rptr_o,

  // AXI Slave port
  input  logic [AsyncAxiInArWidth-1:0] async_axi_in_ar_data_i,
  input  logic [LogDepth:0]            async_axi_in_ar_wptr_i,
  output logic [LogDepth:0]            async_axi_in_ar_rptr_o,
  input  logic [AsyncAxiInAwWidth-1:0] async_axi_in_aw_data_i,
  input  logic [LogDepth:0]            async_axi_in_aw_wptr_i,
  output logic [LogDepth:0]            async_axi_in_aw_rptr_o,
  output logic [AsyncAxiInBWidth-1:0]  async_axi_in_b_data_o,
  output logic [LogDepth:0]            async_axi_in_b_wptr_o,
  input  logic [LogDepth:0]            async_axi_in_b_rptr_i,
  output logic [AsyncAxiInRWidth-1:0]  async_axi_in_r_data_o,
  output logic [LogDepth:0]            async_axi_in_r_wptr_o,
  input  logic [LogDepth:0]            async_axi_in_r_rptr_i,
  input  logic [AsyncAxiInWWidth-1:0]  async_axi_in_w_data_i,
  input  logic [LogDepth:0]            async_axi_in_w_wptr_i,
  output logic [LogDepth:0]            async_axi_in_w_rptr_o
);

  // ----------------
  // Merge XBAR (Narrow & Wide from Snitch cluster)
  // ----------------

  localparam int unsigned NrMergeSlaves = 2;
  localparam int unsigned NrMergeMasters = 2; // Wide / Narrow
  localparam int unsigned MergeIdWidthIn = snitch_cluster_pkg::NarrowIdWidthOut; // (Narrow_out id width)
  localparam int unsigned MergeIdWidthOut = MergeIdWidthIn + $clog2(NrMergeMasters);

  // Change the merged IDs to fit the SoC
  typedef logic [MergeIdWidthIn -1:0]    merge_mst_id_t;
  typedef logic [MergeIdWidthOut-1:0]    merge_slv_id_t;
  `AXI_TYPEDEF_ALL(merge_mst, snitch_cluster_pkg::addr_t, merge_mst_id_t, snitch_cluster_pkg::data_dma_t, snitch_cluster_pkg::strb_dma_t, snitch_cluster_pkg::user_dma_t)
  `AXI_TYPEDEF_ALL(merge_slv, snitch_cluster_pkg::addr_t, merge_slv_id_t, snitch_cluster_pkg::data_dma_t, snitch_cluster_pkg::strb_dma_t, snitch_cluster_pkg::user_dma_t)

  // From/to the snitch_cluster_wrapper
  snitch_cluster_pkg::narrow_in_req_t     snitch_narrow_in_req; // idw = 2
  snitch_cluster_pkg::narrow_in_resp_t    snitch_narrow_in_rsp; // idw = 2
  snitch_cluster_pkg::narrow_out_req_t    snitch_narrow_out_req; // idw = 4
  snitch_cluster_pkg::narrow_out_resp_t   snitch_narrow_out_rsp; // idw = 4
  snitch_cluster_pkg::wide_in_req_t       snitch_wide_in_req; // idw = 1
  snitch_cluster_pkg::wide_in_resp_t      snitch_wide_in_rsp; // idw = 1
  snitch_cluster_pkg::wide_out_req_t      snitch_wide_out_req; // idw = 3
  snitch_cluster_pkg::wide_out_resp_t     snitch_wide_out_rsp; // idw = 3
  merge_mst_req_t  snitch_wide_out_narowid_req; // idw = 4
  merge_mst_resp_t snitch_wide_out_narowid_rsp; // idw = 4

  axi_iw_converter #(
    .AxiSlvPortIdWidth      ( snitch_cluster_pkg::WideIdWidthOut   ),
    .AxiMstPortIdWidth      ( snitch_cluster_pkg::NarrowIdWidthOut ),
    .AxiSlvPortMaxUniqIds   ( 3                  ), // It will anyways prepend
    .AxiSlvPortMaxTxnsPerId ( 2                  ),
    .AxiSlvPortMaxTxns      ( 4                  ),
    .AxiMstPortMaxUniqIds   ( 3                  ),
    .AxiMstPortMaxTxnsPerId ( 2                  ),
    .AxiAddrWidth           ( AxiAddrWidth       ),
    .AxiDataWidth           ( AxiDataWidth       ),
    .AxiUserWidth           ( AxiUserWidth       ),
    .slv_req_t              ( snitch_cluster_pkg::wide_out_req_t  ),
    .slv_resp_t             ( snitch_cluster_pkg::wide_out_resp_t ),
    .mst_req_t              ( merge_mst_req_t      ),
    .mst_resp_t             ( merge_mst_resp_t     )
  ) i_wide_out_iw (
    .clk_i      ( clk_i                     ),
    .rst_ni     ( rst_ni                    ),
    .slv_req_i  ( snitch_wide_out_req       ),
    .slv_resp_o ( snitch_wide_out_rsp       ),
    .mst_req_o  ( snitch_wide_out_narowid_req     ),
    .mst_resp_i ( snitch_wide_out_narowid_rsp     )
   );

  // Change the wide IDs (3) to fit the narrow IDs (4)

  // From the merge xbar
  merge_slv_req_t  [NrMergeSlaves-1 :0] merge_axi_slv_req;
  merge_slv_resp_t [NrMergeSlaves-1 :0] merge_axi_slv_rsp;

  // DMA configuration struct
  localparam axi_pkg::xbar_cfg_t MergeXbarCfg = '{
    NoSlvPorts        : 2, // SoC + Bootrom
    NoMstPorts        : NrMergeMasters, // Wide out + Narrow out 
    MaxMstTrans       : 8,
    MaxSlvTrans       : 8,
    FallThrough       : 1'b0,
    LatencyMode       : axi_pkg::CUT_ALL_PORTS,
    AxiIdWidthSlvPorts: MergeIdWidthIn,
    AxiIdUsedSlvPorts : MergeIdWidthIn,
    UniqueIds         : 1'b0,
    AxiAddrWidth      : snitch_cluster_pkg::AddrWidth,
    AxiDataWidth      : snitch_cluster_pkg::WideDataWidth,
    NoAddrRules       : 1,
    default           : '0
  };

  typedef enum int unsigned {
    Merge_SoC      = 32'd0,
    Merge_Rom      = 32'd1
  } merge_e;

  typedef struct packed {
    int unsigned idx;
    snitch_cluster_pkg::addr_t start_addr;
    snitch_cluster_pkg::addr_t end_addr;
  } xbar_rule_t;

  xbar_rule_t [MergeXbarCfg.NoAddrRules-1:0] merge_xbar_rule;

  assign merge_xbar_rule         = '{
    '{
      idx       : Merge_Rom,
      start_addr: 'h1000,
      end_addr  : 'h1000+'h1000
    }
  };

  localparam bit [MergeXbarCfg.NoSlvPorts-1:0] MergeEnableDefaultMstPort = '1;
  assign merge_xbar_default_port = '{default: Merge_SoC};

  generate
  if (snitch_cluster_pkg::NarrowDataWidth != snitch_cluster_pkg::WideDataWidth ) begin
      $error("%m ** Narrow and wide must be the same size");
  end
  endgenerate

  axi_xbar #(
    .Cfg (MergeXbarCfg),
    .slv_aw_chan_t (merge_mst_aw_chan_t),
    .mst_aw_chan_t (merge_slv_aw_chan_t),
    .w_chan_t (merge_mst_w_chan_t),
    .slv_b_chan_t (merge_mst_b_chan_t),
    .mst_b_chan_t (merge_slv_b_chan_t),
    .slv_ar_chan_t (merge_mst_ar_chan_t),
    .mst_ar_chan_t (merge_slv_ar_chan_t),
    .slv_r_chan_t (merge_mst_r_chan_t),
    .mst_r_chan_t (merge_slv_r_chan_t),
    .slv_req_t (merge_mst_req_t),
    .slv_resp_t (merge_mst_resp_t),
    .mst_req_t (merge_slv_req_t),
    .mst_resp_t (merge_slv_resp_t),
    .rule_t (xbar_rule_t)
  ) i_merge_xbar (
    .clk_i,
    .rst_ni,
    .test_i (1'b0),
    .slv_ports_req_i ({snitch_narrow_out_req, snitch_wide_out_narowid_req}),
    .slv_ports_resp_o ({snitch_narrow_out_rsp, snitch_wide_out_narowid_rsp}),
    .mst_ports_req_o (merge_axi_slv_req),
    .mst_ports_resp_i (merge_axi_slv_rsp),
    .addr_map_i (merge_xbar_rule),
    .en_default_mst_port_i (MergeEnableDefaultMstPort),
    .default_mst_port_i (merge_xbar_default_port)
  );

  // ----------------
  // Instanciate cluster
  // ----------------

  // We use narrow as wide does not connect to the peripherals
  assign snitch_wide_in_req = '0;

  snitch_cluster_wrapper i_snitch_cluster_wrapper (
    .clk_i,
    .rst_ni,
    .debug_req_i             ('0),
    .meip_i                  ('0),
    .mtip_i                  ('0),
    .msip_i                  ('0),
    .narrow_in_req_i         (snitch_narrow_in_req ),
    .narrow_in_resp_o        (snitch_narrow_in_rsp ),
    .narrow_out_req_o        (snitch_narrow_out_req),
    .narrow_out_resp_i       (snitch_narrow_out_rsp),
    .wide_out_req_o          (snitch_wide_out_req  ),
    .wide_out_resp_i         (snitch_wide_out_rsp  ),
    .wide_in_req_i           (snitch_wide_in_req   ),
    .wide_in_resp_o          (snitch_wide_in_rsp   )
  );

  // ----------------
  // ID width, Isolate and CDC
  // ----------------

  // From SoC (CDC in) to Cluster
  axi_in_req_t   axi_to_cluster_req;
  axi_in_resp_t  axi_to_cluster_resp;
  // From Cluster to SoC (CDC out)
  axi_in_req_t   axi_from_cluster_req;
  axi_in_resp_t  axi_from_cluster_resp;

  typedef logic [AxiDataWidth-1:0]  axi_data_t;
  typedef logic [AxiStrbWidth-1:0]  axi_strb_t;
  typedef logic [AxiAddrWidth-1:0]  axi_addr_t;
  typedef logic [AxiInIdWidth-1:0]  axi_id_in_t;
  typedef logic [AxiOutIdWidth-1:0] axi_id_out_t;
  typedef logic [AxiUserWidth-1:0]  axi_user_t;
  typedef logic [IwcAxiIdOutWidth-1:0]   axi_id_out_iwc_t;
  `AXI_TYPEDEF_ALL(axi_iwc_out, axi_addr_t, axi_id_out_iwc_t, axi_data_t, axi_strb_t, axi_user_t)

  axi_iwc_out_req_t axi_from_cluster_iwc_req;
  axi_iwc_out_resp_t axi_from_cluster_iwc_resp;

  axi_iw_converter #(
    .AxiSlvPortIdWidth      ( MergeIdWidthOut    ),
    .AxiMstPortIdWidth      ( AxiOutIdWidth      ),
    .AxiSlvPortMaxUniqIds   ( 3                  ),
    .AxiSlvPortMaxTxnsPerId ( 2                  ),
    .AxiSlvPortMaxTxns      ( 4                  ),
    .AxiMstPortMaxUniqIds   ( 3                  ),
    .AxiMstPortMaxTxnsPerId ( 4                  ),
    .AxiAddrWidth           ( AxiAddrWidth       ),
    .AxiDataWidth           ( AxiDataWidth       ),
    .AxiUserWidth           ( AxiUserWidth       ),
    .slv_req_t              ( axi_iwc_out_req_t  ),
    .slv_resp_t             ( axi_iwc_out_resp_t ),
    .mst_req_t              ( axi_out_req_t      ),
    .mst_resp_t             ( axi_out_resp_t     )
  ) i_soc_out_iw (
    .clk_i      ( clk_i                     ),
    .rst_ni     ( rst_ni                    ),
    .slv_req_i  ( merge_axi_slv_req[Merge_SoC] ),
    .slv_resp_o ( merge_axi_slv_rsp[Merge_SoC] ),
    .mst_req_o  ( axi_from_cluster_req      ),
    .mst_resp_i ( axi_from_cluster_resp     )
   );

  axi_iw_converter #(
    .AxiSlvPortIdWidth      ( AxiInIdWidth                           ),
    .AxiMstPortIdWidth      ( snitch_cluster_pkg::NarrowIdWidthIn      ),
    .AxiSlvPortMaxUniqIds   ( 2                  ),
    .AxiSlvPortMaxTxnsPerId ( 2                  ),
    .AxiSlvPortMaxTxns      ( 4                  ),
    .AxiMstPortMaxUniqIds   ( 2                  ),
    .AxiMstPortMaxTxnsPerId ( 4                  ),
    .AxiAddrWidth           ( AxiAddrWidth       ),
    .AxiDataWidth           ( AxiDataWidth       ),
    .AxiUserWidth           ( AxiUserWidth       ),
    .slv_req_t              ( axi_in_req_t  ),
    .slv_resp_t             ( axi_in_resp_t ),
    .mst_req_t              ( snitch_cluster_pkg::narrow_in_req_t      ),
    .mst_resp_t             ( snitch_cluster_pkg::narrow_in_resp_t     )
  ) i_soc_in_iw (
    .clk_i      ( clk_i                  ),
    .rst_ni     ( rst_ni                 ),
    .slv_req_i  ( axi_to_cluster_req     ),
    .slv_resp_o ( axi_to_cluster_resp    ),
    .mst_req_o  ( snitch_narrow_in_req   ),
    .mst_resp_i ( snitch_narrow_in_rsp   )
  );

  // From AXI Isolate to CDC
  axi_out_req_t  axi_from_cluster_iso_req;
  axi_out_resp_t axi_from_cluster_iso_resp;
  logic axi_isolate_sync;

  sync #(
    .STAGES        ( SyncStages ),
    .ResetValue    ( 1'b1       )
  ) i_isolate_sync (
    .clk_i,
    .rst_ni   ( pwr_on_rst_ni    ),
    .serial_i ( axi_isolate_i    ),
    .serial_o ( axi_isolate_sync )
  );

  axi_isolate #(
    .NumPending           ( AxiMaxOutTrans ),
    .TerminateTransaction ( 1              ),
    .AtopSupport          ( 1              ),
    .AxiAddrWidth         ( AxiAddrWidth   ),
    .AxiDataWidth         ( AxiDataWidth   ),
    .AxiIdWidth           ( AxiOutIdWidth  ),
    .AxiUserWidth         ( AxiUserWidth   ),
    .axi_req_t            ( axi_out_req_t  ),
    .axi_resp_t           ( axi_out_resp_t )
  ) i_axi_out_isolate     (
    .clk_i                ( clk_i                     ),
    .rst_ni               ( rst_ni                    ),
    .slv_req_i            ( axi_from_cluster_req      ),
    .slv_resp_o           ( axi_from_cluster_resp     ),
    .mst_req_o            ( axi_from_cluster_iso_req  ),
    .mst_resp_i           ( axi_from_cluster_iso_resp ),
    .isolate_i            ( axi_isolate_sync          ),
    .isolated_o           ( axi_isolated_o            )
  );

  axi_cdc_dst #(
    .LogDepth   ( LogDepth          ),
    .SyncStages ( CdcSyncStages     ),
    .aw_chan_t  ( axi_in_aw_chan_t  ),
    .w_chan_t   ( axi_in_w_chan_t   ),
    .b_chan_t   ( axi_in_b_chan_t   ),
    .ar_chan_t  ( axi_in_ar_chan_t  ),
    .r_chan_t   ( axi_in_r_chan_t   ),
    .axi_req_t  ( axi_in_req_t      ),
    .axi_resp_t ( axi_in_resp_t     )
  ) i_snitch_cluster_cdc_dst (
    // Asynchronous slave port
    .async_data_slave_aw_data_i ( async_axi_in_aw_data_i ),
    .async_data_slave_aw_wptr_i ( async_axi_in_aw_wptr_i ),
    .async_data_slave_aw_rptr_o ( async_axi_in_aw_rptr_o ),
    .async_data_slave_w_data_i  ( async_axi_in_w_data_i  ),
    .async_data_slave_w_wptr_i  ( async_axi_in_w_wptr_i  ),
    .async_data_slave_w_rptr_o  ( async_axi_in_w_rptr_o  ),
    .async_data_slave_b_data_o  ( async_axi_in_b_data_o  ),
    .async_data_slave_b_wptr_o  ( async_axi_in_b_wptr_o  ),
    .async_data_slave_b_rptr_i  ( async_axi_in_b_rptr_i  ),
    .async_data_slave_ar_data_i ( async_axi_in_ar_data_i ),
    .async_data_slave_ar_wptr_i ( async_axi_in_ar_wptr_i ),
    .async_data_slave_ar_rptr_o ( async_axi_in_ar_rptr_o ),
    .async_data_slave_r_data_o  ( async_axi_in_r_data_o  ),
    .async_data_slave_r_wptr_o  ( async_axi_in_r_wptr_o  ),
    .async_data_slave_r_rptr_i  ( async_axi_in_r_rptr_i  ),
    // Synchronous master port
    .dst_clk_i                  ( clk_i                  ),
    .dst_rst_ni                 ( pwr_on_rst_ni          ),
    .dst_req_o                  ( axi_to_cluster_req     ),
    .dst_resp_i                 ( axi_to_cluster_resp    )
  );

  axi_cdc_src #(
   .LogDepth   ( LogDepth          ),
   .SyncStages ( CdcSyncStages     ),
   .aw_chan_t  ( axi_out_aw_chan_t ),
   .w_chan_t   ( axi_out_w_chan_t  ),
   .b_chan_t   ( axi_out_b_chan_t  ),
   .ar_chan_t  ( axi_out_ar_chan_t ),
   .r_chan_t   ( axi_out_r_chan_t  ),
   .axi_req_t  ( axi_out_req_t     ),
   .axi_resp_t ( axi_out_resp_t    )
  ) i_snitch_cluster_cdc_src (
    // Asynchronous Master port
    .async_data_master_aw_data_o( async_axi_out_aw_data_o ),
    .async_data_master_aw_wptr_o( async_axi_out_aw_wptr_o ),
    .async_data_master_aw_rptr_i( async_axi_out_aw_rptr_i ),
    .async_data_master_w_data_o ( async_axi_out_w_data_o  ),
    .async_data_master_w_wptr_o ( async_axi_out_w_wptr_o  ),
    .async_data_master_w_rptr_i ( async_axi_out_w_rptr_i  ),
    .async_data_master_b_data_i ( async_axi_out_b_data_i  ),
    .async_data_master_b_wptr_i ( async_axi_out_b_wptr_i  ),
    .async_data_master_b_rptr_o ( async_axi_out_b_rptr_o  ),
    .async_data_master_ar_data_o( async_axi_out_ar_data_o ),
    .async_data_master_ar_wptr_o( async_axi_out_ar_wptr_o ),
    .async_data_master_ar_rptr_i( async_axi_out_ar_rptr_i ),
    .async_data_master_r_data_i ( async_axi_out_r_data_i  ),
    .async_data_master_r_wptr_i ( async_axi_out_r_wptr_i  ),
    .async_data_master_r_rptr_o ( async_axi_out_r_rptr_o  ),
    // Synchronous slave port
    .src_clk_i                  ( clk_i                    ),
    .src_rst_ni                 ( pwr_on_rst_ni          ),
    .src_req_i                  ( axi_from_cluster_iso_req ),
    .src_resp_o                 ( axi_from_cluster_iso_resp)
  );

  // ----------------
  // Bootrom
  // ----------------

  `REG_BUS_TYPEDEF_ALL(reg_dma, snitch_cluster_pkg::addr_t, snitch_cluster_pkg::data_dma_t, snitch_cluster_pkg::strb_dma_t)

  reg_dma_req_t bootrom_reg_req;
  reg_dma_rsp_t bootrom_reg_rsp;

  axi_to_reg #(
    .ADDR_WIDTH         (snitch_cluster_pkg::AddrWidth      ),
    .DATA_WIDTH         (snitch_cluster_pkg::WideDataWidth      ),
    .AXI_MAX_WRITE_TXNS (1                 ),
    .AXI_MAX_READ_TXNS  (1                 ),
    .DECOUPLE_W         (0                 ),
    .ID_WIDTH           (MergeIdWidthOut    ),
    .USER_WIDTH         (snitch_cluster_pkg::WideUserWidth      ),
    .axi_req_t          (merge_slv_req_t ),
    .axi_rsp_t          (merge_slv_resp_t),
    .reg_req_t          (reg_dma_req_t     ),
    .reg_rsp_t          (reg_dma_rsp_t     )
  ) i_axi_to_reg_bootrom (
    .clk_i      (clk_i                    ),
    .rst_ni     (rst_ni                   ),
    .testmode_i (1'b0                     ),
    .axi_req_i  (merge_axi_slv_req[Merge_Rom]),
    .axi_rsp_o  (merge_axi_slv_rsp[Merge_Rom]),
    .reg_req_o  (bootrom_reg_req          ),
    .reg_rsp_i  (bootrom_reg_rsp          )
  );

  snitch_cluster_bootrom i_bootrom (
    .clk_i  (clk_i                        ),
    .req_i  (bootrom_reg_req.valid        ),
    .addr_i (snitch_cluster_pkg::addr_t'(bootrom_reg_req.addr)),
    .rdata_o(bootrom_reg_rsp.rdata        )
  );
  `FF(bootrom_reg_rsp.ready, bootrom_reg_req.valid, 1'b0)
  assign bootrom_reg_rsp.error = 1'b0;

  // pragma translate_off
  `ifndef VERILATOR
  `ifndef XSIM
  initial begin : check_params
    narrow_wide_dw: assert (snitch_cluster_pkg::NarrowDataWidth == snitch_cluster_pkg::WideDataWidth) else
      $fatal(1, $sformatf("Slv_req and aw_chan id width not equal."));
  end
  `endif
  `endif
  // pragma translate_on

  generate
  if ( AxiDataWidth != snitch_cluster_pkg::WideDataWidth ||
       AxiAddrWidth != snitch_cluster_pkg::AddrWidth     ||
       AxiUserWidth  < snitch_cluster_pkg::WideUserWidth    ) begin
      $error("%m ** SoC and wide must be the same size");
  end
  endgenerate

endmodule
