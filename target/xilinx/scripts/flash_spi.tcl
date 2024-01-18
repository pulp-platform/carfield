# Copyright 2020 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Nils Wistoff <nwistoff@iis.ee.ethz.ch>
# Noah Huetter <huettern@iis.ee.ethz.ch>

open_hw_manager

connect_hw_server -url $::env(XILINX_HOST):$::env(XILINX_PORT)
open_hw_target $::env(XILINX_HOST):$::env(XILINX_PORT)/$::env(XILINX_FPGA_PATH)

set file $::env(FILE)
set offset $::env(OFFSET)
set mcs_file image.mcs

if {$::env(XILINX_BOARD) eq "vcu128"} {
  set hw_device [get_hw_devices xcvu37p_0]
  set hw_mem_device [lindex [get_cfgmem_parts {mt25qu02g-spi-x1_x2_x4}] 0]
} elseif {$::env(XILINX_BOARD) eq "vcu118"} {
  set mcs_primary_file image_primary.mcs
  set mcs_secondary_file image_secondary.mcs
  set hw_device [get_hw_devices xcvu9p_0]
  set hw_mem_device [lindex [get_cfgmem_parts {mt25qu01g-spi-x1_x2_x4_x8}] 0]
}

# Create flash configuration file
if {$::env(XILINX_BOARD) eq "vcu118"} {
  write_cfgmem -force -format mcs -size 256 -interface SPIx8 \
  -loaddata "up $offset $file" \
  -checksum \
  -file $mcs_file
} else {
  write_cfgmem -force -format mcs -size 256 -interface SPIx4 \
  -loaddata "up $offset $file" \
  -checksum \
  -file $mcs_file
}

set_property PARAM.FREQUENCY 15000000 [get_hw_targets *]

create_hw_cfgmem -hw_device $hw_device $hw_mem_device
set hw_cfgmem [get_property PROGRAM.HW_CFGMEM $hw_device]
set_property PROGRAM.ADDRESS_RANGE  {use_file} $hw_cfgmem
if {$::env(XILINX_BOARD) eq "vcu118"} {
 set_property PROGRAM.FILES [list $mcs_primary_file $mcs_secondary_file] $hw_cfgmem
} else {
 set_property PROGRAM.FILES [list $mcs_file ] $hw_cfgmem
}
set_property PROGRAM.PRM_FILE {} $hw_cfgmem
set_property PROGRAM.UNUSED_PIN_TERMINATION {pull-none} $hw_cfgmem
set_property PROGRAM.BLANK_CHECK  0 $hw_cfgmem
set_property PROGRAM.ERASE  1 $hw_cfgmem
set_property PROGRAM.CFG_PROGRAM  1 $hw_cfgmem
set_property PROGRAM.VERIFY  1 $hw_cfgmem
set_property PROGRAM.CHECKSUM  0 $hw_cfgmem

# Create bitstream to access SPI flash
create_hw_bitstream -hw_device $hw_device [get_property PROGRAM.HW_CFGMEM_BITFILE $hw_device];
program_hw_devices $hw_device;
refresh_hw_device $hw_device;

# Program SPI flash
program_hw_cfgmem -hw_cfgmem $hw_cfgmem
