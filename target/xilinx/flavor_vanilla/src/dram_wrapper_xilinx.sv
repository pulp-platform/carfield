// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Cyril Koenig <cykoenig@iis.ee.ethz.ch>
//
// Resize AXI AW IW DW before connecting to a Xilinx DRAM controller

`include "cheshire/typedef.svh"
`include "phy_definitions.svh"
`include "common_cells/registers.svh"

module dram_wrapper_xilinx #(
    parameter type axi_soc_aw_chan_t = logic,
    parameter type axi_soc_w_chan_t  = logic,
    parameter type axi_soc_b_chan_t  = logic,
    parameter type axi_soc_ar_chan_t = logic,
    parameter type axi_soc_r_chan_t  = logic,
    parameter type axi_soc_req_t     = logic,
    parameter type axi_soc_resp_t    = logic
) (
    // System reset
    input                 sys_rst_i,
    input                 dram_clk_i,
    // Controller reset
    input                 soc_resetn_i,
    input                 soc_clk_i,

    // Phy interfaces
`ifdef USE_DDR4
    `DDR4_INTF
`endif
`ifdef USE_DDR3
    `DDR3_INTF
`endif

    // Dram axi interface
    input  axi_soc_req_t  soc_req_i,
    output axi_soc_resp_t soc_rsp_o
);

  ////////////////////////////////////
  // Configurations and definitions //
  ////////////////////////////////////

  typedef struct packed {
    bit EnCDC;
    integer IdWidth;
    integer AddrWidth;
    integer DataWidth;
    integer StrobeWidth;
  } dram_cfg_t;

`ifdef TARGET_ZCU102
  localparam dram_cfg_t cfg = '{
    EnCDC         : 1,    // MIG UI clock domain differs -> CDC enabled
    IdWidth       : 4,
    AddrWidth     : 29,   // ZCU102 MIG expects 29-bit address (typical)
    DataWidth     : 128,  // 128-bit AXI
    StrobeWidth   : 16
  };
`endif

`ifdef TARGET_VCU128
  localparam dram_cfg_t cfg = '{
    EnCDC         : 1,
    IdWidth       : 4,
    AddrWidth     : 32,
    DataWidth     : 512,
    StrobeWidth   : 64
  };
`endif

`ifdef TARGET_GENESYS2
  localparam dram_cfg_t cfg = '{
    EnCDC         : 1,
    IdWidth       : 4,
    AddrWidth     : 30,
    DataWidth     : 64,
    StrobeWidth   : 8
  };
`endif

  localparam SoC_DataWidth = $bits(soc_req_i.w.data);
  localparam SoC_IdWidth   = $bits(soc_req_i.ar.id);
  localparam SoC_UserWidth = $bits(soc_req_i.ar.user);
  localparam SoC_AddrWidth = $bits(soc_req_i.ar.addr);

  localparam logic [SoC_AddrWidth-1:0] DDR_BASE = 32'h8000_0000;

  // Define type after data width + address width (still SoC addr/user/id)
  `AXI_TYPEDEF_ALL(axi_dw, logic[SoC_AddrWidth-1:0], logic[SoC_IdWidth-1:0],
                   logic[cfg.DataWidth-1:0], logic[cfg.StrobeWidth-1:0],
                   logic[SoC_UserWidth-1:0])

  // Define type after data width + id width (SoC addr/user, MIG id/data)
  `AXI_TYPEDEF_ALL(axi_dw_iw, logic[SoC_AddrWidth-1:0], logic[cfg.IdWidth-1:0],
                   logic[cfg.DataWidth-1:0], logic[cfg.StrobeWidth-1:0],
                   logic[SoC_UserWidth-1:0])

  // MIG/UI clock + reset
  logic dram_axi_clk;
  logic dram_rst_o;               // MIG ui_clk_sync_rst (active high)
  logic mig_calib_complete;

  // Before resizing
  axi_soc_req_t  soc_dresizer_req;
  axi_soc_resp_t soc_dresizer_rsp;

  // After DW resize
  axi_dw_req_t   dresizer_iresizer_req;
  axi_dw_resp_t  dresizer_iresizer_rsp;

  // After IW resize
  axi_dw_iw_req_t  iresizer_cdc_req;
  axi_dw_iw_resp_t iresizer_cdc_rsp;

  // After CDC (towards MIG)
  axi_dw_iw_req_t  cdc_dram_req;
  axi_dw_iw_resp_t cdc_dram_rsp;

  // Entry signals
  assign soc_dresizer_req = soc_req_i;
  assign soc_rsp_o        = soc_dresizer_rsp;

  /////////////////////////////////////
  // Instantiate data width resizer  //
  /////////////////////////////////////

  axi_dw_converter #(
      .AxiMaxReads        (8),
      .AxiSlvPortDataWidth(SoC_DataWidth),
      .AxiMstPortDataWidth(cfg.DataWidth),
      .AxiAddrWidth       (SoC_AddrWidth),
      .AxiIdWidth         (SoC_IdWidth  ),
      // Common aw, ar, b
      .aw_chan_t          (axi_soc_aw_chan_t),
      .b_chan_t           (axi_soc_b_chan_t),
      .ar_chan_t          (axi_soc_ar_chan_t),
      // Master w, r
      .mst_w_chan_t       (axi_dw_w_chan_t),
      .mst_r_chan_t       (axi_dw_r_chan_t),
      .axi_mst_req_t      (axi_dw_req_t),
      .axi_mst_resp_t     (axi_dw_resp_t),
      // Slave w, r
      .slv_w_chan_t       (axi_soc_w_chan_t),
      .slv_r_chan_t       (axi_soc_r_chan_t),
      .axi_slv_req_t      (axi_soc_req_t),
      .axi_slv_resp_t     (axi_soc_resp_t)
  ) axi_dw_converter_ddr (
      .clk_i      (soc_clk_i),
      .rst_ni     (soc_resetn_i),
      .slv_req_i  (soc_dresizer_req),
      .slv_resp_o (soc_dresizer_rsp),
      .mst_req_o  (dresizer_iresizer_req),
      .mst_resp_i (dresizer_iresizer_rsp)
  );

  /////////////////
  // ID resizer  //
  /////////////////

  axi_iw_converter #(
    .AxiAddrWidth          ( SoC_AddrWidth    ),
    .AxiDataWidth          ( cfg.DataWidth    ),
    .AxiUserWidth          ( SoC_UserWidth    ),
    .AxiSlvPortIdWidth     ( SoC_IdWidth      ),
    .AxiSlvPortMaxUniqIds  ( 1                ),
    .AxiSlvPortMaxTxnsPerId( 1                ),
    .AxiSlvPortMaxTxns     ( 1                ),
    .AxiMstPortIdWidth     ( cfg.IdWidth      ),
    .AxiMstPortMaxUniqIds  ( 1                ),
    .AxiMstPortMaxTxnsPerId( 1                ),
    .slv_req_t             ( axi_dw_req_t     ),
    .slv_resp_t            ( axi_dw_resp_t    ),
    .mst_req_t             ( axi_dw_iw_req_t  ),
    .mst_resp_t            ( axi_dw_iw_resp_t )
  ) i_axi_iw_convert (
    .clk_i      ( soc_clk_i             ),
    .rst_ni     ( soc_resetn_i          ),
    .slv_req_i  ( dresizer_iresizer_req ),
    .slv_resp_o ( dresizer_iresizer_rsp ),
    .mst_req_o  ( iresizer_cdc_req      ),
    .mst_resp_i ( iresizer_cdc_rsp      )
  );

  //////////////////////
  // Instantiate CDC  //
  //////////////////////

  if (cfg.EnCDC) begin : gen_cdc
    axi_cdc #(
        .aw_chan_t (axi_dw_iw_aw_chan_t),
        .w_chan_t  (axi_dw_iw_w_chan_t),
        .b_chan_t  (axi_dw_iw_b_chan_t),
        .ar_chan_t (axi_dw_iw_ar_chan_t),
        .r_chan_t  (axi_dw_iw_r_chan_t),
        .axi_req_t (axi_dw_iw_req_t),
        .axi_resp_t(axi_dw_iw_resp_t),
        .LogDepth  (4)
    ) i_axi_cdc_mig (
        .src_clk_i  (soc_clk_i),
        .src_rst_ni (soc_resetn_i),
        .src_req_i  (iresizer_cdc_req),
        .src_resp_o (iresizer_cdc_rsp),
        .dst_clk_i  (dram_axi_clk),
        // IMPORTANT: keep CDC dest side in reset until MIG is ready
        .dst_rst_ni ((~dram_rst_o) & mig_calib_complete),
        .dst_req_o  (cdc_dram_req),
        .dst_resp_i (cdc_dram_rsp)
    );
  end else begin : gen_no_cdc
    assign cdc_dram_req     = iresizer_cdc_req;
    assign iresizer_cdc_rsp = cdc_dram_rsp;
  end

  ///////////////////////
  // Address remapping  //
  ///////////////////////

  logic [cfg.AddrWidth-1:0] cdc_aw_addr_off;
  logic [cfg.AddrWidth-1:0] cdc_ar_addr_off;
  logic [SoC_AddrWidth-1:0] aw_addr_off_full, ar_addr_off_full;

  assign aw_addr_off_full = cdc_dram_req.aw.addr - DDR_BASE;
  assign ar_addr_off_full = cdc_dram_req.ar.addr - DDR_BASE;

  assign cdc_aw_addr_off  = aw_addr_off_full[cfg.AddrWidth-1:0];
  assign cdc_ar_addr_off  = ar_addr_off_full[cfg.AddrWidth-1:0];

  ///////////////////////////////////////////////
  // MIG-facing sanitizer for ZCU102 (128-bit)  //
  ///////////////////////////////////////////////

  localparam int MIG_BYTES = cfg.DataWidth / 8;   // 16 bytes
  localparam int MIG_SIZE  = $clog2(MIG_BYTES);   // 4 -> 16B beats

  // Gate traffic until MIG is calibrated and UI reset deasserted
  wire mig_ready = mig_calib_complete & (~dram_rst_o);

  // Aligned addresses for MIG (force to 16B boundary)
  wire [cfg.AddrWidth-1:0] mig_awaddr_aligned =
      {cdc_aw_addr_off[cfg.AddrWidth-1:MIG_SIZE], {MIG_SIZE{1'b0}}};

  wire [cfg.AddrWidth-1:0] mig_araddr_aligned =
      {cdc_ar_addr_off[cfg.AddrWidth-1:MIG_SIZE], {MIG_SIZE{1'b0}}};

  // (Optional) Assertions: catch misaligned requests early in sim/ILA-friendly builds
  always_ff @(posedge dram_axi_clk) begin
    if (mig_ready) begin
      if (cdc_dram_req.aw_valid && cdc_dram_rsp.aw_ready) begin
        assert ((cdc_aw_addr_off & ((1 << cdc_dram_req.aw.size) - 1)) == 0)
          else $fatal(1, "Unaligned AW addr: size=%0d addr=0x%0h",
                      cdc_dram_req.aw.size, cdc_aw_addr_off);
      end
      if (cdc_dram_req.ar_valid && cdc_dram_rsp.ar_ready) begin
        assert ((cdc_ar_addr_off & ((1 << cdc_dram_req.ar.size) - 1)) == 0)
          else $fatal(1, "Unaligned AR addr: size=%0d addr=0x%0h",
                      cdc_dram_req.ar.size, cdc_ar_addr_off);
      end
    end
  end

  ///////////////////////
  // Instantiate DDR4   //
  ///////////////////////

`ifdef USE_DDR4

  // MIG outputs (explicit signals to avoid 'user' X-propagation)
  wire mig_awready, mig_wready, mig_bvalid, mig_arready, mig_rvalid;
  wire [cfg.IdWidth-1:0] mig_bid, mig_rid;
  wire [1:0]             mig_bresp, mig_rresp;
  wire                   mig_rlast;
  wire [cfg.DataWidth-1:0] mig_rdata;

  // Build cdc_dram_rsp struct explicitly, force user=0
  always_comb begin
    cdc_dram_rsp          = '0;
    cdc_dram_rsp.aw_ready = mig_awready;
    cdc_dram_rsp.w_ready  = mig_wready;

    cdc_dram_rsp.b_valid  = mig_bvalid;
    cdc_dram_rsp.b.id     = mig_bid;
    cdc_dram_rsp.b.resp   = mig_bresp;
    cdc_dram_rsp.b.user   = '0;

    cdc_dram_rsp.ar_ready = mig_arready;

    cdc_dram_rsp.r_valid  = mig_rvalid;
    cdc_dram_rsp.r.id     = mig_rid;
    cdc_dram_rsp.r.data   = mig_rdata;
    cdc_dram_rsp.r.resp   = mig_rresp;
    cdc_dram_rsp.r.last   = mig_rlast;
    cdc_dram_rsp.r.user   = '0;
  end

  xlnx_mig_ddr4 i_dram (
    // Reset/clock in
    .sys_rst                 (sys_rst_i),       // Active high
    .c0_sys_clk_i            (dram_clk_i),
    .c0_ddr4_aresetn         (soc_resetn_i),

    // UI clock/reset out
    .c0_ddr4_ui_clk          (dram_axi_clk),
    .c0_ddr4_ui_clk_sync_rst (dram_rst_o),

    // AXI slave interface to MIG
    .c0_ddr4_s_axi_awid      (cdc_dram_req.aw.id),
    .c0_ddr4_s_axi_awaddr    (mig_awaddr_aligned),
    .c0_ddr4_s_axi_awlen     (cdc_dram_req.aw.len),
    .c0_ddr4_s_axi_awsize    (MIG_SIZE[2:0]),              // force 16B beats
    .c0_ddr4_s_axi_awburst   (cdc_dram_req.aw.burst),
    .c0_ddr4_s_axi_awlock    (cdc_dram_req.aw.lock),
    .c0_ddr4_s_axi_awcache   (cdc_dram_req.aw.cache),
    .c0_ddr4_s_axi_awprot    (cdc_dram_req.aw.prot),
    .c0_ddr4_s_axi_awqos     (cdc_dram_req.aw.qos),
    .c0_ddr4_s_axi_awvalid   (cdc_dram_req.aw_valid & mig_ready),
    .c0_ddr4_s_axi_awready   (mig_awready),

    .c0_ddr4_s_axi_wdata     (cdc_dram_req.w.data),
    .c0_ddr4_s_axi_wstrb     (cdc_dram_req.w.strb),
    .c0_ddr4_s_axi_wlast     (cdc_dram_req.w.last),
    .c0_ddr4_s_axi_wvalid    (cdc_dram_req.w_valid & mig_ready),
    .c0_ddr4_s_axi_wready    (mig_wready),

    .c0_ddr4_s_axi_bready    (cdc_dram_req.b_ready),
    .c0_ddr4_s_axi_bid       (mig_bid),
    .c0_ddr4_s_axi_bresp     (mig_bresp),
    .c0_ddr4_s_axi_bvalid    (mig_bvalid),

    .c0_ddr4_s_axi_arid      (cdc_dram_req.ar.id),
    .c0_ddr4_s_axi_araddr    (mig_araddr_aligned),
    .c0_ddr4_s_axi_arlen     (cdc_dram_req.ar.len),
    .c0_ddr4_s_axi_arsize    (MIG_SIZE[2:0]),              // force 16B beats
    .c0_ddr4_s_axi_arburst   (cdc_dram_req.ar.burst),
    .c0_ddr4_s_axi_arlock    (cdc_dram_req.ar.lock),
    .c0_ddr4_s_axi_arcache   (cdc_dram_req.ar.cache),
    .c0_ddr4_s_axi_arprot    (cdc_dram_req.ar.prot),
    .c0_ddr4_s_axi_arqos     (cdc_dram_req.ar.qos),
    .c0_ddr4_s_axi_arvalid   (cdc_dram_req.ar_valid & mig_ready),
    .c0_ddr4_s_axi_arready   (mig_arready),

    .c0_ddr4_s_axi_rready    (cdc_dram_req.r_ready),
    .c0_ddr4_s_axi_rid       (mig_rid),
    .c0_ddr4_s_axi_rdata     (mig_rdata),
    .c0_ddr4_s_axi_rresp     (mig_rresp),
    .c0_ddr4_s_axi_rlast     (mig_rlast),
    .c0_ddr4_s_axi_rvalid    (mig_rvalid),

    // Calibration complete (CRITICAL!)
    .c0_init_calib_complete  (mig_calib_complete),

    // Other MIG outputs you might have
    .addn_ui_clkout1         (dram_clk_o),
    .dbg_clk                 (),
    .dbg_bus                 (),

    // PHY ports
    .*
  );

`endif // USE_DDR4


  ///////////////////////
  // Instantiate DDR3   //
  ///////////////////////
`ifdef USE_DDR3
  // (Left unchanged; for ZCU you are using DDR4)
  xlnx_mig_7_ddr3 i_dram ( .* );
`endif

endmodule