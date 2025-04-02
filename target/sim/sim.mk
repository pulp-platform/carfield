# Copyright 2024 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

## @section Carfield platform simulation

QUESTA ?= questa-2023.4
TBENCH ?= tb_carfield_soc

## Get HyperRAM verification IP (VIP) for simulation
# Forward relevant Hyperbus targets
$(HYP_ROOT)/models/s27ks0641/s27ks0641.v:
	@echo "[PULP] Fetch Hyperbus model"
	@$(MAKE) -C $(HYP_ROOT) models/s27ks0641 > /dev/null

$(CAR_TGT_DIR)/sim/models/s27ks0641.sdf: $(HYP_ROOT)/models/s27ks0641/s27ks0641.v
	mkdir -p $(dir $@)
	cp $(HYP_ROOT)/models/s27ks0641/s27ks0641.sdf $@
	sed -i "s|(INSTANCE dut)|(INSTANCE i_hyper)|g" $@
	sed -i "s|(INSTANCE dut/|(INSTANCE |g" $@

CAR_SIM_ALL += $(CHS_ROOT)/target/sim/models/s25fs512s.v
CAR_SIM_ALL += $(CHS_ROOT)/target/sim/models/24FC1025.v
CAR_SIM_ALL += $(HYP_ROOT)/models/s27ks0641/s27ks0641.v
CAR_SIM_ALL += $(CAR_TGT_DIR)/sim/models/s27ks0641.sdf

# Defines for hyperram model preload at time 0
HYP_USER_PRELOAD      ?= 0
HYP0_PRELOAD_MEM_FILE ?= ""
HYP1_PRELOAD_MEM_FILE ?= ""

RUNTIME_DEFINES := +define+HYP_USER_PRELOAD="$(HYP_USER_PRELOAD)"
RUNTIME_DEFINES += +define+HYP0_PRELOAD_MEM_FILE=\"$(HYP0_PRELOAD_MEM_FILE)\"
RUNTIME_DEFINES += +define+HYP1_PRELOAD_MEM_FILE=\"$(HYP1_PRELOAD_MEM_FILE)\"

#############
# Questasim #
#############

## @section Questasim simulator target

QUESTA_FLAGS := -permissive -suppress 3009 -suppress 8386 -error 7 +UVM_NO_RELNOTES
ifdef DEBUG
	VOPT_FLAGS := $(QUESTA_FLAGS) +acc -sdf
	VSIM_FLAGS := $(QUESTA_FLAGS)
	RUN_AND_EXIT := log -r /*; run -all
else
	VOPT_FLAGS := $(QUESTA_FLAGS) -O5 +acc=p+$(TBENCH). +noacc=p+carfield. -sdf
	VSIM_FLAGS := $(QUESTA_FLAGS) -c
	RUN_AND_EXIT := run -all; exit
endif

.PHONY: $(CAR_VSIM_DIR)/compile.carfield_soc.tcl
$(CAR_VSIM_DIR)/compile.carfield_soc.tcl:
	$(BENDER) script vsim $(common_targs) $(sim_targs) $(common_defs) $(safed_defs) --vlog-arg="$(RUNTIME_DEFINES)" --compilation-mode separate > $@
	echo 'vlog "$(CHS_ROOT)/target/sim/src/elfloader.cpp" -ccflags "-std=c++11"' >> $@
	echo 'vopt $(VOPT_FLAGS) $(TBENCH) -o $(TBENCH)_opt' >> $@

CAR_VSIM_ALL += $(CAR_SIM_ALL)
CAR_VSIM_ALL += $(CAR_VSIM_DIR)/compile.carfield_soc.tcl

## Generate all required VIPs (SPI flash, I2c EEPROm, HyperRAM, etc) and compilation scripts for Questasim
.PHONY: car-vsim-sim-init
car-vsim-sim-init: $(CAR_VSIM_ALL) 

## Compile Carfield HW using Questasim. Run `make car-sim-init` from the root directory to prepare
## the simulation environment before running this command.
.PHONY: car-vsim-sim-build
car-vsim-sim-build: $(CAR_VSIM_DIR)/compile.carfield_soc.tcl
	cd $(CAR_VSIM_DIR); $(QUESTA) vsim -c -do "quit -code [source $<]"

.PHONY: car-vsim-sim-clean
## Remove all Questasim simulation build artifacts
car-vsim-sim-clean:
	rm -rf $(CAR_VSIM_DIR)/uart $(CAR_VSIM_DIR)/FETCH* $(CAR_VSIM_DIR)/logs $(CAR_VSIM_DIR)/*.ini $(CAR_VSIM_DIR)/trace* $(CAR_VSIM_DIR)/*.wlf $(CAR_VSIM_DIR)/transcript $(CAR_VSIM_DIR)/work

.PHONY: car-vsim-sim-run
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
	$(eval CHS_BINARY_ABS := $(realpath $(CHS_BINARY)))
	$(eval CHS_IMAGE_ABS := $(realpath $(CHS_IMAGE)))
	$(eval SECD_BINARY_ABS := $(realpath $(SECD_BINARY)))
	$(eval SECD_IMAGE_ABS := $(realpath $(SECD_IMAGE)))
	$(eval SAFED_BINARY_ABS := $(realpath $(SAFED_BINARY)))
	$(eval PULPD_BINARY_ABS := $(realpath $(PULPD_BINARY)))
	$(eval SPATZD_BINARY_ABS := $(realpath $(SPATZD_BINARY)))
	cd $(CAR_VSIM_DIR); $(QUESTA) vsim $(VSIM_FLAGS) -do \
		"set HYP_USER_PRELOAD $(HYP_USER_PRELOAD); \
		 set SECURE_BOOT $(SECURE_BOOT); \
		 set CHS_BOOTMODE $(CHS_BOOTMODE); \
		 set CHS_PRELMODE $(CHS_PRELMODE); \
		 set CHS_BINARY $(CHS_BINARY_ABS); \
		 set CHS_IMAGE  $(CHS_IMAGE_ABS); \
		 set SECD_BINARY $(SECD_BINARY_ABS); \
		 set SECD_BOOTMODE $(SECD_BOOTMODE); \
		 set SECD_IMAGE $(SECD_IMAGE_ABS); \
		 set SAFED_BINARY $(SAFED_BINARY_ABS); \
		 set SAFED_BOOTMODE $(SAFED_BOOTMODE); \
		 set PULPD_BINARY $(PULPD_BINARY_ABS); \
		 set PULPD_BOOTMODE $(PULPD_BOOTMODE); \
		 set SPATZD_BINARY $(SPATZD_BINARY_ABS); \
		 set SPATZD_BOOTMODE $(SPATZD_BOOTMODE);\
		 set TESTBENCH $(TBENCH); \
		 set VSIM_FLAGS \"$(VSIM_FLAGS)\"; \
		 source $(CAR_VSIM_DIR)/start.carfield_soc.tcl ; \
		 $(RUN_AND_EXIT)"

#######
# VCS #
#######
## @section VCS simulator target

CAR_VCS_ALL += $(CAR_SIM_ALL)
# TODO

###########
# Xcelium #
###########

## @section Xcelium simulator target

CAR_XCELIUM_ALL += $(CAR_XCELIUM_ALL)
# TODO

## @section Global targets
.PHONY: car-sim-init

## Generate all required VIPs and compilation scripts for all supported simulators
car-sim-init: car-vsim-sim-init
