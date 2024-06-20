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
  import carfield_chip_pkg::*;
  import carfield_reg_pkg::*;
  import cheshire_pkg::*;
`ifdef SAFED_ENABLE
  import safety_island_pkg::*;
`endif
  import tlul_ot_pkg::*;
`ifdef SPATZ_ENABLE
  import spatz_cluster_pkg::*;
`endif
  import pkg_carfield_padframe_behav::*;
#(
  parameter cheshire_cfg_t Cfg = carfield_pkg::CarfieldCfgDefault,
  parameter int unsigned   HypNumPhys  = 2,
  parameter int unsigned   HypNumChips = 2,
  parameter type           reg_req_t   = logic,
  parameter type           reg_rsp_t   = logic
) (
  inout wire logic pad_periph_reset_n_pad,
  inout wire logic pad_periph_bypass_fll_pad,
  inout wire logic pad_periph_ref_clk_pad,
  inout wire logic pad_periph_ext_clk_pad,
  inout wire logic pad_periph_secure_boot_pad,
  inout wire logic pad_periph_jtag_pll_00_pad,
  inout wire logic pad_periph_jtag_pll_01_pad,
  inout wire logic pad_periph_jtag_pll_02_pad,
  inout wire logic pad_periph_jtag_pll_03_pad,
  inout wire logic pad_periph_jtag_pll_04_pad,
  inout wire logic pad_periph_debug_out0_pad,
  inout wire logic pad_periph_debug_out1_pad,
  inout wire logic pad_periph_debug_out2_pad,
  inout wire logic pad_periph_debug_out3_pad,
  inout wire logic pad_periph_debug_out4_pad,
  inout wire logic pad_periph_bootmode_host_0_pad,
  inout wire logic pad_periph_bootmode_host_1_pad,
  inout wire logic pad_periph_bootmode_host_2_pad,
  inout wire logic pad_periph_jtag_host_tck_pad,
  inout wire logic pad_periph_jtag_host_tms_pad,
  inout wire logic pad_periph_jtag_host_tdi_pad,
  inout wire logic pad_periph_jtag_host_trstn_pad,
  inout wire logic pad_periph_jtag_host_tdo_pad,
  inout wire logic pad_periph_host_00_pad,
  inout wire logic pad_periph_host_01_pad,
  inout wire logic pad_periph_host_02_pad,
  inout wire logic pad_periph_host_03_pad,
  inout wire logic pad_periph_host_04_pad,
  inout wire logic pad_periph_host_05_pad,
  inout wire logic pad_periph_host_06_pad,
  inout wire logic pad_periph_host_07_pad,
  inout wire logic pad_periph_host_08_pad,
  inout wire logic pad_periph_host_09_pad,
  inout wire logic pad_periph_host_10_pad,
  inout wire logic pad_periph_bootmode_safe_0_pad,
  inout wire logic pad_periph_bootmode_safe_1_pad,
  inout wire logic pad_periph_jtag_safe_tck_pad,
  inout wire logic pad_periph_jtag_safe_tms_pad,
  inout wire logic pad_periph_jtag_safe_tdi_pad,
  inout wire logic pad_periph_jtag_safe_trstn_pad,
  inout wire logic pad_periph_jtag_safe_tdo_pad,
  inout wire logic pad_periph_bootmode_secure_0_pad,
  inout wire logic pad_periph_bootmode_secure_1_pad,
  inout wire logic pad_periph_jtag_secure_tck_pad,
  inout wire logic pad_periph_jtag_secure_tms_pad,
  inout wire logic pad_periph_jtag_secure_tdi_pad,
  inout wire logic pad_periph_jtag_secure_trstn_pad,
  inout wire logic pad_periph_jtag_secure_tdo_pad,
  inout wire logic pad_periph_secure_00_pad,
  inout wire logic pad_periph_secure_01_pad,
  inout wire logic pad_periph_secure_02_pad,
  inout wire logic pad_periph_secure_03_pad,
  inout wire logic pad_periph_secure_04_pad,
  inout wire logic pad_periph_secure_05_pad,
  inout wire logic pad_periph_secure_06_pad,
  inout wire logic pad_periph_secure_07_pad,
  inout wire logic pad_periph_gpio_00_pad,
  inout wire logic pad_periph_gpio_01_pad,
  inout wire logic pad_periph_gpio_02_pad,
  inout wire logic pad_periph_gpio_03_pad,
  inout wire logic pad_periph_gpio_04_pad,
  inout wire logic pad_periph_gpio_05_pad,
  inout wire logic pad_periph_gpio_06_pad,
  inout wire logic pad_periph_gpio_07_pad,
  inout wire logic pad_periph_gpio_08_pad,
  inout wire logic pad_periph_gpio_09_pad,
  inout wire logic pad_periph_gpio_10_pad,
  inout wire logic pad_periph_gpio_11_pad,
  inout wire logic pad_periph_gpio_12_pad,
  inout wire logic pad_periph_gpio_13_pad,
  inout wire logic pad_periph_gpio_14_pad,
  inout wire logic pad_periph_gpio_15_pad,
  inout wire logic pad_periph_periph_00_pad,
  inout wire logic pad_periph_periph_01_pad,
  inout wire logic pad_periph_periph_02_pad,
  inout wire logic pad_periph_periph_03_pad,
  inout wire logic pad_periph_periph_04_pad,
  inout wire logic pad_periph_periph_05_pad,
  inout wire logic pad_periph_periph_06_pad,
  inout wire logic pad_periph_periph_07_pad,
  inout wire logic pad_periph_periph_08_pad,
  inout wire logic pad_periph_periph_09_pad,
  inout wire logic pad_periph_periph_10_pad,
  inout wire logic pad_periph_periph_11_pad,
  inout wire logic pad_periph_periph_12_pad,
  inout wire logic pad_periph_periph_13_pad,
  inout wire logic pad_periph_periph_14_pad,
  inout wire logic pad_periph_periph_15_pad,
  inout wire logic pad_periph_periph_16_pad,
  inout wire logic pad_periph_hyper0_csn0_pad,
  inout wire logic pad_periph_hyper0_csn1_pad,
  inout wire logic pad_periph_hyper0_ck_pad,
  inout wire logic pad_periph_hyper0_ckn_pad,
  inout wire logic pad_periph_hyper0_rwds_pad,
  inout wire logic pad_periph_hyper0_rstn_pad,
  inout wire logic pad_periph_hyper0_data0_pad,
  inout wire logic pad_periph_hyper0_data1_pad,
  inout wire logic pad_periph_hyper0_data2_pad,
  inout wire logic pad_periph_hyper0_data3_pad,
  inout wire logic pad_periph_hyper0_data4_pad,
  inout wire logic pad_periph_hyper0_data5_pad,
  inout wire logic pad_periph_hyper0_data6_pad,
  inout wire logic pad_periph_hyper0_data7_pad,
  inout wire logic pad_periph_hyper1_csn0_pad,
  inout wire logic pad_periph_hyper1_csn1_pad,
  inout wire logic pad_periph_hyper1_ck_pad,
  inout wire logic pad_periph_hyper1_ckn_pad,
  inout wire logic pad_periph_hyper1_rwds_pad,
  inout wire logic pad_periph_hyper1_rstn_pad,
  inout wire logic pad_periph_hyper1_data0_pad,
  inout wire logic pad_periph_hyper1_data1_pad,
  inout wire logic pad_periph_hyper1_data2_pad,
  inout wire logic pad_periph_hyper1_data3_pad,
  inout wire logic pad_periph_hyper1_data4_pad,
  inout wire logic pad_periph_hyper1_data5_pad,
  inout wire logic pad_periph_hyper1_data6_pad,
  inout wire logic pad_periph_hyper1_data7_pad,
  inout wire logic pad_periph_sl_clk_in_pad,
  inout wire logic pad_periph_sl_data_in0_pad,
  inout wire logic pad_periph_sl_data_in1_pad,
  inout wire logic pad_periph_sl_data_in2_pad,
  inout wire logic pad_periph_sl_data_in3_pad,
  inout wire logic pad_periph_sl_data_in4_pad,
  inout wire logic pad_periph_sl_data_in5_pad,
  inout wire logic pad_periph_sl_data_in6_pad,
  inout wire logic pad_periph_sl_data_in7_pad,
  inout wire logic pad_periph_sl_clk_out_pad,
  inout wire logic pad_periph_sl_data_out0_pad,
  inout wire logic pad_periph_sl_data_out1_pad,
  inout wire logic pad_periph_sl_data_out2_pad,
  inout wire logic pad_periph_sl_data_out3_pad,
  inout wire logic pad_periph_sl_data_out4_pad,
  inout wire logic pad_periph_sl_data_out5_pad,
  inout wire logic pad_periph_sl_data_out6_pad,
  inout wire logic pad_periph_sl_data_out7_pad
);

  ////////////////////////////
  // Carfield configuration //
  ////////////////////////////

  localparam cheshire_cfg_t CarfieldCfg = carfield_pkg::CarfieldCfgDefault;
  `CHESHIRE_TYPEDEF_ALL(carfield_, CarfieldCfg)


  ////////////////////////
  // Connection Signals //
  ////////////////////////

  // POR
  logic pwr_on_rst_n;
  logic ref_clk_pwr_on_rst_n;

  // clock signals
  logic ref_clk;
  // generated clocks
  logic host_clk, periph_clk, alt_clk, rt_clk;

  // secure boot mode signal
  logic secure_boot;

  //////////////
  // Padframe //
  //////////////

  // register interface
  // to padframe: ref clock domain
  carfield_reg_req_t padframe_refclk_cfg_reg_req;
  carfield_reg_rsp_t padframe_refclk_cfg_reg_rsp;

  // signal to pad
  static_connection_signals_pad2soc_t st_pad2soc_signals;
  static_connection_signals_soc2pad_t st_soc2pad_signals;
  port_signals_pad2soc_t              pad2soc_port_signals;
  port_signals_soc2pad_t              soc2pad_port_signals;

  carfield_pkg::carfield_debug_sigs_t carfield_debug_signals;

  // pad2soc

  // is secure boot enabled
  assign secure_boot = st_pad2soc_signals.periph.st_secure_boot_i;
  // safed bootmodes
  logic [1:0] bootmode_safe_isln_s;
  assign bootmode_safe_isln_s[0] = st_pad2soc_signals.periph.st_safe_boot_sel0;
  assign bootmode_safe_isln_s[1] = st_pad2soc_signals.periph.st_safe_boot_sel1;
  // secd bootmodes
  logic [1:0] bootmode_sec_isln_s;
  assign bootmode_sec_isln_s[0] = st_pad2soc_signals.periph.st_secure_boot_sel0;
  assign bootmode_sec_isln_s[1] = st_pad2soc_signals.periph.st_secure_boot_sel1;
  // hostd bootmodes
  logic [2:0] bootmode_host_s;
  assign bootmode_host_s[0] = st_pad2soc_signals.periph.st_host_boot_sel0;
  assign bootmode_host_s[1] = st_pad2soc_signals.periph.st_host_boot_sel1;
  assign bootmode_host_s[2] = st_pad2soc_signals.periph.st_host_boot_sel2; // has no loads
  // serial link
  logic [SlinkNumChan-1:0][SlinkNumLanes-1:0] serial_link_data_in_s;
  assign serial_link_data_in_s[0][0] = st_pad2soc_signals.periph.sl_data_in0_o;
  assign serial_link_data_in_s[0][1] = st_pad2soc_signals.periph.sl_data_in1_o;
  assign serial_link_data_in_s[0][2] = st_pad2soc_signals.periph.sl_data_in2_o;
  assign serial_link_data_in_s[0][3] = st_pad2soc_signals.periph.sl_data_in3_o;
  assign serial_link_data_in_s[0][4] = st_pad2soc_signals.periph.sl_data_in4_o;
  assign serial_link_data_in_s[0][5] = st_pad2soc_signals.periph.sl_data_in5_o;
  assign serial_link_data_in_s[0][6] = st_pad2soc_signals.periph.sl_data_in6_o;
  assign serial_link_data_in_s[0][7] = st_pad2soc_signals.periph.sl_data_in7_o;
  // hyperbus signals
  logic [HypNumPhys-1:0]      hyperbus_rwds_in_s;
  logic [HypNumPhys-1:0][7:0] hyperbus_data_in_s;
  // hyperbus 0
  assign hyperbus_data_in_s[0][0] = st_pad2soc_signals.periph.st_hyper0_dq0_i;
  assign hyperbus_data_in_s[0][1] = st_pad2soc_signals.periph.st_hyper0_dq1_i;
  assign hyperbus_data_in_s[0][2] = st_pad2soc_signals.periph.st_hyper0_dq2_i;
  assign hyperbus_data_in_s[0][3] = st_pad2soc_signals.periph.st_hyper0_dq3_i;
  assign hyperbus_data_in_s[0][4] = st_pad2soc_signals.periph.st_hyper0_dq4_i;
  assign hyperbus_data_in_s[0][5] = st_pad2soc_signals.periph.st_hyper0_dq5_i;
  assign hyperbus_data_in_s[0][6] = st_pad2soc_signals.periph.st_hyper0_dq6_i;
  assign hyperbus_data_in_s[0][7] = st_pad2soc_signals.periph.st_hyper0_dq7_i;
  assign hyperbus_rwds_in_s[0]    = st_pad2soc_signals.periph.st_hyper0_rwds_i;
  // hyperbus 1
  assign hyperbus_data_in_s[1][0] = st_pad2soc_signals.periph.st_hyper1_dq0_i;
  assign hyperbus_data_in_s[1][1] = st_pad2soc_signals.periph.st_hyper1_dq1_i;
  assign hyperbus_data_in_s[1][2] = st_pad2soc_signals.periph.st_hyper1_dq2_i;
  assign hyperbus_data_in_s[1][3] = st_pad2soc_signals.periph.st_hyper1_dq3_i;
  assign hyperbus_data_in_s[1][4] = st_pad2soc_signals.periph.st_hyper1_dq4_i;
  assign hyperbus_data_in_s[1][5] = st_pad2soc_signals.periph.st_hyper1_dq5_i;
  assign hyperbus_data_in_s[1][6] = st_pad2soc_signals.periph.st_hyper1_dq6_i;
  assign hyperbus_data_in_s[1][7] = st_pad2soc_signals.periph.st_hyper1_dq7_i;
  assign hyperbus_rwds_in_s[1]    = st_pad2soc_signals.periph.st_hyper1_rwds_i;

  // soc2pad

  // serial link
  logic [SlinkNumChan-1:0][SlinkNumLanes-1:0] serial_link_data_out_s;
  assign st_soc2pad_signals.periph.sl_data_out0_i = serial_link_data_out_s[0][0];
  assign st_soc2pad_signals.periph.sl_data_out1_i = serial_link_data_out_s[0][1];
  assign st_soc2pad_signals.periph.sl_data_out2_i = serial_link_data_out_s[0][2];
  assign st_soc2pad_signals.periph.sl_data_out3_i = serial_link_data_out_s[0][3];
  assign st_soc2pad_signals.periph.sl_data_out4_i = serial_link_data_out_s[0][4];
  assign st_soc2pad_signals.periph.sl_data_out5_i = serial_link_data_out_s[0][5];
  assign st_soc2pad_signals.periph.sl_data_out6_i = serial_link_data_out_s[0][6];
  assign st_soc2pad_signals.periph.sl_data_out7_i = serial_link_data_out_s[0][7];
  //hyperbus
  logic [HypNumPhys-1:0]                  hyperbus_rwds_out_s;
  logic [HypNumPhys-1:0]                  hyperbus_rwds_oe_s;
  logic [HypNumPhys-1:0]                  hyperbus_clk_o_s;
  logic [HypNumPhys-1:0]                  hyperbus_clk_no_s;
  logic [HypNumPhys-1:0]                  hyperbus_rst_no_s;
  logic [HypNumPhys-1:0][HypNumChips-1:0] hyperbus_cs_no_s;
  logic [HypNumPhys-1:0][7:0]             hyperbus_data_out_s;
  logic [HypNumPhys-1:0]                  hyperbus_data_oe_s;
  // hyper bus 0
  assign st_soc2pad_signals.periph.st_hyper0_ck_no    = hyperbus_clk_no_s[0];
  assign st_soc2pad_signals.periph.st_hyper0_ck_o     = hyperbus_clk_o_s[0];
  assign st_soc2pad_signals.periph.st_hyper0_cs0_no   = hyperbus_cs_no_s[0][0];
  assign st_soc2pad_signals.periph.st_hyper0_cs1_no   = hyperbus_cs_no_s[0][1];
  assign st_soc2pad_signals.periph.st_hyper0_dq0_o    = hyperbus_data_out_s[0][0];
  assign st_soc2pad_signals.periph.st_hyper0_dq1_o    = hyperbus_data_out_s[0][1];
  assign st_soc2pad_signals.periph.st_hyper0_dq2_o    = hyperbus_data_out_s[0][2];
  assign st_soc2pad_signals.periph.st_hyper0_dq3_o    = hyperbus_data_out_s[0][3];
  assign st_soc2pad_signals.periph.st_hyper0_dq4_o    = hyperbus_data_out_s[0][4];
  assign st_soc2pad_signals.periph.st_hyper0_dq5_o    = hyperbus_data_out_s[0][5];
  assign st_soc2pad_signals.periph.st_hyper0_dq6_o    = hyperbus_data_out_s[0][6];
  assign st_soc2pad_signals.periph.st_hyper0_dq7_o    = hyperbus_data_out_s[0][7];
  assign st_soc2pad_signals.periph.st_hyper0_dq_oe    = hyperbus_data_oe_s[0];
  assign st_soc2pad_signals.periph.st_hyper0_reset_no = hyperbus_rst_no_s[0];
  assign st_soc2pad_signals.periph.st_hyper0_rwds_o   = hyperbus_rwds_out_s[0];
  assign st_soc2pad_signals.periph.st_hyper0_rwds_oe  = hyperbus_rwds_oe_s[0];
  // hyperbus 1
  assign st_soc2pad_signals.periph.st_hyper1_ck_no    = hyperbus_clk_no_s[1];
  assign st_soc2pad_signals.periph.st_hyper1_ck_o     = hyperbus_clk_o_s[1];
  assign st_soc2pad_signals.periph.st_hyper1_cs0_no   = hyperbus_cs_no_s[1][0];
  assign st_soc2pad_signals.periph.st_hyper1_cs1_no   = hyperbus_cs_no_s[1][1];
  assign st_soc2pad_signals.periph.st_hyper1_dq0_o    = hyperbus_data_out_s[1][0];
  assign st_soc2pad_signals.periph.st_hyper1_dq1_o    = hyperbus_data_out_s[1][1];
  assign st_soc2pad_signals.periph.st_hyper1_dq2_o    = hyperbus_data_out_s[1][2];
  assign st_soc2pad_signals.periph.st_hyper1_dq3_o    = hyperbus_data_out_s[1][3];
  assign st_soc2pad_signals.periph.st_hyper1_dq4_o    = hyperbus_data_out_s[1][4];
  assign st_soc2pad_signals.periph.st_hyper1_dq5_o    = hyperbus_data_out_s[1][5];
  assign st_soc2pad_signals.periph.st_hyper1_dq6_o    = hyperbus_data_out_s[1][6];
  assign st_soc2pad_signals.periph.st_hyper1_dq7_o    = hyperbus_data_out_s[1][7];
  assign st_soc2pad_signals.periph.st_hyper1_dq_oe    = hyperbus_data_oe_s[1];
  assign st_soc2pad_signals.periph.st_hyper1_reset_no = hyperbus_rst_no_s[1];
  assign st_soc2pad_signals.periph.st_hyper1_rwds_o   = hyperbus_rwds_out_s[1];
  assign st_soc2pad_signals.periph.st_hyper1_rwds_oe  = hyperbus_rwds_oe_s[1];

  //  peripherals

  // pad2soc
  // qspi0_hostd
  logic [ 3:0]                                 spih_sd_i_s;
  assign spih_sd_i_s[0] = pad2soc_port_signals.periph.qspi0_host.sd0_i;
  assign spih_sd_i_s[1] = pad2soc_port_signals.periph.qspi0_host.sd1_i;
  assign spih_sd_i_s[2] = pad2soc_port_signals.periph.qspi0_host.sd2_i;
  assign spih_sd_i_s[3] = pad2soc_port_signals.periph.qspi0_host.sd3_i;
  // qspi0_secd
  logic [ 3:0]                                 spih_ot_sd_i_s;
  assign spih_ot_sd_i_s[0] = pad2soc_port_signals.periph.qspi0_sec_isln.sd0_i;
  assign spih_ot_sd_i_s[1] = pad2soc_port_signals.periph.qspi0_sec_isln.sd1_i;
  assign spih_ot_sd_i_s[2] = pad2soc_port_signals.periph.qspi0_sec_isln.sd2_i;
  assign spih_ot_sd_i_s[3] = pad2soc_port_signals.periph.qspi0_sec_isln.sd3_i;
  // ethernet
  logic [3:0]                                eth_rxd_i_s;
  assign eth_rxd_i_s[0]  = pad2soc_port_signals.periph.ethernet.eth_rxd0_o;
  assign eth_rxd_i_s[1]  = pad2soc_port_signals.periph.ethernet.eth_rxd1_o;
  assign eth_rxd_i_s[2]  = pad2soc_port_signals.periph.ethernet.eth_rxd2_o;
  assign eth_rxd_i_s[3]  = pad2soc_port_signals.periph.ethernet.eth_rxd3_o;

  // gpio
  // TODO: parameterize number of gpios
  logic [31:0]              gpio_out_s;
  logic [31:0]              gpio_tx_en_s;
  logic [31:0]              gpio_in_s;
  assign soc2pad_port_signals.periph.gpio.gpio00_out = gpio_out_s[0];
  assign soc2pad_port_signals.periph.gpio.gpio01_out = gpio_out_s[1];
  assign soc2pad_port_signals.periph.gpio.gpio02_out = gpio_out_s[2];
  assign soc2pad_port_signals.periph.gpio.gpio03_out = gpio_out_s[3];
  assign soc2pad_port_signals.periph.gpio.gpio04_out = gpio_out_s[4];
  assign soc2pad_port_signals.periph.gpio.gpio05_out = gpio_out_s[5];
  assign soc2pad_port_signals.periph.gpio.gpio06_out = gpio_out_s[6];
  assign soc2pad_port_signals.periph.gpio.gpio07_out = gpio_out_s[7];
  assign soc2pad_port_signals.periph.gpio.gpio08_out = gpio_out_s[8];
  assign soc2pad_port_signals.periph.gpio.gpio09_out = gpio_out_s[9];
  assign soc2pad_port_signals.periph.gpio.gpio10_out = gpio_out_s[10];
  assign soc2pad_port_signals.periph.gpio.gpio11_out = gpio_out_s[11];
  assign soc2pad_port_signals.periph.gpio.gpio12_out = gpio_out_s[12];
  assign soc2pad_port_signals.periph.gpio.gpio13_out = gpio_out_s[13];
  assign soc2pad_port_signals.periph.gpio.gpio14_out = gpio_out_s[14];
  assign soc2pad_port_signals.periph.gpio.gpio15_out = gpio_out_s[15];
  // GPIO 16-31 remain unconnected
  assign soc2pad_port_signals.periph.gpio.gpio00_tx_en = gpio_tx_en_s[0];
  assign soc2pad_port_signals.periph.gpio.gpio01_tx_en = gpio_tx_en_s[1];
  assign soc2pad_port_signals.periph.gpio.gpio02_tx_en = gpio_tx_en_s[2];
  assign soc2pad_port_signals.periph.gpio.gpio03_tx_en = gpio_tx_en_s[3];
  assign soc2pad_port_signals.periph.gpio.gpio04_tx_en = gpio_tx_en_s[4];
  assign soc2pad_port_signals.periph.gpio.gpio05_tx_en = gpio_tx_en_s[5];
  assign soc2pad_port_signals.periph.gpio.gpio06_tx_en = gpio_tx_en_s[6];
  assign soc2pad_port_signals.periph.gpio.gpio07_tx_en = gpio_tx_en_s[7];
  assign soc2pad_port_signals.periph.gpio.gpio08_tx_en = gpio_tx_en_s[8];
  assign soc2pad_port_signals.periph.gpio.gpio09_tx_en = gpio_tx_en_s[9];
  assign soc2pad_port_signals.periph.gpio.gpio10_tx_en = gpio_tx_en_s[10];
  assign soc2pad_port_signals.periph.gpio.gpio11_tx_en = gpio_tx_en_s[11];
  assign soc2pad_port_signals.periph.gpio.gpio12_tx_en = gpio_tx_en_s[12];
  assign soc2pad_port_signals.periph.gpio.gpio13_tx_en = gpio_tx_en_s[13];
  assign soc2pad_port_signals.periph.gpio.gpio14_tx_en = gpio_tx_en_s[14];
  assign soc2pad_port_signals.periph.gpio.gpio15_tx_en = gpio_tx_en_s[15];
  // GPIO 16-31 remain unconnected
  assign gpio_in_s[0] = pad2soc_port_signals.periph.gpio.gpio00_in;
  assign gpio_in_s[1] = pad2soc_port_signals.periph.gpio.gpio01_in;
  assign gpio_in_s[2] = pad2soc_port_signals.periph.gpio.gpio02_in;
  assign gpio_in_s[3] = pad2soc_port_signals.periph.gpio.gpio03_in;
  assign gpio_in_s[4] = pad2soc_port_signals.periph.gpio.gpio04_in;
  assign gpio_in_s[5] = pad2soc_port_signals.periph.gpio.gpio05_in;
  assign gpio_in_s[6] = pad2soc_port_signals.periph.gpio.gpio06_in;
  assign gpio_in_s[7] = pad2soc_port_signals.periph.gpio.gpio07_in;
  assign gpio_in_s[8] = pad2soc_port_signals.periph.gpio.gpio08_in;
  assign gpio_in_s[9] = pad2soc_port_signals.periph.gpio.gpio09_in;
  assign gpio_in_s[10] = pad2soc_port_signals.periph.gpio.gpio10_in;
  assign gpio_in_s[11] = pad2soc_port_signals.periph.gpio.gpio11_in;
  assign gpio_in_s[12] = pad2soc_port_signals.periph.gpio.gpio12_in;
  assign gpio_in_s[13] = pad2soc_port_signals.periph.gpio.gpio13_in;
  assign gpio_in_s[14] = pad2soc_port_signals.periph.gpio.gpio14_in;
  assign gpio_in_s[15] = pad2soc_port_signals.periph.gpio.gpio15_in;
  // GPI0 16-31 remain unconnected
  assign gpio_in_s[31:16] = '0;


  // soc2pad
  // uart0_host -- carfield itf
  // qspi0_hostd
  logic                                        spih_sck_o_s;
  logic [ 1:0]                                 spih_csb_o_s;
  logic [ 3:0]                                 spih_sd_o_s;
  logic [ 3:0]                                 spih_sd_en_o_s;
  assign soc2pad_port_signals.periph.qspi0_host.csn0_o   = spih_csb_o_s[0]; // TO CHECK POLARITY OF THE SIGNAL
  assign soc2pad_port_signals.periph.qspi0_host.csn1_o   = spih_csb_o_s[1];
  assign soc2pad_port_signals.periph.qspi0_host.sck_o    = spih_sck_o_s;
  assign soc2pad_port_signals.periph.qspi0_host.sd0_o    = spih_sd_o_s[0];
  assign soc2pad_port_signals.periph.qspi0_host.sd0_oe   = spih_sd_en_o_s[0];
  assign soc2pad_port_signals.periph.qspi0_host.sd1_o    = spih_sd_o_s[1];
  assign soc2pad_port_signals.periph.qspi0_host.sd1_oe   = spih_sd_en_o_s[1];
  assign soc2pad_port_signals.periph.qspi0_host.sd2_o    = spih_sd_o_s[2];
  assign soc2pad_port_signals.periph.qspi0_host.sd2_oe   = spih_sd_en_o_s[2];
  assign soc2pad_port_signals.periph.qspi0_host.sd3_o    = spih_sd_o_s[3];
  assign soc2pad_port_signals.periph.qspi0_host.sd3_oe   = spih_sd_en_o_s[3];
  // i2c0_host -- carfield itf
  // qspi0_secd
  logic                                        spih_ot_sck_o_s;
  logic                                        spih_ot_csb_o_s;
  logic [ 3:0]                                 spih_ot_sd_o_s;
  logic [ 3:0]                                 spih_ot_sd_en_o_s;
  assign soc2pad_port_signals.periph.qspi0_sec_isln.csn0_o    = spih_ot_csb_o_s; // TO CHECK POLARITY OF THE SIGNAL
  assign soc2pad_port_signals.periph.qspi0_sec_isln.sck_o     = spih_ot_sck_o_s;
  assign soc2pad_port_signals.periph.qspi0_sec_isln.sd0_o     = spih_ot_sd_o_s[0];
  assign soc2pad_port_signals.periph.qspi0_sec_isln.sd0_oe    = spih_ot_sd_en_o_s[0];
  assign soc2pad_port_signals.periph.qspi0_sec_isln.sd1_o     = spih_ot_sd_o_s[1];
  assign soc2pad_port_signals.periph.qspi0_sec_isln.sd1_oe    = spih_ot_sd_en_o_s[1];
  assign soc2pad_port_signals.periph.qspi0_sec_isln.sd2_o     = spih_ot_sd_o_s[2];
  assign soc2pad_port_signals.periph.qspi0_sec_isln.sd2_oe    = spih_ot_sd_en_o_s[2];
  assign soc2pad_port_signals.periph.qspi0_sec_isln.sd3_o     = spih_ot_sd_o_s[3];
  assign soc2pad_port_signals.periph.qspi0_sec_isln.sd3_oe    = spih_ot_sd_en_o_s[3];
  // uart1_secd -- carfield itf
  // spi 1 --- not sure wheter to include another spi....
  // can0 -- carfield itf
  // ethernet
  logic  [ 3:0]                                eth_txd_o_s;
  assign soc2pad_port_signals.periph.ethernet.eth_txd0_i = eth_txd_o_s[0];
  assign soc2pad_port_signals.periph.ethernet.eth_txd1_i = eth_txd_o_s[1];
  assign soc2pad_port_signals.periph.ethernet.eth_txd2_i = eth_txd_o_s[2];
  assign soc2pad_port_signals.periph.ethernet.eth_txd3_i = eth_txd_o_s[3];

  // The following macro divides CLK_SIGNAL by 10x using a static integer clock
  // divider. To that end this macro also instantiates a reset synchronizer
  // since we need a synchronous reset for the divider.
  `define CLK_DIV_BY_10(CLK_NAME, CLK_SIGNAL)                         \
    logic CLK_NAME``_div_10x;                                         \
    logic CLK_NAME``_div_10x_rst_synced;                              \
    rstgen i_rstgen_``CLK_NAME``_10x_divider (                        \
      .clk_i(CLK_SIGNAL),                                             \
      .rst_ni(pwr_on_rst_n),                                          \
      .test_mode_i(1'b0),                                             \
      .rst_no(CLK_NAME``_div_10x_rst_synced),                         \
      .init_no()                                                      \
    );                                                                \
    clk_int_div_static #(.DIV_VALUE(10)) i_clk_div_10x_``CLK_NAME`` ( \
      .clk_i          ( CLK_SIGNAL   ),                               \
      .rst_ni         ( CLK_NAME``_div_10x_rst_synced ),              \
      .en_i           ( 1'b1         ),                               \
      .test_mode_en_i ( 1'b0         ),                               \
      .clk_o          ( CLK_NAME``_div_10x )                          \
    );
  
  // The following macro divides CLK_SIGNAL by 100x using a static integer clock
  // divider. To that end this macro also instantiates a reset synchronizer
  // since we need a synchronous reset for the divider.
  `define CLK_DIV_BY_100(CLK_NAME, CLK_SIGNAL)                          \
    logic CLK_NAME``_div_100x;                                          \
    logic CLK_NAME``_div_100x_rst_synced;                               \
    rstgen i_rstgen_``CLK_NAME``_100x_divider (                         \
      .clk_i(CLK_SIGNAL),                                               \
      .rst_ni(pwr_on_rst_n),                                            \
      .test_mode_i(1'b0),                                               \
      .rst_no(CLK_NAME``_div_100x_rst_synced),                          \
      .init_no()                                                        \
    );                                                                  \
    clk_int_div_static #(.DIV_VALUE(100)) i_clk_div_100x_``CLK_NAME`` ( \
      .clk_i          ( CLK_SIGNAL   ),                                 \
      .rst_ni         ( CLK_NAME``_div_100x_rst_synced ),               \
      .en_i           ( 1'b1         ),                                 \
      .test_mode_en_i ( 1'b0         ),                                 \
      .clk_o          ( CLK_NAME``_div_100x )                           \
    );                                                                  \

  // The clock is assigned to the soc2pad debug signals to be exposed
  // by the padframes debug pads.
  `define ASSIGN_CLK_DBG(CLK_NAME, DBG_SIGNAL_NAME)                                 \
    assign soc2pad_port_signals.periph.debug_signals.``DBG_SIGNAL_NAME = CLK_NAME;  \

  `define ASSIGN_CLK_DIV_BY_10_DBG(CLK_NAME, CLK_SIGNAL, DBG_SIGNAL_NAME) \
    `CLK_DIV_BY_10(CLK_NAME, CLK_SIGNAL)                                  \
    `ASSIGN_CLK_DBG(CLK_NAME``_div_10x, DBG_SIGNAL_NAME)                  \

  `define ASSIGN_CLK_DIV_BY_100_DBG(CLK_NAME, CLK_SIGNAL, DBG_SIGNAL_NAME) \
    `CLK_DIV_BY_100(CLK_NAME, CLK_SIGNAL)                                  \
    `ASSIGN_CLK_DBG(CLK_NAME``_div_100x, DBG_SIGNAL_NAME)                  \

  `ASSIGN_CLK_DIV_BY_10_DBG(host_clk, host_clk, host_clk)
  `ASSIGN_CLK_DIV_BY_10_DBG(host_pll, host_dbg_clk, host_pll)
  `ASSIGN_CLK_DIV_BY_10_DBG(alt_clk, alt_clk, alt_clk)
  `ASSIGN_CLK_DIV_BY_10_DBG(alt_pll, alt_dbg_clk, alt_pll)
  `ASSIGN_CLK_DIV_BY_10_DBG(periph_clk, periph_clk, periph_clk)
  `ASSIGN_CLK_DIV_BY_10_DBG(periph_pll, periph_dbg_clk, periph_pll)
  assign soc2pad_port_signals.periph.debug_signals.host_por_n = carfield_debug_signals.host_pwr_on_rst_n;
  `ASSIGN_CLK_DIV_BY_10_DBG(periph_domain_clk, carfield_debug_signals.domain_clk[0], periph_domain_clk)
  assign soc2pad_port_signals.periph.debug_signals.periph_domain_rstn = carfield_debug_signals.domain_rsts_n[0];
  `ASSIGN_CLK_DIV_BY_10_DBG(safety_domain_clk, carfield_debug_signals.domain_clk[1], safety_island_domain_clk)
  assign soc2pad_port_signals.periph.debug_signals.safety_island_domain_rstn = carfield_debug_signals.domain_rsts_n[1];
  `ASSIGN_CLK_DIV_BY_10_DBG(security_domain_clk, carfield_debug_signals.domain_clk[2], security_island_domain_clk)
  assign soc2pad_port_signals.periph.debug_signals.security_island_domain_rstn = carfield_debug_signals.domain_rsts_n[2];
  `ASSIGN_CLK_DIV_BY_10_DBG(pulp_cluster_domain_clk, carfield_debug_signals.domain_clk[3], pulp_cluster_domain_clk)
  assign soc2pad_port_signals.periph.debug_signals.pulp_cluster_domain_rstn = carfield_debug_signals.domain_rsts_n[3];
  `ASSIGN_CLK_DIV_BY_10_DBG(spatz_cluster_domain_clk, carfield_debug_signals.domain_clk[4], spatz_cluster_domain_clk)
  assign soc2pad_port_signals.periph.debug_signals.spatz_cluster_domain_rstn = carfield_debug_signals.domain_rsts_n[4];

  // External async register interface
  logic [1:0] ext_reg_async_slv_req_src_out;
  logic [1:0] ext_reg_async_slv_ack_src_in;
  carfield_reg_req_t     [1:0] ext_reg_async_slv_data_src_out;
  logic [1:0] ext_reg_async_slv_req_src_in;
  logic [1:0] ext_reg_async_slv_ack_src_out;
  carfield_reg_rsp_t     [1:0] ext_reg_async_slv_data_src_in;

  //////////////////////
  // Clock generation //
  //////////////////////

  logic       clk_fll_out;
  logic       clk_fll_e;
  logic       clk_fll_ref;
  logic       fll_lock;
  logic       fll_rst_n;
  logic       fll_pwd;
  logic       fll_test_mode;
  logic       fll_scan_e;
  logic       fll_scan_in;
  logic       fll_scan_out;
  logic       fll_scan_jtag_in;
  logic       fll_scan_jtag_out;

  // ref_clk
  assign ref_clk      = st_pad2soc_signals.periph.st_ref_clk;
  // power on reset
  assign pwr_on_rst_n = st_pad2soc_signals.periph.st_rst_n;

  assign host_clk    = clk_fll_out;
  assign periph_clk  = clk_fll_out;
  assign alt_clk     = clk_fll_out;
  assign clk_fll_e   = 1'b1;

  assign clk_fll_ref = ref_clk;

  assign fll_rst_n        = pwr_on_rst_n;
  assign fll_pwd          = 1'b0;
  assign fll_test_mode    = 1'b0;
  assign fll_scan_e       = 1'b0;
  assign fll_scan_in      = 1'b0;
  assign fll_scan_jtag_in = 1'b0;  

  `CLK_DIV_BY_100(rt_from_fll_clk, clk_fll_out)
  assign rt_clk = rt_from_fll_clk_div_100x; //TODO: check correctness

  assign soc2pad_port_signals.periph.jtag_pll2.tdo_o = '0;  //TODO
  assign soc2pad_port_signals.periph.jtag_pll1.tdo_o = '0;  //TODO
  assign soc2pad_port_signals.periph.jtag_pll0.tdo_o = '0;  //TODO

  assign clk_dbg_fll_out = clk_fll_out; //TODO: check correctness
  assign host_dbg_clk    = clk_dbg_fll_out; //TODO: check correctness
  assign periph_dbg_clk  = clk_dbg_fll_out; //TODO: check correctness
  assign alt_dbg_clk     = clk_dbg_fll_out; //TODO: check correctness

  // synchronize power-on rst with ref clock (required by padframe)
  rstgen i_ref_clk_rstgen (
    .clk_i  (ref_clk),
    .rst_ni (pwr_on_rst_n),
    .test_mode_i ( '0 ),
    .rst_no (ref_clk_pwr_on_rst_n),
    .init_no () // TODO: connect ?
  );

`ifdef GF12_FLL
  gf12_fll_wrap #(
    .reg_req_t ( carfield_reg_req_t ),
    .reg_rsp_t ( carfield_reg_rsp_t )
  ) i_fll_wrap (
    .ref_clk_cdc_i       ( ref_clk                           ),
    .pwr_on_rst_n_cdc_i  ( ref_clk_pwr_on_rst_n              ),
    .async_req_i         ( ext_reg_async_slv_req_src_out[0]  ),
    .async_ack_o         ( ext_reg_async_slv_ack_src_in[0]   ),
    .async_data_i        ( ext_reg_async_slv_data_src_out[0] ),
    .async_req_o         ( ext_reg_async_slv_req_src_in[0]   ),
    .async_ack_i         ( ext_reg_async_slv_ack_src_out[0]  ),
    .async_data_o        ( ext_reg_async_slv_data_src_in[0]  ),
    .clk_fll_out_o       ( clk_fll_out                       ),
    .clk_fll_e_i         ( clk_fll_e                         ),
    .clk_fll_ref_i       ( clk_fll_ref                       ),
    .fll_lock_o          ( fll_lock                          ),
    .fll_rst_n_i         ( fll_rst_n                         ),
    .fll_pwd_i           ( fll_pwd                           ),
    .fll_test_mode_i     ( fll_test_mode                     ),
    .fll_scan_e_i        ( fll_scan_e                        ),
    .fll_scan_in_i       ( fll_scan_in                       ),
    .fll_scan_out_o      ( fll_scan_out                      ),
    .fll_scan_jtag_in_i  ( fll_scan_jtag_in                  ),
    .fll_scan_jtag_out_o ( fll_scan_jtag_out                 )
  );
`else
  clk_rst_gen #(
    .ClkPeriod    ( 18.1ns ),
    .RstClkCycles ( 0 )
  ) i_clk_rst_sys (
    .clk_o  ( clk_fll_out ),
    .rst_no (  )
  );
`endif

  //////////////////
  // Carfield SoC //
  //////////////////

  carfield      #(
    .Cfg         ( Cfg         ),
    .HypNumPhys  ( HypNumPhys  ),
    .HypNumChips ( HypNumChips ),
    .reg_req_t   ( carfield_reg_req_t ),
    .reg_rsp_t   ( carfield_reg_rsp_t )
  ) i_dut (
    .host_clk_i                 ( host_clk                                         ),
    .periph_clk_i               ( periph_clk                                       ),
    .alt_clk_i                  ( alt_clk                                          ),
    .rt_clk_i                   ( rt_clk                                           ),
    .pwr_on_rst_ni              ( pwr_on_rst_n                                     ),
    .test_mode_i                ( '0                                               ),
    .boot_mode_i                ( bootmode_host_s[1:0]                             ),
    .jtag_tck_i                 ( st_pad2soc_signals.periph.st_jtag_host_tck       ),
    .jtag_trst_ni               ( st_pad2soc_signals.periph.st_jtag_host_trstn     ),
    .jtag_tms_i                 ( st_pad2soc_signals.periph.st_jtag_host_tms       ),
    .jtag_tdi_i                 ( st_pad2soc_signals.periph.st_jtag_host_tdi       ),
    .jtag_tdo_o                 ( st_soc2pad_signals.periph.st_jtag_host_tdo       ),
    .jtag_tdo_oe_o              (                                                  ),
    .jtag_ot_tck_i              ( st_pad2soc_signals.periph.st_jtag_secure_tck     ),
    .jtag_ot_trst_ni            ( st_pad2soc_signals.periph.st_jtag_secure_trstn   ),
    .jtag_ot_tms_i              ( st_pad2soc_signals.periph.st_jtag_secure_tms     ),
    .jtag_ot_tdi_i              ( st_pad2soc_signals.periph.st_jtag_secure_tdi     ),
    .jtag_ot_tdo_o              ( st_soc2pad_signals.periph.st_jtag_secure_tdo     ),
    .jtag_ot_tdo_oe_o           (                                                  ),
    .bootmode_ot_i              ( bootmode_sec_isln_s                              ),
    .jtag_safety_island_tck_i   ( st_pad2soc_signals.periph.st_jtag_safe_tck       ),
    .jtag_safety_island_trst_ni ( st_pad2soc_signals.periph.st_jtag_safe_trstn     ),
    .jtag_safety_island_tms_i   ( st_pad2soc_signals.periph.st_jtag_safe_tms       ),
    .jtag_safety_island_tdi_i   ( st_pad2soc_signals.periph.st_jtag_safe_tdi       ),
    .jtag_safety_island_tdo_o   ( st_soc2pad_signals.periph.st_jtag_safe_tdo       ),
    .bootmode_safe_isln_i       ( bootmode_safe_isln_s                             ),
    .secure_boot_i              ( secure_boot                                      ),
    .uart_tx_o                  ( soc2pad_port_signals.periph.uart0_host.tx_o      ),
    .uart_rx_i                  ( pad2soc_port_signals.periph.uart0_host.rx_i      ),
    .uart_ot_tx_o               ( soc2pad_port_signals.periph.uart1_sec_isln.tx_o  ),
    .uart_ot_rx_i               ( pad2soc_port_signals.periph.uart1_sec_isln.rx_i  ),
    .i2c_sda_o                  ( soc2pad_port_signals.periph.i2c0_host.sda_o      ),
    .i2c_sda_i                  ( pad2soc_port_signals.periph.i2c0_host.sda_i      ),
    .i2c_sda_en_o               ( soc2pad_port_signals.periph.i2c0_host.sda_oe     ),
    .i2c_scl_o                  ( soc2pad_port_signals.periph.i2c0_host.scl_o      ),
    .i2c_scl_i                  ( pad2soc_port_signals.periph.i2c0_host.scl_i      ),
    .i2c_scl_en_o               ( soc2pad_port_signals.periph.i2c0_host.scl_oe     ),
    .spih_sck_o                 ( spih_sck_o_s                                     ),
    .spih_sck_en_o              (                                                  ),
    .spih_csb_o                 ( spih_csb_o_s                                     ),
    .spih_csb_en_o              (                                                  ),
    .spih_sd_o                  ( spih_sd_o_s                                      ),
    .spih_sd_en_o               ( spih_sd_en_o_s                                   ),
    .spih_sd_i                  ( spih_sd_i_s                                      ),
    // spi secd: TODO: check
    .spih_ot_sck_o              ( spih_ot_sck_o_s                                  ),
    .spih_ot_sck_en_o           (                                                  ),
    .spih_ot_csb_o              ( spih_ot_csb_o_s                                  ),
    .spih_ot_csb_en_o           (                                                  ),
    .spih_ot_sd_o               ( spih_ot_sd_o_s                                   ),
    .spih_ot_sd_en_o            ( spih_ot_sd_en_o_s                                ),
    .spih_ot_sd_i               ( spih_ot_sd_i_s                                   ),
    // ethernet
    .eth_rxck_i                 ( pad2soc_port_signals.periph.ethernet.eth_rxck_o  ),
    .eth_rxctl_i                ( pad2soc_port_signals.periph.ethernet.eth_rxctl_o ),
    .eth_rxd_i                  ( eth_rxd_i_s                                      ),
    .eth_md_i                   ( pad2soc_port_signals.periph.ethernet.eth_md_o    ),
    .eth_txck_o                 ( soc2pad_port_signals.periph.ethernet.eth_txck_i  ),
    .eth_txctl_o                ( soc2pad_port_signals.periph.ethernet.eth_txctl_i ),
    .eth_txd_o                  ( eth_txd_o_s                                      ),
    .eth_md_o                   ( soc2pad_port_signals.periph.ethernet.eth_md_i    ),
    .eth_md_oe                  ( soc2pad_port_signals.periph.ethernet.eth_md_oe   ),
    .eth_mdc_o                  ( soc2pad_port_signals.periph.ethernet.eth_mdc_i   ),
    .eth_rst_n_o                ( soc2pad_port_signals.periph.ethernet.eth_rstn_i  ),
    // can bus
    .can_rx_i                   ( pad2soc_port_signals.periph.can0.rx_o            ),
    .can_tx_o                   ( soc2pad_port_signals.periph.can0.tx_i            ),
    // gpios
    .gpio_i                     ( gpio_in_s                                        ),
    .gpio_o                     ( gpio_out_s                                       ),
    .gpio_en_o                  ( gpio_tx_en_s                                     ),
    // serial link
    .slink_rcv_clk_i            ( st_pad2soc_signals.periph.sl_clk_in_o            ),
    .slink_rcv_clk_o            ( st_soc2pad_signals.periph.sl_clk_out_i           ),
    .slink_i                    ( serial_link_data_in_s                            ),
    .slink_o                    ( serial_link_data_out_s                           ),
    // hyperbus
    .hyper_cs_no                ( hyperbus_cs_no_s                                 ),
    .hyper_ck_o                 ( hyperbus_clk_o_s                                 ),
    .hyper_ck_no                ( hyperbus_clk_no_s                                ),
    .hyper_rwds_o               ( hyperbus_rwds_out_s                              ),
    .hyper_rwds_i               ( hyperbus_rwds_in_s                               ),
    .hyper_rwds_oe_o            ( hyperbus_rwds_oe_s                               ),
    .hyper_dq_i                 ( hyperbus_data_in_s                               ),
    .hyper_dq_o                 ( hyperbus_data_out_s                              ),
    .hyper_dq_oe_o              ( hyperbus_data_oe_s                               ),
    .hyper_reset_no             ( hyperbus_rst_no_s                                ),
    .ext_reg_async_slv_req_o    ( ext_reg_async_slv_req_src_out                    ),
    .ext_reg_async_slv_ack_i    ( ext_reg_async_slv_ack_src_in                     ),
    .ext_reg_async_slv_data_o   ( ext_reg_async_slv_data_src_out                   ),
    .ext_reg_async_slv_req_i    ( ext_reg_async_slv_req_src_in                     ),
    .ext_reg_async_slv_ack_o    ( ext_reg_async_slv_ack_src_out                    ),
    .ext_reg_async_slv_data_i   ( ext_reg_async_slv_data_src_in                    ),
    // Debug Signals
    .debug_signals_o            ( carfield_debug_signals                           )
  );

  //////////////
  // Padframe //
  //////////////

  reg_cdc_dst #(
     .CDC_KIND ( "cdc_4phase" ),
     .req_t     ( carfield_reg_req_t     ),
     .rsp_t     ( carfield_reg_rsp_t     )
  ) i_reg_cdc_dst_padframe (
      .dst_clk_i   ( ref_clk ),
      .dst_rst_ni  ( ref_clk_pwr_on_rst_n ),
      .dst_req_o   ( padframe_refclk_cfg_reg_req ),
      .dst_rsp_i   ( padframe_refclk_cfg_reg_rsp ),

      .async_req_i ( ext_reg_async_slv_req_src_out[1]  ),
      .async_ack_o ( ext_reg_async_slv_ack_src_in[1] ),
      .async_data_i( ext_reg_async_slv_data_src_out[1] ),

      .async_req_o ( ext_reg_async_slv_req_src_in[1]  ),
      .async_ack_i ( ext_reg_async_slv_ack_src_out[1]   ),
      .async_data_o( ext_reg_async_slv_data_src_in[1] )
  );

  carfield_padframe_behav #(
    .req_t  ( carfield_reg_req_t         ),
    .resp_t ( carfield_reg_rsp_t         )
  ) i_carfield_padframe (
    .clk_i  ( ref_clk      ),
    .rst_ni ( ref_clk_pwr_on_rst_n ),
    .static_connection_signals_pad2soc ( st_pad2soc_signals ),
    .static_connection_signals_soc2pad ( st_soc2pad_signals ),
    .port_signals_pad2soc ( pad2soc_port_signals ),
    .port_signals_soc2pad ( soc2pad_port_signals),
    // Landing Pads
    .pad_periph_reset_n_pad ,
    .pad_periph_bypass_fll_pad ,
    .pad_periph_ref_clk_pad ,
    .pad_periph_ext_clk_pad ,
    .pad_periph_secure_boot_pad,
    .pad_periph_jtag_pll_00_pad,
    .pad_periph_jtag_pll_01_pad,
    .pad_periph_jtag_pll_02_pad,
    .pad_periph_jtag_pll_03_pad,
    .pad_periph_jtag_pll_04_pad,
    .pad_periph_bootmode_host_0_pad ,
    .pad_periph_bootmode_host_1_pad ,
    .pad_periph_bootmode_host_2_pad ,
    .pad_periph_jtag_host_tck_pad ,
    .pad_periph_jtag_host_tms_pad ,
    .pad_periph_jtag_host_tdi_pad ,
    .pad_periph_jtag_host_trstn_pad ,
    .pad_periph_jtag_host_tdo_pad ,
    .pad_periph_host_00_pad ,
    .pad_periph_host_01_pad ,
    .pad_periph_host_02_pad ,
    .pad_periph_host_03_pad ,
    .pad_periph_host_04_pad ,
    .pad_periph_host_05_pad ,
    .pad_periph_host_06_pad ,
    .pad_periph_host_07_pad ,
    .pad_periph_host_08_pad ,
    .pad_periph_host_09_pad ,
    .pad_periph_host_10_pad ,
    .pad_periph_bootmode_safe_0_pad ,
    .pad_periph_bootmode_safe_1_pad ,
    .pad_periph_jtag_safe_tck_pad ,
    .pad_periph_jtag_safe_tms_pad ,
    .pad_periph_jtag_safe_tdi_pad ,
    .pad_periph_jtag_safe_trstn_pad ,
    .pad_periph_jtag_safe_tdo_pad ,
    .pad_periph_bootmode_secure_0_pad ,
    .pad_periph_bootmode_secure_1_pad ,
    .pad_periph_jtag_secure_tck_pad ,
    .pad_periph_jtag_secure_tms_pad ,
    .pad_periph_jtag_secure_tdi_pad ,
    .pad_periph_jtag_secure_trstn_pad ,
    .pad_periph_jtag_secure_tdo_pad ,
    .pad_periph_secure_00_pad ,
    .pad_periph_secure_01_pad ,
    .pad_periph_secure_02_pad ,
    .pad_periph_secure_03_pad ,
    .pad_periph_secure_04_pad ,
    .pad_periph_secure_05_pad ,
    .pad_periph_secure_06_pad ,
    .pad_periph_secure_07_pad ,
    .pad_periph_gpio_00_pad ,
    .pad_periph_gpio_01_pad ,
    .pad_periph_gpio_02_pad ,
    .pad_periph_gpio_03_pad ,
    .pad_periph_gpio_04_pad ,
    .pad_periph_gpio_05_pad ,
    .pad_periph_gpio_06_pad ,
    .pad_periph_gpio_07_pad ,
    .pad_periph_gpio_08_pad ,
    .pad_periph_gpio_09_pad ,
    .pad_periph_gpio_10_pad ,
    .pad_periph_gpio_11_pad ,
    .pad_periph_gpio_12_pad ,
    .pad_periph_gpio_13_pad ,
    .pad_periph_gpio_14_pad ,
    .pad_periph_gpio_15_pad ,
    .pad_periph_periph_00_pad ,
    .pad_periph_periph_01_pad ,
    .pad_periph_periph_02_pad ,
    .pad_periph_periph_03_pad ,
    .pad_periph_periph_04_pad ,
    .pad_periph_periph_05_pad ,
    .pad_periph_periph_06_pad ,
    .pad_periph_periph_07_pad ,
    .pad_periph_periph_08_pad ,
    .pad_periph_periph_09_pad ,
    .pad_periph_periph_10_pad ,
    .pad_periph_periph_11_pad ,
    .pad_periph_periph_12_pad ,
    .pad_periph_periph_13_pad ,
    .pad_periph_periph_14_pad ,
    .pad_periph_periph_15_pad ,
    .pad_periph_periph_16_pad ,
    .pad_periph_hyper0_csn0_pad ,
    .pad_periph_hyper0_csn1_pad ,
    .pad_periph_hyper0_ck_pad ,
    .pad_periph_hyper0_ckn_pad ,
    .pad_periph_hyper0_rwds_pad ,
    .pad_periph_hyper0_rstn_pad ,
    .pad_periph_hyper0_data0_pad ,
    .pad_periph_hyper0_data1_pad ,
    .pad_periph_hyper0_data2_pad ,
    .pad_periph_hyper0_data3_pad ,
    .pad_periph_hyper0_data4_pad ,
    .pad_periph_hyper0_data5_pad ,
    .pad_periph_hyper0_data6_pad ,
    .pad_periph_hyper0_data7_pad ,
    .pad_periph_hyper1_csn0_pad ,
    .pad_periph_hyper1_csn1_pad ,
    .pad_periph_hyper1_ck_pad ,
    .pad_periph_hyper1_ckn_pad ,
    .pad_periph_hyper1_rwds_pad ,
    .pad_periph_hyper1_rstn_pad ,
    .pad_periph_hyper1_data0_pad ,
    .pad_periph_hyper1_data1_pad ,
    .pad_periph_hyper1_data2_pad ,
    .pad_periph_hyper1_data3_pad ,
    .pad_periph_hyper1_data4_pad ,
    .pad_periph_hyper1_data5_pad ,
    .pad_periph_hyper1_data6_pad ,
    .pad_periph_hyper1_data7_pad ,
    .pad_periph_sl_clk_in_pad ,
    .pad_periph_sl_data_in0_pad ,
    .pad_periph_sl_data_in1_pad ,
    .pad_periph_sl_data_in2_pad ,
    .pad_periph_sl_data_in3_pad ,
    .pad_periph_sl_data_in4_pad ,
    .pad_periph_sl_data_in5_pad ,
    .pad_periph_sl_data_in6_pad ,
    .pad_periph_sl_data_in7_pad ,
    .pad_periph_sl_clk_out_pad ,
    .pad_periph_sl_data_out0_pad ,
    .pad_periph_sl_data_out1_pad ,
    .pad_periph_sl_data_out2_pad ,
    .pad_periph_sl_data_out3_pad ,
    .pad_periph_sl_data_out4_pad ,
    .pad_periph_sl_data_out5_pad ,
    .pad_periph_sl_data_out6_pad ,
    .pad_periph_sl_data_out7_pad ,
    .pad_periph_debug_out0_pad,
    .pad_periph_debug_out1_pad,
    .pad_periph_debug_out2_pad,
    .pad_periph_debug_out3_pad,
    .pad_periph_debug_out4_pad,
    // Config Interface
    .config_req_i ( padframe_refclk_cfg_reg_req ),
    .config_rsp_o ( padframe_refclk_cfg_reg_rsp )
  );

endmodule
