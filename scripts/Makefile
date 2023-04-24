# Copyright 2021 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Author: Matteo Perotti <mperotti@iis.ee.ethz.ch>

ROOT        := $(patsubst %/,%, $(dir $(abspath $(lastword $(MAKEFILE_LIST))/../)))

SNPS_SG     ?= spyglass-2022.06

bender_defs  ?= -D SPYGLASS        \
                -D SYNTHESIS       \
                -D EXCLUDE_PADFRAME

bender_targs ?= -t asic               \
                -t spyglass           \
                -t cva6_test          \
                -t synthesis          \
                -t top_level          \
                -t intel16            \
                -t scm_use_latch_scm  \
                -t cluster_standalone \
                -t cv64a6_imafdc_sv39

# PHONY since these targets are all pretty fast compared to spyglass
.PHONY: lint gen_script update

lint: update gen_script spyglass/sgdc/func.sgdc spyglass/scripts/run_lint.tcl
	cd spyglass; $(SNPS_SG) sg_shell -tcl scripts/run_lint.tcl

gen_script: update
	mkdir -p spyglass/tmp
	bender script verilator $(bender_targs) $(bender_defs) > spyglass/tmp/files

update:
	bender update
	make -C $(ROOT) chs-hw-all
	make -C $(ROOT) spatz-init
