# Copyright 2023 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#

set partNumber $::env(XILINX_PART)
set boardName  $::env(XILINX_BOARD)

set ipName xlnx_clk_wiz

create_project $ipName . -force -part $partNumber
set_property board_part $boardName [current_project]

create_ip -name clk_wiz -vendor xilinx.com -library ip -version 6.0 -module_name $ipName

if {$::env(BOARD) eq "vcu128"} {
    set_property -dict  [list CONFIG.CLK_IN1_BOARD_INTERFACE {default_100mhz_clk} \
                              CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {20.000} \
                              CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
                              CONFIG.MMCM_DIVCLK_DIVIDE {5} \
                              CONFIG.MMCM_CLKFBOUT_MULT_F {52.375} \
                              CONFIG.MMCM_CLKOUT0_DIVIDE_F {52.375} \
                              CONFIG.CLKOUT1_JITTER {294.871} \
                              CONFIG.CLKOUT1_PHASE_ERROR {297.237}
                        ] [get_ips $ipName]

}
if {$::env(BOARD) eq "zcu102"} {
    set_property -dict  [list CONFIG.CLK_IN1_BOARD_INTERFACE {user_si570_sysclk} \
                              CONFIG.RESET_BOARD_INTERFACE {Custom} \
                              CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50.000} \
                              CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
                              CONFIG.CLKIN1_JITTER_PS {33.330000000000005} \
                              CONFIG.MMCM_CLKFBOUT_MULT_F {4.000} \
                              CONFIG.MMCM_CLKIN1_PERIOD {3.333} \
                              CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
                              CONFIG.MMCM_CLKOUT0_DIVIDE_F {24.000} \
                              CONFIG.CLKOUT1_JITTER {116.415} \
                              CONFIG.CLKOUT1_PHASE_ERROR {77.836}
                        ] [get_ips $ipName]
}
if {$::env(BOARD) eq "genesys2"} {
    set_property -dict  [list CONFIG.CLK_IN1_BOARD_INTERFACE {sys_diff_clock} \
                              CONFIG.RESET_BOARD_INTERFACE {Custom} \
                              CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {20.000} \
                              CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
                              CONFIG.CLKIN1_JITTER_PS {50.0} \
                              CONFIG.MMCM_CLKFBOUT_MULT_F {4.250} \
                              CONFIG.MMCM_CLKIN1_PERIOD {5.000} \
                              CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
                              CONFIG.MMCM_CLKOUT0_DIVIDE_F {42.500} \
                              CONFIG.CLKOUT1_JITTER {155.788} \
                              CONFIG.CLKOUT1_PHASE_ERROR {94.329}
                        ] [get_ips $ipName]
}

generate_target {instantiation_template} [get_files ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
generate_target all [get_files  ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./$ipName.srcs/sources_1/ip/$ipName/$ipName.xci]
launch_run -jobs 8 ${ipName}_synth_1
wait_on_run ${ipName}_synth_1
