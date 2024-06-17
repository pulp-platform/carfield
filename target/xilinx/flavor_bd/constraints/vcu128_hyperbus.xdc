# Copyright 2024 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {design_1_i/carfield_xilinx_ip_0/inst/i_carfield_xilinx/gen_hyper_phy[0].padinst_hyper_rwds0/iobuf_i/O}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets gen_hyper_phy[0].padinst_hyper_rwds0/iobuf_i/O]

############
# Hyperbus #
############

#set_property PACKAGE_PIN A16      [get_ports "pad_hyper_csn[0]"] ;# (FMCP_HSPC_LA22_N) Bank  71 VCCO - VADJ     - IO_L24N_T3U_N11_71
#set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_csn[0]"] ;# (FMCP_HSPC_LA22_N) Bank  71 VCCO - VADJ     - IO_L24N_T3U_N11_71
#set_property PACKAGE_PIN A20      [get_ports "pad_hyper_dq[7]"] ;# (FMCP_HSPC_LA20_N) Bank  71 VCCO - VADJ     - IO_L22N_T3U_N7_DBC_AD0N_71
#set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_dq[7]"] ;# (FMCP_HSPC_LA20_N) Bank  71 VCCO - VADJ     - IO_L22N_T3U_N7_DBC_AD0N_71
#set_property PACKAGE_PIN A21      [get_ports "pad_hyper_dq[6]"] ;# (FMCP_HSPC_LA20_P) Bank  71 VCCO - VADJ     - IO_L22P_T3U_N6_DBC_AD0P_71
#set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_dq[6]"] ;# (FMCP_HSPC_LA20_P) Bank  71 VCCO - VADJ     - IO_L22P_T3U_N6_DBC_AD0P_71
#set_property PACKAGE_PIN D20      [get_ports "pad_hyper_reset[0]"] ;# (FMCP_HSPC_LA25_P) Bank  71 VCCO - VADJ     - IO_L18P_T2U_N10_AD2P_71
#set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_reset[0]"] ;# (FMCP_HSPC_LA25_P) Bank  71 VCCO - VADJ     - IO_L18P_T2U_N10_AD2P_71
set_property PACKAGE_PIN A24 [get_ports {pad_hyper_csn[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pad_hyper_csn[1]}]
set_property PACKAGE_PIN A25 [get_ports {pad_hyper_csn[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pad_hyper_csn[0]}]
set_property PACKAGE_PIN C23 [get_ports pad_hyper_rwds]
set_property IOSTANDARD LVCMOS18 [get_ports pad_hyper_rwds]
set_property PACKAGE_PIN D26 [get_ports {pad_hyper_dq[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pad_hyper_dq[2]}]
set_property PACKAGE_PIN A23 [get_ports {pad_hyper_dq[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pad_hyper_dq[3]}]
set_property PACKAGE_PIN B23 [get_ports {pad_hyper_dq[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pad_hyper_dq[0]}]
set_property PACKAGE_PIN E26 [get_ports {pad_hyper_dq[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pad_hyper_dq[4]}]
set_property PACKAGE_PIN D22 [get_ports {pad_hyper_dq[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pad_hyper_dq[7]}]
set_property PACKAGE_PIN E22 [get_ports {pad_hyper_dq[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pad_hyper_dq[1]}]
set_property PACKAGE_PIN F25 [get_ports pad_hyper_ckn]
set_property IOSTANDARD LVCMOS18 [get_ports pad_hyper_ckn]
set_property PACKAGE_PIN F26 [get_ports pad_hyper_ck]
set_property IOSTANDARD LVCMOS18 [get_ports pad_hyper_ck]
set_property PACKAGE_PIN G27 [get_ports {pad_hyper_dq[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pad_hyper_dq[5]}]
set_property PACKAGE_PIN H27 [get_ports {pad_hyper_dq[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pad_hyper_dq[6]}]
#set_property PACKAGE_PIN L23      [get_ports "pad_hyper_csn[1]"] ;# (FMCP_HSPC_LA02_P) Bank  72 VCCO - VADJ     - IO_L4P_T0U_N6_DBC_AD7P_72
#set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_csn[1]"] ;# (FMCP_HSPC_LA02_P) Bank  72 VCCO - VADJ     - IO_L4P_T0U_N6_DBC_AD7P_72
#set_property PACKAGE_PIN K23      [get_ports "pad_hyper_dq[5]"] ;# (FMCP_HSPC_LA16_N) Bank  72 VCCO - VADJ     - IO_L3N_T0L_N5_AD15N_72
#set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_dq[5]"] ;# (FMCP_HSPC_LA16_N) Bank  72 VCCO - VADJ     - IO_L3N_T0L_N5_AD15N_72
#set_property PACKAGE_PIN K24      [get_ports "pad_hyper_dq[4]"] ;# (FMCP_HSPC_LA16_P) Bank  72 VCCO - VADJ     - IO_L3P_T0L_N4_AD15P_72
#set_property IOSTANDARD  LVCMOS18     [get_ports "pad_hyper_dq[4]"] ;# (FMCP_HSPC_LA16_P) Bank  72 VCCO - VADJ     - IO_L3P_T0L_N4_AD15P_72

