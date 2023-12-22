# Copyright 2024 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

## @section Carfield platform simulation

QUESTA ?= questa-2023.4
TBENCH ?= tb_carfield_soc

## Get HyperRAM verification IP (VIP) for simulation
$(CAR_TGT_DIR)/sim/src/hyp_vip:
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

CAR_SIM_ALL += $(CHS_ROOT)/target/sim/models/s25fs512s.v
CAR_SIM_ALL += $(CHS_ROOT)/target/sim/models/24FC1025.v
CAR_SIM_ALL += $(CAR_TGT_DIR)/sim/src/hyp_vip

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
	VOPT_FLAGS := $(QUESTA_FLAGS) +acc
else
	VOPT_FLAGS := $(QUESTA_FLAGS) -O5 +acc=p+$(TBENCH). +noacc=p+carfield.
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

## Compile Carfield HW using Questasim
car-vsim-sim-build: car-vsim-sim-init
	cd $(CAR_VSIM_DIR); $(QUESTA) vsim -c -do "quit -code [source $(CAR_VSIM_DIR)/compile.carfield_soc.tcl]"

.PHONY: car-vsim-sim-clean
## Remove all Questasim simulation build artifacts
car-vsim-sim-clean:
	cd $(CAR_VSIM_DIR); rm -rf *.ini trace* *.wlf $(CAR_VSIM_DIR)/transcript $(CAR_VSIM_DIR)/work

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
.PHONY: car-sim-init car-sim-build car-sim-clean

## Generate all required VIPs and compilation scripts for all supported simulators
car-sim-init: car-vsim-sim-init

## Compile Carfield HW using all supported simulators
car-sim-build: car-vsim-sim-build

## Remove all simulation build artifacts from all supported simulators
car-sim-clean: car-vsim-sim-clean
