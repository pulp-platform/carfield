# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Luca Valente <luca.valente@unibo.it>

ROOT := .
CHS_ROOT ?= $(ROOT)/cheshire
SW_ROOT := $(ROOT)/sw

include $(CHS_ROOT)/cheshire.mk
# include $(SW_ROOT)/sw.mk

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

# bender defines
defines += -D FEATURE_ICACHE_STAT
defines += -D PRIVATE_ICACHE
defines += -D HIERARCHY_ICACHE_32BIT

ifdef gui
	vsim-flag :=
	run_and_exit := run -all
else
	vsim-flag := -c
	run_and_exit := run_and_exit
endif

tb/hyp_vip:
	git clone git@iis-git.ee.ethz.ch:carfield/hyp_vip.git $@

scripts/carfield_compile.tcl:
	$(BENDER) script vsim $(targets) $(defines) --vlog-arg="$(VLOG_ARGS)" > $@
	echo 'vlog "$(CURDIR)/$(CHS_ROOT)/target/sim/src/elfloader.cpp" -ccflags "-std=c++11"' >> $@

hw-build: hw-clean scripts/carfield_compile.tcl
	vsim -c -do "source scripts/carfield_compile.tcl; exit"

hw-sim:
	vsim $(vsim-flag) -do "set BOOTMODE 0; set BINARY $(elf-bin); set TESTBENCH tb_carfield_soc; source scripts/start_carfield.tcl ; add log -r sim:/tb_carfield_soc/*; $(run_and_exit)"

hw-clean:
	rm -rf *.ini trace* *.wlf transcript work
