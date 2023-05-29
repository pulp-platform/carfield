# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Luca Valente <luca.valente@unibo.it>
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
# Yvan Tortorella <yvan.tortorella@unibo.it>

CAR_ROOT ?= .
CHS_ROOT ?= $(CAR_ROOT)/cheshire
CAR_SW_DIR := $(CAR_ROOT)/sw

# Bender
BENDER   ?= bender
QUESTA   ?= questa-2022.3
TBENCH   ?= tb_carfield_soc
BOOTMODE ?= 0 # default passive bootmode
PRELMODE ?= 1 # default serial link preload
VOPTARGS ?=

# Include cheshire's makefrag only if the dependency was cloned
-include $(CHS_ROOT)/cheshire.mk

# Spatz
SPATZ_ROOT ?= $(CAR_ROOT)/spatz
SPATZ_MAKEDIR := $(SPATZ_ROOT)/hw/system/spatz_cluster

TESTNAME ?= helloworld
MEMTYPE  ?= spm
CHS_BINARY   ?= $(CHS_ROOT)/sw/tests/hostd/$(TESTNAME).car.$(MEMTYPE).elf
SECD_BINARY  ?= # TODO: secd sw root
SAFED_BINARY ?= # TODo: safed sw root
CHS_IMAGE    ?=

# Include bender targets and defines for common usage and synth verification
# (the following includes are mandatory)
include $(CAR_ROOT)/bender-common.mk
include $(CAR_ROOT)/bender-synth.mk

# Setup Virtual Environment for python scripts (reggen)
VENVDIR?=$(WORKDIR)/.venv
REQUIREMENTS_TXT?=$(wildcard requirements.txt)
include $(CAR_ROOT)/utils/venv.mk

# bender targets
TARGETS += -t sim
TARGETS += -t test
TARGETS += -t rtl
TARGETS += -t integer_cluster
TARGETS += -t cv64a6_imafdcsclic_sv39
TARGETS += -t simulation
TARGETS += $(common_targs)

# bender defines
DEFINES += $(common_defs)

ifdef gui
	VSIM_FLAG :=
	RUN_AND_EXIT := run -all
else
	VSIM_FLAG := -c
	RUN_AND_EXIT := run -all; exit
endif

######################
# Nonfree components #
######################

CAR_NONFREE_REMOTE ?= git@iis-git.ee.ethz.ch:carfield/carfield-nonfree.git
CAR_NONFREE_COMMIT ?= 7250f3ccfe044e67f56003ab22740c5b748b9a26

## Clone the non-free verification IP for the Carfield TB
car-nonfree-init:
	git clone $(CAR_NONFREE_REMOTE) nonfree
	cd nonfree && git checkout $(CAR_NONFREE_COMMIT)
	cd nonfree/intel16 && icdesign intel16 -update all -nogui

-include nonfree/nonfree.mk

############
# Build SW #
############

include $(CAR_SW_DIR)/sw.mk

##############
# Simulation #
##############
.PHONY: hw/regs/carfield_regs.hjson
hw/regs/carfield_regs.hjson: hw/regs/carfield_regs.csv | venv
	$(VENV)/python ./scripts/csv_to_json.py --input $< --output $@

.PHONY: hw/regs/carfield_reg_pkg.sv hw/regs/carfield_reg_top.sv
hw/regs/carfield_reg_pkg.sv hw/regs/carfield_reg_top.sv: hw/regs/carfield_regs.hjson | venv
	$(VENV)/python utils/reggen/regtool.py -r $< --outdir $(dir $@)

## @section Carfield SoC HW Generation
.PHONY: regenerate_soc_regs
## Regenerate the toplevel SoC Control Register file from the CSV description of all registers in
## hw/regs/carfield_regs.csv. You don't have to run this target unless you changed the CSV file. The
## checked-in pregenerated register file RTL should be up-to-date. If you regenerate the regfile, do
## not forget to check in the generated RTL.
regenerate_soc_regs: hw/regs/carfield_reg_pkg.sv hw/regs/carfield_reg_top.sv

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

.PHONY: scripts/carfield_compile.tcl
scripts/carfield_compile.tcl:
	$(BENDER) script vsim $(TARGETS) $(DEFINES) --vlog-arg="$(VLOG_ARGS)" > $@
	echo 'vlog "$(CURDIR)/$(CHS_ROOT)/target/sim/src/elfloader.cpp" -ccflags "-std=c++11"' >> $@

## @section Carfield SoC Simulation
## Compile the Carfield RTL using Questasim. In order to compile the TB you first have to run the
## car-nonfree-init target.
car-hw-build: scripts/carfield_compile.tcl
	$(QUESTA) vsim -c -do "source scripts/carfield_compile.tcl; exit"

.PHONY: car-hw-sim
## Run simulation of the carfield RTL.
## @param BOOTMODE=0 The bootmode of carfield.
## @param PRELMODE=1 If 1, use the serial link for memory preloading.
## @param TESTNAME=hello_wolrd The name of the test to simulate. This automatically sets the BINARY variable. Defaults to hello_world.
## @param MEMTYPE=spm The kind of memory used for preloading the test.
## @param BINARY=sw/tests/hello_world/hello_world.spm.elf The path to the elf binary to simulate. Defaults to the path of the test chosen with TESTNAME.
## @param VOPTARGS="" Additional arguments to Questa's vopt command.
## @param TBENCH=tb_carfield_soc The toplevel testbench to use. Defaults to 'tb_carfield_soc'.
car-hw-sim:
	$(QUESTA) vsim $(VSIM_FLAG) -do "set BOOTMODE $(BOOTMODE); set PRELMODE $(PRELMODE); set CHS_BINARY $(CHS_BINARY); set SECD_BINARY $(SECD_BINARY); set SAFED_BINARY $(SAFED_BINARY); set VOPTARGS $(VOPTARGS); set CHS_IMAGE $(CHS_IMAGE); set TESTBENCH $(TBENCH); source scripts/start_carfield.tcl ; add log -r sim:/$(TBENCH)/*; $(RUN_AND_EXIT)"

.PHONY: car-hw-clean
## Remove all simulation build artifacts
car-hw-clean:
	rm -rf *.ini trace* *.wlf transcript work

## @section Carfield SoC Dependency Management
.PHONY: car-update-dps
## Update and re-resove all IP dependencies. Bender will try to resolve dependency conflicts with
## semantic versioning and the Bender.local file that contains overrides. You should run this target
## only if you changed the Bender.yml file and updated the version of some sub-IP. This will
## regenerate the Bender.lock. Once you resolved all remaining dependency conflicts you must commit
## the udpated Bender.lock file to keep the pinned IP versions in line with the Bender.yml file.
car-update-deps:
	$(BENDER) update

.PHONY: car-checkout-deps
## Checkout all IP dependencies that are currently pinned in the Bender.lock file. This command will
## not re-resolve dependencies but use the exact versions checked into the repository through the
## lock file. Use the car-update-deps target to update all IPs to the latest version and to
## regenerate the lock file.
car-checkout-deps:
	$(BENDER) checkout
	touch Bender.lock

car-checkout: car-checkout-deps

car-init: $(CAR_ROOT)/tb/hyp_vip car-checkout spatz-init chs-init

spatz-init:
	$(MAKE) -C $(SPATZ_MAKEDIR) -B SPATZ_CLUSTER_CFG=carfield.hjson bootrom

.PHONY: chs-init
chs-init:
	$(MAKE) -B chs-hw-all
	$(MAKE) -B chs-sim-all
	$(MAKE) -B chs-sw-all

############
# RTL LINT #
############
SPYGLASS_TARGS += $(common_targs)
SPYGLASS_TARGS += $(synth_targs)
SPYGLASS_DEFS += $(common_defs)
SPYGLASS_DEFS += $(synth_defs)

## @section Carfield SoC Utilities

## Run Spyglass Lint on the entire RTL
lint:
	$(MAKE) -C scripts lint bender_defs="$(SPYGLASS_DEFS)" bender_targs="$(SPYGLASS_TARGS)" > make.log

# Setup Autodocumentation of the Makefile
HELP_TITLE="Carfield Open-Source RTL"
HELP_DESCRIPTION="Hardware generation and simulation targets for Carfield"
include $(CAR_ROOT)/utils/help.mk
.DEFAULT_GOAL := help
