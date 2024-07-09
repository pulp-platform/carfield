# Copyright 2024 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

# VIOs are asynchronous
set_false_path -through [get_pins -of_objects [get_cells design_1_i/vio_0] -filter {NAME =~ *probe*}]

# Create system clocks
create_clock -period 4 -name sys_clk [get_pins design_1_i/util_ds_buf_0/IBUF_OUT]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins design_1_i/util_ds_buf_0/IBUF_OUT]
create_clock -period 10 -name pcie_clk [get_nets design_1_i/util_ds_buf_1/U0/IBUF_OUT[0]]
create_clock -period 10 -name pcie_clk_div [get_nets design_1_i/util_ds_buf_1/U0/IBUF_DS_ODIV2[0]]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets design_1_i/util_ds_buf_1/U0/IBUF_DS_ODIV2[0]]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets design_1_i/util_ds_buf_1/U0/IBUF_OUT[0]]

# PCIe clock LOC
#set_property LOC [get_package_pins -of_objects [get_bels [get_sites -filter {NAME =~ *COMMON*} -of_objects [get_iobanks -of_objects [get_sites GTYE4_CHANNEL_X1Y15]]]/REFCLK0P]] [get_ports pcie_refclk_clk_p[0]]
#set_property LOC [get_package_pins -of_objects [get_bels [get_sites -filter {NAME =~ *COMMON*} -of_objects [get_iobanks -of_objects [get_sites GTYE4_CHANNEL_X1Y15]]]/REFCLK0N]] [get_ports pcie_refclk_clk_n[0]]

set_property PACKAGE_PIN AW25     [get_ports "uart_rx_i"] ;# Bank  64 VCCO - VCC1V8_FPGA - IO_L9P_T1L_N4_AD12P_64
set_property IOSTANDARD  LVCMOS18 [get_ports "uart_rx_i"] ;# Bank  64 VCCO - VCC1V8_FPGA - IO_L9P_T1L_N4_AD12P_64
set_property PACKAGE_PIN BB21     [get_ports "uart_tx_o"] ;# Bank  64 VCCO - VCC1V8_FPGA - IO_L8N_T1L_N3_AD5N_64
set_property IOSTANDARD  LVCMOS18 [get_ports "uart_tx_o"] ;# Bank  64 VCCO - VCC1V8_FPGA - IO_L8N_T1L_N3_AD5N_64
#set_property PACKAGE_PIN BB22     [get_ports "uart_rts_o"] ;
#set_property IOSTANDARD  LVCMOS18 [get_ports "uart_rts_o"] ;
#set_property PACKAGE_PIN AY25     [get_ports "uart_cts_i"] ;
#set_property IOSTANDARD  LVCMOS18 [get_ports "uart_cts_i"] ;

set_property PACKAGE_PIN L19      [get_ports cpu_reset] ;# Bank  73 VCCO - VCC1V2_FPGA - IO_T1U_N12_73
set_property IOSTANDARD  LVCMOS12 [get_ports cpu_reset] ;# Bank  73 VCCO - VCC1V2_FPGA - IO_T1U_N12_73

set_property BOARD_PART_PIN default_250mhz_clk1_n [get_ports default_250mhz_clk1_clk_n]
set_property BOARD_PART_PIN default_250mhz_clk1_p [get_ports default_250mhz_clk1_clk_p]

set_property PACKAGE_PIN D12      [get_ports default_250mhz_clk1_clk_n]    ; # Bank  71 VCCO - VCC1V2_FPGA - IO_L13N_T2L_N1_GC_QBC_71
set_property IOSTANDARD  DIFF_SSTL12 [get_ports default_250mhz_clk1_clk_n] ; # Bank  71 VCCO - VCC1V2_FPGA - IO_L13N_T2L_N1_GC_QBC_71
set_property PACKAGE_PIN E12      [get_ports default_250mhz_clk1_clk_p]    ; # Bank  71 VCCO - VCC1V2_FPGA - IO_L13P_T2L_N0_GC_QBC_71
set_property IOSTANDARD  DIFF_SSTL12 [get_ports default_250mhz_clk1_clk_p] ; # Bank  71 VCCO - VCC1V2_FPGA - IO_L13P_T2L_N0_GC_QBC_71
