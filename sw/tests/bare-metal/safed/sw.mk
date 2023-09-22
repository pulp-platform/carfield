# Copyright 2023 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

.PHONY: all clean

# Make fragment for safety island bare-metal tests compiled with pulp-runtime.

# List all the directories in the 'tests' folder
SAFED_TEST_DIRS := $(wildcard $(SAFED_SW_DIR)/tests/*)
SAFED_TEST_DIRS := $(filter-out $(SAFED_SW_DIR)/tests/runtime_shared,$(SAFED_TEST_DIRS))
SAFED_TEST_DIRS := $(filter-out $(wildcard $(SAFED_SW_DIR)/tests/freertos*),$(SAFED_TEST_DIRS))

# Generate the list of build targets based on the directories
SAFED_BUILD_TARGETS := $(addsuffix /build,$(SAFED_TEST_DIRS))

# We have a target per test. The target (1) compiles the binary and (2) generates the needed stimuli
# file format, if any is required.
$(SAFED_SW_DIR)/tests/%/build: $(SAFED_ROOT) | venv
	# Compile
	$(MAKE) -C $(SAFED_SW_DIR)/tests/$* all

# Convert compiled binaries to header files
SAFED_HEADER_TARGETS := $(patsubst $(SAFED_SW_DIR)/tests/%, $(CAR_SW_DIR)/tests/bare-metal/safed/%.h, $(SAFED_TEST_DIRS))

$(CAR_SW_DIR)/tests/bare-metal/safed/%.h: $(SAFED_SW_DIR)/tests/%/build | venv
	$(VENV)/python $(CAR_ROOT)/scripts/elf2header.py --binary $</$*/$* --vectors $@

# Convert compiled binaries to slm files for hyperram
SAFED_SLM_TARGETS := $(patsubst $(SAFED_SW_DIR)/tests/%, $(CAR_SW_DIR)/tests/bare-metal/safed/%.hyperram0.slm, $(SAFED_TEST_DIRS))
SAFED_SLM_TARGETS += $(patsubst $(SAFED_SW_DIR)/tests/%, $(CAR_SW_DIR)/tests/bare-metal/safed/%.hyperram1.slm, $(SAFED_TEST_DIRS))

$(CAR_SW_DIR)/tests/bare-metal/safed/%.hyperram0.slm $(CAR_SW_DIR)/tests/bare-metal/safed/%.hyperram1.slm: $(SAFED_SW_DIR)/tests/%/build | venv
	$(VENV)/python $(CAR_ROOT)/scripts/elf2slm.py --binary=$</$*/$* --vectors=$(CAR_SW_DIR)/tests/bare-metal/safed/$*.hyperram

# Global targets
safed-sw-all: $(SAFED_BUILD_TARGETS) $(SAFED_HEADER_TARGETS) $(SAFED_SLM_TARGETS)

safed-sw-clean:
	# Clean all the directories in 'tests'
	$(foreach dir, $(SAFED_TEST_DIRS), $(MAKE) -C $(dir) clean;)
	$(RM) $(CAR_SW_DIR)/tests/bare-metal/safed/*.h
