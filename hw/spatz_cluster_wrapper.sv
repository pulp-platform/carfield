// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Yvan Tortorella <yvan.tortorella@unibo.it>

`include "axi/typedef.svh"

module spatz_cluster_wrapper
 import spatz_cluster_pkg::*;
 import fpnew_pkg::fpu_implementation_t;
 import snitch_pma_pkg::snitch_pma_t;
 #(
  parameter int unsigned AxiAddrWidth     = 48,
  parameter int unsigned AxiDataWidth     = 64,
  parameter int unsigned AxiUserWidth     = 10,
  parameter int unsigned AxiInIdWidth     = 6,
  parameter int unsigned AxiOutIdWidth    = 2,
  parameter int unsigned IwcAxiIdOutWidth = 3,
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
  input  logic [NumCores-1:0] debug_req_i,

  input  logic [NumCores-1:0] meip_i,
  input  logic [NumCores-1:0] mtip_i,
  input  logic [NumCores-1:0] msip_i,
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

  typedef logic [AxiDataWidth-1:0]  axi_data_t;
  typedef logic [AxiStrbWidth-1:0]  axi_strb_t;
  typedef logic [AxiAddrWidth-1:0]  axi_addr_t;
  typedef logic [AxiInIdWidth-1:0]  axi_id_in_t;
  typedef logic [AxiOutIdWidth-1:0] axi_id_out_t;
  typedef logic [AxiUserWidth-1:0]  axi_user_t;
  typedef logic [IwcAxiIdOutWidth-1:0]   axi_id_out_iwc_t;
  `AXI_TYPEDEF_ALL(axi_iwc_out, axi_addr_t, axi_id_out_iwc_t, axi_data_t, axi_strb_t, axi_user_t)

  localparam int unsigned NumIntOutstandingLoads   [NumCores] = '{1, 1};
  localparam int unsigned NumIntOutstandingMem     [NumCores] = '{4, 4};
  localparam int unsigned NumSpatzOutstandingLoads [NumCores] = '{4, 4};

  axi_iwc_out_req_t axi_from_cluster_iwc_req;
  axi_iwc_out_resp_t axi_from_cluster_iwc_resp;

  axi_out_req_t  axi_from_cluster_req;
  axi_out_resp_t axi_from_cluster_resp;

  // From AXI Isolate to CDC
  axi_out_req_t  axi_from_cluster_iso_req;
  axi_out_resp_t axi_from_cluster_iso_resp;
  logic axi_isolate_sync;

  localparam int unsigned ICacheLineWidth = 128;
  localparam int unsigned ICacheLineCount = 128;
  localparam int unsigned ICacheSets = 2;

  function automatic snitch_pma_pkg::rule_t [snitch_pma_pkg::NrMaxRules-1:0] get_cached_regions();
    automatic snitch_pma_pkg::rule_t [snitch_pma_pkg::NrMaxRules-1:0] cached_regions;
    cached_regions = '{default: '0};
    cached_regions[0] = '{base: 48'h78000000, mask: 48'hffffffc00000};
    return cached_regions;
  endfunction

  localparam snitch_pma_pkg::snitch_pma_t SnitchPMACfg = '{
    NrCachedRegionRules: 1,
    CachedRegion: get_cached_regions(),
    default: 0
  };

  localparam fpnew_pkg::fpu_implementation_t FPUImplementation [NumCores] = '{
    '{
        PipeRegs: // FMA Block
                  '{
                    '{  2, // FP32
                        4, // FP64
                        1, // FP16
                        0, // FP8
                        1, // FP16alt
                        0  // FP8alt
                      },
                    '{1, 1, 1, 1, 1, 1},   // DIVSQRT
                    '{1,
                      1,
                      1,
                      1,
                      1,
                      1},   // NONCOMP
                    '{2,
                      2,
                      2,
                      2,
                      2,
                      2},   // CONV
                    '{4,
                      4,
                      4,
                      4,
                      4,
                      4}    // DOTP
                    },
        UnitTypes: '{'{fpnew_pkg::MERGED,
                       fpnew_pkg::MERGED,
                       fpnew_pkg::MERGED,
                       fpnew_pkg::MERGED,
                       fpnew_pkg::MERGED,
                       fpnew_pkg::MERGED},  // FMA
                    '{fpnew_pkg::DISABLED,
                        fpnew_pkg::DISABLED,
                        fpnew_pkg::DISABLED,
                        fpnew_pkg::DISABLED,
                        fpnew_pkg::DISABLED,
                        fpnew_pkg::DISABLED}, // DIVSQRT
                    '{fpnew_pkg::PARALLEL,
                        fpnew_pkg::PARALLEL,
                        fpnew_pkg::PARALLEL,
                        fpnew_pkg::PARALLEL,
                        fpnew_pkg::PARALLEL,
                        fpnew_pkg::PARALLEL}, // NONCOMP
                    '{fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED},   // CONV
                    '{fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED}},  // DOTP
        PipeConfig: fpnew_pkg::BEFORE
    },
    '{
        PipeRegs: // FMA Block
                  '{
                    '{  2, // FP32
                        4, // FP64
                        1, // FP16
                        0, // FP8
                        1, // FP16alt
                        0  // FP8alt
                      },
                    '{1, 1, 1, 1, 1, 1},   // DIVSQRT
                    '{1,
                      1,
                      1,
                      1,
                      1,
                      1},   // NONCOMP
                    '{2,
                      2,
                      2,
                      2,
                      2,
                      2},   // CONV
                    '{4,
                      4,
                      4,
                      4,
                      4,
                      4}    // DOTP
                    },
        UnitTypes: '{'{fpnew_pkg::MERGED,
                       fpnew_pkg::MERGED,
                       fpnew_pkg::MERGED,
                       fpnew_pkg::MERGED,
                       fpnew_pkg::MERGED,
                       fpnew_pkg::MERGED},  // FMA
                    '{fpnew_pkg::DISABLED,
                        fpnew_pkg::DISABLED,
                        fpnew_pkg::DISABLED,
                        fpnew_pkg::DISABLED,
                        fpnew_pkg::DISABLED,
                        fpnew_pkg::DISABLED}, // DIVSQRT
                    '{fpnew_pkg::PARALLEL,
                        fpnew_pkg::PARALLEL,
                        fpnew_pkg::PARALLEL,
                        fpnew_pkg::PARALLEL,
                        fpnew_pkg::PARALLEL,
                        fpnew_pkg::PARALLEL}, // NONCOMP
                    '{fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED},   // CONV
                    '{fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED,
                        fpnew_pkg::MERGED}},  // DOTP
        PipeConfig: fpnew_pkg::BEFORE
    }
  };

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
  ) ;

  // From CDC to Cluster
  axi_in_req_t   axi_to_cluster_req;
  axi_in_resp_t  axi_to_cluster_resp;

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
  ) i_spatz_cluster_cdc_dst (
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
  ) i_spatz_cluster_cdc_src (
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

  axi_iw_converter #(
    .AxiSlvPortIdWidth      ( IwcAxiIdOutWidth   ),
    .AxiMstPortIdWidth      ( AxiOutIdWidth      ),
    .AxiSlvPortMaxUniqIds   ( 2                  ),
    .AxiSlvPortMaxTxnsPerId ( 2                  ),
    .AxiSlvPortMaxTxns      ( 4                  ),
    .AxiMstPortMaxUniqIds   ( 2                  ),
    .AxiMstPortMaxTxnsPerId ( 4                  ),
    .AxiAddrWidth           ( AxiAddrWidth       ),
    .AxiDataWidth           ( AxiDataWidth       ),
    .AxiUserWidth           ( AxiUserWidth       ),
    .slv_req_t              ( axi_iwc_out_req_t  ),
    .slv_resp_t             ( axi_iwc_out_resp_t ),
    .mst_req_t              ( axi_out_req_t      ),
    .mst_resp_t             ( axi_out_resp_t     )
  ) iw_converter(
    .clk_i      ( clk_i                     ),
    .rst_ni     ( rst_ni                    ),
    .slv_req_i  ( axi_from_cluster_iwc_req  ),
    .slv_resp_o ( axi_from_cluster_iwc_resp ),
    .mst_req_o  ( axi_from_cluster_req      ),
    .mst_resp_i ( axi_from_cluster_resp     )
   );

  // Spatz cluster under test.
  spatz_cluster #(
    .AxiAddrWidth             ( AxiAddrWidth             ),
    .AxiDataWidth             ( AxiDataWidth             ),
    .AxiIdWidthIn             ( AxiInIdWidth             ),
    .AxiIdWidthOut            ( IwcAxiIdOutWidth         ),
    .AxiUserWidth             ( AxiUserWidth             ),
    .BootAddr                 ( 32'h1000                 ),
    .ClusterPeriphSize        ( 64                       ),
    .NrCores                  ( 2                        ),
    .TCDMDepth                ( 1024                     ),
    .NrBanks                  ( 16                       ),
    .ICacheLineWidth          ( ICacheLineWidth          ),
    .ICacheLineCount          ( ICacheLineCount          ),
    .ICacheSets               ( ICacheSets               ),
    .FPUImplementation        ( FPUImplementation        ),
    .SnitchPMACfg             ( SnitchPMACfg             ),
    .NumIntOutstandingLoads   ( NumIntOutstandingLoads   ),
    .NumIntOutstandingMem     ( NumIntOutstandingMem     ),
    .NumSpatzOutstandingLoads ( NumSpatzOutstandingLoads ),
    .axi_in_req_t             ( axi_in_req_t             ),
    .axi_in_resp_t            ( axi_in_resp_t            ),
    .axi_out_req_t            ( axi_iwc_out_req_t        ),
    .axi_out_resp_t           ( axi_iwc_out_resp_t       ),
    .Xdma                     ( 2'b01                    ),
    .DMAAxiReqFifoDepth       ( 3                        ),
    .DMAReqFifoDepth          ( 3                        ),
    .RegisterOffloadRsp       ( 1                        ),
    .RegisterCoreReq          ( 1                        ),
    .RegisterCoreRsp          ( 1                        ),
    .RegisterTCDMCuts         ( 1                        ),
    .RegisterExt              ( 0                        ),
    .XbarLatency              ( axi_pkg::CUT_ALL_PORTS   ),
    .MaxMstTrans              ( 4                        ),
    .MaxSlvTrans              ( 4                        )
  ) i_cluster (
    .clk_i,
    .rst_ni,
    .debug_req_i,
    .meip_i,
    .mtip_i,
    .msip_i,
    .hart_base_id_i          ( 10'h10                    ),
    .cluster_base_addr_i     ( 48'h51000000              ),
    .axi_core_default_user_i ( 10'h7                     ),
    .cluster_probe_o,
    // AXI Slave Port
    .axi_in_req_i            ( axi_to_cluster_req        ),
    .axi_in_resp_o           ( axi_to_cluster_resp       ),
    // AXI Master Port
    .axi_out_req_o           ( axi_from_cluster_iwc_req  ),
    .axi_out_resp_i          ( axi_from_cluster_iwc_resp )
  );

endmodule: spatz_cluster_wrapper
