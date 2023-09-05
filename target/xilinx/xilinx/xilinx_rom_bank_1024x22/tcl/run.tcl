# Copyright 2023 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Maicol Ciani <maicol.ciani@unibo.it>

set partNumber $::env(XILINX_PART)
set boardName  $::env(XILINX_BOARD)


create_project xilinx_rom_bank_1024x22 . -part $partNumber
set_property board_part $boardName [current_project]


create_ip -name dist_mem_gen -vendor xilinx.com -library ip -version 8.0 -module_name xilinx_rom_bank_1024x22
set_property -dict [list CONFIG.depth {1024} \
                         CONFIG.data_width {22} \
                         CONFIG.memory_type {rom} \
                         CONFIG.input_options {registered} \
                         CONFIG.output_options {non_registered} \
                         CONFIG.single_port_output_clock_enable {false} \
                         CONFIG.default_data {00000000} \
                   ] [get_ips  xilinx_rom_bank_1024x22]

exec cp otp.coe xilinx_rom_bank_1024x22.srcs/sources_1/ip/otp.coe
set_property -dict [list CONFIG.coefficient_file {../otp.coe}] [get_ips xilinx_rom_bank_1024x22]
generate_target all [get_files ./xilinx_rom_bank_1024x22.srcs/sources_1/ip/xilinx_rom_bank_1024x22/xilinx_rom_bank_1024x22.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./xilinx_rom_bank_1024x22.srcs/sources_1/ip/xilinx_rom_bank_1024x22/xilinx_rom_bank_1024x22.xci]
launch_run -jobs 8 xilinx_rom_bank_1024x22_synth_1
wait_on_run xilinx_rom_bank_1024x22_synth_1
