# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

## @section Carfield emulation

#
# Makefile variables (user inputs are in capital letters)
#

VIVADO   ?= vitis-2020.2 vivado

XILINX_PROJECT ?= carfield
# XILINX_FLAVOR in {vanilla,bd} see carfield_bd.mk
XILINX_FLAVOR  ?= bd
# Board in {vcu128, vcu118}
XILINX_BOARD   ?= vcu128

XILINX_PORT       ?= 3121
XILINX_FPGA_PATH  ?= xilinx_tcf/Xilinx/*
XILINX_HOST       ?= localhost
XILINX_BOOT_ETH   ?= 0

ifeq ($(XILINX_BOARD),vcu128)
	xilinx_part       := xcvu37p-fsvh2892-2L-e
	xilinx_board_long := xilinx.com:vcu128:part0:1.0
endif

ifeq ($(XILINX_BOARD),vcu118)
	xilinx_part       := xcvu9p-flga2104-2L-e
	xilinx_board_long := xilinx.com:vcu118:part0:2.4
endif

XILINX_USE_ARTIFACTS ?= 0
XILINX_ARTIFACTS_ROOT ?=
XILINX_ELABORATION_ONLY ?= 0
XILINX_CHECK_TIMING ?= 0

VIVADO_MODE  ?= batch
VIVADO_FLAGS ?= -nojournal -mode $(VIVADO_MODE)

xilinx_ip_dir := $(CAR_XIL_DIR)/xilinx_ips
xilinx_bit := $(CAR_XIL_DIR)/out/$(XILINX_PROJECT)_$(XILINX_FLAVOR)_$(XILINX_BOARD)_$(CARFIELD_CONFIG).bit

#
# Include other makefiles flavors
#

include $(CAR_XIL_DIR)/flavor_vanilla/flavor_vanilla.mk
include $(CAR_XIL_DIR)/flavor_bd/flavor_bd.mk

#
# Flavor dependant variables
#

vivado_env := $(vivado_env_$(XILINX_FLAVOR))
xilinx_targs := $(xilinx_targs_$(XILINX_FLAVOR))
xilinx_defs := $(xilinx_defs_$(XILINX_FLAVOR))

#
# IPs compile rules
#

# Note: at the moment xilinx_ips uses vivado_env defined above,
# but it could re-define its own vivado_env and xilinx_targs
include $(CAR_XIL_DIR)/xilinx_ips/xilinx_ips.mk

#
# Top level compile rules
#

# Copy bitstream and probe file to final output location (/target/xilinx/out)
$(CAR_XIL_DIR)/out/%.bit: $(xilinx_bit_$(XILINX_FLAVOR))
	mkdir -p $(CAR_XIL_DIR)/out/
	if [ "$(XILINX_ELABORATION_ONLY)" -eq "0" ]; then \
		cp $< $@; \
		cp $(patsubst %.bit,%.ltx,$< $@); \
	fi

## Build bitstream for Carfield
## @param XILINX_PROJECT The name of the Xilinx project
## @param XILINX_FLAVOR=<vanilla|bd> The flavor of the implementation
## @param XILINX_BOARD The target Xilinx board
## @param CARFIELD_CONFIG The SoC configuration to be used
car-xil-all: $(xilinx_bit)

## Program last bitstream for Carfield
## @param VIVADO The Vivado version in use
## @param XILINX_BOARD The target Xilinx board to be programmed
## @param VIVADO_FLAGS Some flags for Vivado, such as batch or gui mode
car-xil-program:
	@echo "Programming board $(XILINX_BOARD) ($(xilinx_part))"
	$(vivado_env) $(VIVADO) $(VIVADO_FLAGS) -source $(CAR_XIL_DIR)/scripts/program.tcl

## Flash Linux image on Cheshire
## @param VIVADO The Vivado version in use
## @param XILINX_BOARD The target Xilinx board to be programmed
## @param XILINX_FLAVOR=<vanilla|bd> The flavor of the implementation.
## @param VIVADO_FLAGS Some flags for Vivado, such as batch or gui mode
car-xil-flash: $(CAR_SW_DIR)/boot/linux_carfield_$(XILINX_FLAVOR).gpt.bin
	$(vivado_env) FILE=$< OFFSET=0 $(VIVADO) $(VIVADO_FLAGS) -source $(CAR_XIL_DIR)/scripts/flash_spi.tcl

## Clean Xilinx artifacts for all implementations
car-xil-clean: car-xil-clean-vanilla car-xil-clean-bd xilinx-ip-clean-all

.PHONY: car-xil-program car-xil-flash car-xil-clean car-xil-all
