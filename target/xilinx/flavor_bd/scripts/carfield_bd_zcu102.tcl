# Copyright 2020 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# This file was generated for vivado 2020.2
#
# Arya Saraei <arya.baghchesaraei2@unibo.it>

############################################################
# ZCU102 Carfield Block Design
#
# This design combines:
#
# 1) PS -> Carfield AXI access
#    Zynq PS M_AXI_HPM0_FPD
#    -> SmartConnect
#    -> Carfield periph_axi_s
#
#    Used for:
#    - PS register access
#    - XSCT debug access
#    - A53 software access to Carfield scratch registers
#
# 2) Carfield -> PS DDR access
#    Carfield dram_axi
#    -> SmartConnect
#    -> Zynq PS S_AXI_HP0_FPD
#
#    Used for:
#    - Carfield master accesses to PS DDR4
#    - L2 ELF external memory transactions
#
# Clocking:
#    PS pl_clk0 -> clk_wiz -> 10/20/50/100 MHz
#
# Reset:
#    PS reset -> proc_sys_reset -> Carfield/system AXI reset
#
# Debug:
#    System ILA inserted on both AXI paths
#
############################################################




set design_name design_1

if {[get_files -quiet ${design_name}.bd] ne ""} {
  remove_files [get_files ${design_name}.bd]
}

create_bd_design $design_name
current_bd_design $design_name

############################################################
# PS
############################################################
create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.3 i_zynq_ps

apply_bd_automation -rule xilinx.com:bd_rule:zynq_ultra_ps_e \
  -config {apply_board_preset "1"} [get_bd_cells i_zynq_ps]

set_property -dict [list \
  CONFIG.PSU__USE__M_AXI_GP0 {1} \
  CONFIG.PSU__USE__M_AXI_GP1 {0} \
  CONFIG.PSU__USE__S_AXI_GP0 {0} \
  CONFIG.PSU__USE__S_AXI_GP1 {0} \
  CONFIG.PSU__USE__S_AXI_GP2 {1} \
  CONFIG.PSU__USE__S_AXI_GP3 {0} \
  CONFIG.PSU__USE__S_AXI_GP4 {0} \
  CONFIG.PSU__USE__S_AXI_GP5 {0} \
  CONFIG.PSU__MAXIGP0__DATA_WIDTH {64} \
  CONFIG.PSU__SAXIGP2__DATA_WIDTH {64} \
  CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {100} \
] [get_bd_cells i_zynq_ps]

############################################################
# Clock wizard
############################################################
create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0

set_property -dict [list \
  CONFIG.PRIM_IN_FREQ {99.990005} \
  CONFIG.CLKOUT1_USED {true} \
  CONFIG.CLKOUT2_USED {true} \
  CONFIG.CLKOUT3_USED {true} \
  CONFIG.CLKOUT4_USED {true} \
  CONFIG.NUM_OUT_CLKS {4} \
  CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {10.000} \
  CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {20.000} \
  CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {50.000} \
  CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {100.000} \
  CONFIG.CLK_OUT1_PORT {clk_10} \
  CONFIG.CLK_OUT2_PORT {clk_20} \
  CONFIG.CLK_OUT3_PORT {clk_50} \
  CONFIG.CLK_OUT4_PORT {clk_100} \
  CONFIG.RESET_TYPE {ACTIVE_HIGH} \
  CONFIG.USE_RESET {false} \
] [get_bd_cells clk_wiz_0]

connect_bd_net [get_bd_pins i_zynq_ps/pl_clk0] [get_bd_pins clk_wiz_0/clk_in1]

############################################################
# Reset
############################################################
create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 rst_inv_0
set_property -dict [list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}] [get_bd_cells rst_inv_0]

connect_bd_net [get_bd_pins i_zynq_ps/pl_resetn0] [get_bd_pins rst_inv_0/Op1]

create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 psr_50

connect_bd_net [get_bd_pins clk_wiz_0/clk_50] [get_bd_pins psr_50/slowest_sync_clk]
connect_bd_net [get_bd_pins clk_wiz_0/locked] [get_bd_pins psr_50/dcm_locked]
connect_bd_net [get_bd_pins rst_inv_0/Res]    [get_bd_pins psr_50/ext_reset_in]

############################################################
# Constants
############################################################
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_low_0
set_property -dict [list CONFIG.CONST_VAL {0} CONFIG.CONST_WIDTH {1}] [get_bd_cells const_low_0]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_high_0
set_property -dict [list CONFIG.CONST_VAL {1} CONFIG.CONST_WIDTH {1}] [get_bd_cells const_high_0]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_boot_2
set_property -dict [list CONFIG.CONST_VAL {2} CONFIG.CONST_WIDTH {2}] [get_bd_cells const_boot_2]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_gpio_0
set_property -dict [list CONFIG.CONST_VAL {0} CONFIG.CONST_WIDTH {32}] [get_bd_cells const_gpio_0]

############################################################
# Carfield IP
############################################################
create_bd_cell -type ip -vlnv ethz.ch:user:carfield_xilinx_ip:1.0 carfield_xilinx_ip_0

connect_bd_net [get_bd_pins clk_wiz_0/clk_10]  [get_bd_pins carfield_xilinx_ip_0/clk_10]
connect_bd_net [get_bd_pins clk_wiz_0/clk_20]  [get_bd_pins carfield_xilinx_ip_0/clk_20]
connect_bd_net [get_bd_pins clk_wiz_0/clk_50]  [get_bd_pins carfield_xilinx_ip_0/clk_50]
connect_bd_net [get_bd_pins clk_wiz_0/clk_100] [get_bd_pins carfield_xilinx_ip_0/clk_100]

connect_bd_net [get_bd_pins psr_50/mb_reset] [get_bd_pins carfield_xilinx_ip_0/cpu_reset]

connect_bd_net [get_bd_pins const_low_0/dout]  [get_bd_pins carfield_xilinx_ip_0/testmode_i]
connect_bd_net [get_bd_pins const_boot_2/dout] [get_bd_pins carfield_xilinx_ip_0/boot_mode_i]
connect_bd_net [get_bd_pins const_boot_2/dout] [get_bd_pins carfield_xilinx_ip_0/boot_mode_safety_i]
connect_bd_net [get_bd_pins const_gpio_0/dout] [get_bd_pins carfield_xilinx_ip_0/gpio_i]
connect_bd_net [get_bd_pins const_high_0/dout] [get_bd_pins carfield_xilinx_ip_0/jtag_trst_ni]

############################################################
# Carfield UART
############################################################

create_bd_port -dir O uart_tx_o
create_bd_port -dir I uart_rx_i

connect_bd_net \
  [get_bd_ports uart_tx_o] \
  [get_bd_pins carfield_xilinx_ip_0/uart_tx_o]

connect_bd_net \
  [get_bd_ports uart_rx_i] \
  [get_bd_pins carfield_xilinx_ip_0/uart_rx_i]

############################################################
# PS -> Carfield SmartConnect
############################################################
set sc_ps2cf [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 sc_ps2cf]

set_property -dict [list \
  CONFIG.NUM_SI {1} \
  CONFIG.NUM_MI {1} \
  CONFIG.NUM_CLKS {1} \
  CONFIG.HAS_ARESETN {1} \
] $sc_ps2cf

connect_bd_intf_net [get_bd_intf_pins i_zynq_ps/M_AXI_HPM0_FPD] \
                    [get_bd_intf_pins sc_ps2cf/S00_AXI]

connect_bd_intf_net [get_bd_intf_pins sc_ps2cf/M00_AXI] \
                    [get_bd_intf_pins carfield_xilinx_ip_0/periph_axi_s]

connect_bd_net [get_bd_pins clk_wiz_0/clk_50] [get_bd_pins i_zynq_ps/maxihpm0_fpd_aclk]
connect_bd_net [get_bd_pins clk_wiz_0/clk_50] [get_bd_pins sc_ps2cf/aclk]
connect_bd_net [get_bd_pins psr_50/interconnect_aresetn] [get_bd_pins sc_ps2cf/aresetn]

############################################################
# System ILA: PS -> Carfield
############################################################
set sys_ila_ps2cf [create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 sys_ila_ps2cf]

set_property -dict [list \
  CONFIG.C_NUM_MONITOR_SLOTS {1} \
  CONFIG.C_SLOT_0_INTF_TYPE {xilinx.com:interface:aximm_rtl:1.0} \
  CONFIG.C_DATA_DEPTH {1024} \
] $sys_ila_ps2cf

connect_bd_net [get_bd_pins clk_wiz_0/clk_50] [get_bd_pins sys_ila_ps2cf/clk]

connect_bd_intf_net [get_bd_intf_pins sc_ps2cf/M00_AXI] \
                    [get_bd_intf_pins sys_ila_ps2cf/SLOT_0_AXI]

############################################################
# Carfield dram_axi -> PS DDR via HP0
############################################################
set sc_cf2ps_hp0 [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 sc_cf2ps_hp0]

set_property -dict [list \
  CONFIG.NUM_SI {1} \
  CONFIG.NUM_MI {1} \
  CONFIG.NUM_CLKS {1} \
  CONFIG.HAS_ARESETN {1} \
] $sc_cf2ps_hp0

connect_bd_intf_net [get_bd_intf_pins carfield_xilinx_ip_0/dram_axi] \
                    [get_bd_intf_pins sc_cf2ps_hp0/S00_AXI]

connect_bd_intf_net [get_bd_intf_pins sc_cf2ps_hp0/M00_AXI] \
                    [get_bd_intf_pins i_zynq_ps/S_AXI_HP0_FPD]

connect_bd_net [get_bd_pins carfield_xilinx_ip_0/dram_axi_m_aclk] \
               [get_bd_pins sc_cf2ps_hp0/aclk]

connect_bd_net [get_bd_pins carfield_xilinx_ip_0/dram_axi_m_aclk] \
               [get_bd_pins i_zynq_ps/saxihp0_fpd_aclk]

connect_bd_net [get_bd_pins psr_50/interconnect_aresetn] \
               [get_bd_pins sc_cf2ps_hp0/aresetn]

############################################################
# System ILA: Carfield -> PS DDR
############################################################
set sys_ila_hp0 [create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 sys_ila_hp0]

set_property -dict [list \
  CONFIG.C_NUM_MONITOR_SLOTS {1} \
  CONFIG.C_SLOT_0_INTF_TYPE {xilinx.com:interface:aximm_rtl:1.0} \
  CONFIG.C_DATA_DEPTH {4096} \
  CONFIG.C_INPUT_PIPE_STAGES {1} \
] $sys_ila_hp0

connect_bd_net [get_bd_pins carfield_xilinx_ip_0/dram_axi_m_aclk] \
               [get_bd_pins sys_ila_hp0/clk]

connect_bd_intf_net [get_bd_intf_pins carfield_xilinx_ip_0/dram_axi] \
                    [get_bd_intf_pins sys_ila_hp0/SLOT_0_AXI]

############################################################
# Address map: PS sees Carfield
############################################################
assign_bd_address \
  -target_address_space [get_bd_addr_spaces i_zynq_ps/Data] \
  -offset 0xA0000000 \
  -range 0x00100000 \
  [get_bd_addr_segs {carfield_xilinx_ip_0/periph_axi_s/reg0}] \
  -force

############################################################
# Address map: Carfield dram_axi sees PS DDR through HP0
############################################################
assign_bd_address [get_bd_addr_segs {i_zynq_ps/SAXIGP2/HP0_DDR_LOW}]

set_property offset 0x0000000000 \
  [get_bd_addr_segs {carfield_xilinx_ip_0/dram_axi/SEG_i_zynq_ps_HP0_DDR_LOW}]

set_property range 2G \
  [get_bd_addr_segs {carfield_xilinx_ip_0/dram_axi/SEG_i_zynq_ps_HP0_DDR_LOW}]

############################################################
# Validate / Save
############################################################
validate_bd_design
save_bd_design