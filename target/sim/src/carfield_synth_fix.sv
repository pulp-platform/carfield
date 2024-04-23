// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

module carfield_chip_fixture;

  `include "cheshire/typedef.svh"
  `include "register_interface/assign.svh"
  `include "axi/assign.svh"

  import carfield_chip_pkg::*;
  import cheshire_pkg::*;
  import carfield_pkg::*;
  import safety_island_pkg::*;

  ///////////
  //  DPI  //
  ///////////

  import "DPI-C" function byte read_elf(input string filename);
  import "DPI-C" function byte get_entry(output longint entry);
  import "DPI-C" function byte get_section(output longint address, output longint len);
  import "DPI-C" context function byte read_section(input longint address, inout byte buffer[], input longint len);

  /////////
  // DUT //
  /////////

  localparam time         ClkPeriodRef  = 10ns;  // 100MHz reference clock
  localparam time         ClkPeriodExt  = 3.3ns; // 300MHz: the maximum
                                                 // frequency supported by the
                                                 // pads according to intel16's
                                                 // datasheet
  localparam time         ClkPeriodJtag = 40ns;
  localparam int unsigned RstCycles     = 5;
  localparam real         TAppl         = 0.1;
  localparam real         TTest         = 0.9;

  localparam int NumPhys  = 2;
  localparam int NumChips = 2;

  ////////////////////////
  // IN/OUT declaration //
  ////////////////////////

  logic       ref_clk, ext_clk;
  logic       bypass_pll;
  logic       pwr_on_rst_n;
  logic       pwr_on_ext_rst_n;
  logic       secure_boot;
  logic       testmode_hostd;
  logic [1:0] bootmode_hostd;
  logic [1:0] bootmode_safed;
  logic [1:0] bootmode_secd;

  logic jtag_hostd_tck;
  logic jtag_hostd_trst_n;
  logic jtag_hostd_tms;
  logic jtag_hostd_tdi;
  logic jtag_hostd_tdo;

  logic jtag_safed_tck;
  logic jtag_safed_trst_n;
  logic jtag_safed_tms;
  logic jtag_safed_tdi;
  logic jtag_safed_tdo;

  logic jtag_secd_tck;
  logic jtag_secd_trst_n;
  logic jtag_secd_tms;
  logic jtag_secd_tdi;
  logic jtag_secd_tdo;

  logic jtag_pll_tck;
  logic jtag_pll_trst_n;
  logic jtag_pll_tms;
  logic jtag_pll_tdi;
  logic jtag_pll_tdo;

  logic uart_hostd_tx;
  logic uart_hostd_rx;
  logic uart_secd_tx;
  logic uart_secd_rx;

  // Serial Link signals
  logic [SlinkNumChan-1:0]                    slink_hostd_rcv_clk_to_vip;
  logic [SlinkNumChan-1:0]                    slink_hostd_rcv_clk_from_vip;
  logic [SlinkNumChan-1:0][SlinkNumLanes-1:0] slink_hostd_to_vip;
  logic [SlinkNumChan-1:0][SlinkNumLanes-1:0] slink_hostd_from_vip;

  ///////////////////////
  // INOUT declaration //
  ///////////////////////

  // Clock
  wire                                w_ref_clk;
  // Bypass PLL
  wire                                w_bypass_pll;
  // External clock
  wire                                w_ext_clk;
  // POR (power-on reset, active low)
  wire                                w_pwr_on_rst_n;
  // secure boot emulation
  wire                                w_secure_boot;
  // Bootmode (hostd)
  wire [2:0]                          w_bootmode_hostd;
  // Bootmode (safed)
  wire [1:0]                          w_bootmode_safed;
  // Bootmode (secd)
  wire [1:0]                          w_bootmode_secd;
  // JTAG (hostd)
  wire                                w_jtag_hostd_tck;
  wire                                w_jtag_hostd_tms;
  wire                                w_jtag_hostd_tdi;
  wire                                w_jtag_hostd_trstn;
  wire                                w_jtag_hostd_tdo;
  // JTAG (safed)
  wire                                w_jtag_safed_tck;
  wire                                w_jtag_safed_tms;
  wire                                w_jtag_safed_tdi;
  wire                                w_jtag_safed_trstn;
  wire                                w_jtag_safed_tdo;
  // JTAG (secd)
  wire                                w_jtag_secd_tck;
  wire                                w_jtag_secd_tms;
  wire                                w_jtag_secd_tdi;
  wire                                w_jtag_secd_trstn;
  wire                                w_jtag_secd_tdo;
  // GPIOs
  wire [15:0]                         w_gpio;
  // Serial Link
  wire                                w_slink_hostd_rcv_clk_to_vip;
  wire                                w_slink_hostd_rcv_clk_from_vip;
  wire [SlinkNumLanes-1:0]            w_slink_hostd_to_vip;
  wire [SlinkNumLanes-1:0]            w_slink_hostd_from_vip;
  // hyperbus tristate signals
  wire [NumPhys-1:0][NumChips-1:0]    w_hyper_csn;
  wire [NumPhys-1:0]                  w_hyper_ck;
  wire [NumPhys-1:0]                  w_hyper_ckn;
  wire [NumPhys-1:0]                  w_hyper_rwds;
  wire [NumPhys-1:0][7:0]             w_hyper_dq;
  wire [NumPhys-1:0]                  w_hyper_resetn;
  // SPI (hostd)
  wire                                w_spi_hostd_sck;
  wire [SpihNumCs-1:0]                w_spi_hostd_csb;
  wire [3:0]                          w_spi_hostd_sd;
  // SPI (secd)
  wire                                w_spi_secd_sck;
  wire [SpihNumCs-1:0]                w_spi_secd_csb;
  wire [3:0]                          w_spi_secd_sd;
  // UART (hostd)
  wire                                w_uart_hostd_tx;
  wire                                w_uart_hostd_rx;
  // UART (secd)
  wire                                w_uart_secd_tx;
  wire                                w_uart_secd_rx;
  // I2C (hostd)
  wire                                w_i2c_hostd_sda;
  wire                                w_i2c_hostd_scl;
  // CAN
  wire                                w_can_tx;
  wire                                w_can_rx;
  // Ethernet
  wire                                w_eth_rst;
  wire                                w_eth_txck;
  wire                                w_eth_txctl;
  wire                                w_eth_txd0;
  wire                                w_eth_txd1;
  wire                                w_eth_txd2;
  wire                                w_eth_txd3;
  wire                                w_eth_mdc;
  wire                                w_eth_md;
  wire                                w_eth_rxck;
  wire                                w_eth_rxctl;
  wire                                w_eth_rxd0;
  wire                                w_eth_rxd1;
  wire                                w_eth_rxd2;
  wire                                w_eth_rxd3;
  // Debug signals
  wire [2:0]                          debug_signals;

  wire                                w_jtag_pll_tck;
  wire                                w_jtag_pll_tms;
  wire                                w_jtag_pll_tdi;
  wire                                w_jtag_pll_trstn;
  wire                                w_jtag_pll_tdo;

  /////////////////
  // Assignments //
  /////////////////

  // Clock
  assign w_ref_clk          = ref_clk;
  // PLL bypass
  assign w_bypass_pll       = bypass_pll;
  // External clock
  assign w_ext_clk          = ext_clk;
  // POR
`ifndef BYPASS_PLL
  assign w_pwr_on_rst_n = pwr_on_rst_n;
`else
  assign w_pwr_on_rst_n = pwr_on_ext_rst_n;
`endif
  // secure boot emulation
  assign w_secure_boot      = secure_boot;
  // Bootmode (hostd)
  // We only use 2 bits at the moment, the thirs is tied to 0
  assign w_bootmode_hostd   = {1'b0, bootmode_hostd};
  // Bootmode (safed)
  assign w_bootmode_safed   = bootmode_safed;
  // Bootmode (secd)
  assign w_bootmode_secd    = bootmode_secd;
  // JTAG (hostd)
  assign w_jtag_hostd_tck   = jtag_hostd_tck;
  assign w_jtag_hostd_tms   = jtag_hostd_tms;
  assign w_jtag_hostd_tdi   = jtag_hostd_tdi;
  assign w_jtag_hostd_trstn = jtag_hostd_trst_n;
  // TODO the pad is inverted wrt output signal, FIXME! This is just a hack,
  // some parameters in the padframe are off
  assign jtag_hostd_tdo     = w_jtag_hostd_tdo;
  // JTAG (safed)
  assign w_jtag_safed_tck   = jtag_safed_tck;
  assign w_jtag_safed_tms   = jtag_safed_tms;
  assign w_jtag_safed_tdi   = jtag_safed_tdi;
  assign w_jtag_safed_trstn = jtag_safed_trst_n;
  assign jtag_safed_tdo     = w_jtag_safed_tdo;
  // JTAG (secd)
  assign w_jtag_secd_tck    = jtag_secd_tck;
  assign w_jtag_secd_tms    = jtag_secd_tms;
  assign w_jtag_secd_tdi    = jtag_secd_tdi;
  assign w_jtag_secd_trstn  = jtag_secd_trst_n;
  assign jtag_secd_tdo      = w_jtag_secd_tdo;
  // GPIOs (hostd)
  assign w_gpio             = '0;
  // Serial Link (hostd)
  assign w_slink_hostd_rcv_clk_from_vip = slink_hostd_rcv_clk_from_vip;
  assign w_slink_hostd_from_vip         = slink_hostd_from_vip;
  assign slink_hostd_rcv_clk_to_vip     = w_slink_hostd_rcv_clk_to_vip;
  assign slink_hostd_to_vip             = w_slink_hostd_to_vip;
  // UART (hostd)
  assign uart_hostd_tx                  = w_uart_hostd_tx;
  assign w_uart_hostd_rx                = uart_hostd_rx;
  // UART (secd)
  assign uart_secd_tx                   = w_uart_secd_tx;
  assign w_uart_secd_rx                 = uart_secd_rx;
  // CAN
  // TODO connect
  assign w_can_rx                       = '0;
  // Ethernet
  // TODO connect
  assign w_eth_rxck                     = '0;
  assign w_eth_rxctl                    = '0;
  assign w_eth_rxd0                     = '0;
  assign w_eth_rxd1                     = '0;
  assign w_eth_rxd2                     = '0;
  assign w_eth_rxd3                     = '0;
  // PLL JTAG
  assign w_jtag_pll_tck                 = jtag_pll_tck;
  assign w_jtag_pll_tms                 = jtag_pll_tms;
  assign w_jtag_pll_tdi                 = jtag_pll_tdi;
  assign w_jtag_pll_trstn               = jtag_pll_trst_n;
  assign jtag_pll_tdo                   = w_jtag_pll_tdo;

  ///////////////////////////////
  // External Clock generation //
  ///////////////////////////////

  clk_rst_gen #(
    .ClkPeriod    ( ClkPeriodExt ),
    .RstClkCycles ( RstCycles    )
  ) i_ext_clk (
    .clk_o  ( ext_clk ),
`ifndef BYPASS_PLL
    .rst_no ( )
`else
    .rst_no ( pwr_on_ext_rst_n )
`endif
  );

  ////////////////////////////
  // Carfield configuration //
  ////////////////////////////

  localparam cheshire_cfg_t DutCfg = carfield_pkg::CarfieldCfgDefault;
  `CHESHIRE_TYPEDEF_ALL(, DutCfg)


`ifndef CARFIELD_CHIP_NETLIST
  carfield_synth_wrap #(
    .HypNumPhys  ( NumPhys  ),
    .HypNumChips ( NumChips )
  ) i_dut (
`else
  carfield_synth_wrap i_dut (
`endif
    // POR
    .pad_periph_reset_n_pad           ( w_pwr_on_rst_n          ),
    .pad_periph_bypass_fll_pad        ( w_bypass_pll            ),
    // Reference clock
    .pad_periph_ref_clk_pad           ( w_ref_clk               ),
    // External clock
    .pad_periph_ext_clk_pad           ( w_ext_clk               ),
    .pad_periph_secure_boot_pad       ( w_secure_boot           ),
    .pad_periph_jtag_pll_00_pad       ( w_jtag_pll_tck          ),
    .pad_periph_jtag_pll_01_pad       ( w_jtag_pll_tms          ),
    .pad_periph_jtag_pll_02_pad       ( w_jtag_pll_tdi          ),
    .pad_periph_jtag_pll_03_pad       ( w_jtag_pll_trstn        ),
    .pad_periph_jtag_pll_04_pad       ( w_jtag_pll_tdo          ),
    // Debug signals
    .pad_periph_debug_out0_pad        ( debug_signals[0]        ), // default host pll
    .pad_periph_debug_out1_pad        ( debug_signals[1]        ), // default alt pll
    .pad_periph_debug_out2_pad        ( debug_signals[2]        ), // default periph pll
    .pad_periph_debug_out3_pad        ( /* unconnected in TB */ ), // default host clk
    .pad_periph_debug_out4_pad        ( /* unconnected in TB */ ), // default host por
    // Bootmode (hostd)
    .pad_periph_bootmode_host_0_pad   ( w_bootmode_hostd[0] ),
    .pad_periph_bootmode_host_1_pad   ( w_bootmode_hostd[1] ),
    .pad_periph_bootmode_host_2_pad   ( w_bootmode_hostd[2] ), // currently without load
    // JTAG (hostd)
    .pad_periph_jtag_host_tck_pad     ( w_jtag_hostd_tck    ),
    .pad_periph_jtag_host_tms_pad     ( w_jtag_hostd_tms    ),
    .pad_periph_jtag_host_tdi_pad     ( w_jtag_hostd_tdi    ),
    .pad_periph_jtag_host_trstn_pad   ( w_jtag_hostd_trstn  ),
    .pad_periph_jtag_host_tdo_pad     ( w_jtag_hostd_tdo    ),
    // UART (hostd)
    .pad_periph_host_00_pad           ( w_uart_hostd_rx     ),
    .pad_periph_host_01_pad           ( w_uart_hostd_tx     ),
    // SPI (hostd)
    .pad_periph_host_02_pad           ( w_spi_hostd_sd[0]   ),
    .pad_periph_host_03_pad           ( w_spi_hostd_sd[1]   ),
    .pad_periph_host_04_pad           ( w_spi_hostd_sd[2]   ),
    .pad_periph_host_05_pad           ( w_spi_hostd_sd[3]   ),
    .pad_periph_host_06_pad           ( w_spi_hostd_sck     ),
    .pad_periph_host_07_pad           ( w_spi_hostd_csb[0]  ),
    .pad_periph_host_08_pad           ( w_spi_hostd_csb[1]  ),
    // I2C (hostd)
    .pad_periph_host_09_pad           ( w_i2c_hostd_sda     ),
    .pad_periph_host_10_pad           ( w_i2c_hostd_scl     ),
    // Bootmode (safed)
    .pad_periph_bootmode_safe_0_pad   ( w_bootmode_safed[0] ),
    .pad_periph_bootmode_safe_1_pad   ( w_bootmode_safed[1] ),
    // JTAG (safed)
    .pad_periph_jtag_safe_tck_pad     ( w_jtag_safed_tck    ),
    .pad_periph_jtag_safe_tms_pad     ( w_jtag_safed_tms    ),
    .pad_periph_jtag_safe_tdi_pad     ( w_jtag_safed_tdi    ),
    .pad_periph_jtag_safe_trstn_pad   ( w_jtag_safed_trstn  ),
    .pad_periph_jtag_safe_tdo_pad     ( w_jtag_safed_tdo    ),
    // Bootmode (secd)
    .pad_periph_bootmode_secure_0_pad ( w_bootmode_secd[0]  ),
    .pad_periph_bootmode_secure_1_pad ( w_bootmode_secd[1]  ),
    // JTAG (secd)
    .pad_periph_jtag_secure_tck_pad   ( w_jtag_secd_tck   ),
    .pad_periph_jtag_secure_tms_pad   ( w_jtag_secd_tms   ),
    .pad_periph_jtag_secure_tdi_pad   ( w_jtag_secd_tdi   ),
    .pad_periph_jtag_secure_trstn_pad ( w_jtag_secd_trstn ),
    .pad_periph_jtag_secure_tdo_pad   ( w_jtag_secd_tdo   ),
    // SPI (secd)
    .pad_periph_secure_00_pad         ( w_spi_secd_sd[0]  ),
    .pad_periph_secure_01_pad         ( w_spi_secd_sd[1]  ),
    .pad_periph_secure_02_pad         ( w_spi_secd_sd[2]  ),
    .pad_periph_secure_03_pad         ( w_spi_secd_sd[3]  ),
    .pad_periph_secure_04_pad         ( w_spi_secd_sck    ),
    .pad_periph_secure_05_pad         ( w_spi_secd_csb[0] ),
    // UART (secd) ???
    .pad_periph_secure_06_pad         ( w_uart_secd_rx    ),
    .pad_periph_secure_07_pad         ( w_uart_secd_tx    ),
    // GPIOs
    .pad_periph_gpio_00_pad           ( w_gpio[0]         ),
    .pad_periph_gpio_01_pad           ( w_gpio[1]         ),
    .pad_periph_gpio_02_pad           ( w_gpio[2]         ),
    .pad_periph_gpio_03_pad           ( w_gpio[3]         ),
    .pad_periph_gpio_04_pad           ( w_gpio[4]         ),
    .pad_periph_gpio_05_pad           ( w_gpio[5]         ),
    .pad_periph_gpio_06_pad           ( w_gpio[6]         ),
    .pad_periph_gpio_07_pad           ( w_gpio[7]         ),
    .pad_periph_gpio_08_pad           ( w_gpio[8]         ),
    .pad_periph_gpio_09_pad           ( w_gpio[9]         ),
    .pad_periph_gpio_10_pad           ( w_gpio[10]        ),
    .pad_periph_gpio_11_pad           ( w_gpio[11]        ),
    .pad_periph_gpio_12_pad           ( w_gpio[12]        ),
    .pad_periph_gpio_13_pad           ( w_gpio[13]        ),
    .pad_periph_gpio_14_pad           ( w_gpio[14]        ),
    .pad_periph_gpio_15_pad           ( w_gpio[15]        ),
    // CAN
    .pad_periph_periph_00_pad         ( w_can_tx          ),
    .pad_periph_periph_01_pad         ( w_can_rx          ),
    // Ethernet
    .pad_periph_periph_02_pad         ( w_eth_rst         ),
    .pad_periph_periph_03_pad         ( w_eth_txck        ),
    .pad_periph_periph_04_pad         ( w_eth_txctl       ),
    .pad_periph_periph_05_pad         ( w_eth_txd0        ),
    .pad_periph_periph_06_pad         ( w_eth_txd1        ),
    .pad_periph_periph_07_pad         ( w_eth_txd2        ),
    .pad_periph_periph_08_pad         ( w_eth_txd3        ),
    .pad_periph_periph_09_pad         ( w_eth_mdc         ),
    .pad_periph_periph_10_pad         ( w_eth_md          ),
    .pad_periph_periph_11_pad         ( w_eth_rxck        ),
    .pad_periph_periph_12_pad         ( w_eth_rxctl       ),
    .pad_periph_periph_13_pad         ( w_eth_rxd0        ),
    .pad_periph_periph_14_pad         ( w_eth_rxd1        ),
    .pad_periph_periph_15_pad         ( w_eth_rxd2        ),
    .pad_periph_periph_16_pad         ( w_eth_rxd3        ),
    // Hyper0
    .pad_periph_hyper0_csn0_pad       ( w_hyper_csn[0][0] ),
    .pad_periph_hyper0_csn1_pad       ( w_hyper_csn[0][1] ),
    .pad_periph_hyper0_ck_pad         ( w_hyper_ck[0]     ),
    .pad_periph_hyper0_ckn_pad        ( w_hyper_ckn[0]    ),
    .pad_periph_hyper0_rwds_pad       ( w_hyper_rwds[0]   ),
    .pad_periph_hyper0_rstn_pad       ( w_hyper_resetn[0] ),
    .pad_periph_hyper0_data0_pad      ( w_hyper_dq[0][0]  ),
    .pad_periph_hyper0_data1_pad      ( w_hyper_dq[0][1]  ),
    .pad_periph_hyper0_data2_pad      ( w_hyper_dq[0][2]  ),
    .pad_periph_hyper0_data3_pad      ( w_hyper_dq[0][3]  ),
    .pad_periph_hyper0_data4_pad      ( w_hyper_dq[0][4]  ),
    .pad_periph_hyper0_data5_pad      ( w_hyper_dq[0][5]  ),
    .pad_periph_hyper0_data6_pad      ( w_hyper_dq[0][6]  ),
    .pad_periph_hyper0_data7_pad      ( w_hyper_dq[0][7]  ),
    // Hyper1
    .pad_periph_hyper1_csn0_pad       ( w_hyper_csn[1][0] ),
    .pad_periph_hyper1_csn1_pad       ( w_hyper_csn[1][1] ),
    .pad_periph_hyper1_ck_pad         ( w_hyper_ck[1]     ),
    .pad_periph_hyper1_ckn_pad        ( w_hyper_ckn[1]    ),
    .pad_periph_hyper1_rwds_pad       ( w_hyper_rwds[1]   ),
    .pad_periph_hyper1_rstn_pad       ( w_hyper_resetn[1] ),
    .pad_periph_hyper1_data0_pad      ( w_hyper_dq[1][0]  ),
    .pad_periph_hyper1_data1_pad      ( w_hyper_dq[1][1]  ),
    .pad_periph_hyper1_data2_pad      ( w_hyper_dq[1][2]  ),
    .pad_periph_hyper1_data3_pad      ( w_hyper_dq[1][3]  ),
    .pad_periph_hyper1_data4_pad      ( w_hyper_dq[1][4]  ),
    .pad_periph_hyper1_data5_pad      ( w_hyper_dq[1][5]  ),
    .pad_periph_hyper1_data6_pad      ( w_hyper_dq[1][6]  ),
    .pad_periph_hyper1_data7_pad      ( w_hyper_dq[1][7]  ),
    // Serial Link
    .pad_periph_sl_clk_in_pad         ( w_slink_hostd_rcv_clk_from_vip ),
    .pad_periph_sl_data_in0_pad       ( w_slink_hostd_from_vip[0]      ),
    .pad_periph_sl_data_in1_pad       ( w_slink_hostd_from_vip[1]      ),
    .pad_periph_sl_data_in2_pad       ( w_slink_hostd_from_vip[2]      ),
    .pad_periph_sl_data_in3_pad       ( w_slink_hostd_from_vip[3]      ),
    .pad_periph_sl_data_in4_pad       ( w_slink_hostd_from_vip[4]      ),
    .pad_periph_sl_data_in5_pad       ( w_slink_hostd_from_vip[5]      ),
    .pad_periph_sl_data_in6_pad       ( w_slink_hostd_from_vip[6]      ),
    .pad_periph_sl_data_in7_pad       ( w_slink_hostd_from_vip[7]      ),
    .pad_periph_sl_clk_out_pad        ( w_slink_hostd_rcv_clk_to_vip   ),
    .pad_periph_sl_data_out0_pad      ( w_slink_hostd_to_vip[0]        ),
    .pad_periph_sl_data_out1_pad      ( w_slink_hostd_to_vip[1]        ),
    .pad_periph_sl_data_out2_pad      ( w_slink_hostd_to_vip[2]        ),
    .pad_periph_sl_data_out3_pad      ( w_slink_hostd_to_vip[3]        ),
    .pad_periph_sl_data_out4_pad      ( w_slink_hostd_to_vip[4]        ),
    .pad_periph_sl_data_out5_pad      ( w_slink_hostd_to_vip[5]        ),
    .pad_periph_sl_data_out6_pad      ( w_slink_hostd_to_vip[6]        ),
    .pad_periph_sl_data_out7_pad      ( w_slink_hostd_to_vip[7]        )
  );

  pullup (w_i2c_hostd_sda);
  pullup (w_i2c_hostd_scl);

  pullup (w_spih_hostd_sck);

  for (genvar i = 0; i < 4; ++i) begin : gen_spih_sd_io
    pullup (w_spi_hostd_sd[i]);
  end

  for (genvar i = 0; i < SpihNumCs; ++i) begin : gen_spih_cs_io
    pullup (w_spi_hostd_csb[i]);
  end

  for (genvar i = 0 ; i<NumPhys; i++) begin : gen_hyper_phy
    pullup (w_hyper_rwds[i]);
  end

  //////////////////
  // Carfield VIP //
  //////////////////

  localparam int unsigned SafedNumAxiExtMstPorts   = 1;
  localparam int unsigned PulpClNumAxiExtMstPorts  = 0;
  localparam int unsigned SpatzClNumAxiExtMstPorts = 0;
  localparam int unsigned CarNumAxiExtSlvPorts     = SafedNumAxiExtMstPorts + PulpClNumAxiExtMstPorts + SpatzClNumAxiExtMstPorts;

  axi_mst_req_t [CarNumAxiExtSlvPorts-1:0] ext_to_vip_req;
  axi_mst_rsp_t [CarNumAxiExtSlvPorts-1:0] ext_to_vip_rsp;

  axi_mst_req_t axi_muxed_req;
  axi_mst_rsp_t axi_muxed_rsp;

  // Verification IPs for carfield
  vip_carfield_soc #(
    .DutCfg        ( DutCfg ),
    // Determine whether we preload the hyperram model or not User preload. If 0, the memory model
    // is not preloaded at time 0.
    .HypUserPreload ( `HYP_USER_PRELOAD ),
    // Mem files for hyperram model. The argument is considered only if HypUserPreload==1 in the
    // memory model.
    .Hyp0UserPreloadMemFile ( `HYP0_PRELOAD_MEM_FILE ),
    .Hyp1UserPreloadMemFile ( `HYP1_PRELOAD_MEM_FILE ),
    .ClkPeriodSys  ( ClkPeriodRef ),
    .ClkPeriodJtag ( ClkPeriodJtag ),
    .RstCycles     ( RstCycles ),
    .TAppl         ( TAppl ),
    .TTest         ( TTest ),
    .NumAxiExtSlvPorts ( CarNumAxiExtSlvPorts ),
    .axi_slv_ext_req_t ( axi_mst_req_t ),
    .axi_slv_ext_rsp_t ( axi_mst_rsp_t )
  ) car_vip (
    // We use the clock/reset generated in cheshire VIP
    .clk_vip   (),
    .rst_n_vip (),
    .pad_hyper_csn ( w_hyper_csn ),
    .pad_hyper_ck  ( w_hyper_ck  ),
    .pad_hyper_ckn ( w_hyper_ckn ),
    .pad_hyper_rwds  ( w_hyper_rwds ),
    .pad_hyper_resetn ( w_hyper_resetn ),
    .pad_hyper_dq (w_hyper_dq ),
    // Multiplex incoming AXI req/rsp and convert t
    // hrough serial link
    .axi_slvs_req ( ext_to_vip_req ),
    .axi_slvs_rsp ( ext_to_vip_rsp ),
    .axi_muxed_req ( axi_muxed_req ),
    .axi_muxed_rsp ( axi_muxed_rsp )
  );

  //////////////////
  // Cheshire VIP //
  //////////////////

  // VIP
  vip_cheshire_soc #(
    .DutCfg            ( DutCfg ),
    .axi_ext_llc_req_t ( axi_llc_req_t ),
    .axi_ext_llc_rsp_t ( axi_llc_rsp_t ),
    .axi_ext_mst_req_t ( axi_mst_req_t ),
    .axi_ext_mst_rsp_t ( axi_mst_rsp_t ),
    .ClkPeriodSys      ( ClkPeriodRef  ),
    .ClkPeriodJtag     ( ClkPeriodJtag ),
    .RstCycles         ( RstCycles ),
    .TAppl             ( TAppl ),
    .TTest             ( TTest ),
    .SlinkAxiDebug     ( 0     )
  ) chs_vip (
    // Generate reference clock for the PLL
    .clk             ( ref_clk                ),
    // Generate reset
    .rst_n           ( pwr_on_rst_n           ),
    .test_mode       ( testmode_hostd         ),
    .boot_mode       ( bootmode_hostd         ),
    // In carfield chip, the real-time clock is generated by the PLL
    .rtc             ( /* unconnected */      ),
    // In carfield chip, we do not connect to axi_sim_mem, but to HyperRAM
    .axi_llc_mst_req ( '0 ),
    .axi_llc_mst_rsp (    ),
     // External AXI port
    .axi_slink_mst_req ( axi_muxed_req ),
    .axi_slink_mst_rsp ( axi_muxed_rsp ),
    // JTAG interface
    .jtag_tck        ( jtag_hostd_tck   ),
    .jtag_trst_n     ( jtag_hostd_trst_n ),
    .jtag_tms        ( jtag_hostd_tms   ),
    .jtag_tdi        ( jtag_hostd_tdi   ),
    .jtag_tdo        ( jtag_hostd_tdo   ),
    // UART interface
    .uart_tx         ( uart_hostd_tx ),
    .uart_rx         ( uart_hostd_rx ),
    // I2C interface
    .i2c_sda         ( w_i2c_hostd_sda ),
    .i2c_scl         ( w_i2c_hostd_scl ),
    // SPI host interface
    .spih_sck        ( w_spi_hostd_sck ),
    .spih_csb        ( w_spi_hostd_csb ),
    .spih_sd         ( w_spi_hostd_sd  ),
    // Serial link interface
    .slink_rcv_clk_i ( slink_hostd_rcv_clk_from_vip ),
    .slink_rcv_clk_o ( slink_hostd_rcv_clk_to_vip   ),
    .slink_i         ( slink_hostd_from_vip         ),
    .slink_o         ( slink_hostd_to_vip           )
  );

  ///////////////////////
  // Safety island VIP //
  ///////////////////////

  localparam time ClkPeriodSafedJtag = 20ns;

  localparam axi_in_t AxiIn = gen_axi_in(DutCfg);
  localparam int unsigned AxiSlvIdWidth = DutCfg.AxiMstIdWidth + $clog2(AxiIn.num_in);

  // VIP
  vip_safety_island_soc #(
    .DutCfg            ( SafetyIslandCfg ),
    .axi_mst_ext_req_t ( axi_mst_req_t ),
    .axi_mst_ext_rsp_t ( axi_mst_rsp_t ),
    .axi_slv_ext_req_t ( axi_mst_req_t ),
    .axi_slv_ext_rsp_t ( axi_mst_rsp_t ),
    .GlobalAddrWidth   ( 32            ),
    .BaseAddr          ( 32'h6000_0000 ),
    .AddrRange         ( CarfieldIslandsCfg.safed.size      ),
    .MemOffset         ( SafetyIslandMemOffset ),
    .PeriphOffset      ( SafetyIslandPerOffset ),
    .ClkPeriodSys      ( ClkPeriodRef          ),
    .ClkPeriodJtag     ( ClkPeriodSafedJtag    ),
    .RstCycles         ( RstCycles             ),
    .AxiDataWidth      ( DutCfg.AxiDataWidth   ),
    .AxiAddrWidth      ( DutCfg.AddrWidth      ),
    .AxiInputIdWidth   ( AxiSlvIdWidth         ),
    .AxiOutputIdWidth  ( DutCfg.AxiMstIdWidth  ),
    .AxiUserWidth      ( DutCfg.AxiUserWidth   ),
    .AxiDebug          ( 0     ),
    .ApplFrac          ( TAppl ),
    .TestFrac          ( TTest )
  ) safed_vip (
    // we use the clock generated in cheshire VIP
    .clk_vip      (),
    .ext_clk_vip  (),
    // we use the reset generated in cheshire VIP
    .rst_n_vip    (),
    .test_mode    (),
    .boot_mode    ( bootmode_safed ),
    // we use the rtc generated in cheshire VIP
    .rtc          (),
    // Not used in carfield
    .axi_mst_req  ( '0 ),
    .axi_mst_rsp  (    ),
    // Virtual driver to be multiplexed and then serialized through the serial link
    .axi_slv_req  ( ext_to_vip_req[SafedNumAxiExtMstPorts-1:0] ),
    .axi_slv_rsp  ( ext_to_vip_rsp[SafedNumAxiExtMstPorts-1:0] ),
    // JTAG interface
    .jtag_tck     ( jtag_safed_tck    ),
    .jtag_trst_n  ( jtag_safed_trst_n ),
    .jtag_tms     ( jtag_safed_tms    ),
    .jtag_tdi     ( jtag_safed_tdi    ),
    .jtag_tdo     ( jtag_safed_tdo    ),
    // Exit
    .exit_status  ( )
  );

  /////////////////////////
  // Security island VIP //
  /////////////////////////

  localparam time ClkPeriodSecdJtag = 20ns;

  // VIP
  vip_security_island_soc #(
    .ClkPeriodJtag ( ClkPeriodSecdJtag ),
    .RstCycles     ( RstCycles ),
    .TAppl         ( TAppl ),
    .TTest         ( TTest )
  ) secd_vip (
    .clk_vip      ( ),
    .rst_n_vip    ( ),
    .bootmode     ( bootmode_secd   ),
    // UART interface
    .uart_tx      ( uart_secd_tx     ),
    .uart_rx      ( uart_secd_rx     ),
    // JTAG interface
    .jtag_tck     ( jtag_secd_tck    ),
    .jtag_trst_n  ( jtag_secd_trst_n ),
    .jtag_tms     ( jtag_secd_tms    ),
    .jtag_tdi     ( jtag_secd_tdi    ),
    .jtag_tdo     ( jtag_secd_tdo    ),
    .SPI_D0       ( w_spi_secd_sd[0] ),
    .SPI_D1       ( w_spi_secd_sd[1] ),
    .SPI_SCK      ( w_spi_secd_sck   ),
    .SPI_CSB      ( w_spi_secd_csb[0])
  );

  /////////////////////////
  // PLL JTAG verif      //
  /////////////////////////

  localparam time ClkPeriodPllJtag  = 20ns;
  localparam int PLL_JTAG_IR_BYPASS = 'h0;
  localparam int PLL_JTAG_IR_IDCODE = 'h1;
  localparam int PLL_JTAG_IR_PLLREG = 'h10;

  // Generate clock for JTAG
  clk_rst_gen #(
    .ClkPeriod    ( ClkPeriodPllJtag ),
    .RstClkCycles ( RstCycles        )
  ) i_clk_jtag (
    .clk_o  ( jtag_pll_tck ),
    .rst_no ( )
  );

  VJTAG_DV vjtag_pll(jtag_pll_tck);

  typedef vjtag_test::vjtag_driver #(
    .IrLength( 5                        ),
    .IrIDCODE( PLL_JTAG_IR_IDCODE       ),
    .TA      ( ClkPeriodPllJtag * TAppl ),
    .TT      ( ClkPeriodPllJtag * TTest )
  ) vjtag_driver_t;

  vjtag_driver_t vjtag_pll_dv = new(vjtag_pll);

  initial begin
    vjtag_pll_dv.reset_master();
  end

  assign jtag_pll_trst_n = vjtag_pll.trst_n;
  assign jtag_pll_tms = vjtag_pll.tms;
  assign jtag_pll_tdi = vjtag_pll.tdi;
  assign vjtag_pll.tdo = jtag_pll_tdo;


  /////////////////////////
  // Carfield chip tasks //
  /////////////////////////

  // PLL bypass mode
  task set_bypass_pll(input logic bypass);
    bypass_pll = bypass;
  endtask

  task set_secure_boot(input logic sb);
    secure_boot = sb;
  endtask // set_secure_boot

  // PLL frequency meters
  localparam MaxSample = 1024;
  logic [NumPlls-1:0] print_freq_debug_signals, print_freq_pll_out;
  real  sampled_freq_debug_signals [NumPlls-1:0];
  real  sampled_freq_pll_out [NumPlls-1:0];

  for(genvar p=0; p<NumPlls; p++) begin
    freq_meter #(
      .MAX_SAMPLE ( MaxSample )
    ) i_freq_meter_debug_signals (
      .clk        ( debug_signals[p]),
      .print_freq ( print_freq_debug_signals[p]   ),
      .freq       ( sampled_freq_debug_signals[p] )
    );

    //TODO: how should this be managed??? PLL, FLL???
    // freq_meter #(
    //   .MAX_SAMPLE ( MaxSample )
    // ) i_freq_meter_pll_out (
    //   .clk        ( i_dut.i_pll.clkpll_o[p] ),
    //   .print_freq ( print_freq_pll_out[p]   ),
    //   .freq       ( sampled_freq_pll_out[p] )
    // );
  end

  task sample_freq_debug_signals ();
     for(int i=0; i<NumPlls; i++) begin
         repeat(MaxSample*2)
           @(posedge debug_signals[i]);

         @(posedge print_freq_debug_signals[i]);

         $display("Sampling debug signal %d. Measured frequency: %f MHz\n", i, sampled_freq_debug_signals[i]*10);
     end
  endtask

  //TODO: how should this be managed??? PLL, FLL???
  // task sample_freq_pll_out ();
  //    for(int i=0; i<NumPlls; i++) begin
  //        repeat(MaxSample*2)
  //          @(posedge  i_dut.i_pll.clkpll_o[i]);

  //        @(posedge print_freq_pll_out[i]);

  //        $display("Sampling PLL output %d. Measured frequency: %f MHz\n", i, sampled_freq_pll_out[i]*10);
  //    end
  // endtask

  task check_freq_pll_out (
    input real sampled_freq_pll_out,
    input int  desired_freq
  );
     real     diff_freq;
     diff_freq = sampled_freq_pll_out - real'(desired_freq);
     diff_freq = (diff_freq/sampled_freq_pll_out)*100;

     if((diff_freq < -5) | (diff_freq > 5))
       $fatal(1,"More than 5 percent of difference between actual and desired frequency! %f vs %d", sampled_freq_pll_out, desired_freq);
     else
       $display("Desired: %f actual: %d", desired_freq, sampled_freq_pll_out);
  endtask

  ///////////////////
  // Generic tasks //
  ///////////////////

  task passthrough_or_wait_for_secd_hw_init();
`ifndef CARFIELD_CHIP_NETLIST
    if ((secure_boot || !i_dut.i_dut.car_regs_hw2reg.security_island_isolate_status.d) &&
        i_dut.i_dut.gen_secure_subsystem.i_security_island.u_RoT.u_rv_core_ibex.fetch_enable != lc_ctrl_pkg::On) begin
      $display("Wait for OT to boot...");
      wait (i_dut.i_dut.gen_secure_subsystem.i_security_island.u_RoT.u_rv_core_ibex.fetch_enable == lc_ctrl_pkg::On);
    end
`endif
  endtask

  task automatic slink_read_reg(
    input doub_bt addr,
    output word_bt data,
    input int unsigned idle_cycles
  );
    axi_data_t beats [$];
    #(ClkPeriodRef * idle_cycles);
    chs_vip.slink_read_beats(addr, 2, 0, beats);
    data = beats[0];
  endtask

endmodule
