# Copyright 2022 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

set SOC_TCK 20

####################
# Clock generators #
####################

# Do not optimize anything in 
set_property DONT_TOUCH TRUE [get_cells gen_domain_clock_mux[*].i_clk_mux]

# Enable all clocks (clk_en register)
set_property DONT_TOUCH TRUE [get_cells i_carfield_reg_top/u_*_clk_sel]
set_property DONT_TOUCH TRUE [get_cells i_carfield_reg_top/u_*_clk_en]
set_case_analysis 1 [get_pins {i_carfield_reg_top/u_*_clk_en/q_reg[0]/Q}]

##########
# BUFG   #
##########

# tc_clk_mux2 are used for reset signals too, this makes Vivado flag them as clock trees and wasted precious routing ressources
set all_in_mux [get_nets -of [ get_pins -filter { DIRECTION == IN } -of [get_cells -hier -filter { ORIG_REF_NAME == tc_clk_mux2 || REF_NAME == tc_clk_mux2 }]]]
set_property CLOCK_DEDICATED_ROUTE FALSE $all_in_mux
set_property CLOCK_BUFFER_TYPE NONE $all_in_mux

####################
# Reset Generators #
####################

# Bound asynchronous software-reset paths independently of clock relationships
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {ORIG_REF_NAME=="rstgen" || REF_NAME=="rstgen"}]
set carfield_rstgen_outputs [get_pins -of_objects [get_cells -hier i_carfield_rstgen] -filter {DIRECTION==OUT}]
set all_rstgen_outputs [get_pins -filter {DIRECTION==OUT} -of_objects [get_cells -hier -filter {REF_NAME == rstgen || ORIG_REF_NAME == rstgen}]]
set regtop_reset_clocks [get_pins -of_objects [get_cells -hier -filter {NAME=~*i_carfield_reg_top/u_*_rst/*}] -filter {IS_CLOCK}]
set domain_clocks [get_clocks *domain_clk]
# Useless (no from)
set_max_delay -datapath_only -through $carfield_rstgen_outputs $SOC_TCK
set_min_delay -through $all_rstgen_outputs 0
# Useless (no from)
set_max_delay -datapath_only -from $regtop_reset_clocks -to $domain_clocks $SOC_TCK
set_min_delay -from $regtop_reset_clocks -to $domain_clocks 0

# Go large on the isolation
set_max_delay -through [get_nets *isolat*] $SOC_TCK

# Host pwr_on_reset is resynch by the domains
set_max_delay -datapath -from [get_pins i_host_rstgen/i_rstgen_bypass/synch_regs_q_reg[3]/C] -through [get_pins -of_object [get_cells -hier -filter {REF_NAME==clk_mux_glitch_free || ORIG_REF_NAME==clk_mux_glitch_free}] -filter { NAME =~*async* }] $SOC_TCK

# Reset synchronizers are themselves reset by the host synch reset
set_max_delay -to [get_pins -of_objects [get_cells -hier -filter {NAME =~ "*i_carfield_rstgen/*/i_rstgen_bypass/synch*"}] -filter {REF_PIN_NAME == CLR}] $SOC_TCK
set_min_delay -to [get_pins -of_objects [get_cells -hier -filter {NAME =~ "*i_carfield_rstgen/*/i_rstgen_bypass/synch*"}] -filter {REF_PIN_NAME == CLR}] 0

###################
# Carfield regtop #
###################

# Most of these paths go through proper synchronizers, but not all of them
set_max_delay -datapath_only -through [get_cells i_carfield_reg_top] -from [get_clocks -filter {NAME !~ "*clk_50*"}] -to [get_clocks *clk_50*] $SOC_TCK
set_max_delay -datapath_only -through [get_cells i_carfield_reg_top] -from [get_clocks *clk_50*] -to [get_clocks -filter {NAME !~ "*clk_50*"}] $SOC_TCK

#################
# Carfield CDCs #
#################

# Note :
# For the 2 phases CDC we use datapath-only max delays as we grab everything grossly
# On the AXI CDC as we precisely select the Clk-to-Q path we use a unique set_max_delay -datapath
# All the delays are assumed to be SOC_TCK (host domain)

# Datapath-only max delay on 2 phases and 2 phases clearable
set_max_delay -datapath_only -from [get_clocks] -through [get_nets -filter {NAME=~"*async*"} -of_objects [get_cells -hier -filter {REF_NAME =~ cdc_2phase_src* || ORIG_REF_NAME =~ cdc_2phase_src*}]] $SOC_TCK

# Datapath-only max delay on 4 phases
set_max_delay -datapath_only -from [get_clocks] -through [get_nets -filter {NAME=~"*async*"} -of_objects [get_cells -hier -filter {REF_NAME == cdc_4phase_src || ORIG_REF_NAME == cdc_4phase_src}]] $SOC_TCK

# Edge propagator ack (maybe already done below?)
set_max_delay -datapath_only -from [get_clocks] -through [get_nets -hier -filter { NAME =~ "*/i_edge_propagator_ack/sync_b" }] $SOC_TCK

# Datapath-only max delay on synchronizers
set all_sync_cells [get_cells -hier -filter {ORIG_REF_NAME=="sync" || REF_NAME=="sync" || ORIG_REF_NAME=="pulp_sync" || REF_NAME=="pulp_sync"}]
set_property KEEP_HIERARCHY SOFT $all_sync_cells
set_max_delay -from [get_clocks] -datapath_only -through [get_pins -of_objects $all_sync_cells -filter {REF_PIN_NAME=~serial_i}] $SOC_TCK

# Datapath-only max delay on OT synchronizers
set all_ot_sync_cells [get_cells -hier -filter {ORIG_REF_NAME=="prim_ot_flop_2sync" || REF_NAME=="prim_ot_flop_2sync"}]
set_property KEEP_HIERARCHY SOFT $all_ot_sync_cells
set_max_delay -from [get_clocks] -datapath_only -through [get_pins -of_objects $all_ot_sync_cells -filter {REF_PIN_NAME=~d_i*}] $SOC_TCK

set all_edge_propagator_ack [get_cells -hier -filter {ORIG_REF_NAME=="edge_propagator_ack" || REF_NAME=="edge_propagator_ack"}]
set_property KEEP_HIERARCHY SOFT $all_edge_propagator_ack
set edge_propagator_sync_nets [get_nets -filter {NAME=~*sync_b} -of_object [get_cells -hier -filter {ORIG_REF_NAME==pulp_sync_wedge || REF_NAME==pulp_sync_wedge}]]
set_max_delay -from [get_clocks] -datapath_only -through $edge_propagator_sync_nets $SOC_TCK
