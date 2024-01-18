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
set MIG_TCK 4
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

set_property PACKAGE_PIN AW25 [get_ports uart_rx_i]
set_property IOSTANDARD LVCMOS18 [get_ports uart_rx_i]
set_property PACKAGE_PIN BB21 [get_ports uart_tx_o]
set_property IOSTANDARD LVCMOS18 [get_ports uart_tx_o]
#set_property PACKAGE_PIN AY25 [get_ports uart_rts_no]
#set_property IOSTANDARD LVCMOS18 [get_ports uart_rts_no]
#set_property PACKAGE_PIN BB22 [get_ports uart_cts_ni]
#set_property IOSTANDARD LVCMOS18 [get_ports uart_cts_ni]
#set_property IOB {TRUE} [ get_cells -of_objects [ all_fanin -flat -startpoints_only [get_ports {uart_rx_i}]]]
#set_property IOB {TRUE} [ get_cells -of_objects [ all_fanin -flat -startpoints_only [get_ports {uart_tx_o}]]]

set_property PACKAGE_PIN L19	 [get_ports cpu_reset]
set_property IOSTANDARD LVCMOS12 [get_ports cpu_reset]



#AY14-N28 PMOD0_0
set_property PACKAGE_PIN AY14 [get_ports jtag_tdo_o]
set_property IOSTANDARD LVCMOS18 [get_ports jtag_tdo_o]
#AY15-M30 PMOD0_1
set_property PACKAGE_PIN AY15 [get_ports jtag_trst_ni]
set_property IOSTANDARD LVCMOS18 [get_ports jtag_trst_ni]
#AW15-N30 PMOD0_2
set_property PACKAGE_PIN AW15 [get_ports jtag_tck_i]
set_property IOSTANDARD LVCMOS18 [get_ports jtag_tck_i]
#AV16-P29 PMOD0_4
set_property PACKAGE_PIN AV16 [get_ports jtag_tdi_i]
set_property IOSTANDARD LVCMOS18 [get_ports jtag_tdi_i]
#AU16     PMOD0_5
set_property PACKAGE_PIN AU16 [get_ports jtag_tms_i]
set_property IOSTANDARD LVCMOS18 [get_ports jtag_tms_i]
#AT15     PMOD0_6

#AV15-P30 PMOD0_3



set_property BOARD_PART_PIN default_250mhz_clk1_n [get_ports sys_clk_n]
set_property IOSTANDARD LVDS [get_ports sys_clk_n]
set_property BOARD_PART_PIN default_250mhz_clk1_p [get_ports sys_clk_p]
set_property IOSTANDARD LVDS [get_ports sys_clk_p]
set_property PACKAGE_PIN E12 [get_ports sys_clk_p]
set_property PACKAGE_PIN D12 [get_ports sys_clk_n]

#set_property PACKAGE_PIN AT15 [get_ports {sd_cd_i}]
#set_property IOSTANDARD LVCMOS18 [get_ports {sd_cd_i}]
#set_property PACKAGE_PIN AY15 [get_ports {sd_cmd_o}]
#set_property IOSTANDARD LVCMOS18 [get_ports {sd_cmd_o}]
#set_property PACKAGE_PIN AW15 [get_ports {sd_d_io[0]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {sd_d_io[0]}]
#set_property PULLUP true [get_ports {sd_d_io[0]}]
#set_property PACKAGE_PIN AV16 [get_ports {sd_d_io[1]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {sd_d_io[1]}]
#set_property PULLUP true [get_ports {sd_d_io[1]}]
#set_property PACKAGE_PIN AU16 [get_ports {sd_d_io[2]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {sd_d_io[2]}]
#set_property PULLUP true [get_ports {sd_d_io[2]}]
#set_property PACKAGE_PIN AY14 [get_ports {sd_d_io[3]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {sd_d_io[3]}]
#set_property PULLUP true [get_ports {sd_d_io[3]}]
#set_property PACKAGE_PIN AV15 [get_ports {sd_sclk_o}]
#set_property IOSTANDARD LVCMOS18 [get_ports {sd_sclk_o}]
#set_property PACKAGE_PIN AT16 [get_ports {sd_reset_o}]
#set_property IOSTANDARD LVCMOS18 [get_ports {sd_reset_o}]

#set_property IOB {TRUE} [ get_cells -of_objects [ all_fanin -flat -startpoints_only [get_ports {sd_d_io[0]}]]]
#set_property IOB {TRUE} [ get_cells -of_objects [ all_fanin -flat -startpoints_only [get_ports {sd_d_io[1]}]]]
#set_property IOB {TRUE} [ get_cells -of_objects [ all_fanin -flat -startpoints_only [get_ports {sd_d_io[2]}]]]
#set_property IOB {TRUE} [ get_cells -of_objects [ all_fanin -flat -startpoints_only [get_ports {sd_d_io[3]}]]]
#set_property MARK_DEBUG true [get_nets i_carfield/jtag_tck_i]

set_property MARK_DEBUG true [get_nets i_carfield/jtag_tdi_i]
set_property MARK_DEBUG true [get_nets i_carfield/jtag_tdo_o]
set_property MARK_DEBUG true [get_nets i_carfield/jtag_tms_i] 
set_property MARK_DEBUG true [get_nets i_carfield/jtag_trst_ni] 
set_property MARK_DEBUG true [get_nets i_carfield/rst_ni]
set_property MARK_DEBUG true [get_nets i_carfield/test_mode_i]
set_property MARK_DEBUG true [get_nets i_carfield/boot_mode_i]
set_property MARK_DEBUG true [get_nets i_carfield/rtc_i]
set_property MARK_DEBUG true [get_nets i_carfield/uart_tx_o]
set_property MARK_DEBUG true [get_nets i_carfield/uart_rx_i]
set_property MARK_DEBUG true [get_nets i_carfield/uart_rts_no]
set_property MARK_DEBUG true [get_nets i_carfield/uart_dtr_no]
set_property MARK_DEBUG true [get_nets i_carfield/uart_cts_ni]
set_property MARK_DEBUG true [get_nets i_carfield/uart_dsr_ni]
set_property MARK_DEBUG true [get_nets i_carfield/uart_dcd_ni]
set_property MARK_DEBUG true [get_nets i_carfield/uart_rin_ni]

  // External AXI LLC (DRAM) port
set_property MARK_DEBUG true [get_nets i_carfield/axi_llc_mst_req_o]
set_property MARK_DEBUG true [get_nets i_carfield/axi_llc_mst_rsp_i]
  // External AXI crossbar ports
set_property MARK_DEBUG true [get_nets i_carfield/axi_ext_mst_req_i]
set_property MARK_DEBUG true [get_nets i_carfield/axi_ext_mst_rsp_o]
set_property MARK_DEBUG true [get_nets i_carfield/axi_ext_slv_req_o]
set_property MARK_DEBUG true [get_nets i_carfield/axi_ext_slv_rsp_i]
  // External reg demux slaves
set_property MARK_DEBUG true [get_nets i_carfield/reg_ext_slv_req_o]
set_property MARK_DEBUG true [get_nets i_carfield/reg_ext_slv_rsp_i]
  // Interrupts from and to external targets
set_property MARK_DEBUG true [get_nets i_carfield/intr_ext_i]
set_property MARK_DEBUG true [get_nets i_carfield/intr_ext_o]
  // Interrupt requests to external harts
set_property MARK_DEBUG true [get_nets i_carfield/xeip_ext_o]
set_property MARK_DEBUG true [get_nets i_carfield/mtip_ext_o]
set_property MARK_DEBUG true [get_nets i_carfield/msip_ext_o]
  // Debug interface to external harts
set_property MARK_DEBUG true [get_nets i_carfield/dbg_active_o]
set_property MARK_DEBUG true [get_nets i_carfield/dbg_ext_req_o]
set_property MARK_DEBUG true [get_nets i_carfield/dbg_ext_unavail_i]

set_property MARK_DEBUG true [get_nets STARTUPE3_inst/qspi_dqi]
set_property MARK_DEBUG true [get_nets STARTUPE3_inst/qspi_dqo]
set_property MARK_DEBUG true [get_nets STARTUPE3_inst/qspi_dqo_ts]
set_property MARK_DEBUG true [get_nets STARTUPE3_inst/qspi_cs_b[1]]
set_property MARK_DEBUG true [get_nets STARTUPE3_inst/qspi_cs_b_ts[1]]
