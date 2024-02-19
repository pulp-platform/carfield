# Copyright 2024 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

set SOC_TCK 20
set JTAG_TCK 100.0
set UART_IO_SPEED 200.0

###################
# Global Settings #
###################

# The output of the reset synchronizer
set_false_path -from [get_ports cpu_reset*]

##########
# Clocks #
##########

# Rtc clock is asynchronous
create_generated_clock -source [get_ports clk_10] -divide_by 10 -name rtc_clk [get_pins i_carfield_xilinx/rtc_clk_q_reg/Q]
set_clock_groups -asynchronous -group {rtc_clk}
set_max_delay -from [get_pin i_carfield_xilinx/rtc_clk_q_reg/Q] $SOC_TCK

# System Clock
# [see in board.xdc]

# JTAG Clock
create_clock -period $JTAG_TCK -name clk_jtag [get_ports jtag_tck_i]
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

#################
# Carfield CDCs #
#################

# Hyper
################

#i_hyper_cdc_dst
set_max_delay -datapath \
 -from [get_pins i_carfield_xilinx/i_hyper_cdc_dst/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield_xilinx/i_carfield/i_cheshire_wrap/i_cheshire_ext_llc_cdc_src/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield_xilinx/i_carfield/i_cheshire_wrap/i_cheshire_ext_llc_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield_xilinx/i_hyper_cdc_dst/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield_xilinx/i_hyper_cdc_dst/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield_xilinx/i_carfield/i_cheshire_wrap/i_cheshire_ext_llc_cdc_src/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield_xilinx/i_carfield/i_cheshire_wrap/i_cheshire_ext_llc_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield_xilinx/i_hyper_cdc_dst/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK
