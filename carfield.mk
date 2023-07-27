# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Luca Valente <luca.valente@unibo.it>
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
# Yvan Tortorella <yvan.tortorella@unibo.it>
# Robert Balas <balasr@iis.ee.ethz.ch>
# Manuel Eggimann <meggiman@iis.ee.ethz.ch>

CAR_ROOT ?= $(shell $(BENDER) path carfield)
CHS_ROOT ?= $(CAR_ROOT)/cheshire
CAR_SW_DIR := $(CAR_ROOT)/sw
CAR_XIL_DIR := $(CAR_ROOT)/target/xilinx
CAR_HW_DIR := $(CAR_ROOT)/hw

BENDER   ?= bender
QUESTA   ?= questa-2022.3
VIVADO   ?= vitis-2020.2 vivado
TBENCH   ?= tb_carfield_soc
VOPTARGS ?=

# Interrupt configuration in cheshire
# CLINT interruptible harts
CLINTCORES     := 3
# PLIC interruptible harts
PLICCORES      := 6
# PLIC number of input interrupts
PLIC_NUM_INTRS := 89

# Serial Link configuration in cheshire
SERIAL_LINK_NUM_BITS := 16

# Cheshire
CHS_ROOT ?= $(shell $(BENDER) path cheshire)
# Include cheshire's makefrag only if the dependency was cloned
-include $(CHS_ROOT)/cheshire.mk

CHS_BOOTMODE ?= 0 # default passive bootmode
CHS_PRELMODE ?= 1 # default serial link preload
CHS_BINARY   ?= 
CHS_IMAGE    ?=

# Safety Island
SAFED_ROOT     ?= $(shell $(BENDER) path safety_island)
SAFED_SW_DIR   := $(SAFED_ROOT)/sw
SAFED_BOOTMODE ?= 0
SAFED_BINARY   ?=

# Security island
SECD_ROOT     ?= $(shell $(BENDER) path opentitan)
SECD_BINARY   ?=
SECD_BOOTMODE ?=

# PULP cluster
PULPCL_ROOT   ?= $(shell $(BENDER) path pulp_cluster)
PULPCL_BINARY ?=

# Spatz cluster
SPATZCL_ROOT    ?= $(shell $(BENDER) path spatz)
SPATZCL_MAKEDIR := $(SPATZCL_ROOT)/hw/system/spatz_cluster
SPATZCL_BINARY  ?=

# Default variable values for RTL simulation
TBENCH         ?= tb_carfield_soc
OPTARGS        ?=

# Include bender targets and defines for common usage and synth verification
# (the following includes are mandatory)
include $(CAR_ROOT)/bender-common.mk
include $(CAR_ROOT)/bender-sim.mk
include $(CAR_ROOT)/bender-synth.mk
include $(CAR_ROOT)/bender-xilinx.mk
include $(CAR_ROOT)/bender-safed.mk

# Setup Virtual Environment for python scripts (reggen)
VENVDIR?=$(WORKDIR)/.venv
REQUIREMENTS_TXT?=$(wildcard requirements.txt)
include $(CAR_ROOT)/utils/venv.mk

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
CAR_NONFREE_COMMIT ?= df886d3eea670dffdbe4d632a64c7b123b9fac76

## Clone the non-free verification IP for the Carfield TB
car-nonfree-init:
	git clone $(CAR_NONFREE_REMOTE) $(CAR_ROOT)/nonfree
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
.PHONY: $(CAR_ROOT)/hw/regs/carfield_regs.hjson
$(CAR_ROOT)/hw/regs/carfield_regs.hjson: hw/regs/carfield_regs.csv | venv
	$(VENV)/python ./scripts/csv_to_json.py --input $< --output $@

.PHONY: $(CAR_ROOT)/hw/regs/carfield_reg_pkg.sv hw/regs/carfield_reg_top.sv
$(CAR_ROOT)/hw/regs/carfield_reg_pkg.sv $(CAR_ROOT)/hw/regs/carfield_reg_top.sv: $(CAR_ROOT)/hw/regs/carfield_regs.hjson | venv
	$(VENV)/python utils/reggen/regtool.py -r $< --outdir $(dir $@)

.PHONY: $(CAR_SW_DIR)/include/regs/soc_ctrl.h
$(CAR_SW_DIR)/include/regs/soc_ctrl.h: $(CAR_ROOT)/hw/regs/carfield_regs.hjson | venv
	$(VENV)/python utils/reggen/regtool.py -D $<  > $@

## @section Carfield SoC HW Generation
.PHONY: regenerate_soc_regs
## Regenerate the toplevel SoC Control Register file from the CSV description of all registers in
## hw/regs/carfield_regs.csv. You don't have to run this target unless you changed the CSV file. The
## checked-in pregenerated register file RTL should be up-to-date. If you regenerate the regfile, do
## not forget to check in the generated RTL.
regenerate_soc_regs: $(CAR_ROOT)/hw/regs/carfield_reg_pkg.sv $(CAR_ROOT)/hw/regs/carfield_reg_top.sv $(CAR_SW_DIR)/include/regs/soc_ctrl.h 

## @section Carfield CLINT and PLIC interruptible harts configuration

## The default configuration in cheshire allows for one interruptible hart. When the number of
## external interruptible harts is updated in the cheshire cfg (cheshire_pkg.sv), we need to
## regenerate the PLIC and CLINT accordingly.
## CLINT: define CLINTCORES used in cheshire.mk before including the makefrag.
## PLIC: edit the hjson configuration file in cheshire.
.PHONY: update_plic
update_plic: $(CHS_ROOT)/hw/rv_plic.cfg.hjson
	sed -i 's/src: .*/src: $(PLIC_NUM_INTRS),/' $<
	sed -i 's/target: .*/target: $(PLICCORES),/' $<

# @section Serial Link configuration
## The default configuration in cheshire allows for 4 data lanes for the serial link. We update the
## configuration to 8 data lanes.
.PHONY: update_serial_link
update_serial_link: $(CHS_ROOT)/hw/serial_link.hjson
	sed -i 's/\(default: "\)8/\116/' $<

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
	$(BENDER) script vsim $(common_targs) $(sim_targs) $(common_defs) $(safed_defs) --vlog-arg="$(VLOG_ARGS)" --compilation-mode separate > $@
	echo 'vlog "$(CHS_ROOT)/target/sim/src/elfloader.cpp" -ccflags "-std=c++11"' >> $@

.PHONY: car-sim-init
car-sim-init: chs-sim-init $(CAR_ROOT)/tb/hyp_vip scripts/carfield_compile.tcl

## @section Carfield SoC Simulation
## Compile the Carfield RTL using Questasim.
car-hw-build: car-sim-init
	$(QUESTA) vsim -c -do "quit -code [source scripts/carfield_compile.tcl]"

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
	$(QUESTA) vsim $(VSIM_FLAG) -do \
		"set CHS_BOOTMODE $(CHS_BOOTMODE); \
		 set CHS_PRELMODE $(CHS_PRELMODE); \
		 set CHS_BINARY $(CHS_BINARY); \
		 set CHS_IMAGE $(CHS_IMAGE); \
		 set SECD_BINARY $(SECD_BINARY); \
		 set SAFED_BOOTMODE $(SAFED_BOOTMODE); \
		 set SAFED_BINARY $(SAFED_BINARY); \
		 set PULPCL_BINARY $(PULPCL_BINARY); \
		 set SPATZCL_BINARY $(SPATZCL_BINARY); \
		 set VOPTARGS $(VOPTARGS); \
		 set TESTBENCH $(TBENCH); \
		 source scripts/start_carfield.tcl ; \
		 add log -r sim:/$(TBENCH)/*; \
		 $(RUN_AND_EXIT)"

.PHONY: car-hw-clean
## Remove all simulation build artifacts
car-hw-clean:
	rm -rf *.ini trace* *.wlf transcript work

## @section Carfield SoC Dependency Management
.PHONY: car-update-deps
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

.PHONY: car-checkout
car-checkout: car-checkout-deps

## @section Carfield initialization
.PHONY: car-hw-init
## Initialize carfield by generating cheshire and spatz registers and wrapper, respectively
## This step takes care of the generation of the missing hardware, or an update of the configuration
## of some IPs, such as the PLIC or CLINT.
car-hw-init: spatz-hw-init chs-hw-init

.PHONY: spatz-hw-init
spatz-hw-init:
	$(MAKE) -C $(SPATZCL_MAKEDIR) -B SPATZ_CLUSTER_CFG=$(CAR_HW_DIR)/cfg/spatz_carfield.hjson bootrom

.PHONY: chs-hw-init
## This target has a prerequisite, i.e. the PLIC configuration must be chosen before generating the
## hardware.
chs-hw-init: update_plic update_serial_link
	$(MAKE) chs-hw-all

.PHONY: chs-sim-init
## Downloads verification IPs for SPI and I2C from cheshire and used by Carfield.
chs-sim-init:
	$(MAKE) chs-sim-all

.PHONY: chs-sw-build
## Builds the SW libraries in cheshire and generates an archive (`libcheshire.a`) available for
## carfield as static library at link time.
chs-sw-build: chs-sw-all

.PHONY: car-sw-build
## Builds carfield application SW and specific libraries. It links against `libcheshire.a`.
car-sw-build: chs-sw-build car-sw-all

.PHONY: car-init
## Shortcut to initialize carfield with all the targets described above.
car-init: car-checkout car-hw-init car-sim-init safed-sw-init

# Initialize and build Safety Island SW
.PHONY: safed-sw-init
safed-sw-init: $(SAFED_ROOT) $(SAFED_SW_DIR)/pulp-runtime $(SAFED_SW_DIR)/pulp-freertos

$(SAFED_SW_DIR)/pulp-runtime: $(SAFED_ROOT)
	$(MAKE) -C $(SAFED_ROOT) pulp-runtime
$(SAFED_SW_DIR)/pulp-freertos: $(SAFED_ROOT)
	$(MAKE) -C $(SAFED_ROOT) pulp-freertos

# For independent boot of an island, we allow to compile the binary standalone.
.PHONY: safed-sw-build
safed-sw-build: safed-sw-init safed-sw-all

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

#############
# Emulation #
#############

include $(CAR_XIL_DIR)/xilinx.mk

########
# Help #
########

# Setup Autodocumentation of the Makefile
HELP_TITLE="Carfield Open-Source RTL"
HELP_DESCRIPTION="Hardware generation and simulation targets for Carfield"
include $(CAR_ROOT)/utils/help.mk
.DEFAULT_GOAL := help
