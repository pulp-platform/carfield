# Copyright 2022 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>


###################
# Global Settings #
###################

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

# Rtc clock is asynchronous
create_generated_clock -source [get_pins i_xlnx_clk_wiz/inst/mmcme4_adv_inst/CLKOUT3] -divide_by 10 -name rtc_clk [get_pins rtc_clk_q_reg/Q]
set_clock_groups -asynchronous -group {rtc_clk}
set_max_delay -from [get_pin rtc_clk_q_reg/Q] $SOC_TCK

# System Clock
# [see in board.xdc]

# JTAG Clock
create_clock -period $JTAG_TCK -name clk_jtag [get_ports jtag_tck_i]
set_input_jitter clk_jtag 1.000
set_clock_groups -name jtag_grp -asynchronous -group {clk_jtag}


####################
# Clock generators #
####################

# Do not optimize anything in them
set_property DONT_TOUCH TRUE [get_cells i_carfield/gen_domain_clock_mux[*].i_clk_mux]

# TODO Check this
set_false_path -from [get_pins i_carfield/gen_domain_clock_mux[*].i_clk_mux/gen_input_stages[*].clock_has_been_disabled_q_reg[*]/C] -to [get_pins i_carfield/gen_domain_clock_mux[*].i_clk_mux/gen_input_stages[*].clock_has_been_disabled_q_reg[*]/D]
set_false_path -from [get_pins i_carfield/gen_domain_clock_mux[*].i_clk_mux/gen_input_stages[*].clock_has_been_disabled_q_reg[*]/C] -to [get_pins i_carfield/gen_domain_clock_mux[*].i_clk_mux/gen_input_stages[*].glitch_filter_q_reg[*][*]/D]

# Periph domain
create_generated_clock -source [get_pins i_carfield/gen_domain_clock_mux[0].i_clk_mux/clks_i[2]] -divide_by 1 -name periph_domain_clk [get_pins i_carfield/gen_domain_clock_mux[0].i_clk_mux/clk_o]
set_case_analysis 0 [get_pins {i_carfield/i_carfield_reg_top/u_periph_clk_sel/q_reg[0]/Q}]
set_case_analysis 1 [get_pins {i_carfield/i_carfield_reg_top/u_periph_clk_sel/q_reg[1]/Q}]
set_case_analysis 1 [get_pins {i_carfield/i_carfield_reg_top/u_periph_clk_en/q_reg[0]/Q}]

# Safety domain
create_generated_clock -source [get_pins i_carfield/gen_domain_clock_mux[1].i_clk_mux/clks_i[1]] -divide_by 1 -name safety_domain_clk    [get_pins i_carfield/gen_domain_clock_mux[1].i_clk_mux/clk_o]
set_case_analysis 1 [get_pins {i_carfield/i_carfield_reg_top/u_safety_island_clk_sel/q_reg[0]/Q}]
set_case_analysis 0 [get_pins {i_carfield/i_carfield_reg_top/u_safety_island_clk_sel/q_reg[1]/Q}]
set_case_analysis 1 [get_pins {i_carfield/i_carfield_reg_top/u_safety_island_clk_en/q_reg[0]/Q}]

# Security domain
create_generated_clock -source [get_pins i_carfield/gen_domain_clock_mux[2].i_clk_mux/clks_i[1]] -divide_by 1 -name security_domain_clk  [get_pins i_carfield/gen_domain_clock_mux[2].i_clk_mux/clk_o]
set_case_analysis 1 [get_pins {i_carfield/i_carfield_reg_top/u_security_island_clk_sel/q_reg[0]/Q}]
set_case_analysis 0 [get_pins {i_carfield/i_carfield_reg_top/u_security_island_clk_sel/q_reg[1]/Q}]
set_case_analysis 1 [get_pins {i_carfield/i_carfield_reg_top/u_security_island_clk_en/q_reg[0]/Q}]

# Pulp domain
create_generated_clock -source [get_pins i_carfield/gen_domain_clock_mux[3].i_clk_mux/clks_i[1]] -divide_by 1 -name pulp_domain_clk      [get_pins i_carfield/gen_domain_clock_mux[3].i_clk_mux/clk_o]
set_case_analysis 1 [get_pins {i_carfield/i_carfield_reg_top/u_pulp_cluster_clk_sel/q_reg[0]/Q}]
set_case_analysis 0 [get_pins {i_carfield/i_carfield_reg_top/u_pulp_cluster_clk_sel/q_reg[1]/Q}]
set_case_analysis 1 [get_pins {i_carfield/i_carfield_reg_top/u_pulp_cluster_clk_en/q_reg[0]/Q}]

# Spatz domain
create_generated_clock -source [get_pins i_carfield/gen_domain_clock_mux[4].i_clk_mux/clks_i[1]] -divide_by 1 -name spatz_domain_clk     [get_pins i_carfield/gen_domain_clock_mux[4].i_clk_mux/clk_o]
set_case_analysis 1 [get_pins {i_carfield/i_carfield_reg_top/u_spatz_cluster_clk_sel/q_reg[0]/Q}]
set_case_analysis 0 [get_pins {i_carfield/i_carfield_reg_top/u_spatz_cluster_clk_sel/q_reg[1]/Q}]
set_case_analysis 1 [get_pins {i_carfield/i_carfield_reg_top/u_spatz_cluster_clk_en/q_reg[0]/Q}]

# L2 Domain
create_generated_clock -source [get_pins i_carfield/gen_domain_clock_mux[5].i_clk_mux/clks_i[0]] -divide_by 1 -name l2_domain_clk       [get_pins i_carfield/gen_domain_clock_mux[5].i_clk_mux/clk_o]
set_case_analysis 0 [get_pins {i_carfield/i_carfield_reg_top/u_l2_clk_sel/q_reg[0]/Q}]
set_case_analysis 0 [get_pins {i_carfield/i_carfield_reg_top/u_l2_clk_sel/q_reg[1]/Q}]
set_case_analysis 1 [get_pins {i_carfield/i_carfield_reg_top/u_l2_clk_en/q_reg[0]/Q}]

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

# Hold and max delay on 2 phases and 2 phases clearable
set_max_delay -through [get_nets -filter {NAME=~"*async*"} -of_objects [get_cells -hier -filter {REF_NAME =~ cdc_2phase_src* || ORIG_REF_NAME =~ cdc_2phase_src*}]] $SOC_TCK
set_false_path -hold -through [get_nets -filter {NAME=~"*async*"} -of_objects [get_cells -hier -filter {REF_NAME =~ cdc_2phase_src* || ORIG_REF_NAME =~ cdc_2phase_src*}]]

# Hold and max delay on 4 phases
set_max_delay -through [get_nets -filter {NAME=~"*async*"} -of_objects [get_cells -hier -filter {REF_NAME == cdc_4phase_src || ORIG_REF_NAME == cdc_4phase_src}]] $SOC_TCK
set_false_path -hold -through [get_nets -filter {NAME=~"*async*"} -of_objects [get_cells -hier -filter {REF_NAME == cdc_4phase_src || ORIG_REF_NAME == cdc_4phase_src}]]

# Hold and max delay on synchronizers
set all_sync_cells [get_cells -hier -filter {ORIG_REF_NAME=="sync" || REF_NAME=="sync"}]
set_property KEEP_HIERARCHY SOFT $all_sync_cells
set_false_path -hold -through [get_pins -of_objects $all_sync_cells -filter {REF_PIN_NAME=~serial_i}]
set_max_delay -through [get_pins -of_objects $all_sync_cells -filter {REF_PIN_NAME=~serial_i}] $SOC_TCK

# Hold and max delay on pulp synchronizers
set all_pulp_sync_cells [get_cells -hier -filter {ORIG_REF_NAME=="pulp_sync" || REF_NAME=="pulp_sync"}]
set_property KEEP_HIERARCHY SOFT $all_pulp_sync_cells
set_false_path -hold -through [get_pins -of_objects $all_pulp_sync_cells -filter {REF_PIN_NAME=~serial_i}]
set_max_delay -through [get_pins -of_objects $all_pulp_sync_cells -filter {REF_PIN_NAME=~serial_i}] $SOC_TCK

# Hold and max delay on OT synchronizers
set all_ot_sync_cells [get_cells -hier -filter {ORIG_REF_NAME=="prim_ot_flop_2sync" || REF_NAME=="prim_ot_flop_2sync"}]
set_property KEEP_HIERARCHY SOFT $all_ot_sync_cells
set_false_path -hold -through [get_pins -of_objects $all_ot_sync_cells -filter {REF_PIN_NAME=~d_i*}]
set_max_delay -through [get_pins -of_objects $all_ot_sync_cells -filter {REF_PIN_NAME=~d_i*}] $SOC_TCK

set all_edge_propagator_ack [get_cells -hier -filter {ORIG_REF_NAME=="edge_propagator_ack" || REF_NAME=="edge_propagator_ack"}]
set_property KEEP_HIERARCHY SOFT $all_edge_propagator_ack
set_false_path -through [get_nets -filter {NAME=~*sync_b} -of_object [get_cells -hier -filter {ORIG_REF_NAME==pulp_sync_wedge || REF_NAME==pulp_sync_wedge}]]

# Peripherals
##############

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

# Safety Island
################

# To Safety Island error slave
# i_carfield/gen_no_safety_island.i_safety_island_axi_err/i_cdc_in
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[2].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_no_safety_island.i_safety_island_axi_err/i_cdc_in/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_no_safety_island.i_safety_island_axi_err/i_cdc_in/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[2].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[2].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_no_safety_island.i_safety_island_axi_err/i_cdc_in/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_no_safety_island.i_safety_island_axi_err/i_cdc_in/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[2].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK

# To Safety Island slave
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

# From Safety Island master
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

# Pulp Cluster
################

# To Pulp cluster error slave
# i_carfield/gen_no_pulp_cluster.i_pulp_cluster_axi_err/i_cdc_in
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/i_intcluster_slv_cdc/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_no_pulp_cluster.i_pulp_cluster_axi_err/i_cdc_in/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_no_pulp_cluster.i_pulp_cluster_axi_err/i_cdc_in/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/i_intcluster_slv_cdc/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/i_intcluster_slv_cdc/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_no_pulp_cluster.i_pulp_cluster_axi_err/i_cdc_in/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_no_pulp_cluster.i_pulp_cluster_axi_err/i_cdc_in/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/i_intcluster_slv_cdc/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK

# To Pulp cluster slave
# i_carfield/gen_pulp_cluster.i_integer_cluster/axi_slave_cdc_i
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/i_intcluster_slv_cdc/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_pulp_cluster.i_integer_cluster/axi_slave_cdc_i/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_pulp_cluster.i_integer_cluster/axi_slave_cdc_i/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/i_intcluster_slv_cdc/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/i_intcluster_slv_cdc/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_pulp_cluster.i_integer_cluster/axi_slave_cdc_i/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_pulp_cluster.i_integer_cluster/axi_slave_cdc_i/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/i_intcluster_slv_cdc/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK

# From Pulp cluster master
# i_carfield/i_cheshire_wrap/i_intcluster_mst_cdc
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_pulp_cluster.i_integer_cluster/axi_master_cdc_i/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/i_intcluster_mst_cdc/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/i_intcluster_mst_cdc/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_pulp_cluster.i_integer_cluster/axi_master_cdc_i/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_pulp_cluster.i_integer_cluster/axi_master_cdc_i/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/i_intcluster_mst_cdc/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/i_intcluster_mst_cdc/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_pulp_cluster.i_integer_cluster/axi_master_cdc_i/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK

# Spatz cluster
###############

# To Spatz cluster error slave
# i_carfield/gen_no_spatz_cluster.i_spatz_cluster_axi_err/i_cdc_in
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[5].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_no_spatz_cluster.i_spatz_cluster_axi_err/i_cdc_in/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_no_spatz_cluster.i_spatz_cluster_axi_err/i_cdc_in/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[5].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[5].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_no_spatz_cluster.i_spatz_cluster_axi_err/i_cdc_in/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_no_spatz_cluster.i_spatz_cluster_axi_err/i_cdc_in/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[5].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK

# To Spatz cluster slave
# i_carfield/gen_spatz_cluster.i_fp_cluster_wrapper/i_spatz_cluster_cdc_dst
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[5].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_spatz_cluster.i_fp_cluster_wrapper/i_spatz_cluster_cdc_dst/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_spatz_cluster.i_fp_cluster_wrapper/i_spatz_cluster_cdc_dst/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[5].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[5].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_spatz_cluster.i_fp_cluster_wrapper/i_spatz_cluster_cdc_dst/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_spatz_cluster.i_fp_cluster_wrapper/i_spatz_cluster_cdc_dst/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_slv_src_cdc[5].i_cheshire_ext_slv_cdc_src/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK

# From Spatz cluster master
# i_carfield/i_cheshire_wrap/gen_ext_mst_dst_cdc[2].i_cheshire_ext_mst_cdc_dst
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_spatz_cluster.i_fp_cluster_wrapper/i_spatz_cluster_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_mst_dst_cdc[2].i_cheshire_ext_mst_cdc_dst/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_mst_dst_cdc[2].i_cheshire_ext_mst_cdc_dst/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_spatz_cluster.i_fp_cluster_wrapper/i_spatz_cluster_cdc_src/i_cdc_fifo_gray_*/i_spill_register/spill_register_flushable_i/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/gen_spatz_cluster.i_fp_cluster_wrapper/i_spatz_cluster_cdc_src/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/i_cheshire_wrap/gen_ext_mst_dst_cdc[2].i_cheshire_ext_mst_cdc_dst/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK
set_max_delay -datapath \
 -from [get_pins i_carfield/i_cheshire_wrap/gen_ext_mst_dst_cdc[2].i_cheshire_ext_mst_cdc_dst/i_cdc_fifo_gray_*/*reg*/C] \
 -to [get_pins i_carfield/gen_spatz_cluster.i_fp_cluster_wrapper/i_spatz_cluster_cdc_src/i_cdc_fifo_gray_*/*i_sync/*reg*/D] \
 $SOC_TCK

# Reconfigurable L2
###################

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

#i_hyper_cdc_dst
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

####################
# Reset Generators #
####################

set_max_delay -from $SOC_RST_SRC $SOC_TCK
set_false_path -hold -from $SOC_RST_SRC
# No max delay on sw reset since clock can be gated anyways
set_false_path -through [get_pins -of_objects [get_cells i_carfield/i_carfield_rstgen] -filter {DIRECTION==OUT}]
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {ORIG_REF_NAME=="rstgen" || REF_NAME=="rstgen"}]
set_false_path -hold -through [get_pins -filter {DIRECTION==OUT} -of_objects [get_cells -hier -filter {REF_NAME == rstgen || ORIG_REF_NAME == rstgen}]]
