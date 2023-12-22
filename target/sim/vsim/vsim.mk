# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

# Default variable values for RTL simulation
TBENCH         ?= tb_carfield_soc

# Defines for hyperram model preload at time 0
HYP_USER_PRELOAD      ?= 0
ifeq ($(HYP_USER_PRELOAD), 1)
	HYP0_PRELOAD_MEM_FILE ?= "$(CAR_ROOT)/sw/tests/bare-metal/pulpd/$(PULPD_TEST_NAME).hyperram0.slm"
	HYP1_PRELOAD_MEM_FILE ?= "$(CAR_ROOT)/sw/tests/bare-metal/pulpd/$(PULPD_TEST_NAME).hyperram1.slm"
else
	HYP0_PRELOAD_MEM_FILE ?= ""
	HYP1_PRELOAD_MEM_FILE ?= ""
endif

RUNTIME_DEFINES := +define+HYP_USER_PRELOAD="$(HYP_USER_PRELOAD)"
RUNTIME_DEFINES += +define+HYP0_PRELOAD_MEM_FILE=\"$(HYP0_PRELOAD_MEM_FILE)\"
RUNTIME_DEFINES += +define+HYP1_PRELOAD_MEM_FILE=\"$(HYP1_PRELOAD_MEM_FILE)\"

QUESTA_FLAGS := -permissive -suppress 3009 -suppress 8386 -error 7 +UVM_NO_RELNOTES
ifdef DEBUG
	VOPT_FLAGS := $(QUESTA_FLAGS) +acc
	VSIM_FLAGS := $(QUESTA_FLAGS)
	RUN_AND_EXIT := log -r /*; run -all
else
	VOPT_FLAGS := $(QUESTA_FLAGS) -O5 +acc=p+tb_carfield_soc. +noacc=p+carfield.
	VSIM_FLAGS := $(QUESTA_FLAGS) -c
	RUN_AND_EXIT := run -all; exit
endif

$(CAR_ROOT)/tb/hyp_vip:
	rm -rf $@
	mkdir $@
	rm -rf model_tmp && mkdir model_tmp
	cd model_tmp; wget https://www.infineon.com/dgdl/Infineon-S27KL0641_S27KS0641_VERILOG-SimulationModels-v05_00-EN.zip?fileId=8ac78c8c7d0d8da4017d0f6349a14f68
	cd model_tmp; mv 'Infineon-S27KL0641_S27KS0641_VERILOG-SimulationModels-v05_00-EN.zip?fileId=8ac78c8c7d0d8da4017d0f6349a14f68' model.zip
	cd model_tmp; unzip model.zip
	cd model_tmp; mv 'S27KL0641 S27KS0641' exe_folder
	cd model_tmp/exe_folder; unzip S27ks0641.exe
	cp model_tmp/exe_folder/S27ks0641/model/s27ks0641.v model_tmp/exe_folder/S27ks0641/model/s27ks0641_verilog.sdf $@
	rm -rf model_tmp

.PHONY: $(CAR_VSIM_DIR)/compile.carfield_soc.tcl
$(CAR_VSIM_DIR)/compile.carfield_soc.tcl:
	$(BENDER) script vsim $(common_targs) $(sim_targs) $(common_defs) $(safed_defs) --vlog-arg="$(VLOG_ARGS) $(RUNTIME_DEFINES)" --compilation-mode separate > $@
	echo 'vlog "$(CHS_ROOT)/target/sim/src/elfloader.cpp" -ccflags "-std=c++11"' >> $@
	echo 'vopt $(VOPT_FLAGS) $(TBENCH) -o $(TBENCH)_opt' >> $@

.PHONY: car-sim-init
car-sim-init: chs-sim-init $(CAR_ROOT)/tb/hyp_vip $(CAR_VSIM_DIR)/compile.carfield_soc.tcl

## @section Carfield SoC Simulation
## Compile the Carfield RTL using Questasim.
car-hw-build: car-sim-init
	$(QUESTA) vsim -c -do "quit -code [source $(CAR_VSIM_DIR)/compile.carfield_soc.tcl]"

.PHONY: car-hw-sim
## Run simulation of the carfield RTL.
## @param BOOTMODE=0 The bootmode of carfield.
## @param PRELMODE=1 If 1, use the serial link for memory preloading.
## @param TESTNAME=hello_wolrd The name of the test to simulate. This automatically sets the BINARY variable. Defaults to hello_world.
## @param MEMTYPE=spm The kind of memory used for preloading the test.
## @param BINARY=sw/tests/hello_world/hello_world.spm.elf The path to the elf binary to simulate. Defaults to the path of the test chosen with TESTNAME.
## @param TBENCH=tb_carfield_soc_opt The optimised toplevel testbench to use. Defaults to 'tb_carfield_soc_opt'.
## @param VSIM_FLAGS the flags for the vsim invocation
car-hw-sim:
	$(QUESTA) vsim $(VSIM_FLAGS) -do \
		"set HYP_USER_PRELOAD $(HYP_USER_PRELOAD); \
		 set SECURE_BOOT $(SECURE_BOOT); \
		 set CHS_BOOTMODE $(CHS_BOOTMODE); \
		 set CHS_PRELMODE $(CHS_PRELMODE); \
		 set CHS_BINARY ../../../$(CHS_BINARY); \
		 set CHS_IMAGE $(CHS_IMAGE); \
		 set SECD_BINARY ../../../$(SECD_BINARY); \
		 set SECD_BOOTMODE $(SECD_BOOTMODE); \
		 set SECD_IMAGE $(SECD_IMAGE); \
		 set SAFED_BOOTMODE $(SAFED_BOOTMODE); \
		 set SAFED_BINARY ../../../$(SAFED_BINARY); \
		 set PULPD_BOOTMODE $(PULPD_BOOTMODE); \
		 set PULPD_BINARY ../../../$(PULPD_BINARY); \
		 set SPATZD_BINARY ../../../$(SPATZD_BINARY); \
		 set SPATZD_BOOTMODE $(SPATZD_BOOTMODE);\
		 set TESTBENCH $(TBENCH); \
		 set VSIM_FLAGS \"$(VSIM_FLAGS)\"; \
		 source $(CAR_VSIM_DIR)/start.carfield_soc.tcl ; \
		 $(RUN_AND_EXIT)"

.PHONY: chs-sim-init
## Downloads verification IPs for SPI and I2C from cheshire and used by Carfield.
chs-sim-init:
	$(MAKE) chs-sim-all

.PHONY: car-hw-clean
## Remove all simulation build artifacts
car-hw-clean:
	rm -rf *.ini trace* *.wlf transcript work
