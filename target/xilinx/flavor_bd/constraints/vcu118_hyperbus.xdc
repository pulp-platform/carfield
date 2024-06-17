# Copyright 2024 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets design_1_i/carfield_xilinx_ip_0/inst/i_carfield_xilinx/gen_hyper_phy[0].padinst_hyper_rwds0/iobuf_i/O]

# (FMCP_HSPC_LA13_N)
set_property PACKAGE_PIN AJ36     [get_ports "pad_hyper_csn[1]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L20N_T3L_N3_AD1N_43
set_property IOSTANDARD  LVCMOS18 [get_ports "pad_hyper_csn[1]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L20N_T3L_N3_AD1N_43

# (FMCP_HSPC_LA13_P)
set_property PACKAGE_PIN AJ35     [get_ports "pad_hyper_csn[0]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L20P_T3L_N2_AD1P_43
set_property IOSTANDARD  LVCMOS18 [get_ports "pad_hyper_csn[0]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L20P_T3L_N2_AD1P_43

# (FMCP_HSPC_LA14_P)
set_property PACKAGE_PIN AG31     [get_ports "pad_hyper_rwds"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L23P_T3U_N8_43
set_property IOSTANDARD  LVCMOS18 [get_ports "pad_hyper_rwds"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L23P_T3U_N8_43

# (FMCP_HSPC_LA09_N)
set_property PACKAGE_PIN AK33     [get_ports "pad_hyper_dq[2]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L19N_T3L_N1_DBC_AD9N_43
set_property IOSTANDARD  LVCMOS18 [get_ports "pad_hyper_dq[2]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L19N_T3L_N1_DBC_AD9N_43

# (FMCP_HSPC_LA10_N)
set_property PACKAGE_PIN AR35     [get_ports "pad_hyper_dq[3]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L3N_T0L_N5_AD15N_43
set_property IOSTANDARD  LVCMOS18 [get_ports "pad_hyper_dq[3]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L3N_T0L_N5_AD15N_43

# (FMCP_HSPC_LA10_P)
set_property PACKAGE_PIN AP35     [get_ports "pad_hyper_dq[0]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L3P_T0L_N4_AD15P_43
set_property IOSTANDARD  LVCMOS18 [get_ports "pad_hyper_dq[0]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L3P_T0L_N4_AD15P_43

# (FMCP_HSPC_LA09_P)
set_property PACKAGE_PIN AJ33     [get_ports "pad_hyper_dq[4]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L19P_T3L_N0_DBC_AD9P_43
set_property IOSTANDARD  LVCMOS18 [get_ports "pad_hyper_dq[4]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L19P_T3L_N0_DBC_AD9P_43

# (FMCP_HSPC_LA06_N)
set_property PACKAGE_PIN AT36     [get_ports "pad_hyper_dq[7]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L2N_T0L_N3_43
set_property IOSTANDARD  LVCMOS18 [get_ports "pad_hyper_dq[7]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L2N_T0L_N3_43

# (FMCP_HSPC_LA06_P)
set_property PACKAGE_PIN AT35     [get_ports "pad_hyper_dq[1]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L2P_T0L_N2_43
set_property IOSTANDARD  LVCMOS18 [get_ports "pad_hyper_dq[1]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L2P_T0L_N2_43

# (FMCP_HSPC_LA01_CC_N)
set_property PACKAGE_PIN AL31     [get_ports "pad_hyper_ckn"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L16N_T2U_N7_QBC_AD3N_43
set_property IOSTANDARD  LVCMOS18 [get_ports "pad_hyper_ckn"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L16N_T2U_N7_QBC_AD3N_43

# (FMCP_HSPC_LA01_CC_P)
set_property PACKAGE_PIN AL30     [get_ports "pad_hyper_ck"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L16P_T2U_N6_QBC_AD3P_43
set_property IOSTANDARD  LVCMOS18 [get_ports "pad_hyper_ck"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L16P_T2U_N6_QBC_AD3P_43

# (FMCP_HSPC_LA05_N)
set_property PACKAGE_PIN AR38     [get_ports "pad_hyper_dq[5]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L1N_T0L_N1_DBC_43
set_property IOSTANDARD  LVCMOS18 [get_ports "pad_hyper_dq[5]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L1N_T0L_N1_DBC_43

# (FMCP_HSPC_LA05_P)
set_property PACKAGE_PIN AP38     [get_ports "pad_hyper_dq[6]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L1P_T0L_N0_DBC_43
set_property IOSTANDARD  LVCMOS18 [get_ports "pad_hyper_dq[6]"] ;# Bank  43 VCCO - VADJ_1V8_FPGA - IO_L1P_T0L_N0_DBC_43
