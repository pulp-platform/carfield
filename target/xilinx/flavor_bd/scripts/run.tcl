# Copyright 2020 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

# Create project
set project carfield_$::env(XILINX_BOARD)

create_project $project ./$project -force -part $::env(XILINX_PART)
set_property board_part $::env(XILINX_BOARD_LONG) [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]

# set number of threads to 8 (maximum, unfortunately)
set_param general.maxThreads 8

# Include custom IP
set_property ip_repo_paths ../xilinx_ips/carfield_ip [current_project]
update_ip_catalog

# Avoid changing top level randomly in case of error
# set_property source_mgmt_mode None [current_project]

# Add params to runs
import_files -fileset constrs_1 -norecurse constraints/$::env(XILINX_BOARD).xdc
import_files -fileset constrs_1 -norecurse ../constraints/carfield_islands.tcl
source scripts/add_includes.tcl

# Build block design
source scripts/carfield_bd_$::env(XILINX_BOARD).tcl

# Add the ext_jtag pins to block design
if {[info exists ::env(GEN_EXT_JTAG)] && ($::env(GEN_EXT_JTAG)==1)} {
  source scripts/carfield_bd_ext_jtag_$::env(XILINX_BOARD).tcl
  import_files -fileset constrs_1 -norecurse constraints/$::env(XILINX_BOARD)_ext_jtag.xdc
}

add_files -norecurse [make_wrapper -files [get_files *design_1.bd] -top]

# Create OOC runs
generate_target all [get_files *design_1.bd]
export_ip_user_files -of_objects  [get_files *design_1.bd] -no_script
create_ip_run [get_files *design_1.bd]

# Make sure carfield.xdc (imported from IP) executes after carfield_islands.tcl (that generates the clocks)
set_property processing_order LATE [get_files carfield.xdc]

# Start OOC synthesis of changed IPs
set synth_runs [get_runs *synth*]
# Exclude the whole design (synth_1) and the carfield IP (bug)
set all_ooc_synth [lsearch -regexp -all -inline -not $synth_runs {^synth_1$|carfield}]
set runs_queued {}
foreach run $all_ooc_synth {
    if {[get_property PROGRESS [get_run $run]] != "100%"} {
        puts "Launching run $run"
        lappend runs_queued $run
        # Default synthesis strategy
        # set_property strategy Flow_RuntimeOptimized [get_runs $run]
    } else {
        puts "Skipping 100% complete run: $run"
    }
}
if {[llength $runs_queued] != 0} {
    reset_run $runs_queued
    launch_runs $runs_queued -jobs 16
    puts "Waiting on $runs_queued"
    foreach run $runs_queued {
        wait_on_run $run
    }
    # reset main synthesis
    reset_run synth_1
}

# set_property strategy Flow_RuntimeOptimized [get_runs synth_1]
# set_property strategy Flow_RuntimeOptimized [get_runs impl_1]
set_property strategy Performance_Explore [get_runs impl_1]

set_property STEPS.SYNTH_DESIGN.ARGS.RETIMING true [get_runs synth_1]
# Enable sfcu due to package conflicts
set_property -name {STEPS.SYNTH_DESIGN.ARGS.MORE OPTIONS} -value {-sfcu} -objects [get_runs synth_1]

launch_runs synth_1
wait_on_run synth_1
open_run synth_1 -name synth_1

# Instantiate ILA
set DEBUG [llength [get_nets -hier -filter {MARK_DEBUG == 1}]]
if ($DEBUG) {
  # Create core
  puts "Creating debug core..."
  create_debug_core u_ila_0 ila
  set_property -dict "ALL_PROBE_SAME_MU true ALL_PROBE_SAME_MU_CNT 4 C_ADV_TRIGGER true C_DATA_DEPTH 16384 \
   C_EN_STRG_QUAL true C_INPUT_PIPE_STAGES 0 C_TRIGIN_EN false C_TRIGOUT_EN false" [get_debug_cores u_ila_0]
  ## Clock
  set ila_clk_net [get_nets design_1_i/clk_wiz_0_clk_50]
  set_property port_width 1 [get_debug_ports u_ila_0/clk]
  connect_debug_port u_ila_0/clk $ila_clk_net
  set ila_clks [get_clocks -of_objects $ila_clk_net]
  set ila_clk_names {}
  foreach c $ila_clks { lappend ila_clk_names [get_property NAME $c] }
  set ila_period [get_property PERIOD [lindex $ila_clks 0]]
  # Get nets to debug
  set debugNets [lsort -dictionary [get_nets -hier -filter {MARK_DEBUG == 1}]]
  set netNameLast ""
  set probe_i 0
  # Loop through all nets (add extra list element to ensure last net is processed)
  foreach net [concat $debugNets {""}] {
    # Remove trailing array index
    regsub {\[[0-9]*\]$} $net {} netName
    # Create probe after all signals with the same name have been collected
    if {$netNameLast != $netName} {
      if {$netNameLast != ""} {
          puts "Creating probe $probe_i with width [llength $sigList] for signal '$netNameLast'"
          # probe0 already exists, and does not need to be created
          if {$probe_i != 0} {
            create_debug_port u_ila_0 probe
          }
          set_property port_width [llength $sigList] [get_debug_ports u_ila_0/probe$probe_i]
          set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe$probe_i]
          set probe_nets [get_nets $sigList]
          connect_debug_port u_ila_0/probe$probe_i $probe_nets
          # If the probed net is not in the ILA clock domain, constrain the CDC path
          set probe_clks [get_clocks -quiet -of_objects \
            [all_fanin -quiet -to [lindex $probe_nets 0] -flat -startpoints_only]]
          foreach probe_clk $probe_clks {
            set probe_clk_name [get_property NAME $probe_clk]
            if {[lsearch -exact $ila_clk_names $probe_clk_name] < 0} {
              puts "  CDC into ILA: $probe_clk_name -> {$ila_clk_names}, set_max_delay $ila_period through probe"
              set_max_delay -datapath_only -from $probe_clk -to $ila_clks -through $probe_nets $ila_period
              break
            }
          }
          incr probe_i
      }
      set sigList ""
    }
    lappend sigList $net
    set netNameLast $netName
  }
  # Need to save save constraints before implementing the core
  set_property target_constrs_file [get_files $::env(XILINX_BOARD).xdc] [current_fileset -constrset]

  save_constraints -force
  implement_debug_core
  write_debug_probes -force probes.ltx
}

# Incremental implementation
if {[info exists ::env(ROUTED_DCP)] && [file exists $::env(ROUTED_DCP)]} {
  set_property incremental_checkpoint $::env(ROUTED_DCP) [get_runs impl_1]
}

# Implementation
launch_runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
