# VIOs are asynchronous
set_false_path -through [get_pins -of_objects [get_cells design_1_i/vio_0] -filter {NAME =~ *probe*}]

# Create system clocks
#create_clock -period 4 -name sys_clk [get_pins design_1_i/util_ds_buf_0/IBUF_OUT]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins design_1_i/util_ds_buf_0/IBUF_OUT]
#create_clock -period 4 -name pcie_clk [get_nets design_1_i/util_ds_buf_1/U0/IBUF_OUT[0]]
#create_clock -period 4 -name pcie_clk_div [get_nets design_1_i/util_ds_buf_1/U0/IBUF_DS_ODIV2[0]]
#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets design_1_i/util_ds_buf_1/U0/IBUF_DS_ODIV2[0]]
#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets design_1_i/util_ds_buf_1/U0/IBUF_OUT[0]]

# PCIe clock LOC
#set_property LOC [get_package_pins -of_objects [get_bels [get_sites -filter {NAME =~ *COMMON*} -of_objects [get_iobanks -of_objects [get_sites GTYE4_CHANNEL_X1Y15]]]/REFCLK0P]] [get_ports pcie_refclk_clk_p[0]]
#set_property LOC [get_package_pins -of_objects [get_bels [get_sites -filter {NAME =~ *COMMON*} -of_objects [get_iobanks -of_objects [get_sites GTYE4_CHANNEL_X1Y15]]]/REFCLK0N]] [get_ports pcie_refclk_clk_n[0]]

#  VCU128 Rev1.0 XDC
#  Date: 01/24/2018

#### This file is a general .xdc for the VCU128 1 Rev.
#### To use it in a project:
#### - uncomment the lines corresponding to used pins
#### - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

set_property PACKAGE_PIN AW25     [get_ports "uart_rx_i"] ;# Bank  67 VCCO - VCC1V8   - IO_L2N_T0L_N3_67
set_property IOSTANDARD  LVCMOS18 [get_ports "uart_rx_i"] ;# Bank  67 VCCO - VCC1V8   - IO_L2N_T0L_N3_67
set_property PACKAGE_PIN BB21     [get_ports "uart_tx_o"] ;# Bank  67 VCCO - VCC1V8   - IO_L2P_T0L_N2_67
set_property IOSTANDARD  LVCMOS18 [get_ports "uart_tx_o"] ;# Bank  67 VCCO - VCC1V8   - IO_L2P_T0L_N2_67

set_property PACKAGE_PIN L19 [get_ports reset]
set_property IOSTANDARD LVCMOS12 [get_ports reset]

#set_property BOARD_PART_PIN default_250mhz_clk_n [get_ports sys_clk_clk_n[0]]
#set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_clk_clk_n[0]]
#set_property BOARD_PART_PIN default_100mhz_clk_p [get_ports sys_clk_clk_p[0]]
#set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_clk_clk_p[0]]
#set_property PACKAGE_PIN BH51 [get_ports sys_clk_clk_p[0]]
#set_property PACKAGE_PIN BJ51 [get_ports sys_clk_clk_n[0]]
