# Copyright 2023 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
# Yvan Tortorella <yvan.tortorella@unibo.it>

.PHONY: all clean

# Make fragment for integer cluster bare-metal tests compiled with pulp-runtime.

# List all the directories in the 'tests' folder
CAR_PULPD_SW := $(CAR_SW_DIR)/tests/bare-metal/pulpd
PULPD_SW_DIR := $(PULPD_ROOT)/regression-tests/parallel_bare_tests
PULPD_TEST_DIRS := $(wildcard $(PULPD_ROOT)/regression-tests/parallel_bare_tests/*)
PULPD_TEST_DIRS := $(filter-out $(wildcard $(PULPD_ROOT)/regression-tests/parallel_bare_tests/*.cfg),$(PULPD_TEST_DIRS))

# We remove unneded TCDM sections directly from the binary we want to generate. This speeds up the standalone
# simulation when preloading the L2 memory using JTAG and Serial Link.
remove_sections := --remove-section .l1cluster_g --remove-section .bss_l1

# We remove memory sections allocated in the cluster TCDM from the dumped headers and slm files. This prevents
# CVA6/JTAG/Serial Link from uselessly write zeroes in the the TCDM at the start of the offloading procedure.
start_section := 0x50040000

# Generate the list of build targets based on the directories
PULPD_BUILD_TARGETS := $(addsuffix /build,$(PULPD_TEST_DIRS))

# We have a target per test. The target (1) compiles the binary and (2) generates the needed stimuli
# file format, if any is required.
$(PULPD_SW_DIR)/%/build: $(PULPD_ROOT) | venv
	# Compile
	$(MAKE) -C $(PULPD_SW_DIR)/$* all
	cp $@/test/test $@/test/$*.bin
	$(PULPD_RISCV)-objcopy $(remove_sections) $@/test/test
	cp $@/test/test $(CAR_PULPD_SW)/$*.elf
	@echo $(PULPD_SW_DIR)

# Convert compiled binaries to header files
PULPD_HEADER_TARGETS := $(patsubst $(PULPD_SW_DIR)/%, $(CAR_SW_DIR)/tests/bare-metal/pulpd/%.h, $(PULPD_TEST_DIRS))

$(CAR_SW_DIR)/tests/bare-metal/pulpd/%.h: $(PULPD_SW_DIR)/%/build/test/test | venv
	$(VENV)/python $(CAR_ROOT)/scripts/elf2header.py --binary $< --vectors $@ --start_section=$(start_section)

# Convert compiled binaries to slm for hyperram
PULPD_SLM_TARGETS := $(patsubst $(PULPD_SW_DIR)/%, $(CAR_SW_DIR)/tests/bare-metal/pulpd/%.hyperram0.slm, $(PULPD_TEST_DIRS))
PULPD_SLM_TARGETS += $(patsubst $(PULPD_SW_DIR)/%, $(CAR_SW_DIR)/tests/bare-metal/pulpd/%.hyperram1.slm, $(PULPD_TEST_DIRS))

$(CAR_SW_DIR)/tests/bare-metal/pulpd/%.hyperram0.slm $(CAR_SW_DIR)/tests/bare-metal/pulpd/%.hyperram1.slm: $(PULPD_SW_DIR)/%/build/test/test | venv
	$(VENV)/python $(CAR_ROOT)/scripts/elf2slm.py --binary=$< --vectors=$(CAR_SW_DIR)/tests/bare-metal/pulpd/$*.hyperram --start_section=$(start_section)

# Global targets
pulpd-sw-all: $(PULPD_BUILD_TARGETS) $(PULPD_HEADER_TARGETS) $(PULPD_SLM_TARGETS)

pulpd-sw-clean:
	# Clean all the directories in 'tests'
	$(foreach dir, $(PULPD_TEST_DIRS), $(MAKE) -C $(dir) clean;)
	$(RM) $(CAR_SW_DIR)/tests/bare-metal/pulpd/*.h
