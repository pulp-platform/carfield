// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>
// Cyril Koenig <cykoenig@iis.ee.ethz.ch>

`include "axi/typedef.svh"
`include "cheshire/typedef.svh"

module carfield_xilinx
  import carfield_pkg::*;
  import cheshire_pkg::*;
  import safety_island_pkg::*;
#(
  parameter int unsigned HypNumPhys  = 2,
  parameter int unsigned HypNumChips = 2,
  parameter int unsigned HYPERRAM_CLK_DIVIDER = 2
) (
  input  logic         cpu_reset,

  input  logic         clk_10,
  input  logic         clk_20,
  input  logic         clk_50,
  input  logic         clk_100,

  input  logic         testmode_i,
  input  logic [1:0]   boot_mode_i,
  input  logic [1:0]   boot_mode_safety_i,

  input  logic         jtag_tck_i,
  input  logic         jtag_tms_i,
  input  logic         jtag_tdi_i,
  output logic         jtag_tdo_o,
  input  logic         jtag_trst_ni,
  output logic         jtag_vdd_o,
  output logic         jtag_gnd_o,

  output logic         uart_tx_o,
  input  logic         uart_rx_i,

  // GPIOs will be used as interrupts,
  input  logic [31:0]  gpio_i,


  // Hyperbus

  // Physical interace: HyperBus PADs
  // Attention CS0 correspond to CS1 on the FMC (see constraints)
  inout  [HypNumPhys-1:0][HypNumChips-1:0]  pad_hyper_csn,
  inout  [HypNumPhys-1:0]                   pad_hyper_ck,
  inout  [HypNumPhys-1:0]                   pad_hyper_ckn,
  inout  [HypNumPhys-1:0]                   pad_hyper_rwds,
  // inout  [HypNumPhys-1:0]                pad_hyper_reset,
  inout  [HypNumPhys-1:0][7:0]              pad_hyper_dq,

  // Dram axi

  output wire dram_axi_m_aclk,
  output wire dram_axi_m_aresetn,

  output wire [6:0] dram_axi_m_axi_awid,
  output wire [47:0] dram_axi_m_axi_awaddr,
  output wire [7:0] dram_axi_m_axi_awlen,
  output wire [2:0] dram_axi_m_axi_awsize,
  output wire [1:0] dram_axi_m_axi_awburst,
  output wire dram_axi_m_axi_awlock,
  output wire [3:0] dram_axi_m_axi_awcache,
  output wire [2:0] dram_axi_m_axi_awprot,
  output wire [3:0] dram_axi_m_axi_awqos,
  output wire dram_axi_m_axi_awvalid,
  input  wire dram_axi_m_axi_awready,

  output wire [63:0] dram_axi_m_axi_wdata,
  output wire [7:0] dram_axi_m_axi_wstrb,
  output wire dram_axi_m_axi_wlast,
  output wire dram_axi_m_axi_wvalid,
  input  wire dram_axi_m_axi_wready,

  output wire dram_axi_m_axi_bready,
  input  wire [6:0] dram_axi_m_axi_bid,
  input  wire [1:0] dram_axi_m_axi_bresp,
  input  wire dram_axi_m_axi_bvalid,

  output wire [6:0]dram_axi_m_axi_arid,
  output wire [47:0] dram_axi_m_axi_araddr,
  output wire [7:0] dram_axi_m_axi_arlen,
  output wire [2:0] dram_axi_m_axi_arsize,
  output wire [1:0] dram_axi_m_axi_arburst,
  output wire dram_axi_m_axi_arlock,
  output wire [3:0] dram_axi_m_axi_arcache,
  output wire [2:0] dram_axi_m_axi_arprot,
  output wire [3:0] dram_axi_m_axi_arqos,
  output wire dram_axi_m_axi_arvalid,
  input  wire dram_axi_m_axi_arready,

  output wire dram_axi_m_axi_rready,
  input  wire [6:0] dram_axi_m_axi_rid,
  input  wire [63:0] dram_axi_m_axi_rdata,
  input  wire [1:0] dram_axi_m_axi_rresp,
  input  wire dram_axi_m_axi_rlast,
  input  wire dram_axi_m_axi_rvalid,

  // Periph axi out

  output wire periph_axi_m_aclk,
  output wire periph_axi_m_aresetn,

  output wire [1:0] periph_axi_m_axi_awid,
  output wire [47:0] periph_axi_m_axi_awaddr,
  output wire [7:0] periph_axi_m_axi_awlen,
  output wire [2:0] periph_axi_m_axi_awsize,
  output wire [1:0] periph_axi_m_axi_awburst,
  output wire periph_axi_m_axi_awlock,
  output wire [3:0] periph_axi_m_axi_awcache,
  output wire [2:0] periph_axi_m_axi_awprot,
  output wire [3:0] periph_axi_m_axi_awqos,
  output wire periph_axi_m_axi_awvalid,
  input  wire periph_axi_m_axi_awready,

  output wire [63:0] periph_axi_m_axi_wdata,
  output wire [7:0] periph_axi_m_axi_wstrb,
  output wire periph_axi_m_axi_wlast,
  output wire periph_axi_m_axi_wvalid,
  input  wire periph_axi_m_axi_wready,

  output wire periph_axi_m_axi_bready,
  input  wire [1:0] periph_axi_m_axi_bid,
  input  wire [1:0] periph_axi_m_axi_bresp,
  input  wire periph_axi_m_axi_bvalid,

  output wire [1:0]periph_axi_m_axi_arid,
  output wire [47:0] periph_axi_m_axi_araddr,
  output wire [7:0] periph_axi_m_axi_arlen,
  output wire [2:0] periph_axi_m_axi_arsize,
  output wire [1:0] periph_axi_m_axi_arburst,
  output wire periph_axi_m_axi_arlock,
  output wire [3:0] periph_axi_m_axi_arcache,
  output wire [2:0] periph_axi_m_axi_arprot,
  output wire [3:0] periph_axi_m_axi_arqos,
  output wire periph_axi_m_axi_arvalid,
  input  wire periph_axi_m_axi_arready,

  output wire periph_axi_m_axi_rready,
  input  wire [1:0] periph_axi_m_axi_rid,
  input  wire [63:0] periph_axi_m_axi_rdata,
  input  wire [1:0] periph_axi_m_axi_rresp,
  input  wire periph_axi_m_axi_rlast,
  input  wire periph_axi_m_axi_rvalid,

  // Periph axi in

  input wire [1:0] periph_axi_s_axi_awid,
  input wire [47:0] periph_axi_s_axi_awaddr,
  input wire [7:0] periph_axi_s_axi_awlen,
  input wire [2:0] periph_axi_s_axi_awsize,
  input wire [1:0] periph_axi_s_axi_awburst,
  input wire periph_axi_s_axi_awlock,
  input wire [3:0] periph_axi_s_axi_awcache,
  input wire [2:0] periph_axi_s_axi_awprot,
  input wire [3:0] periph_axi_s_axi_awqos,
  input wire periph_axi_s_axi_awvalid,
  output  wire periph_axi_s_axi_awready,

  input wire [63:0] periph_axi_s_axi_wdata,
  input wire [7:0] periph_axi_s_axi_wstrb,
  input wire periph_axi_s_axi_wlast,
  input wire periph_axi_s_axi_wvalid,
  output  wire periph_axi_s_axi_wready,

  input wire periph_axi_s_axi_bready,
  output  wire [1:0] periph_axi_s_axi_bid,
  output  wire [1:0] periph_axi_s_axi_bresp,
  output  wire periph_axi_s_axi_bvalid,

  input wire [1:0]periph_axi_s_axi_arid,
  input wire [47:0] periph_axi_s_axi_araddr,
  input wire [7:0] periph_axi_s_axi_arlen,
  input wire [2:0] periph_axi_s_axi_arsize,
  input wire [1:0] periph_axi_s_axi_arburst,
  input wire periph_axi_s_axi_arlock,
  input wire [3:0] periph_axi_s_axi_arcache,
  input wire [2:0] periph_axi_s_axi_arprot,
  input wire [3:0] periph_axi_s_axi_arqos,
  input wire periph_axi_s_axi_arvalid,
  output  wire periph_axi_s_axi_arready,

  input   wire periph_axi_s_axi_rready,
  output  wire [1:0] periph_axi_s_axi_rid,
  output  wire [63:0] periph_axi_s_axi_rdata,
  output  wire [1:0] periph_axi_s_axi_rresp,
  output  wire periph_axi_s_axi_rlast,
  output  wire periph_axi_s_axi_rvalid

);

  ///////////////////////////
  // Clk reset definitions //
  ///////////////////////////

  logic cpu_resetn;
  assign cpu_resetn = ~cpu_reset;
  logic sys_rst;

  wire soc_clk, host_clk, alt_clk, periph_clk;
  (* dont_touch = "yes" *)  wire rst_n;

  ///////////////////
  // GPIOs         // 
  ///////////////////

  // Give VDD and GND to JTAG
  assign jtag_vdd_o  = '1;
  assign jtag_gnd_o  = '0;

  //////////////////
  // Clock Wizard //
  //////////////////

  localparam rtc_clk_divider = 4;
  assign soc_clk = clk_50;
  assign alt_clk = clk_20;
  assign host_clk = soc_clk;
  assign periph_clk = soc_clk;

  /////////////////////
  // Reset Generator //
  /////////////////////

  rstgen i_rstgen_main (
    .clk_i        ( soc_clk                  ),
    .rst_ni       ( ~sys_rst                 ),
    .test_mode_i  ( testmode_i              ),
    .rst_no       ( rst_n                    ),
    .init_no      (                          ) // keep open
  );

  ///////////////////
  // VIOs          //
  ///////////////////

  logic [1:0] boot_mode, boot_mode_safety;

  assign sys_rst = cpu_reset;
  assign boot_mode = boot_mode_i;
  assign boot_mode_safety = boot_mode_safety_i;

  /////////////////////////
  // "RTC" Clock Divider //
  /////////////////////////

  (* dont_touch = "yes" *) logic rtc_clk_d, rtc_clk_q;
  logic [4:0] counter_d, counter_q;

  // Divide clk_10 => 1 MHz RTC Clock
  always_comb begin
    counter_d = counter_q + 1;
    rtc_clk_d = rtc_clk_q;

    if(counter_q == rtc_clk_divider) begin
      counter_d = 5'b0;
      rtc_clk_d = ~rtc_clk_q;
    end
  end

  always_ff @(posedge clk_10, negedge rst_n) begin
    if(~rst_n) begin
      counter_q <= 5'b0;
      rtc_clk_q <= 0;
    end else begin
      counter_q <= counter_d;
      rtc_clk_q <= rtc_clk_d;
    end
  end

  //////////////////
  // Carfield Cfg //
  //////////////////

  localparam cheshire_cfg_t Cfg = carfield_pkg::CarfieldCfgDefault;
  `CHESHIRE_TYPEDEF_ALL(carfield_, Cfg)

  ///////////////////
  // LLC interface //
  ///////////////////

  localparam axi_in_t   AxiIn   = gen_axi_in(Cfg);
  localparam int unsigned LlcIdWidth = Cfg.AxiMstIdWidth+$clog2(AxiIn.num_in)+Cfg.LlcNotBypass;
  localparam int unsigned LlcArWidth = (2**LogDepth)*axi_pkg::ar_width(Cfg.AddrWidth,LlcIdWidth,Cfg.AxiUserWidth);
  localparam int unsigned LlcAwWidth = (2**LogDepth)*axi_pkg::aw_width(Cfg.AddrWidth,LlcIdWidth,Cfg.AxiUserWidth);
  localparam int unsigned LlcBWidth  = (2**LogDepth)*axi_pkg::b_width(LlcIdWidth,Cfg.AxiUserWidth);
  localparam int unsigned LlcRWidth  = (2**LogDepth)*axi_pkg::r_width(Cfg.AxiDataWidth,LlcIdWidth,Cfg.AxiUserWidth);
  localparam int unsigned LlcWWidth  = (2**LogDepth)*axi_pkg::w_width(Cfg.AxiDataWidth,Cfg.AxiUserWidth);
  // LLC interface
  logic [LlcArWidth-1:0] llc_ar_data;
  logic [    LogDepth:0] llc_ar_wptr;
  logic [    LogDepth:0] llc_ar_rptr;
  logic [LlcAwWidth-1:0] llc_aw_data;
  logic [    LogDepth:0] llc_aw_wptr;
  logic [    LogDepth:0] llc_aw_rptr;
  logic [ LlcBWidth-1:0] llc_b_data;
  logic [    LogDepth:0] llc_b_wptr;
  logic [    LogDepth:0] llc_b_rptr;
  logic [ LlcRWidth-1:0] llc_r_data;
  logic [    LogDepth:0] llc_r_wptr;
  logic [    LogDepth:0] llc_r_rptr;
  logic [ LlcWWidth-1:0] llc_w_data;
  logic [    LogDepth:0] llc_w_wptr;
  logic [    LogDepth:0] llc_w_rptr;
  // Axi interface
  carfield_axi_llc_req_t llc_req;
  carfield_axi_llc_rsp_t llc_rsp;

  axi_cdc_dst      #(
  .LogDepth     ( LogDepth                   ),
  .axi_req_t    ( carfield_axi_llc_req_t     ),
  .axi_resp_t   ( carfield_axi_llc_rsp_t     ),
  .w_chan_t     ( carfield_axi_llc_w_chan_t  ),
  .b_chan_t     ( carfield_axi_llc_b_chan_t  ),
  .ar_chan_t    ( carfield_axi_llc_ar_chan_t ),
  .r_chan_t     ( carfield_axi_llc_r_chan_t  ),
  .aw_chan_t    ( carfield_axi_llc_aw_chan_t )
  ) i_hyper_cdc_dst (
  .async_data_slave_aw_data_i ( llc_aw_data ),
  .async_data_slave_aw_wptr_i ( llc_aw_wptr ),
  .async_data_slave_aw_rptr_o ( llc_aw_rptr ),
  .async_data_slave_w_data_i  ( llc_w_data  ),
  .async_data_slave_w_wptr_i  ( llc_w_wptr  ),
  .async_data_slave_w_rptr_o  ( llc_w_rptr  ),
  .async_data_slave_b_data_o  ( llc_b_data  ),
  .async_data_slave_b_wptr_o  ( llc_b_wptr  ),
  .async_data_slave_b_rptr_i  ( llc_b_rptr  ),
  .async_data_slave_ar_data_i ( llc_ar_data ),
  .async_data_slave_ar_wptr_i ( llc_ar_wptr ),
  .async_data_slave_ar_rptr_o ( llc_ar_rptr ),
  .async_data_slave_r_data_o  ( llc_r_data  ),
  .async_data_slave_r_wptr_o  ( llc_r_wptr  ),
  .async_data_slave_r_rptr_i  ( llc_r_rptr  ),
  // synchronous master port
  .dst_clk_i                  ( soc_clk     ),
  .dst_rst_ni                 ( rst_n       ),
  .dst_req_o                  ( llc_req   ),
  .dst_resp_i                 ( llc_rsp   )
);

  assign dram_axi_m_aclk             = soc_clk;
  assign dram_axi_m_aresetn          = rst_n;

  assign dram_axi_m_axi_awid         = llc_req.aw.id;
  assign dram_axi_m_axi_awaddr       = llc_req.aw.addr;
  assign dram_axi_m_axi_awlen        = llc_req.aw.len;
  assign dram_axi_m_axi_awsize       = llc_req.aw.size;
  assign dram_axi_m_axi_awburst      = llc_req.aw.burst;
  assign dram_axi_m_axi_awlock       = llc_req.aw.lock;
  assign dram_axi_m_axi_awcache      = llc_req.aw.cache;
  assign dram_axi_m_axi_awprot       = llc_req.aw.prot;
  assign dram_axi_m_axi_awqos        = llc_req.aw.qos;
  assign dram_axi_m_axi_awvalid      = llc_req.aw_valid;
  assign llc_rsp.aw_ready            = dram_axi_m_axi_awready;

  assign dram_axi_m_axi_wdata        = llc_req.w.data;
  assign dram_axi_m_axi_wstrb        = llc_req.w.strb;
  assign dram_axi_m_axi_wlast        = llc_req.w.last;
  assign dram_axi_m_axi_wvalid       = llc_req.w_valid;
  assign llc_rsp.w_ready             = dram_axi_m_axi_wready;

  assign dram_axi_m_axi_bready       = llc_req.b_ready;
  assign llc_rsp.b.id                = dram_axi_m_axi_bid;
  assign llc_rsp.b.resp              = dram_axi_m_axi_bresp;
  assign llc_rsp.b_valid             = dram_axi_m_axi_bvalid;

  assign dram_axi_m_axi_arid         = llc_req.ar.id;
  assign dram_axi_m_axi_araddr       = llc_req.ar.addr;
  assign dram_axi_m_axi_arlen        = llc_req.ar.len;
  assign dram_axi_m_axi_arsize       = llc_req.ar.size;
  assign dram_axi_m_axi_arburst      = llc_req.ar.burst;
  assign dram_axi_m_axi_arlock       = llc_req.ar.lock;
  assign dram_axi_m_axi_arcache      = llc_req.ar.cache;
  assign dram_axi_m_axi_arprot       = llc_req.ar.prot;
  assign dram_axi_m_axi_arqos        = llc_req.ar.qos;
  assign dram_axi_m_axi_arvalid      = llc_req.ar_valid;
  assign llc_rsp.ar_ready            = dram_axi_m_axi_arready;

  assign dram_axi_m_axi_rready       = llc_req.r_ready;
  assign llc_rsp.r.id                = dram_axi_m_axi_rid;
  assign llc_rsp.r.data              = dram_axi_m_axi_rdata;
  assign llc_rsp.r.resp              = dram_axi_m_axi_rresp;
  assign llc_rsp.r.last              = dram_axi_m_axi_rlast;
  assign llc_rsp.r_valid             = dram_axi_m_axi_rvalid;

  /////////////////////////////////
  // Serial Link to block design //
  /////////////////////////////////

  // Serial link interface
  logic [SlinkNumChan-1:0]                     slink_clk_soc_periph;
  logic [SlinkNumChan-1:0]                     slink_clk_periph_soc;
  logic [SlinkNumChan-1:0][SlinkNumLanes-1:0]  slink_soc_periph;
  logic [SlinkNumChan-1:0][SlinkNumLanes-1:0]  slink_periph_soc;

  carfield_axi_mst_req_t periph_soc_bd_req, periph_bd_soc_req;
  carfield_axi_mst_rsp_t periph_soc_bd_rsp, periph_bd_soc_rsp;

  serial_link #(
    .axi_req_t    ( carfield_axi_mst_req_t ),
    .axi_rsp_t    ( carfield_axi_mst_rsp_t ),
    .cfg_req_t    ( carfield_reg_req_t ),
    .cfg_rsp_t    ( carfield_reg_rsp_t ),
    .aw_chan_t    ( carfield_axi_mst_aw_chan_t ),
    .ar_chan_t    ( carfield_axi_mst_ar_chan_t ),
    .r_chan_t     ( carfield_axi_mst_r_chan_t  ),
    .w_chan_t     ( carfield_axi_mst_w_chan_t  ),
    .b_chan_t     ( carfield_axi_mst_b_chan_t  ),
    .hw2reg_t     ( serial_link_single_channel_reg_pkg::serial_link_single_channel_hw2reg_t ),
    .reg2hw_t     ( serial_link_single_channel_reg_pkg::serial_link_single_channel_reg2hw_t ),
    .NumChannels  ( SlinkNumChan   ),
    .NumLanes     ( SlinkNumLanes  ),
    .MaxClkDiv    ( SlinkMaxClkDiv )
  ) i_serial_link (
    .clk_i          ( host_clk   ),
    .rst_ni         ( rst_n      ),
    .clk_sl_i       ( host_clk   ),
    .rst_sl_ni      ( rst_n      ),
    .clk_reg_i      ( host_clk   ),
    .rst_reg_ni     ( rst_n      ),
    .testmode_i     ( testmode_i ),
    .axi_in_req_i   ( periph_bd_soc_req ),
    .axi_in_rsp_o   ( periph_bd_soc_rsp ),
    .axi_out_req_o  ( periph_soc_bd_req ),
    .axi_out_rsp_i  ( periph_soc_bd_rsp ),
    .cfg_req_i      ( '0 ),
    .cfg_rsp_o      (    ),
    .ddr_rcv_clk_i  ( slink_clk_soc_periph ),
    .ddr_rcv_clk_o  ( slink_clk_periph_soc ),
    .ddr_i          ( slink_soc_periph ),
    .ddr_o          ( slink_periph_soc ),
    .isolated_i     ( '0 ),
    .isolate_o      ( ),
    .clk_ena_o      ( ),
    .reset_no       ( )
  );

  // AXI periph soc to block design

  assign periph_axi_m_aclk           = soc_clk;
  assign periph_axi_m_aresetn        = rst_n;

  assign periph_axi_m_axi_awid         = periph_soc_bd_req.aw.id;
  assign periph_axi_m_axi_awaddr       = periph_soc_bd_req.aw.addr;
  assign periph_axi_m_axi_awlen        = periph_soc_bd_req.aw.len;
  assign periph_axi_m_axi_awsize       = periph_soc_bd_req.aw.size;
  assign periph_axi_m_axi_awburst      = periph_soc_bd_req.aw.burst;
  assign periph_axi_m_axi_awlock       = periph_soc_bd_req.aw.lock;
  assign periph_axi_m_axi_awcache      = periph_soc_bd_req.aw.cache;
  assign periph_axi_m_axi_awprot       = periph_soc_bd_req.aw.prot;
  assign periph_axi_m_axi_awqos        = periph_soc_bd_req.aw.qos;
  assign periph_axi_m_axi_awvalid      = periph_soc_bd_req.aw_valid;
  assign periph_soc_bd_rsp.aw_ready    = periph_axi_m_axi_awready;

  assign periph_axi_m_axi_wdata        = periph_soc_bd_req.w.data;
  assign periph_axi_m_axi_wstrb        = periph_soc_bd_req.w.strb;
  assign periph_axi_m_axi_wlast        = periph_soc_bd_req.w.last;
  assign periph_axi_m_axi_wvalid       = periph_soc_bd_req.w_valid;
  assign periph_soc_bd_rsp.w_ready     = periph_axi_m_axi_wready;

  assign periph_axi_m_axi_bready       = periph_soc_bd_req.b_ready;
  assign periph_soc_bd_rsp.b.id        = periph_axi_m_axi_bid;
  assign periph_soc_bd_rsp.b.resp      = periph_axi_m_axi_bresp;
  assign periph_soc_bd_rsp.b_valid     = periph_axi_m_axi_bvalid;

  assign periph_axi_m_axi_arid         = periph_soc_bd_req.ar.id;
  assign periph_axi_m_axi_araddr       = periph_soc_bd_req.ar.addr;
  assign periph_axi_m_axi_arlen        = periph_soc_bd_req.ar.len;
  assign periph_axi_m_axi_arsize       = periph_soc_bd_req.ar.size;
  assign periph_axi_m_axi_arburst      = periph_soc_bd_req.ar.burst;
  assign periph_axi_m_axi_arlock       = periph_soc_bd_req.ar.lock;
  assign periph_axi_m_axi_arcache      = periph_soc_bd_req.ar.cache;
  assign periph_axi_m_axi_arprot       = periph_soc_bd_req.ar.prot;
  assign periph_axi_m_axi_arqos        = periph_soc_bd_req.ar.qos;
  assign periph_axi_m_axi_arvalid      = periph_soc_bd_req.ar_valid;
  assign periph_soc_bd_rsp.ar_ready    = periph_axi_m_axi_arready;

  assign periph_axi_m_axi_rready       = periph_soc_bd_req.r_ready;
  assign periph_soc_bd_rsp.r.id        = periph_axi_m_axi_rid;
  assign periph_soc_bd_rsp.r.data      = periph_axi_m_axi_rdata;
  assign periph_soc_bd_rsp.r.resp      = periph_axi_m_axi_rresp;
  assign periph_soc_bd_rsp.r.last      = periph_axi_m_axi_rlast;
  assign periph_soc_bd_rsp.r_valid     = periph_axi_m_axi_rvalid;

  // AXI periph block design to soc

  // periph_axi_s_aclk     unused (assumed already synch with soc_clk)
  // periph_axi_s_aresetn  ubused (assumed already synch with reset)

  assign periph_bd_soc_req.aw.id      =  periph_axi_s_axi_awid    ;
  assign periph_bd_soc_req.aw.addr    =  periph_axi_s_axi_awaddr  ;
  assign periph_bd_soc_req.aw.len     =  periph_axi_s_axi_awlen   ;
  assign periph_bd_soc_req.aw.size    =  periph_axi_s_axi_awsize  ;

  assign periph_bd_soc_req.aw.burst   = periph_axi_s_axi_awburst  ;
  assign periph_bd_soc_req.aw.lock    = periph_axi_s_axi_awlock   ;
  assign periph_bd_soc_req.aw.cache   = periph_axi_s_axi_awcache  ;
  assign periph_bd_soc_req.aw.prot    = periph_axi_s_axi_awprot   ;
  assign periph_bd_soc_req.aw.qos     = periph_axi_s_axi_awqos    ;
  assign periph_bd_soc_req.aw_valid   = periph_axi_s_axi_awvalid  ;
  assign periph_axi_s_axi_awready     = periph_bd_soc_rsp.aw_ready;

  assign periph_bd_soc_req.w.data     = periph_axi_s_axi_wdata    ;
  assign periph_bd_soc_req.w.strb     = periph_axi_s_axi_wstrb    ;
  assign periph_bd_soc_req.w.last     = periph_axi_s_axi_wlast    ;
  assign periph_bd_soc_req.w_valid    = periph_axi_s_axi_wvalid   ;
  assign periph_axi_s_axi_wready      = periph_bd_soc_rsp.w_ready ;

  assign periph_bd_soc_req.b_ready    = periph_axi_s_axi_bready   ;
  assign periph_axi_s_axi_bid         = periph_bd_soc_rsp.b.id    ;
  assign periph_axi_s_axi_bresp       = periph_bd_soc_rsp.b.resp  ;
  assign periph_axi_s_axi_bvalid      = periph_bd_soc_rsp.b_valid ;

  assign periph_bd_soc_req.ar.id      = periph_axi_s_axi_arid      ;
  assign periph_bd_soc_req.ar.addr    = periph_axi_s_axi_araddr    ;
  assign periph_bd_soc_req.ar.len     = periph_axi_s_axi_arlen     ;
  assign periph_bd_soc_req.ar.size    = periph_axi_s_axi_arsize    ;
  assign periph_bd_soc_req.ar.burst   = periph_axi_s_axi_arburst   ;
  assign periph_bd_soc_req.ar.lock    = periph_axi_s_axi_arlock    ;
  assign periph_bd_soc_req.ar.cache   = periph_axi_s_axi_arcache   ;
  assign periph_bd_soc_req.ar.prot    = periph_axi_s_axi_arprot    ;
  assign periph_bd_soc_req.ar.qos     = periph_axi_s_axi_arqos     ;
  assign periph_bd_soc_req.ar_valid   = periph_axi_s_axi_arvalid   ;
  assign periph_axi_s_axi_arready     = periph_bd_soc_rsp.ar_ready ;

  assign periph_bd_soc_req.r_ready    = periph_axi_s_axi_rready    ;
  assign periph_axi_s_axi_rid         = periph_bd_soc_rsp.r.id     ;
  assign periph_axi_s_axi_rdata       = periph_bd_soc_rsp.r.data   ;
  assign periph_axi_s_axi_rresp       = periph_bd_soc_rsp.r.resp   ;
  assign periph_axi_s_axi_rlast       = periph_bd_soc_rsp.r.last   ;
  assign periph_axi_s_axi_rvalid      = periph_bd_soc_rsp.r_valid  ;

  //////////////////
  // SPI Adaption //
  //////////////////

  logic spi_sck_soc;
  logic [1:0] spi_cs_soc;
  logic [3:0] spi_sd_soc_out;
  logic [3:0] spi_sd_soc_in;

  logic spi_sck_en;
  logic [1:0] spi_cs_en;
  logic [3:0] spi_sd_en;

  //////////////////
  // QSPI         //
  //////////////////

  logic                 qspi_clk;
  logic                 qspi_clk_ts;
  logic [3:0]           qspi_dqi;
  logic [3:0]           qspi_dqo_ts;
  logic [3:0]           qspi_dqo;
  logic [SpihNumCs-1:0] qspi_cs_b;
  logic [SpihNumCs-1:0] qspi_cs_b_ts;

  assign qspi_clk      = spi_sck_soc;
  assign qspi_cs_b     = spi_cs_soc;
  assign qspi_dqo      = spi_sd_soc_out;
  assign spi_sd_soc_in = qspi_dqi;
  // Tristate - Enable
  assign qspi_clk_ts  = ~spi_sck_en;
  assign qspi_cs_b_ts = ~spi_cs_en;
  assign qspi_dqo_ts  = ~spi_sd_en;

  // On VCU128/ZCU102, SPI ports are not directly available
  STARTUPE3 #(
     .PROG_USR("FALSE"),
     .SIM_CCLK_FREQ(0.0)
  )
  STARTUPE3_inst (
     .CFGCLK    ( /* Output */ ),
     .CFGMCLK   ( /* Output */ ),
     .DI        (qspi_dqi),
     .EOS       ( /* Output */ ),
     .PREQ      ( /* Output */ ),
     .DO        (qspi_dqo),
     .DTS       (qspi_dqo_ts),
     .FCSBO     (qspi_cs_b[1]),
     .FCSBTS    (qspi_cs_b_ts[1]),
     .GSR       (1'b0),
     .GTS       (1'b0),
     .KEYCLEARB (1'b1),
     .PACK      (1'b0),
     .USRCCLKO  (qspi_clk),
     .USRCCLKTS (qspi_clk_ts),
     .USRDONEO  (1'b1),
     .USRDONETS (1'b1)
  );


  ///////////////////
  // Hyperram PADS //
  ///////////////////

  logic [HypNumPhys-1:0][HypNumChips-1:0]  hyper_cs_n_wire;
  logic [HypNumPhys-1:0][HypNumChips-1:0]  hyper_cs_pad_out;
  logic [HypNumPhys-1:0]                   hyper_ck_wire;
  logic [HypNumPhys-1:0]                   hyper_ck_out_wire;
  logic [HypNumPhys-1:0]                   hyper_ck_n_wire;
  logic [HypNumPhys-1:0]                   hyper_ck_n_out_wire;
  logic [HypNumPhys-1:0]                   hyper_rwds_o;
  logic [HypNumPhys-1:0]                   hyper_rwds_i;
  logic [HypNumPhys-1:0]                   hyper_rwds_oe;
  logic [HypNumPhys-1:0][7:0]              hyper_dq_i;
  logic [HypNumPhys-1:0][7:0]              hyper_dq_o;
  logic [HypNumPhys-1:0]                   hyper_dq_oe;
  logic [HypNumPhys-1:0]                   hyper_reset_n_wire;
  logic [HypNumPhys-1:0]                   hyper_rst_n_out_wire;

`ifndef GEN_NO_HYPERBUS 
  for (genvar i = 0 ; i<HypNumPhys; i++) begin : gen_hyper_phy
    for (genvar j = 0; j<HypNumChips; j++) begin : gen_hyper_cs
      pad_functional_pd padinst_hyper_csno (
        .OEN ( 1'b0                    ),
        .I   ( hyper_cs_n_wire[i][j]   ),
        .O   ( hyper_cs_pad_out[i][j]  ),
        .PEN (                         ),
        .PAD ( pad_hyper_csn[i][j]     )
      );
    end
    pad_functional_pd padinst_hyper_ck (
      .OEN ( 1'b0                 ),
      .I   ( hyper_ck_wire[i]     ),
      .O   ( hyper_ck_out_wire[i] ),
      .PEN (                      ),
      .PAD ( pad_hyper_ck[i]      )
    );
    pad_functional_pd padinst_hyper_ckno   (
      .OEN ( 1'b0                   ),
      .I   ( hyper_ck_n_wire[i]     ),
      .O   ( hyper_ck_n_out_wire[i] ),
      .PEN (                        ),
      .PAD ( pad_hyper_ckn[i]       )
    );
    pad_functional_pd padinst_hyper_rwds0  (
      .OEN ( ~hyper_rwds_oe[i]   ),
      .I   ( hyper_rwds_o[i]     ),
      .O   ( hyper_rwds_i[i]     ),
      .PEN (                     ),
      .PAD ( pad_hyper_rwds[i]   )
    );
    for (genvar j = 0; j < 8; j++) begin : gen_hyper_dq
      pad_functional_pd padinst_hyper_dqio0  (
        .OEN ( ~hyper_dq_oe[i]    ),
        .I   ( hyper_dq_o[i][j]   ),
        .O   ( hyper_dq_i[i][j]   ),
        .PEN (                    ),
        .PAD ( pad_hyper_dq[i][j] )
      );
    end
  end
`endif // GEN_NO_HYERBUS

  ////////////////////////////
  // Hyperram Clock Divider //
  ////////////////////////////

  logic hyp_clk_phy;
  logic hyp_rst_phy_n;

  clk_int_div #(
    .DIV_VALUE_WIDTH       ( 4                     ),
    .DEFAULT_DIV_VALUE     ( HYPERRAM_CLK_DIVIDER ),
    .ENABLE_CLOCK_IN_RESET ( 1'b0                  )
  ) i_hyper_clk_div (
    .clk_i                 ( soc_clk ),
    .rst_ni                ( rst_n      ),
    .en_i                  ( 1'b1              ),
    .test_mode_en_i        ( testmode_i        ),
    .div_i                 ( HYPERRAM_CLK_DIVIDER  ),
    .div_valid_i           ( 1'b0              ),
    .div_ready_o           (                   ),
    .clk_o                 ( hyp_clk_phy       ),
    .cycl_count_o          (                   )
  );

  assign hyp_rst_phy_n = rst_n;

  //////////////////
  // Carfield SoC //
  //////////////////

  logic jtag_host_to_safety, jtag_safety_to_ot;

  carfield #(
      .Cfg (carfield_pkg::CarfieldCfgDefault),
      .reg_req_t(carfield_reg_req_t),
      .reg_rsp_t(carfield_reg_rsp_t),
`ifdef GEN_NO_HYPERBUS // bender-xilinx.mk
      .LlcIdWidth   ( LlcIdWidth ),
      .LlcArWidth   ( LlcArWidth ),
      .LlcAwWidth   ( LlcAwWidth ),
      .LlcBWidth    ( LlcBWidth  ),
      .LlcRWidth    ( LlcRWidth  ),
      .LlcWWidth    ( LlcWWidth  ),
`endif
      .HypNumPhys   ( HypNumPhys ),
      .HypNumChips  ( HypNumChips)
  ) i_carfield (
      .host_clk_i    (host_clk),
      .periph_clk_i  (periph_clk),
      .alt_clk_i     (alt_clk),
      .rt_clk_i      (rtc_clk_q),
      .pwr_on_rst_ni (rst_n),
      .test_mode_i   (testmode_i),
      // Boot mode selection
      .boot_mode_i   (boot_mode),
      // Cheshire JTAG Interface
      .jtag_tck_i                (jtag_tck_i),
      .jtag_trst_ni              (jtag_trst_ni),
      .jtag_tms_i                (jtag_tms_i),
      .jtag_tdi_i                (jtag_tdi_i),
      .jtag_tdo_o                (jtag_host_to_safety),
      .jtag_tdo_oe_o             (),
      // Secure Subsystem JTAG Interface
      .jtag_ot_tck_i             (jtag_tck_i),
      .jtag_ot_trst_ni           (jtag_trst_ni),
      .jtag_ot_tms_i             (jtag_tms_i),
      .jtag_ot_tdi_i             (jtag_safety_to_ot),
      .jtag_ot_tdo_o             (jtag_tdo_o), // Take in account when they are unactivated
      .jtag_ot_tdo_oe_o          (),
      // Safety Island JTAG Interface
      .jtag_safety_island_tck_i  (jtag_tck_i),
      .jtag_safety_island_trst_ni(jtag_trst_ni),
      .jtag_safety_island_tms_i  (jtag_tms_i),
      .jtag_safety_island_tdi_i  (jtag_host_to_safety),
      .jtag_safety_island_tdo_o  (jtag_safety_to_ot),
      .bootmode_safe_isln_i      (boot_mode_safety),
      // UART Interface
      .uart_tx_o,
      .uart_rx_i,
      // OT UART Interface
      .uart_ot_tx_o              (),
      .uart_ot_rx_i              (),
      // Controle Flow UART Modem
      //.uart_rts_no               (),
      //.uart_dtr_no               (),
      //.uart_cts_ni               (),
      //.uart_dsr_ni               (),
      //.uart_dcd_ni               (),
      //.uart_rin_ni               (),
      // I2C Interface
      .i2c_sda_o                 (),
      .i2c_sda_i                 (),
      .i2c_sda_en_o              (),
      .i2c_scl_o                 (),
      .i2c_scl_i                 (),
      .i2c_scl_en_o              (),
      // SPI Host Interface
      .spih_sck_o                (spi_sck_soc),
      .spih_sck_en_o             (spi_sck_en),
      .spih_csb_o                (spi_cs_soc),
      .spih_csb_en_o             (spi_cs_en),
      .spih_sd_o                 (spi_sd_soc_out),
      .spih_sd_en_o              (spi_sd_en),
      .spih_sd_i                 (spi_sd_soc_in),
      // GPIO interface
      .gpio_i                    (gpio_i),
      .gpio_o                    (),
      .gpio_en_o                 (),
`ifdef GEN_NO_HYPERBUS // bender-xilinx.mk
      // LLC Interface
      .llc_ar_data,
      .llc_ar_wptr,
      .llc_ar_rptr,
      .llc_aw_data,
      .llc_aw_wptr,
      .llc_aw_rptr,
      .llc_b_data,
      .llc_b_wptr,
      .llc_b_rptr,
      .llc_r_data,
      .llc_r_wptr,
      .llc_r_rptr,
      .llc_w_data,
      .llc_w_wptr,
      .llc_w_rptr,
`endif // GEN_NO_HYPERBUS

      // Hyperbus interface
      .hyper_cs_no          ( hyper_cs_n_wire     ),
      .hyper_ck_o           ( hyper_ck_wire       ),
      .hyper_ck_no          ( hyper_ck_n_wire     ),
      .hyper_rwds_o         ( hyper_rwds_o        ),
      .hyper_rwds_i         ( hyper_rwds_i        ),
      .hyper_rwds_oe_o      ( hyper_rwds_oe       ),
      .hyper_dq_i           ( hyper_dq_i          ),
      .hyper_dq_o           ( hyper_dq_o          ),
      .hyper_dq_oe_o        ( hyper_dq_oe         ),
      .hyper_reset_no       ( hyper_reset_n_wire  ),

      // Serial link interface
      .slink_rcv_clk_i(slink_clk_periph_soc),
      .slink_rcv_clk_o(slink_clk_soc_periph),
      .slink_i(slink_periph_soc),
      .slink_o(slink_soc_periph)
  );

endmodule
