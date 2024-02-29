// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>
// Cyril Koenig <cykoenig@iis.ee.ethz.ch>

`include "axi/typedef.svh"
`include "cheshire/typedef.svh"
`include "phy_definitions.svh"

module carfield_top_xilinx
  import carfield_pkg::*;
  import cheshire_pkg::*;
  import safety_island_pkg::*;
(
`ifdef USE_RESET
  input logic         cpu_reset,
`endif
`ifdef USE_RESETN
  input logic         cpu_resetn,
`endif

  // System clock for clk_wiz
  input logic         sys_clk_p,
  input logic         sys_clk_n,

`ifdef USE_SWITCHES
  input logic         testmode_i,
  input logic [1:0]   boot_mode_i,
`endif

`ifdef USE_JTAG
  input logic         jtag_tck_i,
  input logic         jtag_tms_i,
  input logic         jtag_tdi_i,
  output logic        jtag_tdo_o,
`ifdef USE_JTAG_TRSTN
  input logic         jtag_trst_ni,
`endif
`ifdef USE_JTAG_VDDGND
  output logic        jtag_vdd_o,
  output logic        jtag_gnd_o,
`endif
`endif // USE_JTAG

`ifdef USE_I2C
  inout wire          i2c_scl_io,
  inout wire          i2c_sda_io,
`endif

`ifdef USE_SD
  input logic         sd_cd_i,
  output logic        sd_cmd_o,
  inout wire  [3:0]   sd_d_io,
  output logic        sd_reset_o,
  output logic        sd_sclk_o,
`endif

`ifdef USE_FAN
  input logic [3:0]   fan_sw,
  output logic        fan_pwm,
`endif

`ifdef USE_QSPI
`ifndef USE_STARTUPE3
  // TODO: off-chip qspi interface
`endif // USE_STARTUPE3
`endif // USE_QSPI

`ifdef USE_VGA
  // VGA Colour signals
  output logic [4:0]  vga_b,
  output logic [5:0]  vga_g,
  output logic [4:0]  vga_r,
  // VGA Sync signals
  output logic        vga_hs,
  output logic        vga_vs,
`endif

`ifdef USE_SERIAL
  output logic [4:0]  ddr_link_o,
  output logic        ddr_link_clk_o,
`endif

  // Phy interface for DDR4
`ifdef USE_DDR4
  `DDR4_INTF
`endif

  // Phy interface for DDR3
`ifdef USE_DDR3
  `DDR3_INTF
`endif

  // Phy interface for Hyperbus
`ifndef GEN_NO_HYPERBUS
  // Physical interace: HyperBus PADs
  // Attention CS0 correspond to CS1 on the FMC (see constraints)
  inout  [`HypNumPhys-1:0][`HypNumChips-1:0] pad_hyper_csn,
  inout  [`HypNumPhys-1:0]                   pad_hyper_ck,
  inout  [`HypNumPhys-1:0]                   pad_hyper_ckn,
  inout  [`HypNumPhys-1:0]                   pad_hyper_rwds,
  // inout  [`HypNumPhys-1:0]                   pad_hyper_reset,
  inout  [`HypNumPhys-1:0][7:0]              pad_hyper_dq,
`endif

  output logic        uart_tx_o,
  input logic         uart_rx_i

);

  ///////////////////////////
  // Clk reset definitions //
  ///////////////////////////

  `ifdef USE_RESET
  logic cpu_resetn;
  assign cpu_resetn = ~cpu_reset;
  `elsif USE_RESETN
  logic cpu_reset;
  assign cpu_reset  = ~cpu_resetn;
  `endif
  logic sys_rst;

  wire clk_100, clk_50, clk_20;
  (* dont_touch = "yes" *) wire clk_10;
  wire soc_clk, host_clk, alt_clk, periph_clk;
  (* dont_touch = "yes" *) wire rst_n;

  ///////////////////
  // GPIOs         // 
  ///////////////////

  // Tie off signals if no switches on the board
`ifndef USE_SWITCHES
  logic         testmode_i;
  logic [1:0]   boot_mode_i, boot_mode_safety_i;
  assign testmode_i  = '0;
  assign boot_mode_i = 2'b00;
  assign boot_mode_safety_i = 2'b00;
`endif

  // Give VDD and GND to JTAG
`ifdef USE_JTAG_VDDGND
  assign jtag_vdd_o  = '1;
  assign jtag_gnd_o  = '0;
`endif
`ifndef USE_JTAG_TRSTN
  logic jtag_trst_ni;
  assign jtag_trst_ni = '1;
`endif

  //////////////////
  // Clock Wizard //
  //////////////////

  wire sys_clk;

  // Get from the diff board pins a single ended buffered clock that
  // can be sent to clk_wiz and DDR separately (without cascading MMCMs)
  // As sys_clk frequency depends on the boards /!\ in IPs configurations
  IBUFDS #
  (
    .IBUF_LOW_PWR ("FALSE")
  )
  u_ibufg_sys_clk
  (
    .I  (sys_clk_p),
    .IB (sys_clk_n),
    .O  (sys_clk)
  );


  xlnx_clk_wiz i_xlnx_clk_wiz (
    .clk_in1 ( sys_clk  ),
    .reset   ( '0       ),
    .clk_100 ( clk_100  ),
    .clk_50  ( clk_50   ),
    .clk_20  ( clk_20   ),
    .clk_10  ( clk_10   )
  );
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

`ifdef USE_VIO
  logic       vio_reset;
  logic [1:0] vio_boot_mode, vio_boot_mode_safety;

  xlnx_vio (
    .clk(soc_clk),
    .probe_out0(vio_reset),
    .probe_out1(vio_boot_mode),
    .probe_out2(vio_boot_mode_safety)
  );
  assign sys_rst = cpu_reset | vio_reset;
  assign boot_mode = boot_mode_i | vio_boot_mode;
  assign boot_mode_safety = boot_mode_safety_i | vio_boot_mode_safety;
`else
  assign sys_rst = cpu_reset;
  assign boot_mode = boot_mode_i;
  assign boot_mode_safety = boot_mode_safety_i;
`endif

  //////////////////
  // I2C Adaption //
  //////////////////

  logic i2c_sda_soc_out;
  logic i2c_sda_soc_in;
  logic i2c_scl_soc_out;
  logic i2c_scl_soc_in;
  logic i2c_sda_en;
  logic i2c_scl_en;
  logic i2c_sda_en_n;
  logic i2c_scl_en_n;

  assign i2c_sda_en = ~i2c_sda_en_n;
  assign i2c_scl_en = ~i2c_scl_en_n;

`ifdef USE_I2C
  // Three state buffer for SCL
  IOBUF #(
    .DRIVE        ( 12        ),
    .IBUF_LOW_PWR ( "FALSE"   ),
    .IOSTANDARD   ( "DEFAULT" ),
    .SLEW         ( "FAST"    )
  ) i_scl_iobuf (
    .O  ( i2c_scl_soc_in      ),
    .IO ( i2c_scl_io          ),
    .I  ( i2c_scl_soc_out     ),
    .T  ( ~i2c_scl_en         )
  );

  // Three state buffer for SDA
  IOBUF #(
    .DRIVE        ( 12        ),
    .IBUF_LOW_PWR ( "FALSE"   ),
    .IOSTANDARD   ( "DEFAULT" ),
    .SLEW         ( "FAST"    )
  ) i_sda_iobuf (
    .O  ( i2c_sda_soc_in      ),
    .IO ( i2c_sda_io          ),
    .I  ( i2c_sda_soc_out     ),
    .T  ( ~i2c_sda_en         )
  );
`endif


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

`ifdef USE_SD
  // Assert reset low => Apply power to the SD Card
  assign sd_reset_o       = 1'b0;
  // SCK  - SD CLK signal
  assign sd_sclk_o        = spi_sck_en    ? spi_sck_soc       : 1'b1;
  // CS   - SD DAT3 signal
  assign sd_d_io[3]       = spi_cs_en[0]  ? spi_cs_soc[0]     : 1'b1;
  // MOSI - SD CMD signal
  assign sd_cmd_o         = spi_sd_en[0]  ? spi_sd_soc_out[0] : 1'b1;
  // MISO - SD DAT0 signal
  assign spi_sd_soc_in[1] = sd_d_io[0];
  // SD DAT1 and DAT2 signal tie-off - Not used for SPI mode
  assign sd_d_io[2:1]     = 2'b11;
  // Bind input side of SoC low for output signals
  assign spi_sd_soc_in[0] = 1'b0;
  assign spi_sd_soc_in[2] = 1'b0;
  assign spi_sd_soc_in[3] = 1'b0;
`endif

  //////////////////
  // QSPI         //
  //////////////////

`ifdef USE_QSPI
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
`ifdef USE_STARTUPE3
  STARTUPE3 #(
     .PROG_USR("FALSE"),
     .SIM_CCLK_FREQ(0.0)
  )
  STARTUPE3_inst (
     .CFGCLK    (),
     .CFGMCLK   (),
     .DI        (qspi_dqi),
     .EOS       (),
     .PREQ      (),
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
`else
  // TODO: off-chip qspi interface
`endif // USE_STARTUPE3

`endif // USE_QSPI

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


  /////////////////
  // Fan Control //
  /////////////////

`ifdef USE_FAN
  fan_ctrl i_fan_ctrl (
    .clk_i         ( soc_clk    ),
    .rst_ni        ( rst_n      ),
    .pwm_setting_i ( fan_sw     ),
    .fan_pwm_o     ( fan_pwm    )
  );
`endif

  //////////////////
  // Carfield Cfg //
  //////////////////

  localparam cheshire_cfg_t Cfg = carfield_pkg::CarfieldCfgDefault;
  `CHESHIRE_TYPEDEF_ALL(carfield_, Cfg)

  ///////////////////
  // LLC interface //
  ///////////////////

`ifdef GEN_NO_HYPERBUS // bender-xilinx.mk
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
`endif // GEN_NO_HYPERBUS

  //////////////////
  // Carfield SoC //
  //////////////////

  logic jtag_host_to_safety, jtag_safety_to_ot;

  carfield #(
      .Cfg       (carfield_pkg::CarfieldCfgDefault),
      .reg_req_t(carfield_reg_req_t),
      .reg_rsp_t(carfield_reg_rsp_t),
`ifdef GEN_NO_HYPERBUS
      .LlcIdWidth   ( LlcIdWidth ),
      .LlcArWidth   ( LlcArWidth ),
      .LlcAwWidth   ( LlcAwWidth ),
      .LlcBWidth    ( LlcBWidth  ),
      .LlcRWidth    ( LlcRWidth  ),
      .LlcWWidth    ( LlcWWidth  ),
`endif
      .HypNumPhys   (`HypNumPhys),
      .HypNumChips  (`HypNumChips)
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
      .gpio_i                    (),
      .gpio_o                    (),
      .gpio_en_o                 (),
`ifdef GEN_NO_HYPERBUS
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
`endif
      // Serial link interface
      .slink_rcv_clk_i           (),
      .slink_rcv_clk_o           (),
      .slink_i                   (),
      .slink_o                   ()
  );

  //////////////////
  // DRAM WRAPPER //
  //////////////////

`ifdef USE_DDR
  dram_wrapper_xilinx #(
    .axi_soc_aw_chan_t ( carfield_axi_llc_aw_chan_t ),
    .axi_soc_w_chan_t  ( carfield_axi_llc_w_chan_t  ),
    .axi_soc_b_chan_t  ( carfield_axi_llc_b_chan_t  ),
    .axi_soc_ar_chan_t ( carfield_axi_llc_ar_chan_t ),
    .axi_soc_r_chan_t  ( carfield_axi_llc_r_chan_t  ),
    .axi_soc_req_t     ( carfield_axi_llc_req_t     ),
    .axi_soc_resp_t    ( carfield_axi_llc_rsp_t     )
  ) i_dram_wrapper (
    // Rst
    .sys_rst_i                  ( sys_rst   ),
    .soc_resetn_i               ( rst_n     ),
    .soc_clk_i                  ( soc_clk   ),
    // Sys clk
    .dram_clk_i                 ( sys_clk   ),
    // Axi
    .soc_req_i                  ( llc_req  ),
    .soc_rsp_o                  ( llc_rsp  ),
    // Phy
    .*
  );
`endif

endmodule
