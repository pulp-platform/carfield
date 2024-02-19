# Copyright 2024 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

set SOC_TCK 20
set JTAG_TCK 100.0
set UART_IO_SPEED 200.0

###################
# Top level reset #
###################

# The output of the top level reset synchronizer
set SOC_RST_SRC [get_pins -filter {DIRECTION == OUT} -leaf -of_objects [get_nets rst_n]]
set_max_delay -from $SOC_RST_SRC $SOC_TCK
set_false_path -hold -from $SOC_RST_SRC

##########
# Clocks #
##########

# Rtc clock is asynchronous
create_generated_clock -source [get_pins -filter {DIRECTION == OUT} -leaf -of_objects [get_nets clk_10]] -divide_by 10 -name rtc_clk [get_pins rtc_clk_q_reg/Q]
set_clock_groups -asynchronous -group {rtc_clk}
set_max_delay -from [get_pin rtc_clk_q_reg/Q] $SOC_TCK

# System Clock
# [see in $XILINX_BOARD.xdc]

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

########
# VIOs #
########

set_false_path -through [get_pins -of_object [get_cells -hier -filter {REF_NAME =~ xlnx_vio || ORIG_REF_NAME =~ xlnx_vio}] -filter {NAME =~ *probe*}]

#################
# Carfield CDCs #
#################

# Hyper
###################

# i_hyper_cdc_dst
set_max_delay -datapath \
 -from [get_pins i_hyper_cdc_dst/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/i_cheshire_ext_llc_cdc_src/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/i_cheshire_ext_llc_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_hyper_cdc_dst/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_hyper_cdc_dst/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/i_cheshire_ext_llc_cdc_src/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/i_cheshire_ext_llc_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_hyper_cdc_dst/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK
