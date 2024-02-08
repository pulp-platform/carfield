##############################
# BOARD SPECIFIC CONSTRAINTS #
##############################

#############
# Sys clock #
#############

# 250 MHz ref clock
set SYS_TCK 4
create_clock -period $SYS_TCK -name sys_clk [get_pins u_ibufg_sys_clk/O]
set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_pins u_ibufg_sys_clk/O]
set_clock_groups -name sys_clk_async -asynchronous -group {sys_clk}

#############
# Mig clock #
#############

# Dram axi clock : 833ps * 4
set MIG_TCK 3.332
set MIG_RST [get_pins i_dram_wrapper/i_dram/c0_ddr4_ui_clk_sync_rst]
create_clock -period $MIG_TCK -name dram_axi_clk [get_pins i_dram_wrapper/i_dram/c0_ddr4_ui_clk]
set_clock_groups -name dram_async -asynchronous -group {dram_axi_clk}
set_false_path -hold -through $MIG_RST
set_max_delay -through $MIG_RST $MIG_TCK

########
# CDCs #
########

set_max_delay -through [get_nets -of_objects [get_cells i_dram_wrapper/gen_cdc.i_axi_cdc_mig/i_axi_cdc_*/i_cdc_fifo_gray_*/*] -filter {NAME=~*async*}] $MIG_TCK
#set_max_delay -datapath -from [get_pins i_axi_cdc_mig/i_axi_cdc_*/i_cdc_fifo_gray_*/*reg*/C] -to [get_pins i_axi_cdc_mig/i_axi_cdc_*/i_cdc_fifo_gray_dst_*/*i_sync/reg*/D] $MIG_TCK

#-------------- MCS Generation ----------------------
#set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN div-1  [current_design]
#set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES       [current_design]
#set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 8          [current_design]
#set_property BITSTREAM.GENERAL.COMPRESS TRUE          [current_design]
#set_property BITSTREAM.CONFIG.UNUSEDPIN Pullnone      [current_design]
#set_property CFGBVS GND                               [current_design]
#set_property CONFIG_VOLTAGE 1.8                       [current_design]
#set_property CONFIG_MODE SPIx8                        [current_design]


#################################################################################

set_property PACKAGE_PIN AW25     [get_ports "uart_rx_i"] ;# Bank  67 VCCO - VCC1V8   - IO_L2N_T0L_N3_67
set_property IOSTANDARD  LVCMOS18 [get_ports "uart_rx_i"] ;# Bank  67 VCCO - VCC1V8   - IO_L2N_T0L_N3_67
set_property PACKAGE_PIN BB21     [get_ports "uart_tx_o"] ;# Bank  67 VCCO - VCC1V8   - IO_L2P_T0L_N2_67
set_property IOSTANDARD  LVCMOS18 [get_ports "uart_tx_o"] ;# Bank  67 VCCO - VCC1V8   - IO_L2P_T0L_N2_67

set_property PACKAGE_PIN L19 [get_ports reset]
set_property IOSTANDARD LVCMOS12 [get_ports reset]

set_property PACKAGE_PIN N30     [get_ports jtag_tdo_o] ;# B25 - H17 (FMCP_HSPC_LA11_N) - J1.08 - TDO
# Todo change invalid lvcmos
set_property IOSTANDARD LVCMOS12 [get_ports jtag_tdo_o]

set_property PACKAGE_PIN P30     [get_ports jtag_tck_i] ;# B26 - H16 (FMCP_HSPC_LA11_P) - J1.06 - TCK
set_property IOSTANDARD LVCMOS12 [get_ports jtag_tck_i] ;

set_property PACKAGE_PIN N28     [get_ports jtag_tms_i] ;# H22 - G16 (FMCP_HSPC_LA12_N) - J1.12 - TNS
set_property IOSTANDARD LVCMOS12 [get_ports jtag_tms_i] ;

set_property PACKAGE_PIN M30     [get_ports jtag_tdi_i] ;# J22 - G15 (FMCP_HSPC_LA12_P) - J1.10 - TDI
set_property IOSTANDARD LVCMOS12 [get_ports jtag_tdi_i]

# Default 250MHz clk1
set_property PACKAGE_PIN D12      [get_ports "sys_clk_n"] ;# Bank  47 VCCO - VCC1V2_FPGA - IO_L13N_T2L_N1_GC_QBC_47
set_property IOSTANDARD  DIFF_SSTL12 [get_ports "sys_clk_n"] ;# Bank  47 VCCO - VCC1V2_FPGA - IO_L13N_T2L_N1_GC_QBC_47
set_property PACKAGE_PIN E12      [get_ports "sys_clk_p"] ;# Bank  47 VCCO - VCC1V2_FPGA - IO_L13P_T2L_N0_GC_QBC_47
set_property IOSTANDARD  DIFF_SSTL12 [get_ports "sys_clk_p"] ;# Bank  47 VCCO - VCC1V2_FPGA - IO_L13P_T2L_N0_GC_QBC_47
