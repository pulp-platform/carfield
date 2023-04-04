# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Luca Valente <luca.valente@unibo.it>

CHS_ROOT ?= ./cheshire

-include $(CHS_ROOT)/cheshire.mk

testname ?= helloworld
memtype ?= spm
elf-bin ?= $(CHS_ROOT)/sw/tests/$(testname).$(memtype).elf

ifdef gui
	vsim-flag :=
	run_and_exit := run -all
else
	vsim-flag := -c
	run_and_exit := run_and_exit
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
	$(BENDER) script vsim -t sim -t cv64a6_imafdc_sv39 -t test -t cva6 --vlog-arg="$(VLOG_ARGS)" > $@
	echo 'vlog "$(CURDIR)/$(CHS_ROOT)/target/sim/src/elfloader.cpp" -ccflags "-std=c++11"' >> $@

car-hw-build: car-hw-clean scripts/carfield_compile.tcl
	vsim -c -do "source scripts/carfield_compile.tcl; exit"

car-hw-sim:
	vsim $(vsim-flag) -do "set BOOTMODE 0; set BINARY $(elf-bin); set TESTBENCH tb_carfield_soc; source scripts/start_carfield.tcl ; add log -r sim:/tb_carfield_soc/*; $(run_and_exit)"

car-hw-clean:
	rm -rf *.ini trace* *.wlf transcript work
