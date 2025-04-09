# Copyright 2018 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Author: Cyril Koenig <cykoenig@iis.ee.ethz.ch>

set project $::env(XILINX_PROJECT)

create_project $project . -force -part $::env(XILINX_PART)
set_property board_part $::env(XILINX_BOARD_LONG) [current_project]

# set number of threads to 8 (maximum, unfortunately)
set_param general.maxThreads 8

# Contraints files selection
switch $::env(XILINX_BOARD) {
  "vcu128" {
    # Board specific
    import_files -fileset constrs_1 -norecurse constraints/$::env(XILINX_BOARD).xdc
    if {[info exists ::env(GEN_EXT_JTAG)] && ($::env(GEN_EXT_JTAG)==1)} {
      import_files -fileset constrs_1 -norecurse constraints/$::env(XILINX_BOARD)_ext_jtag.xdc
    }
    if {![info exists ::env(GEN_NO_HYPERBUS)] || ($::env(GEN_NO_HYPERBUS)==0)} {
      import_files -fileset constrs_1 -norecurse constraints/$::env(XILINX_BOARD)_hyperbus.xdc
    }

    # Vanilla specific
    import_files -fileset constrs_1 -norecurse constraints/carfield_top_xilinx.xdc
    # General constraints
    import_files -fileset constrs_1 -norecurse ../constraints/carfield_islands.tcl
    # Make sure carfield.xdc executes after carfield_islands.tcl (that generates the clocks)
    import_files -fileset constrs_1 -norecurse ../constraints/carfield.xdc
    set_property SCOPED_TO_REF carfield [get_files carfield.xdc]
    set_property processing_order LATE [get_files carfield.xdc]
  }
  default {
      exit 1
  }
}

# Ips selection
set ips $::env(XILINX_IP_PATHS)
read_ip $ips

source scripts/add_sources.tcl

set_property top ${project}_top_xilinx [current_fileset]

update_compile_order -fileset sources_1

if {[info exists ::env(XILINX_ELABORATION_ONLY)] && $::env(XILINX_ELABORATION_ONLY)==1} {
  puts "Running with XILINX_ELABORATION_ONLY"
  set_property XPM_LIBRARIES XPM_MEMORY [current_project]
  
  synth_design -rtl -name rtl_1 -sfcu

} else {
  # Runtime optimized due to the low frequency (50/20MHz)
  # set_property strategy Flow_RuntimeOptimized [get_runs synth_1]
  # set_property strategy Flow_RuntimeOptimized [get_runs impl_1]
  
  set_property XPM_LIBRARIES XPM_MEMORY [current_project]
  
  set_property STEPS.SYNTH_DESIGN.ARGS.RETIMING true [get_runs synth_1]
  # Enable sfcu due to package conflicts
  set_property -name {STEPS.SYNTH_DESIGN.ARGS.MORE OPTIONS} -value {-sfcu} -objects [get_runs synth_1]
  
  # Synthesis
  launch_runs synth_1
  wait_on_run synth_1
  open_run synth_1 -name synth_1
  
  exec mkdir -p reports/
  exec rm -rf reports/*
  
  check_timing -verbose                                                   -file reports/$project.check_timing.rpt
  report_timing -max_paths 100 -nworst 100 -delay_type max -sort_by slack -file reports/$project.timing_WORST_100.rpt
  report_timing -nworst 1 -delay_type max -sort_by group                  -file reports/$project.timing.rpt
  report_utilization -hierarchical                                        -file reports/$project.utilization.rpt
  report_cdc                                                              -file reports/$project.cdc.rpt
  report_clock_interaction                                                -file reports/$project.clock_interaction.rpt
  
  # Instantiate ILA
  set DEBUG [llength [get_nets -hier -filter {MARK_DEBUG == 1}]]
  if ($DEBUG) {
    # Create core
    puts "Creating debug core..."
    create_debug_core u_ila_0 ila
    set_property -dict "ALL_PROBE_SAME_MU true ALL_PROBE_SAME_MU_CNT 4 C_ADV_TRIGGER true C_DATA_DEPTH 16384 \
     C_EN_STRG_QUAL true C_INPUT_PIPE_STAGES 0 C_TRIGIN_EN false C_TRIGOUT_EN false" [get_debug_cores u_ila_0]
    ## Clock
    set_property port_width 1 [get_debug_ports u_ila_0/clk]
    connect_debug_port u_ila_0/clk [get_nets soc_clk]
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
            connect_debug_port u_ila_0/probe$probe_i [get_nets $sigList]
            incr probe_i
        }
        set sigList ""
      }
      lappend sigList $net
      set netNameLast $netName
    }
    # Need to save save constraints before implementing the core
    # set_property target_constrs_file cheshire.srcs/constrs_1/imports/constraints/$::env(BOARD).xdc [current_fileset -constrset]
    save_constraints -force
    implement_debug_core
    write_debug_probes -force probes.ltx
  }
  
  # Implementation
  launch_runs impl_1
  wait_on_run impl_1
  launch_runs impl_1 -to_step write_bitstream
  wait_on_run impl_1
  
  # Check timing constraints
  open_run impl_1
  
  set timingrep [report_timing_summary -no_header -no_detailed_paths -return_string]
  if {[info exists ::env(XILINX_CHECK_TIMING)] && $::env(XILINX_CHECK_TIMING)==1} {
    if {! [string match -nocase {*timing constraints are met*} $timingrep]} {
      send_msg_id {USER 1-1} ERROR {Timing constraints were not met.}
      return -code error
    }
  }
  
  # Output Verilog netlist + SDC for timing simulation
  write_verilog -force -mode funcsim out/${project}_funcsim.v
  write_verilog -force -mode timesim out/${project}_timesim.v
  write_sdf     -force out/${project}_timesim.sdf
  
  # Reports
  exec mkdir -p reports/
  exec rm -rf reports/*
  check_timing                                                              -file reports/${project}.check_timing.rpt
  report_timing -max_paths 100 -nworst 100 -delay_type max -sort_by slack   -file reports/${project}.timing_WORST_100.rpt
  report_timing -nworst 1 -delay_type max -sort_by group                    -file reports/${project}.timing.rpt
  report_utilization -hierarchical                                          -file reports/${project}.utilization.rpt
}
