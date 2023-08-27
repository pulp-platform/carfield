# Copyright 2022 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

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

# Host clock
create_generated_clock -source [get_pins i_xlnx_clk_wiz/inst/mmcme4_adv_inst/CLKOUT1] -divide_by 1 -add -master_clock clk_50_xlnx_clk_wiz -name host_clk [get_pins i_carfield/host_clk_i]
# Periph clock
create_generated_clock -source [get_pins i_xlnx_clk_wiz/inst/mmcme4_adv_inst/CLKOUT1] -divide_by 1 -add -master_clock clk_50_xlnx_clk_wiz -name periph_clk [get_pins i_carfield/periph_clk_i]
# Alt clock
create_generated_clock -source [get_pins i_xlnx_clk_wiz/inst/mmcme4_adv_inst/CLKOUT2] -divide_by 1 -name alt_clk [get_pins i_carfield/alt_clk_i]

# Rtc clock is asynchronous
create_generated_clock -source [get_pins i_xlnx_clk_wiz/inst/mmcme4_adv_inst/CLKOUT3] -divide_by 10 -name rtc_clk [get_pins rtc_clk_q_reg/Q]
set_max_delay -from [get_pin rtc_clk_q_reg/Q] $SOC_TCK
set_false_path -hold -from [get_pin rtc_clk_q_reg/Q]

# Periph domain
set_property DONT_TOUCH TRUE [get_cells i_carfield/gen_domain_clock_mux[0].i_clk_mux]
create_generated_clock -source [get_pins i_carfield/periph_clk_i] -divide_by 1 -name periph_domain_clk [get_pins i_carfield/gen_domain_clock_mux[0].i_clk_mux/clk_o]
set_case_analysis 0 [get_pins {i_carfield/i_carfield_reg_top/u_periph_clk_sel/q_reg[0]/Q}]
set_case_analysis 1 [get_pins {i_carfield/i_carfield_reg_top/u_periph_clk_sel/q_reg[1]/Q}]

# Safety domain
set_property DONT_TOUCH TRUE [get_cells i_carfield/gen_domain_clock_mux[1].i_clk_mux]
create_generated_clock -source [get_pins i_carfield/alt_clk_i] -divide_by 1 -name safety_domain_clk    [get_pins i_carfield/gen_domain_clock_mux[1].i_clk_mux/clk_o]
set_case_analysis 1 [get_pins {i_carfield/i_carfield_reg_top/u_safety_island_clk_sel/q_reg[0]/Q}]
set_case_analysis 0 [get_pins {i_carfield/i_carfield_reg_top/u_safety_island_clk_sel/q_reg[1]/Q}]

# Security domain
set_property DONT_TOUCH TRUE [get_cells i_carfield/gen_domain_clock_mux[2].i_clk_mux]
create_generated_clock -source [get_pins i_carfield/alt_clk_i] -divide_by 1 -name security_domain_clk  [get_pins i_carfield/gen_domain_clock_mux[2].i_clk_mux/clk_o]
set_case_analysis 1 [get_pins {i_carfield/i_carfield_reg_top/u_security_island_clk_sel/q_reg[0]/Q}]
set_case_analysis 0 [get_pins {i_carfield/i_carfield_reg_top/u_security_island_clk_sel/q_reg[1]/Q}]

# Pulp domain
set_property DONT_TOUCH TRUE [get_cells i_carfield/gen_domain_clock_mux[3].i_clk_mux]
create_generated_clock -source [get_pins i_carfield/alt_clk_i] -divide_by 1 -name pulp_domain_clk      [get_pins i_carfield/gen_domain_clock_mux[3].i_clk_mux/clk_o]
set_case_analysis 1 [get_pins {i_carfield/i_carfield_reg_top/u_pulp_cluster_clk_sel/q_reg[0]/Q}]
set_case_analysis 0 [get_pins {i_carfield/i_carfield_reg_top/u_pulp_cluster_clk_sel/q_reg[1]/Q}]

# Spatz domain
set_property DONT_TOUCH TRUE [get_cells i_carfield/gen_domain_clock_mux[4].i_clk_mux]
create_generated_clock -source [get_pins i_carfield/alt_clk_i] -divide_by 1 -name spatz_domain_clk     [get_pins i_carfield/gen_domain_clock_mux[4].i_clk_mux/clk_o]
set_case_analysis 1 [get_pins {i_carfield/i_carfield_reg_top/u_spatz_cluster_clk_sel/q_reg[0]/Q}]
set_case_analysis 0 [get_pins {i_carfield/i_carfield_reg_top/u_spatz_cluster_clk_sel/q_reg[1]/Q}]

# L2 Domain
set_property DONT_TOUCH TRUE [get_cells i_carfield/gen_domain_clock_mux[5].i_clk_mux]
create_generated_clock -source [get_pins i_carfield/host_clk_i] -divide_by 1 -name l2_domain_clk       [get_pins i_carfield/gen_domain_clock_mux[5].i_clk_mux/clk_o]
set_case_analysis 0 [get_pins {i_carfield/i_carfield_reg_top/u_l2_clk_sel/q_reg[0]/Q}]
set_case_analysis 0 [get_pins {i_carfield/i_carfield_reg_top/u_l2_clk_sel/q_reg[1]/Q}]

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

# Note :
# For the 2 phases CDC we use max_delay and hold path as we grab everything grossly
# On the AXI CDC as we precisely select the Clk-to-Q path we use a unique set_max_delay -datapath
# All the delays are assumed to be SOC_TCK (host domain)

# Data on 2 phases and 2 phases clearable
set_max_delay -through [get_nets -filter {NAME=~"*async*"} -of_objects [get_cells -hier -filter {REF_NAME =~ cdc_2phase_src* || ORIG_REF_NAME =~ cdc_2phase_src*}]] $SOC_TCK
# Hold on 2 phases and 2 phases clearable
set_false_path -hold -through [get_nets -filter {NAME=~"*async*"} -of_objects [get_cells -hier -filter {REF_NAME =~ cdc_2phase_src* || ORIG_REF_NAME =~ cdc_2phase_src*}]]

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
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_mst_dst_cdc[0].i_cheshire_ext_mst_cdc_dst/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
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
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[1].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
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

# Hold on axi_cdc and interrupt synchronizers
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {ORIG_REF_NAME=="sync" || REF_NAME=="sync"}]
set_false_path -hold -through [get_pins -of_objects [get_cells -hier -filter {ORIG_REF_NAME=="sync" || REF_NAME=="sync"}] -filter {NAME=~*serial_i}]

set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {ORIG_REF_NAME=="pulp_sync" || REF_NAME=="pulp_sync"}]
set_false_path -hold -through [get_pins -of_objects [get_cells -hier -filter {ORIG_REF_NAME=="pulp_sync" || REF_NAME=="pulp_sync"}] -filter {NAME=~*serial_i}]

####################
# Reset Generators #
####################

set_max_delay -from $SOC_RST_SRC $SOC_TCK
set_false_path -hold -from $SOC_RST_SRC
set_false_path -hold -through [get_pins -of_objects [get_cells i_carfield/i_carfield_rstgen] -filter {DIRECTION==OUT}]

set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {ORIG_REF_NAME=="rstgen" || REF_NAME=="rstgen"}]
set_false_path -hold -through [get_pins -filter {DIRECTION==OUT} -of_objects [get_cells -hier -filter {REF_NAME == rstgen || ORIG_REF_NAME == rstgen}]]
