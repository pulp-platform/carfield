# Copyright 2023 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Maicol Ciani <maicol.ciani@unibo.it>

set partNumber $::env(XILINX_PART)
set boardName  $::env(XILINX_BOARD)


create_project xilinx_rom_bank_8192x40 . -part $partNumber
set_property board_part $boardName [current_project]

create_ip -name dist_mem_gen -vendor xilinx.com -library ip -version 8.0 -module_name xilinx_rom_bank_8192x40
set_property -dict [list CONFIG.depth {8192} \
                         CONFIG.data_width {40} \
                         CONFIG.memory_type {rom} \
                         CONFIG.input_options {registered} \
                         CONFIG.output_options {non_registered} \
                         CONFIG.single_port_output_clock_enable {false} \
                         CONFIG.default_data {ffffffff} \
                   ] [get_ips  xilinx_rom_bank_8192x40]

exec cp boot_rom.coe xilinx_rom_bank_8192x40.srcs/sources_1/ip/boot_rom.coe
set_property -dict [list CONFIG.coefficient_file {../boot_rom.coe}] [get_ips xilinx_rom_bank_8192x40]
generate_target all [get_files ./xilinx_rom_bank_8192x40.srcs/sources_1/ip/xilinx_rom_bank_8192x40/xilinx_rom_bank_8192x40.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./xilinx_rom_bank_8192x40.srcs/sources_1/ip/xilinx_rom_bank_8192x40/xilinx_rom_bank_8192x40.xci]
launch_run -jobs 8 xilinx_rom_bank_8192x40_synth_1
wait_on_run xilinx_rom_bank_8192x40_synth_1
