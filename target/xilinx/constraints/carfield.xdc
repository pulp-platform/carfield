# Copyright 2022 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Nicole Narr <narrn@student.ethz.ch>
# Christopher Reinwardt <creinwar@student.ethz.ch>

###################
# Global Settings #
###################

# Preserve the output mux of the clock divider
set_property DONT_TOUCH TRUE [get_cells i_sys_clk_div/i_clk_bypass_mux]

# The output of the reset synchronizer
set SOC_RST_SRC [get_pins -filter {DIRECTION == OUT} -leaf -of_objects [get_nets rst_n]]

#####################
# Timing Parameters #
#####################

# 10 MHz (max) JTAG clock
set JTAG_TCK 100.0

# UART speed is at most 5 Mb/s
set UART_IO_SPEED 200.0

# Host on clk_50
set SOC_TCK 20

##########
# Clocks #
##########

# Clk_wiz clocks
create_clock -period 100 -name clk_10 [get_pins i_xlnx_clk_wiz/clk_10]
create_clock -period 50 -name clk_20 [get_pins i_xlnx_clk_wiz/clk_20]
create_clock -period 20 -name clk_50 [get_pins i_xlnx_clk_wiz/clk_50]
create_clock -period 10 -name clk_100 [get_pins i_xlnx_clk_wiz/clk_100]
create_clock -period 1000 -name rtc_clk [get_pins rtc_clk_q_reg/Q]

set_clock_groups -name clk_10_grp -asynchronous -group {clk_10}
set_clock_groups -name clk_20_grp -asynchronous -group {clk_20}
set_clock_groups -name clk_50_grp -asynchronous -group {clk_50}
set_clock_groups -name clk_100_grp -asynchronous -group {clk_100}
set_clock_groups -name rtc_clk_grp -asynchronous -group {rtc_clk}

# System Clock
# [see in board.xdc]

# JTAG Clock
create_clock -period $JTAG_TCK -name clk_jtag [get_ports jtag_tck_i]
set_input_jitter clk_jtag 1.000
set_clock_groups -name jtag_grp -asynchronous -group {clk_jtag}

##########
# BUFG   #
##########

# JTAG are on non clock capable GPIOs (if not using BSCANE)
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets -of [get_ports jtag_tck_i]]
set_property CLOCK_BUFFER_TYPE NONE [get_nets -of [get_ports jtag_tck_i]]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets -of [get_ports cpu_reset]]
set_property CLOCK_BUFFER_TYPE NONE [get_nets -of [get_ports cpu_reset]]

set all_in_mux [get_nets -of [ get_pins -filter { DIRECTION == IN } -of [get_cells -hier -filter { ORIG_REF_NAME == tc_clk_mux2 || REF_NAME == tc_clk_mux2 }]]]
set_property CLOCK_DEDICATED_ROUTE FALSE $all_in_mux
set_property CLOCK_BUFFER_TYPE NONE $all_in_mux

########
# JTAG #
########

set_input_delay  -min -clock clk_jtag [expr 0.10 * $JTAG_TCK] [get_ports {jtag_tdi_i jtag_tms_i}]
set_input_delay  -max -clock clk_jtag [expr 0.20 * $JTAG_TCK] [get_ports {jtag_tdi_i jtag_tms_i}]

set_output_delay -min -clock clk_jtag [expr 0.10 * $JTAG_TCK] [get_ports jtag_tdo_o]
set_output_delay -max -clock clk_jtag [expr 0.20 * $JTAG_TCK] [get_ports jtag_tdo_o]

set_max_delay  -from [get_ports jtag_trst_ni] $JTAG_TCK
set_false_path -hold -from [get_ports jtag_trst_ni]

########
# UART #
########

set_max_delay [expr $UART_IO_SPEED * 0.35] -from [get_ports uart_rx_i]
set_false_path -hold -from [get_ports uart_rx_i]

set_max_delay [expr $UART_IO_SPEED * 0.35] -to [get_ports uart_tx_o]
set_false_path -hold -to [get_ports uart_tx_o]

#################
# Carfield CDCs #
#################

# Data on 4 phases
set_max_delay -through [get_nets -filter {NAME=~"*async*"} -of_objects [get_cells -hier -filter {REF_NAME == cdc_4phase_src || ORIG_REF_NAME == cdc_4phase_src}]] $SOC_TCK
# Hold on 4 phases
set_false_path -hold -through [get_nets -filter {NAME=~"*async*"} -of_objects [get_cells -hier -filter {REF_NAME == cdc_4phase_src || ORIG_REF_NAME == cdc_4phase_src}]]

# i_carfield/i_cdc_dst_peripherals
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cdc_dst_peripherals/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[4].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[4].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cdc_dst_peripherals/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cdc_dst_peripherals/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[4].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[4].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cdc_dst_peripherals/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK

# i_carfield/gen_safety_island.i_safety_island_wrap/i_cdc_in
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[2].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_safety_island.i_safety_island_wrap/i_cdc_in/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_safety_island.i_safety_island_wrap/i_cdc_in/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[2].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[2].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_safety_island.i_safety_island_wrap/i_cdc_in/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_safety_island.i_safety_island_wrap/i_cdc_in/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[2].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK

# i_carfield/i_cheshire_wrap/gen_ext_mst_dst_cdc[0].i_cheshire_ext_mst_cdc_dst
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_safety_island.i_safety_island_wrap/i_cdc_out/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_mst_dst_cdc[0].i_cheshire_ext_mst_cdc_dst/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D
] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_mst_dst_cdc[0].i_cheshire_ext_mst_cdc_dst/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_safety_island.i_safety_island_wrap/i_cdc_out/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_safety_island.i_safety_island_wrap/i_cdc_out/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_mst_dst_cdc[0].i_cheshire_ext_mst_cdc_dst/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_mst_dst_cdc[0].i_cheshire_ext_mst_cdc_dst/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_safety_island.i_safety_island_wrap/i_cdc_out/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK

# i_carfield/i_reconfigurable_l2/gen_cdc_fifos[0].i_dst_cdc
set_max_delay -datapath \
 -from [get_pins i_carfield/i_reconfigurable_l2/gen_cdc_fifos[0].i_dst_cdc/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[0].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D
] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[0].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_reconfigurable_l2/gen_cdc_fifos[0].i_dst_cdc/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_reconfigurable_l2/gen_cdc_fifos[0].i_dst_cdc/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[0].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[0].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_reconfigurable_l2/gen_cdc_fifos[0].i_dst_cdc/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK

# i_carfield/i_reconfigurable_l2/gen_cdc_fifos[1].i_dst_cdc
set_max_delay -datapath \
 -from [get_pins i_carfield/i_reconfigurable_l2/gen_cdc_fifos[1].i_dst_cdc/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[1].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D
] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[1].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_reconfigurable_l2/gen_cdc_fifos[1].i_dst_cdc/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_reconfigurable_l2/gen_cdc_fifos[1].i_dst_cdc/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[1].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[1].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_reconfigurable_l2/gen_cdc_fifos[1].i_dst_cdc/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK

# Hold on axi_cdc
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {ORIG_REF_NAME=="sync" || REF_NAME=="sync"}]
set_false_path -hold -through [get_pins -of_objects [get_cells -hier -filter {ORIG_REF_NAME == axi_cdc_src || REF_NAME == axi_cdc_src}] -filter {NAME =~ *async*}]
set_false_path -hold -through [get_pins -of_objects [get_cells -hier -filter {ORIG_REF_NAME == axi_cdc_dst || REF_NAME == axi_cdc_dst}] -filter {NAME =~ *async*}]

####################
# Reset Generators #
####################

set_max_delay -from $SOC_RST_SRC $SOC_TCK
set_false_path -hold -from $SOC_RST_SRC
set_false_path -hold -through [get_pins i_carfield/i_carfield_rstgen/rsts_no]
set_false_path -hold -through [get_pins i_carfield/i_carfield_rstgen/pwr_on_rsts_no]
set_false_path -hold -through [get_pins -filter {REF_PIN_NAME == rst_no} -of_objects [get_cells -hier -filter {REF_NAME == rstgen || ORIG_REF_NAME == rstgen}]]
