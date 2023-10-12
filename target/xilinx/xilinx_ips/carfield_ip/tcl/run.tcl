# Copyright 2020 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

# Create project
set project carfield_ip

create_project $project . -force -part $::env(XILINX_PART)
set_property XPM_LIBRARIES XPM_MEMORY [current_project]

# set number of threads to 8 (maximum, unfortunately)
set_param general.maxThreads 8

# Define sources
source tcl/add_sources.tcl

# Add constraints
add_files -fileset constrs_1 constraints/ooc_carfield_ip.xdc
set_property USED_IN {synthesis out_of_context} [get_files constraints/ooc_carfield_ip.xdc]
add_files -fileset constrs_1 constraints/carfield_ip.xdc 

# Package IP
set_property top carfield_xilinx_ip [current_fileset]

# Attention SFCU is only used because of Carfield's structure
update_compile_order -fileset sources_1
synth_design -rtl -name rtl_1 -sfcu

ipx::package_project -root_dir . -vendor ethz.ch -library user -taxonomy /UserIP -set_current false

# If we don't reopen project, Vivado does not find the newly created ip_repo
close_project
open_project $project.xpr
# Export this IP as a .xci too for coherence with Xilinx IPs
set_property ip_repo_paths . [current_project]
create_ip -verbose -module_name $project -vlnv ethz.ch:user:carfield_xilinx_ip

exit
