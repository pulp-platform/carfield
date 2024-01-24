# Copyright 2023 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

QUESTA ?= questa-2023.4
TBENCH ?= tb_carfield_soc

VSIM_ROOT_DIR = $(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

QUESTA_FLAGS := -permissive -suppress 3009 -suppress 8386 -error 7 +UVM_NO_RELNOTES
ifdef DEBUG
	VSIM_FLAGS := $(QUESTA_FLAGS)
	RUN_AND_EXIT := log -r /*; run -all
else
	VSIM_FLAGS := $(QUESTA_FLAGS) -c
	RUN_AND_EXIT := run -all; exit
endif

## Compile Carfield HW using Questasim. Run `make car-sim-init` from the root directory to prepare
## the simulation environment before running this command.
.PHONY: car-vsim-sim-build
car-vsim-sim-build: $(VSIM_ROOT_DIR)/compile.carfield_soc.tcl
	$(QUESTA) vsim -c -do "quit -code [source $<]"

.PHONY: car-vsim-sim-clean
## Remove all Questasim simulation build artifacts
car-vsim-sim-clean:
	rm -rf $(VSIM_ROOT_DIR)/*.ini $(VSIM_ROOT_DIR)/trace* $(VSIM_ROOT_DIR)/*.wlf $(VSIM_ROOT_DIR)/transcript $(VSIM_ROOT_DIR)/work

.PHONY: car-sim-vsim
## Run simulation of the carfield RTL.
## @param HYP_USER_PRELOAD=0 Whether to preload code in the HyperRAM model.
## @param CHS_BOOTMODE=0 The bootmode of host domain <0 JTAG|1 Serial Link>
## @param CHS_PRELMODE=1 If 1, use the serial link for host domain memory preloading, otherwise JTAG.
## @param CHS_BINARY=<path_to_elf> ELF to be executed on host domain
## @param CHS_IMAGE=<path_to_memh> Raw image (ROMs) or GPT disk image to be executed on Cheshire (when CHS_BOOTMODE >= 1)
## @param SECD_BINARY=<path_to_elf> ELF to be executed on the host domain
## @param SECD_IMAGE=<path_to_memh> Raw image (ROMs) or GPT disk image to be executed on Cheshire (when CHS_BOOTMODE >= 1)
## @param SECD_BOOTMODE=0 The bootmode of secure domain <0 JTAG|1 Serial Link>
## @param SAFED_BINARY=<path_to_elf> ELF to be executed on safe domain
## @param SAFED_BOOTMODE=0 The bootmode of safe domain <0 JTAG|1 Serial Link>
## @param PULPD_BINARY=<path_to_elf> ELF to be executed on integer PMCA
## @param PULPD_BOOTMODE=0 The bootmode of safe domain <0 JTAG|1 Serial Link>
## @param SPATZD_BINARY==<path_to_elf> ELF to be executed on integer PMCA
## @param SPATZD_BOOTMODE=0 The bootmode of safe domain <0 JTAG|1 Serial Link>
## @param TESTBENCH=tb_carfield_soc_opt The optimised toplevel testbench to use. Defaults to 'tb_carfield_soc_opt'.
## @param VSIM_FLAGS The flags for the vsim invocation
car-vsim-sim-run:
	$(QUESTA) vsim $(VSIM_FLAGS) -do \
		"set HYP_USER_PRELOAD $(HYP_USER_PRELOAD); \
		 set SECURE_BOOT $(SECURE_BOOT); \
		 set CHS_BOOTMODE $(CHS_BOOTMODE); \
		 set CHS_PRELMODE $(CHS_PRELMODE); \
		 set CHS_BINARY $(CHS_BINARY); \
		 set CHS_IMAGE $(CHS_IMAGE); \
		 set SECD_BINARY $(SECD_BINARY); \
		 set SECD_BOOTMODE $(SECD_BOOTMODE); \
		 set SECD_IMAGE $(SECD_IMAGE); \
		 set SAFED_BINARY $(SAFED_BINARY); \
		 set SAFED_BOOTMODE $(SAFED_BOOTMODE); \
		 set PULPD_BINARY $(PULPD_BINARY); \
		 set PULPD_BOOTMODE $(PULPD_BOOTMODE); \
		 set SPATZD_BINARY $(SPATZD_BINARY); \
		 set SPATZD_BOOTMODE $(SPATZD_BOOTMODE);\
		 set TESTBENCH $(TBENCH); \
		 set VSIM_FLAGS \"$(VSIM_FLAGS)\"; \
		 source ./start.carfield_soc.tcl ; \
		 $(RUN_AND_EXIT)"

########
# Help #
########

# Setup Autodocumentation of the Makefile
HELP_TITLE="Carfield simulation with Questasim"
HELP_DESCRIPTION="Questasim simulation targets for Carfield"
include ../../../utils/help.mk
.DEFAULT_GOAL := help
