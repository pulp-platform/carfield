create_clock -name carfield_ooc_synth_clk_100 -period 100 [get_ports clk_100]
create_clock -name carfield_ooc_synth_clk_50 -period 50 [get_ports clk_50]
create_clock -name carfield_ooc_synth_clk_20 -period 20 [get_ports clk_20]
create_clock -name carfield_ooc_synth_clk_10 -period 10 [get_ports clk_10]
set_case_analysis 0 [get_ports testmode_i]

set_clock_groups -name async_clks -asynchronous \
-group [get_clocks -include_generated_clocks carfield_ooc_synth_clk_100] \
-group [get_clocks -include_generated_clocks carfield_ooc_synth_clk_50] \
-group [get_clocks -include_generated_clocks carfield_ooc_synth_clk_20] \
-group [get_clocks -include_generated_clocks carfield_ooc_synth_clk_10]
