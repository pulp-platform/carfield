# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Luca Valente <luca.valente@unibo.it>
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
# Yvan Tortorella <yvan.tortorella@unibo.it>
# Robert Balas <balasr@iis.ee.ethz.ch>
# Manuel Eggimann <meggiman@iis.ee.ethz.ch>

# Carfield main make fragment

# Note: this makefrag uses autodocumentation, hence it follows rules for the comment style. See
# `utils/help.mk` for more information.

##########################################
# Virtual environment for python scripts #
##########################################

VENVDIR?=$(WORKDIR)/.venv
REQUIREMENTS_TXT?=$(wildcard requirements.txt)
include $(CAR_ROOT)/utils/venv.mk

export PATH := $(VENVDIR)/bin:$(PATH)
export PYTHON=
export PYTHON3=
override PYTHON := $(CAR_ROOT)/$(VENV)/python3
override PYTHON3 := $(CAR_ROOT)/$(VENV)/python3

###################################
# Generic variable initialization #
###################################

CAR_ROOT    ?= $(shell $(BENDER) path carfield)
CAR_HW_DIR  := $(CAR_ROOT)/hw
CAR_SW_DIR  := $(CAR_ROOT)/sw
CAR_TGT_DIR := $(CAR_ROOT)/target/
CAR_XIL_DIR := $(CAR_TGT_DIR)/xilinx
CAR_SIM_DIR := $(CAR_TGT_DIR)/sim
HYP_ROOT    := $(shell $(BENDER) path hyperbus)
# Questasim
CAR_VSIM_DIR := $(CAR_TGT_DIR)/sim/vsim

BENDER      ?= bender
BENDER_ROOT ?= $(CAR_ROOT)/.bender
BENDER_PATH ?= $(shell which $(BENDER))

# Include mandatory bender targets and defines for multiple targets (sim, fpga, synth)
include $(CAR_ROOT)/bender-common.mk
include $(CAR_ROOT)/bender-sim.mk
include $(CAR_ROOT)/bender-synth.mk
include $(CAR_ROOT)/bender-xilinx.mk
include $(CAR_ROOT)/bender-safed.mk

######################
# Nonfree components #
######################

CAR_NONFREE_REMOTE ?= git@iis-git.ee.ethz.ch:carfield/carfield-nonfree.git
CAR_NONFREE_COMMIT ?= c2c864ca

## @section Carfield platform nonfree components
## Clone the non-free verification IP for Carfield. Some components such as CI scripts and ASIC
## implementations with tech-specific resources are not open-sourced and contained in a `nonfree`
## folder cloned from a remote location, whose access is restricted. If you do not have access, this
## step will be skipped and the usage of the repository will **not** be compromised.
car-nonfree-init:
	git clone $(CAR_NONFREE_REMOTE) $(CAR_ROOT)/nonfree
	cd nonfree && git checkout $(CAR_NONFREE_COMMIT)
	cd nonfree/intel16 && icdesign intel16 -update all -nogui

-include nonfree/nonfree.mk

#####################################
# Islands' variables initialization #
#####################################

# Cheshire, host domain
CHS_ROOT ?= $(shell $(BENDER) path cheshire)
# Include cheshire's makefrag only if the dependency was cloned
-include $(CHS_ROOT)/cheshire.mk
CHS_BOOTMODE ?= 0 # default passive bootmode
CHS_PRELMODE ?= 1 # default serial link preload
CHS_BINARY   ?=
CHS_IMAGE    ?=

# Safety Island, reliabililty and fault-tolerance
SAFED_ROOT     ?= $(shell $(BENDER) path safety_island)
SAFED_SW_DIR   := $(SAFED_ROOT)/sw
SAFED_BOOTMODE ?= 0
SAFED_BINARY   ?=

# Security island, security and secure boot
SECD_ROOT     ?= $(shell $(BENDER) path opentitan)
SECD_BINARY   ?=
SECD_BOOTMODE ?= 0
SECD_IMAGE    ?=
# Secure boot
SECURE_BOOT   ?= 0

# PULP cluster, reliability and general-purpose accelerator
PULPD_ROOT      ?= $(shell $(BENDER) path pulp_cluster)
PULPD_BINARY    ?=
PULPD_TEST_NAME ?=
PULPD_BOOTMODE  ?=

# Spatz cluster, efficient vector co-processor
SPATZD_ROOT     ?= $(shell $(BENDER) path spatz)
SPATZD_MAKEDIR  := $(SPATZD_ROOT)/hw/system/spatz_cluster
SPATZD_CFG      ?= spatz_cluster.carfield.l2.hjson
SPATZD_BINARY   ?=
SPATZD_BOOTMODE ?= 0 # default jtag bootmode

###########################
# System HW configuration #
###########################

# Interrupt configuration in cheshire
# CLINT interruptible harts
CLINTCORES     := 4
# PLIC interruptible harts
PLICCORES      := 8
# PLIC number of input interrupts
PLIC_NUM_INTRS := 89

# Serial Link configuration in cheshire
SERIAL_LINK_NUM_BITS := 16

# AXI Real-Time unit configuration in Carfield
AXIRT_NUM_MGRS := 10
AXIRT_NUM_SUBS := 2

##########################
# Dependency maintenance #
##########################

## @section Carfield platform dependency management
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

############
# Build SW #
############
include $(CAR_SW_DIR)/sw.mk

## @section Carfield platform SW build
.PHONY: chs-sw-build
## Build the host domain (Cheshire) SW libraries and generates an archive (`libcheshire.a`)
## available for Carfield as static library at link time.
chs-sw-build: chs-sw-all

.PHONY: car-sw-build
## Builds carfield application SW and specific libraries. It links against `libcheshire.a`.
car-sw-build: chs-sw-build safed-sw-build pulpd-sw-build spatzd-sw-build car-sw-all

.PHONY: safed-sw-init pulpd-sw-init
## Clone safe domain's SW stack in the dedicated repository.
safed-sw-init: $(SAFED_ROOT) $(SAFED_SW_DIR)/pulp-runtime $(SAFED_SW_DIR)/pulp-freertos

$(SAFED_SW_DIR)/pulp-runtime: $(SAFED_ROOT)
	$(MAKE) -C $(SAFED_ROOT) pulp-runtime BENDER="$(BENDER)"
$(SAFED_SW_DIR)/pulp-freertos: $(SAFED_ROOT)
	$(MAKE) -C $(SAFED_ROOT) pulp-freertos BENDER="$(BENDER)"

## Clone integer PMCA domain's SW stack in the dedicated repository.
pulpd-sw-init: $(PULPD_ROOT) $(PULPD_ROOT)/pulp-runtime $(PULPD_ROOT)/regression-tests

$(PULPD_ROOT)/pulp-runtime: $(PULPD_ROOT)
	$(MAKE) -C $(PULPD_ROOT) pulp-runtime
$(PULPD_ROOT)/regression-tests: $(PULPD_ROOT)
	$(MAKE) -C $(PULPD_ROOT) regression-tests

## Build safe domain SW
.PHONY: safed-sw-build
safed-sw-build: safed-sw-init
	. $(CAR_ROOT)/env/safed-env.sh; \
	$(MAKE) safed-sw-all

## Build integer PMCA domain SW
.PHONY: pulpd-sw-build
pulpd-sw-build: pulpd-sw-init
	. $(CAR_ROOT)/env/pulpd-env.sh; \
	$(MAKE) pulpd-sw-all

## Build vectorial PMCA domain SW

.PHONY: spatzd-sw-build
spatzd-sw-build: $(LLVM_SPATZD_DIR) $(GCC_SPATZD_DIR)
	$(MAKE) spatzd-sw-all

###############
# Generate HW #
###############

## @section Carfield platform HW generation
.PHONY: car-hw-init
## Initialize Carfield HW. This step takes care of the generation of the missing hardware or the
## update of default HW configurations in some of the domains. See the two prerequisite's comment
## for more information.
car-hw-init: spatzd-hw-init chs-hw-init

## @section Carfield platform PCRs generation
.PHONY: regenerate_soc_regs
## Regenerate the toplevel PCRs from the CSV description of all registers in
## hw/regs/carfield_regs.csv. You don't have to run this target unless you changed the CSV file. The
## checked-in pregenerated register file RTL should be up-to-date. If you regenerate the regfile, do
## not forget to check in the generated RTL. In addition, dedicated documentation is autogenerated.
regenerate_soc_regs: $(CAR_ROOT)/hw/regs/carfield_reg_pkg.sv $(CAR_ROOT)/hw/regs/carfield_reg_top.sv $(CAR_SW_DIR)/include/regs/soc_ctrl.h $(CAR_HW_DIR)/regs/pcr.md

.PHONY: $(CAR_ROOT)/hw/regs/carfield_regs.hjson
$(CAR_ROOT)/hw/regs/carfield_regs.hjson: hw/regs/carfield_regs.csv | venv
	$(VENV)/python ./scripts/csv_to_json.py --input $< --output $@

.PHONY: $(CAR_ROOT)/hw/regs/carfield_reg_pkg.sv hw/regs/carfield_reg_top.sv
$(CAR_ROOT)/hw/regs/carfield_reg_pkg.sv $(CAR_ROOT)/hw/regs/carfield_reg_top.sv: $(CAR_ROOT)/hw/regs/carfield_regs.hjson | venv
	$(VENV)/python utils/reggen/regtool.py -r $< --outdir $(dir $@)

.PHONY: $(CAR_SW_DIR)/include/regs/soc_ctrl.h
$(CAR_SW_DIR)/include/regs/soc_ctrl.h: $(CAR_ROOT)/hw/regs/carfield_regs.hjson | venv
	$(VENV)/python utils/reggen/regtool.py -D $<  > $@

.PHONY: $(CAR_SW_DIR)/hw/regs/pcr.md
$(CAR_HW_DIR)/regs/pcr.md: $(CAR_ROOT)/hw/regs/carfield_regs.hjson | venv
	$(VENV)/python utils/reggen/regtool.py -d $<  > $@

## Update host domain PLIC and CLINT interrupt controllers configuration. The default configuration
## in cheshire allows for one interruptible hart. When the number of external interruptible harts is
## updated in the Cheshire cfg (cheshire_pkg.sv), we need to regenerate the PLIC and CLINT
## accordingly. CLINT: define CLINTCORES used in cheshire.mk before including the makefrag. PLIC:
## edit the hjson configuration file in cheshire.
.PHONY: update_plic
update_plic: $(CHS_ROOT)/hw/rv_plic.cfg.hjson
	sed -i 's/src: .*/src: $(PLIC_NUM_INTRS),/' $<
	sed -i 's/target: .*/target: $(PLICCORES),/' $<

## Update host domain Serial Link configuration. The default configuration in cheshire allows for 4
## data lanes for the serial link. We update the configuration to 8 data lanes.
.PHONY: update_serial_link
update_serial_link: $(CHS_ROOT)/hw/serial_link.hjson
	sed -i 's/\(default: "\)8/\116/' $<

## Generate Spatz HW starting from a configuration file. This includes register file, memory map,
## interconnect parametrization.
.PHONY: spatzd-hw-init
spatzd-hw-init: | venv
	$(MAKE) -C $(SPATZD_ROOT) init
	$(MAKE) -C $(SPATZD_MAKEDIR) SPATZ_CLUSTER_CFG_PATH=$(SPATZD_MAKEDIR)/cfg/$(SPATZD_CFG) bootrom
	cp $(SPATZD_ROOT)/sw/snRuntime/include/spatz_cluster_peripheral.h $(CAR_SW_DIR)/include/regs/

## Generate Cheshire HW. This target has a prerequisite, i.e. the PLIC and serial link
## configurations must be chosen before generating the hardware.
.PHONY: chs-hw-init
chs-hw-init: update_plic update_serial_link | venv
	$(MAKE) -B chs-hw-all

##############
# Simulation #
##############

## @section Carfield platform simulation
include $(CAR_SIM_DIR)/sim.mk

##################
# Global targets #
##################

## @section Carfield global targets

.PHONY: car-init-all
## Shortcut to initialize carfield with all the targets described above.
car-init-all: car-checkout car-hw-init car-sim-init safed-sw-init pulpd-sw-init mibench

## Initialize Carfield and build SW
.PHONY: car-all
car-all: car-init-all car-sw-build

#########
# Utils #
#########
## @section Carfield platform utilities

# Lint
SPYGLASS_TARGS += $(common_targs)
SPYGLASS_TARGS += $(synth_targs)
SPYGLASS_DEFS += $(common_defs)
SPYGLASS_DEFS += $(synth_defs)

## Lint the Carfield codebase using Spyglass
.PHONY:lint
lint:
	$(MAKE) -C scripts lint bender_defs="$(SPYGLASS_DEFS)" bender_targs="$(SPYGLASS_TARGS)" > make.log

#############
# Emulation #
#############
## @section Carfield emulation

# Xilinx
include $(CAR_XIL_DIR)/xilinx.mk

#######################
# External benchmarks #
#######################

## @section External SW benchmarks
## Clone Mibench Embedded Suite benchmark
.PHONY: mibench
mibench: $(CAR_SW_DIR)/benchmarks/mibench

$(CAR_SW_DIR)/benchmarks/mibench:
	git clone git@github.com:alex96295/mibench.git -b carfield $@

# Litmus tests
LITMUS_WORK_DIR  := work-litmus
LITMUS_TEST_LIST := $(LITMUS_WORK_DIR)/litmus-tests.list
LITMUS_TESTS     := $(shell xargs printf '\n%s' < $(LITMUS_TEST_LIST) | cut -b 1-)

$(LITMUS_WORK_DIR):
	mkdir -p $(LITMUS_WORK_DIR)

$(LITMUS_TEST_LIST): $(LITMUS_WORK_DIR)
	basename -a `find $(LITMUS_DIR)/binaries/ -name "*.elf" | sed 's/\[/\\\[/g'` > $@

$(LITMUS_TESTS):
	$(MAKE) car-vsim-sim-run CHS_BOOTMODE=0 CHS_PRELMODE=1 CHS_BINARY=$(LITMUS_DIR)/binaries/$@ | tee $(LITMUS_WORK_DIR)/$@.log

$(LITMUS_WORK_DIR)/%.uart.log: %
	sed -n 's/^# \[UART\] \(.*\S\)\s*$$/\1/p' $(LITMUS_WORK_DIR)/$<.log > $@

$(LITMUS_WORK_DIR)/%.litmus.log: $(LITMUS_WORK_DIR)/%.uart.log
	echo "Test $(basename $* .elf) Allowed" > $@
	echo "Histogram" >> $@
	cat $< >> $@
	echo "" >> $@

## Clone Litmus tests for the RISC-V concurrency architecture and run them
car-run-litmus-tests: $(LITMUS_TEST_LIST) $(addprefix $(LITMUS_WORK_DIR)/, $(addsuffix .litmus.log,$(LITMUS_TESTS)))
	cat $^ > $(LITMUS_WORK_DIR)/litmus.log

## Check Litmus tests results against golden model
car-check-litmus-tests: $(LITMUS_WORK_DIR)/litmus.log
	cd $(LITMUS_DIR) && LITMUS_LOG=$(CURDIR)/$(LITMUS_WORK_DIR)/litmus.log ci/compare_model.sh > $(CURDIR)/$(LITMUS_WORK_DIR)/compare.log
	grep "Warning positive differences" $(LITMUS_WORK_DIR)/compare.log
	! grep "Warning negative differences" $(LITMUS_WORK_DIR)/compare.log

########
# Help #
########

# Setup Autodocumentation of the Makefile
HELP_TITLE="Carfield Open-Source RTL"
HELP_DESCRIPTION="Hardware generation and simulation targets for Carfield"
include $(CAR_ROOT)/utils/help.mk
.DEFAULT_GOAL := help
