# Apply set_max_delay on cross-domain paths into ILA inputs.
# Requires u_ila_0 in the netlist (after implement_debug_core).
#
# After implement_debug_core the ILA is still a black box with probe* ports;
# leaf D pins appear only once the core is elaborated (e.g. post opt_design).
#
# Used as:
#   - STEPS.OPT_DESIGN.TCL.PRE from scripts/run.tcl (primary flow)
#   - Manual: open_checkpoint <dcp>; source this file

set ila_clk_net [get_nets -quiet design_1_i/clk_wiz_0_clk_50]
if {$ila_clk_net == ""} {
  error "ILA clock net design_1_i/clk_wiz_0_clk_50 not found"
}
set ila_clks [get_clocks -of_objects $ila_clk_net]
if {$ila_clks == ""} {
  error "No clock found on $ila_clk_net"
}
set ila_clk_names {}
foreach c $ila_clks { lappend ila_clk_names [get_property NAME $c] }
set ila_period [get_property PERIOD [lindex $ila_clks 0]]
puts "ILA clocks: {$ila_clk_names} (period $ila_period ns)"

# Prefer elaborated capture FFs; fall back to black-box probe ports.
set ila_endpoints [get_pins -quiet -of_objects [get_cells -hier -quiet -filter {NAME =~ *u_ila_0*}] \
  -filter {REF_PIN_NAME == D}]
set endpoint_kind "D"
if {$ila_endpoints == ""} {
  set ila_endpoints [get_pins -quiet -of_objects [get_cells -quiet u_ila_0] \
    -filter {REF_PIN_NAME =~ probe*}]
  set endpoint_kind "probe"
}
if {$ila_endpoints == ""} {
  error "ILA u_ila_0 not found (no D or probe pins)"
}
puts "ILA CDC endpoints: [llength $ila_endpoints] $endpoint_kind pin(s)"

# Only clocks that actually drive startpoints into the ILA (-reset_path overrides island set_max_delay 0).
set n_applied 0
set src_clks [get_clocks -quiet -of_objects [all_fanin -flat -startpoints_only $ila_endpoints]]
foreach src_clk $src_clks {
  set src_clk_name [get_property NAME $src_clk]
  if {[lsearch -exact $ila_clk_names $src_clk_name] < 0} {
    puts "ILA CDC: $src_clk_name -> {$ila_clk_names}, set_max_delay -datapath_only -reset_path $ila_period"
    set_max_delay -datapath_only -reset_path -from $src_clk -to $ila_endpoints $ila_period
    incr n_applied
  }
}

puts "Applied $n_applied ILA CDC set_max_delay constraint(s)."
