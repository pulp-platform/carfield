# Copyright 2023 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

RISCV32_GCC_BINROOT ?= $(dir $(shell which riscv32-unknown-elf-gcc))
RISCV32_CC          ?= $(RISCV32_GCC_BINROOT)/riscv32-unknown-elf-gcc

.PHONY: all clean

# Make fragment for safety island bare-metal tests compiled with pulp-runtime.

# List all the directories in the 'tests' folder
TEST_DIRS := $(wildcard $(SAFED_SW_DIR)/tests/*)
TEST_DIRS := $(filter-out $(SAFED_SW_DIR)/tests/runtime_shared,$(TEST_DIRS))
TEST_DIRS := $(filter-out $(wildcard $(SAFED_SW_DIR)/tests/freertos*),$(TEST_DIRS))

# Generate the list of build targets based on the directories
BUILD_TARGETS := $(addsuffix /build,$(TEST_DIRS))

# We have a target per test. The target (1) compiles the binary and (2) generates the needed stimuli
# file format, if any is required.
$(SAFED_SW_DIR)/tests/%/build: safety_island | venv
	# Compile
	$(MAKE) -C $(SAFED_SW_DIR)/tests/$* all

# Convert compiled binaries to header files
HEADER_TARGETS := $(patsubst $(SAFED_SW_DIR)/tests/%, $(CAR_SW_DIR)/tests/bare-metal/safed/%.h, $(TEST_DIRS))

$(CAR_SW_DIR)/tests/bare-metal/safed/%.h: $(SAFED_SW_DIR)/tests/%/build | venv
	$(VENV)/python ./scripts/elf_to_header.py --binary $</$*/$* --vectors $@
#	xxd -i $</$*/$* > $@ )

# Global targets
safed-sw-all: $(BUILD_TARGETS) $(HEADER_TARGETS)

safed-sw-clean:
	# Clean all the directories in 'tests'
	$(foreach dir, $(TEST_DIRS), $(MAKE) -C $(dir) clean;)
	$(RM) $(CAR_SW_DIR)/tests/bare-metal/safed/*.h
