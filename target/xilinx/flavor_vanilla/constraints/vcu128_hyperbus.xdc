# Copyright 2020 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

set_property CLOCK_DEDICATED_ROUTE FALSE [get_ports pad_hyper_rwds[0]]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets gen_hyper_phy[0].padinst_hyper_rwds0/iobuf_i/O]


set period_hyperbus 100

create_clock -period [expr $period_hyperbus] -name hyper_rwds_clk [get_ports pad_hyper_rwds[0]]

create_generated_clock -name hyper_clk_phy -source [get_pins i_carfield/i_hyperbus_wrap/i_hyperbus/CLK] -divide_by 2 [get_pins i_carfield/i_hyperbus_wrap/i_hyperbus/clock_generator.ddr_clk/r_clk0_o_reg/Q]
create_generated_clock -name hyper_clk_phy_90 -source [get_pins i_carfield/i_hyperbus_wrap/i_hyperbus/CLK] -edges {2 4 6} [get_pins i_carfield/i_hyperbus_wrap/i_hyperbus/clock_generator.ddr_clk/r_clk90_o_reg/Q]

set clk_rwds_delayed_pin [get_pins -of_objects [get_cells i_carfield/i_hyperbus_wrap/i_hyperbus/i_phy/i_phy/i_trx/i_delay_rx_rwds_90/i_delay] -filter {DIRECTION =~ OUT}]
set clk_rwds_delayed_inv_pin [get_pins i_carfield/i_hyperbus_wrap/i_hyperbus/i_phy/i_phy/i_trx/i_rx_rwds_cdc_fifo/CLK]

set clk_rx_shift [expr $period_hyperbus/10]
set rwds_input_delay [expr $period_hyperbus/4]
create_generated_clock -name hyper_clk_rwds_delayed0 -edges {1 2 3} -edge_shift "$clk_rx_shift $clk_rx_shift $clk_rx_shift" \
  -source [get_ports pad_hyper_rwds[0]] $clk_rwds_delayed_pin
set_clock_latency [expr ${rwds_input_delay}] hyper_clk_rwds_delayed0

create_generated_clock -name hyper_clk_rwds_sample0 -invert -divide_by 1 -source $clk_rwds_delayed_pin $clk_rwds_delayed_inv_pin
set_clock_latency [expr ${rwds_input_delay}] hyper_clk_rwds_sample0

set_false_path -from [get_ports pad_hyper_rwds[0]] -to [get_ports pad_hyper_rwds[0]]
# these are for clock domain crossing
set_false_path -from [get_clocks hyper_rwds_clk] -to [get_clocks hyper_clk_phy]
set_false_path -from [get_clocks hyper_clk_phy] -to [get_clocks hyper_rwds_clk]
set_false_path -from [get_clocks hyper_clk_phy_90] -to [get_clocks hyper_clk_phy]
set_false_path -from [get_clocks hyper_clk_phy_90] -to [get_clocks hyper_rwds_clk]

# Todo correct build correct input / output constraints

set hyper_output_ports [get_ports pad_hyper_dq*]
set_output_delay [expr $period_hyperbus/2 ] -clock hyper_clk_phy [get_ports $hyper_output_ports] -max
set_output_delay [expr $period_hyperbus/-2] -clock hyper_clk_phy [get_ports $hyper_output_ports] -min -add_delay
set_output_delay [expr $period_hyperbus/2 ] -clock hyper_clk_phy [get_ports $hyper_output_ports] -max -clock_fall -add_delay
set_output_delay [expr $period_hyperbus/-2] -clock hyper_clk_phy [get_ports $hyper_output_ports] -min -clock_fall -add_delay

set hyper_input_ports [get_ports -regexp pad_hyper_dq.*]
set_input_delay -max [expr $period_hyperbus/2] -clock hyper_clk_phy [get_ports $hyper_input_ports]
set_input_delay -min [expr $period_hyperbus/2] -clock hyper_clk_phy [get_ports $hyper_input_ports] -add_delay
set_input_delay -max [expr $period_hyperbus/2] -clock hyper_clk_phy [get_ports $hyper_input_ports] -add_delay -clock_fall
set_input_delay -min [expr $period_hyperbus/2] -clock hyper_clk_phy [get_ports $hyper_input_ports] -add_delay -clock_fall

#set_property PACKAGE_PIN A16      [get_ports "pad_hyper_csn[0]"] ;# (FMCP_HSPC_LA22_N) Bank  71 VCCO - VADJ     - IO_L24N_T3U_N11_71
#set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_csn[0]"] ;# (FMCP_HSPC_LA22_N) Bank  71 VCCO - VADJ     - IO_L24N_T3U_N11_71
#set_property PACKAGE_PIN A20      [get_ports "pad_hyper_dq[7]"] ;# (FMCP_HSPC_LA20_N) Bank  71 VCCO - VADJ     - IO_L22N_T3U_N7_DBC_AD0N_71
#set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_dq[7]"] ;# (FMCP_HSPC_LA20_N) Bank  71 VCCO - VADJ     - IO_L22N_T3U_N7_DBC_AD0N_71
#set_property PACKAGE_PIN A21      [get_ports "pad_hyper_dq[6]"] ;# (FMCP_HSPC_LA20_P) Bank  71 VCCO - VADJ     - IO_L22P_T3U_N6_DBC_AD0P_71
#set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_dq[6]"] ;# (FMCP_HSPC_LA20_P) Bank  71 VCCO - VADJ     - IO_L22P_T3U_N6_DBC_AD0P_71
#set_property PACKAGE_PIN D20      [get_ports "pad_hyper_reset[0]"] ;# (FMCP_HSPC_LA25_P) Bank  71 VCCO - VADJ     - IO_L18P_T2U_N10_AD2P_71
#set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_reset[0]"] ;# (FMCP_HSPC_LA25_P) Bank  71 VCCO - VADJ     - IO_L18P_T2U_N10_AD2P_71
set_property PACKAGE_PIN A24             [get_ports "pad_hyper_csn[0][1]"] ;# (FMCP_HSPC_LA13_N) Bank  72 VCCO - VADJ     - IO_L24N_T3U_N11_72
set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_csn[0][1]"] ;# (FMCP_HSPC_LA13_N) Bank  72 VCCO - VADJ     - IO_L24N_T3U_N11_72
set_property PACKAGE_PIN A25      [get_ports "pad_hyper_csn[0][0]"] ;# (FMCP_HSPC_LA13_P) Bank  72 VCCO - VADJ     - IO_L24P_T3U_N10_72
set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_csn[0][0]"] ;# (FMCP_HSPC_LA13_P) Bank  72 VCCO - VADJ     - IO_L24P_T3U_N10_72
set_property PACKAGE_PIN C23      [get_ports "pad_hyper_rwds[0]"] ;# (FMCP_HSPC_LA14_P) Bank  72 VCCO - VADJ     - IO_L19P_T3L_N0_DBC_AD9P_72
set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_rwds[0]"] ;# (FMCP_HSPC_LA14_P) Bank  72 VCCO - VADJ     - IO_L19P_T3L_N0_DBC_AD9P_72
set_property PACKAGE_PIN D26      [get_ports "pad_hyper_dq[0][2] "] ;# (FMCP_HSPC_LA09_N) Bank  72 VCCO - VADJ     - IO_L17N_T2U_N9_AD10N_72
set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_dq[0][2] "] ;# (FMCP_HSPC_LA09_N) Bank  72 VCCO - VADJ     - IO_L17N_T2U_N9_AD10N_72
set_property PACKAGE_PIN A23      [get_ports pad_hyper_dq[0][3]] ;# (FMCP_HSPC_LA10_N)
set_property IOSTANDARD LVCMOS18  [get_ports pad_hyper_dq[0][3]] ;# (FMCP_HSPC_LA10_N)
set_property PACKAGE_PIN B23      [get_ports pad_hyper_dq[0][0]] ;# (FMCP_HSPC_LA10_P)
set_property IOSTANDARD LVCMOS18  [get_ports pad_hyper_dq[0][0]] ;# (FMCP_HSPC_LA10_P)
set_property PACKAGE_PIN E26      [get_ports "pad_hyper_dq[0][4]"] ;# (FMCP_HSPC_LA09_P) Bank  72 VCCO - VADJ     - IO_L17P_T2U_N8_AD10P_72
set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_dq[0][4]"] ;# (FMCP_HSPC_LA09_P) Bank  72 VCCO - VADJ     - IO_L17P_T2U_N8_AD10P_72
set_property PACKAGE_PIN D22      [get_ports "pad_hyper_dq[0][7]"] ;# (FMCP_HSPC_LA06_N) Bank  72 VCCO - VADJ     - IO_L15N_T2L_N5_AD11N_72
set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_dq[0][7]"] ;# (FMCP_HSPC_LA06_N) Bank  72 VCCO - VADJ     - IO_L15N_T2L_N5_AD11N_72
set_property PACKAGE_PIN E22      [get_ports "pad_hyper_dq[0][1]"] ;# (FMCP_HSPC_LA06_P) Bank  72 VCCO - VADJ     - IO_L15P_T2L_N4_AD11P_72
set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_dq[0][1]"] ;# (FMCP_HSPC_LA06_P) Bank  72 VCCO - VADJ     - IO_L15P_T2L_N4_AD11P_72
set_property PACKAGE_PIN F25      [get_ports "pad_hyper_ckn[0]"] ;# (FMCP_HSPC_LA01_CC_N)  Bank  72 VCCO - VADJ     - IO_L14N_T2L_N3_GC_72
set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_ckn[0]"] ;# (FMCP_HSPC_LA01_CC_N)  Bank  72 VCCO - VADJ     - IO_L14N_T2L_N3_GC_72
set_property PACKAGE_PIN F26      [get_ports "pad_hyper_ck[0]"] ;# (FMCP_HSPC_LA01_CC_P) Bank  72 VCCO - VADJ     - IO_L14P_T2L_N2_GC_72
set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_ck[0]"] ;# (FMCP_HSPC_LA01_CC_P) Bank  72 VCCO - VADJ     - IO_L14P_T2L_N2_GC_72
set_property PACKAGE_PIN G27      [get_ports "pad_hyper_dq[0][5]"] ;# (FMCP_HSPC_LA05_N) Bank  72 VCCO - VADJ     - IO_L9N_T1L_N5_AD12N_72
set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_dq[0][5]"] ;# (FMCP_HSPC_LA05_N) Bank  72 VCCO - VADJ     - IO_L9N_T1L_N5_AD12N_72
set_property PACKAGE_PIN H27      [get_ports "pad_hyper_dq[0][6]"] ;# (FMCP_HSPC_LA05_P) Bank  72 VCCO - VADJ     - IO_L9P_T1L_N4_AD12P_72
set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_dq[0][6]"] ;# (FMCP_HSPC_LA05_P) Bank  72 VCCO - VADJ     - IO_L9P_T1L_N4_AD12P_72
#set_property PACKAGE_PIN L23      [get_ports "pad_hyper_csn[1]"] ;# (FMCP_HSPC_LA02_P) Bank  72 VCCO - VADJ     - IO_L4P_T0U_N6_DBC_AD7P_72
#set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_csn[1]"] ;# (FMCP_HSPC_LA02_P) Bank  72 VCCO - VADJ     - IO_L4P_T0U_N6_DBC_AD7P_72
#set_property PACKAGE_PIN K23      [get_ports "pad_hyper_dq[5]"] ;# (FMCP_HSPC_LA16_N) Bank  72 VCCO - VADJ     - IO_L3N_T0L_N5_AD15N_72
#set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_dq[5]"] ;# (FMCP_HSPC_LA16_N) Bank  72 VCCO - VADJ     - IO_L3N_T0L_N5_AD15N_72
#set_property PACKAGE_PIN K24      [get_ports "pad_hyper_dq[4]"] ;# (FMCP_HSPC_LA16_P) Bank  72 VCCO - VADJ     - IO_L3P_T0L_N4_AD15P_72
#set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_dq[4]"] ;# (FMCP_HSPC_LA16_P) Bank  72 VCCO - VADJ     - IO_L3P_T0L_N4_AD15P_72
