# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

#
# Makefile variables (user inputs are in capital letters)
#

XILINX_PROJECT ?= carfield
# XILINX_FLAVOR in {vanilla,bd} see carfield_bd.mk
XILINX_FLAVOR  ?= bd
# XILINX_BOARD in {vcu128, vcu118}
XILINX_BOARD   ?= vcu128

ifeq ($(XILINX_BOARD),vcu128)
	xilinx_part       := xcvu37p-fsvh2892-2L-e
	xilinx_board_long := xilinx.com:vcu128:part0:1.0
	XILINX_PORT       ?= 3232
	XILINX_FPGA_PATH  ?= xilinx_tcf/Xilinx/091847100638A
	XILINX_HOST       ?= bordcomputer
endif

ifeq ($(XILINX_BOARD),vcu118)
	xilinx_part       := xcvu9p-flga2104-2L-e
	xilinx_board_long := xilinx.com:vcu118:part0:2.4
	XILINX_PORT 	  ?= 3249
	XILINX_FPGA_PATH  ?= xilinx_tcf/Digilent/210308A3B1D8
	XILINX_HOST       ?= bordcomputer
endif

XILINX_USE_ARTIFACTS ?= 0
XILINX_ARTIFACTS_ROOT ?=
XILINX_ELABORATION_ONLY ?= 0
XILINX_CHECK_TIMING ?= 0

VIVADO_MODE  ?= batch
VIVADO_FLAGS ?= -nojournal -mode $(VIVADO_MODE)

xilinx_ip_dir := $(CAR_XIL_DIR)/xilinx_ips
xilinx_bit := $(CAR_XIL_DIR)/out/$(XILINX_PROJECT)_$(XILINX_FLAVOR)_$(XILINX_BOARD).bit

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

# Build bitstream
car-xil-all: $(xilinx_bit)

# Program last bitstream
car-xil-program:
	@echo "Programming board $(XILINX_BOARD) ($(xilinx_part))"
	$(vivado_env) $(VIVADO) $(VIVADO_FLAGS) -source $(CAR_XIL_DIR)/scripts/program.tcl

# Flash linux image
car-xil-flash: $(CAR_SW_DIR)/boot/linux_carfield_$(XILINX_FLAVOR)_$(XILINX_BOARD).gpt.bin
	$(vivado_env) FILE=$< OFFSET=0 $(VIVADO) $(VIVADO_FLAGS) -source $(CAR_XIL_DIR)/scripts/flash_spi.tcl

# Flash uboot image
car-xil-flash-uboot: $(CAR_SW_DIR)/boot/uboot_carfield_$(XILINX_FLAVOR)_$(XILINX_BOARD).gpt.bin
	$(vivado_env) FILE=$< OFFSET=0 $(VIVADO) $(VIVADO_FLAGS) -source $(CAR_XIL_DIR)/scripts/flash_spi.tcl

car-xil-clean: car-xil-clean-vanilla car-xil-clean-bd xilinx-ip-clean-all

.PHONY: car-xil-program car-xil-clean car-xil-all
