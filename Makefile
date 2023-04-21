# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Luca Valente <luca.valente@unibo.it>

ROOT := .
CHS_ROOT ?= $(ROOT)/cheshire
SW_ROOT := $(ROOT)/sw

QUESTA ?= questa-2022.3
TBENCH ?= tb_carfield_soc

-include $(CHS_ROOT)/cheshire.mk

testname ?= helloworld
memtype ?= spm
elf-bin ?= $(CHS_ROOT)/sw/tests/$(testname).$(memtype).elf

# bender targets
targets += -t sim
targets += -t rtl
targets += -t cv64a6_imafdc_sv39
targets += -t test
targets += -t cva6
targets += -t integer_cluster
targets += -t cv32e40p_use_ff_regfile

# bender defines
defines += -D FEATURE_ICACHE_STAT
defines += -D PRIVATE_ICACHE
defines += -D HIERARCHY_ICACHE_32BIT

ifdef gui
	vsim-flag :=
	run_and_exit := run -all
else
	vsim-flag := -c
	run_and_exit := run -all; exit
endif

######################
# Nonfree components #
######################

CAR_NONFREE_REMOTE ?= git@iis-git.ee.ethz.ch:carfield/carfield-nonfree.git
CAR_NONFREE_COMMIT ?= c0d7121d145487950ccb14169b06947848a4d285

nonfree-init:
	git clone $(CAR_NONFREE_REMOTE) nonfree
	cd nonfree && git checkout $(CAR_NONFREE_COMMIT)

-include nonfree/nonfree.mk

tb/hyp_vip:
	git clone git@iis-git.ee.ethz.ch:carfield/hyp_vip.git $@

scripts/carfield_compile.tcl:
	$(BENDER) script vsim $(targets) $(defines) --vlog-arg="$(VLOG_ARGS)" > $@
	echo 'vlog "$(CURDIR)/$(CHS_ROOT)/target/sim/src/elfloader.cpp" -ccflags "-std=c++11"' >> $@

car-hw-build: car-hw-clean scripts/carfield_compile.tcl
	$(QUESTA) vsim -c -do "source scripts/carfield_compile.tcl; exit"

car-hw-sim:
	$(QUESTA) vsim $(vsim-flag) -do "set BOOTMODE 0; set BINARY $(elf-bin); set TESTBENCH $(TBENCH); source scripts/start_carfield.tcl ; add log -r sim:/$(TBENCH)/*; $(run_and_exit)"

car-hw-clean:
	rm -rf *.ini trace* *.wlf transcript work

car-update-deps:
	bender update

car-init: car-update-deps tb/hyp_vip chs-init

chs-init:
	$(MAKE) -B chs-hw-all
	$(MAKE) -B chs-sim-all
	$(MAKE) -B chs-sw-all
