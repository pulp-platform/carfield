# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Luca Valente <luca.valente@unibo.it>
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
# Yvan Tortorella <yvan.tortorella@unibo.it>

ROOT := .
CHS_ROOT ?= $(ROOT)/cheshire
CAR_SW_DIR := $(ROOT)/sw

# Bender
BENDER_VERSION = 0.27.1
BENDER_DIR := $(ROOT)
BENDER   ?= $(BENDER_DIR)/bender
QUESTA   ?= questa-2022.3
TBENCH   ?= tb_carfield_soc
BOOTMODE ?= 0 # default passive bootmode
PRELMODE ?= 1 # default serial link preload
VOPTARGS ?=

# Include cheshire's makefrag only if the dependency was cloned
-include $(CHS_ROOT)/cheshire.mk

# Spatz
SPATZ_ROOT ?= $(ROOT)/spatz
SPATZ_MAKEDIR := $(SPATZ_ROOT)/hw/system/spatz_cluster

TESTNAME ?= helloworld
MEMTYPE  ?= spm
BINARY   ?= $(CHS_ROOT)/sw/tests/$(TESTNAME).$(MEMTYPE).elf
IMAGE    ?=

# Include bender targets and defines for common usage and synth verification
# (the following includes are mandatory)
include bender-common.mk
include bender-synth.mk

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
CAR_NONFREE_COMMIT ?= a5351b2b161e896592b596492bff1abfac367aca

car-nonfree-init:
	git clone $(CAR_NONFREE_REMOTE) nonfree
	cd nonfree && git checkout $(CAR_NONFREE_COMMIT)

-include nonfree/nonfree.mk
-include scripts/spy.mk

############
#  Bender  #
############

# Bender
.PHONY: bender
bender: $(ROOT)/Bender.local check-bender $(BENDER_DIR)/bender

check-bender: $(BENDER_DIR)/bender
	@if [ -x $(BENDER_DIR)/bender ]; then \
		req="bender $(BENDER_VERSION)"; \
		current="$$($(BENDER_DIR)/bender --version)"; \
		if [ "$$(printf '%s\n' "$${req}" "$${current}" | sort -V | head -n1)" != "$${req}" ]; then \
			rm -rf $(BENDER_DIR)/bender; \
		fi \
	fi

$(BENDER_DIR)/bender:
	mkdir -p $(BENDER_DIR) && cd $(BENDER_DIR) && \
	curl --proto '=https' --tlsv1.2 https://pulp-platform.github.io/bender/init -sSf | sh -s -- $(BENDER_VERSION)

############
# Build SW #
############

include $(CAR_SW_DIR)/sw.mk

##############
# Simulation #
##############
.PHONY: scripts/carfield_compile.tcl

tb/hyp_vip:
	git clone git@iis-git.ee.ethz.ch:carfield/hyp_vip.git $@

scripts/carfield_compile.tcl: bender
	$(BENDER) script vsim $(TARGETS) $(DEFINES) --vlog-arg="$(VLOG_ARGS)" > $@
	echo 'vlog "$(CURDIR)/$(CHS_ROOT)/target/sim/src/elfloader.cpp" -ccflags "-std=c++11"' >> $@

car-hw-build: car-hw-clean scripts/carfield_compile.tcl
	$(QUESTA) vsim -c -do "source scripts/carfield_compile.tcl; exit"

car-hw-sim: bender
	$(QUESTA) vsim $(VSIM_FLAG) -do "set BOOTMODE $(BOOTMODE); set PRELMODE $(PRELMODE); set BINARY $(BINARY); set VOPTARGS $(VOPTARGS); set IMAGE $(IMAGE); set TESTBENCH $(TBENCH); source scripts/start_carfield.tcl ; add log -r sim:/$(TBENCH)/*; $(RUN_AND_EXIT)"

car-hw-clean:
	rm -rf *.ini trace* *.wlf transcript work

car-update-deps: bender
	$(BENDER) update

.PHONY: car-checkout-deps
car-checkout-deps: bender
	$(BENDER) checkout
	touch Bender.lock

car-init: car-checkout-deps tb/hyp_vip spatz-init chs-init

spatz-init:
	$(MAKE) -C $(SPATZ_MAKEDIR) -B SPATZ_CLUSTER_CFG=carfield.hjson bootrom

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

lint:
	$(MAKE) -C scripts lint bender_defs="$(SPYGLASS_DEFS)" bender_targs="$(SPYGLASS_TARGS)" > make.log
