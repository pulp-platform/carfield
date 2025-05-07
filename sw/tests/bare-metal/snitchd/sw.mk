# Copyright 2025 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

# So far we don't use Snitch software, just a simple runtime and test in here
SNITCHD_SW_DIR = $(CAR_SW_DIR)/tests/bare-metal/snitchd

SNITCHD_LLVM_ROOT = /usr/pack/riscv-1.0-kgf/pulp-llvm-0.12.0
SNITCHD_CC        = $(SNITCHD_LLVM_ROOT)/bin/clang
SNITCHD_LD       ?= $(SNITCHD_LLVM_ROOT)/bin/ld.lld

SNITCHD_CFLAGS   = -mcpu=snitch -menable-experimental-extensions -mabi=ilp32d -mcmodel=medany
SNITCHD_CFLAGS  += -fno-builtin-printf -fno-builtin-sqrtf -fno-common
SNITCHD_LDFLAGS += -fuse-ld=$(SNITCHD_LD) -nostartfiles -nostdlib -lc
SNITCHD_LDFLAGS += -L$(SNITCHD_LLVM_ROOT)/lib/clang/12.0.1/lib/
SNITCHD_LDFLAGS += -lclang_rt.builtins-riscv32 -T$(SNITCHD_SW_DIR)/runtime/link.ld

SNITCHD_HEADER_TARGETS = $(SNITCHD_SW_DIR)/build/hello_world.h

$(SNITCHD_SW_DIR)/build:
	mkdir -p $@

$(SNITCHD_SW_DIR)/build/hello_world.elf: $(SNITCHD_SW_DIR)/hello_world.c | $(SNITCHD_SW_DIR)/build
	$(SNITCHD_CC) $(SNITCHD_CFLAGS) $(SNITCHD_LDFLAGS) $< $(SNITCHD_SW_DIR)/runtime/crt0.S -o $@

$(SNITCHD_SW_DIR)/build/hello_world.h: $(SNITCHD_SW_DIR)/build/hello_world.elf | venv
	$(VENV)/python $(CAR_ROOT)/scripts/elf2header.py --binary $< --vectors $@

