// Copyright 2021 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Author: Matteo Perotti <mperotti@iis.ee.ethz.ch>
// Description: Carfield wrap for SpyGlass analysis.

module carfield_wrap import carfield_pkg::*; import cheshire_pkg::*; #(
    parameter cheshire_cfg_t Cfg = carfield_pkg::CarfieldCfgDefault, // from Cheshire package
    parameter int unsigned HypNumPhys  = 1,
    parameter int unsigned HypNumChips = 1
) (
    input   logic                                       clk_i,
    input   logic                                       rst_ni,
    input   logic                                       test_mode_i,
    // Boot mode selection
    input   logic [1:0]                                 boot_mode_i,
    // CLINT
    input   logic                                       rtc_i,
    // JTAG Interfacex
    input   logic                                       jtag_tck_i,
    input   logic                                       jtag_trst_ni,
    input   logic                                       jtag_tms_i,
    input   logic                                       jtag_tdi_i,
    output  logic                                       jtag_tdo_o,
    output  logic                                       jtag_tdo_oe_o,
    // UART Interface
    output logic                                        uart_tx_o,
    input  logic                                        uart_rx_i,
    // UART Modem flow control
    output logic                                        uart_rts_no,
    output logic                                        uart_dtr_no,
    input  logic                                        uart_cts_ni,
    input  logic                                        uart_dsr_ni,
    input  logic                                        uart_dcd_ni,
    input  logic                                        uart_rin_ni,
    // I2C Interface
    output logic                                        i2c_sda_o,
    input  logic                                        i2c_sda_i,
    output logic                                        i2c_sda_en_o,
    output logic                                        i2c_scl_o,
    input  logic                                        i2c_scl_i,
    output logic                                        i2c_scl_en_o,
    // SPI Host Interface
    output logic                                        spih_sck_o,
    output logic                                        spih_sck_en_o,
    output logic [SpihNumCs-1:0]                        spih_csb_o,
    output logic [SpihNumCs-1:0]                        spih_csb_en_o,
    output logic [ 3:0]                                 spih_sd_o,
    output logic [ 3:0]                                 spih_sd_en_o,
    input  logic [ 3:0]                                 spih_sd_i,
    // GPIO interface
    input  logic [31:0]                                 gpio_i,
    output logic [31:0]                                 gpio_o,
    output logic [31:0]                                 gpio_en_o,
    // Serial link interface
    input  logic [SlinkNumChan-1:0]                     slink_rcv_clk_i,
    output logic [SlinkNumChan-1:0]                     slink_rcv_clk_o,
    input  logic [SlinkNumChan-1:0][SlinkNumLanes-1:0]  slink_i,
    output logic [SlinkNumChan-1:0][SlinkNumLanes-1:0]  slink_o,
    // HyperBus clocks
    input  logic                                        hyp_clk_phy_i,
    input  logic                                        hyp_rst_phy_ni,
    // Physical interace: facing HyperBus
    inout  [HypNumPhys-1:0][HypNumChips-1:0]            pad_hyper_csn,
    inout  [HypNumPhys-1:0]                             pad_hyper_ck,
    inout  [HypNumPhys-1:0]                             pad_hyper_ckn,
    inout  [HypNumPhys-1:0]                             pad_hyper_rwds,
    inout  [HypNumPhys-1:0]                             pad_hyper_reset,
    inout  [HypNumPhys-1:0][7:0]                        pad_hyper_dq
);

  // DefaultCfg from cheshire_pkg
  localparam cheshire_cfg_t DutCfg = DefaultCfg;

  /********************/
  /* Hyper RAM Params */
  /********************/

  localparam int NumPhys  = 1;
  localparam int NumChips = 2;

  carfield      #(
    .Cfg         ( DefaultCfg ),
    .HypNumPhys  ( NumPhys    ),
    .HypNumChips ( NumChips   )
  ) i_dut        (
    .clk_i           (clk_i            ),
    .rst_ni          (rst_ni           ),
    .test_mode_i     (test_mode_i      ),
    .boot_mode_i     (boot_mode_i      ),
    .rtc_i           (rtc_i            ),
    .jtag_tck_i      (jtag_tck_i       ),
    .jtag_trst_ni    (jtag_trst_ni     ),
    .jtag_tms_i      (jtag_tms_i       ),
    .jtag_tdi_i      (jtag_tdi_i       ),
    .jtag_tdo_o      (jtag_tdo_o       ),
    .jtag_tdo_oe_o   (jtag_tdo_oe_o    ),
    .uart_tx_o       (uart_tx_o        ),
    .uart_rx_i       (uart_rx_i        ),
    .uart_rts_no     (uart_rts_no      ),
    .uart_dtr_no     (uart_dtr_no      ),
    .uart_cts_ni     (uart_cts_ni      ),
    .uart_dsr_ni     (uart_dsr_ni      ),
    .uart_dcd_ni     (uart_dcd_ni      ),
    .uart_rin_ni     (uart_rin_ni      ),
    .i2c_sda_o       (i2c_sda_o        ),
    .i2c_sda_i       (i2c_sda_i        ),
    .i2c_sda_en_o    (i2c_sda_en_o     ),
    .i2c_scl_o       (i2c_scl_o        ),
    .i2c_scl_i       (i2c_scl_i        ),
    .i2c_scl_en_o    (i2c_scl_en_o     ),
    .spih_sck_o      (spih_sck_o       ),
    .spih_sck_en_o   (spih_sck_en_o    ),
    .spih_csb_o      (spih_csb_o       ),
    .spih_csb_en_o   (spih_csb_en_o    ),
    .spih_sd_o       (spih_sd_o        ),
    .spih_sd_en_o    (spih_sd_en_o     ),
    .spih_sd_i       (spih_sd_i        ),
    .gpio_i          (gpio_i           ),
    .gpio_o          (gpio_o           ),
    .gpio_en_o       (gpio_en_o        ),
    .slink_rcv_clk_i (slink_rcv_clk_i  ),
    .slink_rcv_clk_o (slink_rcv_clk_o  ),
    .slink_i         (slink_i          ),
    .slink_o         (slink_o          ),
    .hyp_clk_phy_i   (hyp_clk_phy_i    ),
    .hyp_rst_phy_ni  (hyp_rst_phy_ni   ),
    .pad_hyper_csn   (pad_hyper_csn    ),
    .pad_hyper_ck    (pad_hyper_ck     ),
    .pad_hyper_ckn   (pad_hyper_ckn    ),
    .pad_hyper_rwds  (pad_hyper_rwds   ),
    .pad_hyper_reset (pad_hyper_reset  ),
    .pad_hyper_dq    (pad_hyper_dq     )
  );

endmodule
