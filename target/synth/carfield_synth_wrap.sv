// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Thomas Benz     <tbenz@ethz.ch>
// Luca Valente    <luca.valente@unibo.it>
// Yvan Tortorella <yvan.tortorella@unibo.it>
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

`include "cheshire/typedef.svh"
`include "axi/typedef.svh"
`include "apb/typedef.svh"

// Wrap for synthesis of carfield
module carfield_synth_wrap
  import carfield_pkg::*;
  import carfield_reg_pkg::*;
  import cheshire_pkg::*;
  import safety_island_pkg::*;
  import tlul_ot_pkg::*;
  import spatz_cluster_pkg::*;
#(
  parameter int unsigned HypNumPhys  = 2,
  parameter int unsigned HypNumChips = 2,
) (
  // host clock
  input   logic                                       host_clk_i,
  // peripheral clock
  input   logic                                       periph_clk_i,
  // accelerator and island clock
  input   logic                                       alt_clk_i,
  // external reference clock for timers (CLINT, islands)
  input   logic                                       rt_clk_i,

  input   logic                                       pwr_on_rst_ni,

  // testmode pin
  input   logic                                       test_mode_i,
  // Cheshire BOOT pins (3 pins)
  input   logic [1:0]                                 boot_mode_i,
  // Cheshire JTAG Interface
  input   logic                                       jtag_tck_i,
  input   logic                                       jtag_trst_ni,
  input   logic                                       jtag_tms_i,
  input   logic                                       jtag_tdi_i,
  output  logic                                       jtag_tdo_o,
  output  logic                                       jtag_tdo_oe_o,
  // Secure Subsystem JTAG Interface
  input   logic                                       jtag_ot_tck_i,
  input   logic                                       jtag_ot_trst_ni,
  input   logic                                       jtag_ot_tms_i,
  input   logic                                       jtag_ot_tdi_i,
  output  logic                                       jtag_ot_tdo_o,
  output  logic                                       jtag_ot_tdo_oe_o,
  // Safety Island JTAG Interface
  input   logic                                       jtag_safety_island_tck_i,
  input   logic                                       jtag_safety_island_trst_ni,
  input   logic                                       jtag_safety_island_tms_i,
  input   logic                                       jtag_safety_island_tdi_i,
  output  logic                                       jtag_safety_island_tdo_o,
  // Secure Subsystem BOOT pins
  input   logic [1:0]                                 bootmode_ot_i,
  // unused by safety island -- tdo pad always out mode
  output  logic                                       jtag_safe_isln_tdo_oe_o,
  // Safety Island BOOT pins
  input   logic [1:0]                                 bootmode_safe_isln_i,
  // Host UART Interface
  output logic                                        uart_tx_o,
  input  logic                                        uart_rx_i,
  // Secure Subsystem UART Interface
  output logic                                        uart_ot_tx_o,
  input  logic                                        uart_ot_rx_i,
  // Host I2C Interface pins
  output logic                                        i2c_sda_o,
  input  logic                                        i2c_sda_i,
  output logic                                        i2c_sda_en_o,
  output logic                                        i2c_scl_o,
  input  logic                                        i2c_scl_i,
  output logic                                        i2c_scl_en_o,
  // Host SPI Master Interface
  output logic                                        spih_sck_o,
  output logic                                        spih_sck_en_o,
  output logic [SpihNumCs-1:0]                        spih_csb_o,
  output logic [SpihNumCs-1:0]                        spih_csb_en_o,
  output logic [ 3:0]                                 spih_sd_o,
  output logic [ 3:0]                                 spih_sd_en_o,
  input  logic [ 3:0]                                 spih_sd_i,
  // Secure Subsystem QSPI Master Interface
  output logic                                        spih_ot_sck_o,
  output logic                                        spih_ot_sck_en_o,
  output logic                                        spih_ot_csb_o,
  output logic                                        spih_ot_csb_en_o,
  output logic [ 3:0]                                 spih_ot_sd_o,
  output logic [ 3:0]                                 spih_ot_sd_en_o,
  input  logic [ 3:0]                                 spih_ot_sd_i,
  // ETHERNET interface
  input  logic                                        eth_rxck_i,
  input  logic                                        eth_rxctl_i,
  input  logic  [ 3:0]                                eth_rxd_i,
  input  logic                                        eth_md_i,
  output logic                                        eth_txck_o,
  output logic                                        eth_txctl_o,
  output logic  [ 3:0]                                eth_txd_o,
  output logic                                        eth_md_o,
  output logic                                        eth_md_oe,
  output logic                                        eth_mdc_o,
  output logic                                        eth_rst_n_o,
  // CAN interface
  input  logic                                        can_rx_i,
  output logic                                        can_tx_o,
  // GPIOs
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
  // HyperBus interface
  output logic [HypNumPhys-1:0][HypNumChips-1:0]      hyper_cs_no,
  output logic [HypNumPhys-1:0]                       hyper_ck_o,
  output logic [HypNumPhys-1:0]                       hyper_ck_no,
  output logic [HypNumPhys-1:0]                       hyper_rwds_o,
  input  logic [HypNumPhys-1:0]                       hyper_rwds_i,
  output logic [HypNumPhys-1:0]                       hyper_rwds_oe_o,
  input  logic [HypNumPhys-1:0][7:0]                  hyper_dq_i,
  output logic [HypNumPhys-1:0][7:0]                  hyper_dq_o,
  output logic [HypNumPhys-1:0]                       hyper_dq_oe_o,
  output logic [HypNumPhys-1:0]                       hyper_reset_no,
  // Debug signals
  output carfield_debug_sigs_t                        debug_signals_o
);

  localparam cheshire_cfg_t DutCfg = carfield_pkg::CarfieldCfgDefault;
  `CHESHIRE_TYPEDEF_ALL(, DutCfg)

  carfield      #(
    .Cfg         ( DutCfg      ),
    .HypNumPhys  ( HypNumPhys  ),
    .HypNumChips ( HypNumChips ),
    .reg_req_t   ( reg_req_t ),
    .reg_rsp_t   ( reg_rsp_t )
  ) i_dut                       (
    .host_clk_i                ,
    .periph_clk_i              ,
    .alt_clk_i                 ,
    .rt_clk_i                  ,
    .pwr_on_rst_ni             ,
    .test_mode_i               ,
    .boot_mode_i               ,
    .jtag_tck_i                ,
    .jtag_trst_ni              ,
    .jtag_tms_i                ,
    .jtag_tdi_i                ,
    .jtag_tdo_o                ,
    .jtag_tdo_oe_o             ,
    .jtag_ot_tck_i             ,
    .jtag_ot_trst_ni           ,
    .jtag_ot_tms_i             ,
    .jtag_ot_tdi_i             ,
    .jtag_ot_tdo_o             ,
    .jtag_ot_tdo_oe_o          ,
    .jtag_safety_island_tck_i  ,
    .jtag_safety_island_trst_ni, // Temporary
    .jtag_safety_island_tms_i  , // Temporary
    .jtag_safety_island_tdi_i  , // Temporary
    .jtag_safety_island_tdo_o  ,
    .uart_tx_o                 ,
    .uart_rx_i                 ,
    .uart_ot_tx_o              ,
    .uart_ot_rx_i              ,
    .i2c_sda_o                 ,
    .i2c_sda_i                 ,
    .i2c_sda_en_o              ,
    .i2c_scl_o                 ,
    .i2c_scl_i                 ,
    .i2c_scl_en_o              ,
    // hostd spi
    .spih_sck_o                ,
    .spih_sck_en_o             ,
    .spih_csb_o                ,
    .spih_csb_en_o             ,
    .spih_sd_o                 ,
    .spih_sd_en_o              ,
    .spih_sd_i                 ,
    // secd spi
    .spih_ot_sck_o             ,
    .spih_ot_sck_en_o          ,
    .spih_ot_csb_o             ,
    .spih_ot_csb_en_o          ,
    .spih_ot_sd_o              ,
    .spih_ot_sd_en_o           ,
    .spih_ot_sd_i              ,
    .gpio_i                    ,
    .gpio_o                    ,
    .gpio_en_o                 ,
    .slink_rcv_clk_i           ,
    .slink_rcv_clk_o           ,
    .slink_i                   ,
    .slink_o                   ,
    .hyp_clk_phy_i             ,
    .hyp_rst_phy_ni            ,
    .hyper_cs_no               ,
    .hyper_ck_o                ,
    .hyper_ck_no               ,
    .hyper_rwds_o              ,
    .hyper_rwds_i              ,
    .hyper_rwds_oe_o           ,
    .hyper_dq_i                ,
    .hyper_dq_o                ,
    .hyper_dq_oe_o             ,
    .hyper_reset_no            ,
    .ext_reg_async_slv_req_i   ( '0 ),
    .ext_reg_async_slv_ack_o   (    ),
    .ext_reg_async_slv_data_i  ( '0 ),
    .ext_reg_async_slv_req_o   (    ),
    .ext_reg_async_slv_ack_i   ( '0 ),
    .ext_reg_async_slv_data_o  (    ),
    .debug_signals_o           (    )
  );

endmodule
