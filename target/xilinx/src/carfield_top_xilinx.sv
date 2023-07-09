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
  output logic        qspi_clk,
  input  logic        qspi_dq0,
  input  logic        qspi_dq1,
  input  logic        qspi_dq2,
  input  logic        qspi_dq3,
  output logic        qspi_cs_b,
`endif

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

`ifdef USE_CLK_WIZ
  input clk_in1_p,
  input clk_in1_n,
`endif

  // Phy interface for Hyperbus
`ifdef USE_HYPERBUS
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

  `ifdef USE_RESET
  logic cpu_resetn;
  assign cpu_resetn = ~cpu_reset;
  `elsif USE_RESETN
  logic cpu_reset;
  assign cpu_reset  = ~cpu_resetn;
  `endif
  logic sys_rst;

  (* dont_touch = "yes" *) wire master_clk;
  (* dont_touch = "yes" *) wire master_sync_rst;
  (* dont_touch = "yes" *) wire soc_clk;
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
  // Clock Wizard // 
  //////////////////

`ifdef USE_CLK_WIZ
  xlnx_clk_wiz i_xlnx_clk_wiz (
    .clk_in1_p,
    .clk_in1_n,
    .reset(master_clk),
    // 50 MHz clock out
    .clk_out1( soc_clk )
  );

  //rstgen i_rstgen_main (
  //  .clk_i        ( soc_clk          ),
  //  .rst_ni       ( ~sys_rst         ),
  //  .test_mode_i  ( testmode_i       ),
  //  .rst_no       ( rst_n            ),
  //  .init_no      (                  ) // keep open
  //);
  assign rst_n = ~sys_rst;
`endif


  //////////////////
  // DRAM WRAPPER //
  //////////////////

`ifdef USE_DDR

  dram_wrapper #(
    .axi_soc_aw_chan_t ( axi_llc_aw_chan_t ),
    .axi_soc_w_chan_t  ( axi_llc_w_chan_t ),
    .axi_soc_b_chan_t  ( axi_llc_b_chan_t ),
    .axi_soc_ar_chan_t ( axi_llc_ar_chan_t ),
    .axi_soc_r_chan_t  ( axi_llc_r_chan_t ),
    .axi_soc_req_t     (axi_llc_req_t),
    .axi_soc_resp_t    (axi_llc_rsp_t)
  ) i_dram_wrapper (
    // Rst
    .sys_rst_i                  ( cpu_reset   ),
    .soc_resetn_i               ( rst_n       ),
    .soc_clk_i                  ( soc_clk     ),
    // Clk rst out
    .dram_clk_o                 ( master_clk           ),
    .dram_rst_o                 ( master_sync_reset    ),
    // Axi
    .soc_req_i                  ( '0  ),
    .soc_rsp_o                  (     ),
    // Phy
    .*
  );

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
  logic spi_sck_en_n;
  logic [1:0] spi_cs_en_n;
  logic [3:0] spi_sd_en_n;

  assign spi_sck_en = ~spi_sck_en_n;
  assign spi_cs_en = ~spi_cs_en_n;
  assign spi_sd_en = ~spi_sd_en_n;

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

`ifdef USE_QSPI
  assign qspi_clk  = spi_sck_en    ? spi_sck_soc       : 1'b1;
  assign qspi_cs_b = spi_cs_soc[0];
  assign spi_sd_soc_in[1] = qspi_dq0;
`endif


  /////////////////////////
  // "RTC" Clock Divider //
  /////////////////////////

  logic rtc_clk_d, rtc_clk_q;
  logic [4:0] counter_d, counter_q;

  // Divide soc_clk (20 MHz) by 20 => 1 MHz RTC Clock
  always_comb begin
    counter_d = counter_q + 1;
    rtc_clk_d = rtc_clk_q;

    if(counter_q == 19) begin
      counter_d = 5'b0;
      rtc_clk_d = ~rtc_clk_q;
    end
  end

  always_ff @(posedge soc_clk, negedge rst_n) begin
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

`ifndef GEN_PULP_CLUSTER
`define GEN_PULP_CLUSTER 0
`endif
`ifndef GEN_SAFETY_ISLAND
`define GEN_SAFETY_ISLAND 0
`endif
`ifndef GEN_SPATZ_CLUSTER
`define GEN_SPATZ_CLUSTER 0
`endif
`ifndef GEN_OPEN_TITAN
`define GEN_OPEN_TITAN 0
`endif

  localparam cheshire_cfg_t Cfg = carfield_pkg::CarfieldCfgDefault;
  `CHESHIRE_TYPEDEF_ALL(carfield_, Cfg)

  localparam islands_cfg_t IslandsCfg = '{
    EnPulpCluster   : `GEN_PULP_CLUSTER,
    EnSafetyIsland  : `GEN_SAFETY_ISLAND,
    EnSpatzCluster  : `GEN_SPATZ_CLUSTER,
    EnOpenTitan     : `GEN_OPEN_TITAN,
    EnCan           : 0,
    EnEthernet      : 0,
    default         : '1
  };

  //////////////////
  // Carfield SoC //
  //////////////////

  logic jtag_host_to_safety, jtag_safety_to_ot;

  carfield #(
      .Cfg       (carfield_pkg::CarfieldCfgDefault),
      .IslandsCfg(IslandsCfg),
      .reg_req_t(carfield_reg_req_t),
      .reg_rsp_t(carfield_reg_rsp_t),
      .HypNumPhys   (`HypNumPhys),
      .HypNumChips  (`HypNumChips)
  ) i_carfield (
      .host_clk_i    (soc_clk),
      .periph_clk_i  (soc_clk),
      .alt_clk_i     (soc_clk),
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
      .spih_sck_o                (),
      .spih_sck_en_o             (),
      .spih_csb_o                (),
      .spih_csb_en_o             (),
      .spih_sd_o                 (),
      .spih_sd_en_o              (),
      .spih_sd_i                 (),
      // GPIO interface
      .gpio_i                    (),
      .gpio_o                    (),
      .gpio_en_o                 (),
      // Serial link interface
      .slink_rcv_clk_i           (),
      .slink_rcv_clk_o           (),
      .slink_i                   (),
      .slink_o                   ()

      // LLC (DRAM) Interace
      //.llc_ar_data,
      //.llc_ar_wptr,
      //.llc_ar_rptr,
      //.llc_aw_data,
      //.llc_aw_wptr,
      //.llc_aw_rptr,
      //.llc_b_data,
      //.llc_b_wptr,
      //.llc_b_rptr,
      //.llc_r_data,
      //.llc_r_wptr,
      //.llc_r_rptr,
      //.llc_w_data,
      //.llc_w_wptr,
      //.llc_w_rptr,
      //.hyper_cs_n_wire,
      //.hyper_ck_wire,
      //.hyper_ck_n_wire,
      //.hyper_rwds_o,
      //.hyper_rwds_i,
      //.hyper_rwds_oe,
      //.hyper_dq_i,
      //.hyper_dq_o,
      //.hyper_dq_oe,
      //.hyper_reset_n_wire
  );

endmodule
