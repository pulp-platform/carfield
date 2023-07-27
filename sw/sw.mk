# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Nicole Narr <narrn@student.ethz.ch>
# Christopher Reinwardt <creinwar@student.ethz.ch>
# Paul Scheffler <paulsc@iis.ee.ethz.ch>
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

############
# Carfield #
############

CAR_LD_DIR    ?= $(CAR_SW_DIR)/link

RISCV_LDFLAGS ?= $(CHS_SW_FLAGS) -nostartfiles -Wl,--gc-sections -L$(CHS_SW_LD_DIR) -L$(CAR_LD_DIR)

car-sw-all: car-sw-libs car-sw-tests

.PRECIOUS: %.elf %.dtb
.PHONY: car-sw-all car-sw-libs car-sw-headers car-sw-tests

# Libraries
CAR_PULPD_BARE ?= $(CAR_SW_DIR)/tests/bare-metal/pulpd
CAR_SW_INCLUDES    = -I$(CAR_SW_DIR)/include -I$(CAR_SW_DIR)/tests/bare-metal/safed -I$(CAR_PULPD_BARE) -I$(CHS_SW_DIR)/include $(CHS_SW_DEPS_INCS)
CAR_SW_LIB_SRCS_S  = $(wildcard $(CAR_SW_DIR)/lib/*.S $(CAR_SW_DIR)/lib/**/*.S)
CAR_SW_LIB_SRCS_C  = $(wildcard $(CAR_SW_DIR)/lib/*.c $(CAR_SW_DIR)/lib/**/*.c)
CAR_SW_LIB_SRCS_O  = $(CAR_SW_DEPS_SRCS:.c=.o) $(CAR_SW_LIB_SRCS_S:.S=.o) $(CAR_SW_LIB_SRCS_C:.c=.o)

CAR_SW_LIBS = $(CAR_SW_DIR)/lib/libcarfield.a

$(CAR_SW_DIR)/lib/libcarfield.a: $(CAR_SW_LIB_SRCS_O)
	$(CHS_SW_AR) $(CHS_SW_ARFLAGS) -rcsv $@ $^

car-sw-libs: $(CAR_SW_LIBS)

# Compilation

# All objects require up-to-date patches and headers
%.car.o: %.c
	@echo $(CAR_SW_INCLUDES)
	$(CHS_SW_CC) $(CAR_SW_INCLUDES) $(CHS_SW_CCFLAGS) -c $< -o $@

%.car.o: %.S
	$(CHS_SW_CC) $(CAR_SW_INCLUDES) $(CHS_SW_CCFLAGS) -c $< -o $@

define car_ld_elf_rule
.PRECIOUS: %.car.$(1).elf

%.car.$(1).elf: $$(CAR_LD_DIR)/$(1).ld %.car.o $(CHS_SW_LIBS) $$(CAR_SW_LIBS)
	$$(CHS_SW_CC) $$(CAR_SW_INCLUDES) -T$$< $$(CHS_SW_LDFLAGS) -o $$@ $$(filter-out $$<,$$^)
endef

$(foreach link,$(patsubst $(CAR_LD_DIR)/%.ld,%,$(wildcard $(CAR_LD_DIR)/*.ld)),$(eval $(call car_ld_elf_rule,$(link))))

# Tests

CAR_ELFLOAD_BLOCKING_SAFED_SRC_C := $(CAR_SW_DIR)/tests/bare-metal/hostd/safed_offloader_blocking.c
CAR_ELFLOAD_BLOCKING_SAFED_PATH := $(basename $(CAR_ELFLOAD_BLOCKING_SAFED_SRC_C))
CAR_ELFLOAD_PULPD_SRC_C := $(CAR_SW_DIR)/tests/bare-metal/hostd/pulp-offload.c
CAR_ELFLOAD_PULPD_PATH := $(basename $(CAR_ELFLOAD_PULPD_SRC_C))

CAR_SW_TEST_SRCS_S	= $(wildcard $(CAR_SW_DIR)/tests/bare-metal/hostd/*.S)
CAR_SW_TEST_SRCS_C	= $(filter-out $(CAR_ELFLOAD_BLOCKING_SAFED_SRC_C) $(CAR_ELFLOAD_PULPD_SRC_C), $(wildcard $(CAR_SW_DIR)/tests/bare-metal/hostd/*.c))

CAR_SW_TEST_DRAM_DUMP	= $(CAR_SW_TEST_SRCS_S:.S=.car.dram.dump) $(CAR_SW_TEST_SRCS_C:.c=.car.dram.dump)
CAR_SW_TEST_SPM_DUMP	= $(CAR_SW_TEST_SRCS_S:.S=.car.spm.dump)  $(CAR_SW_TEST_SRCS_C:.c=.car.spm.dump)
CAR_SW_TEST_L2_DUMP	= $(CAR_SW_TEST_SRCS_S:.S=.car.l2.dump)   $(CAR_SW_TEST_SRCS_C:.c=.car.l2.dump)
CAR_SW_TEST_SPM_ROMH	= $(CAR_SW_TEST_SRCS_S:.S=.car.rom.memh)  $(CAR_SW_TEST_SRCS_C:.c=.car.rom.memh)
CAR_SW_TEST_SPM_GPTH	= $(CAR_SW_TEST_SRCS_S:.S=.car.gpt.memh)  $(CAR_SW_TEST_SRCS_C:.c=.car.gpt.memh)

car-sw-tests: $(CAR_SW_TEST_DRAM_DUMP) $(CAR_SW_TEST_SPM_DUMP) $(CAR_SW_TEST_L2_DUMP) $(CAR_SW_TEST_SPM_ROMH) $(CAR_SW_TEST_SPM_GPTH) car-pulpd-sw-offload-tests car-safed-sw-offload-tests

# Generate ELFs for blocking offload from cheshire. We execute from L2 or dram.
# TODO: Make these generations nicer and using patterns. As of now, they are ugly and inefficient.

#################
# Safety Island #
#################

include $(CAR_SW_DIR)/tests/bare-metal/safed/sw.mk

car-safed-sw-offload-tests:
	$(foreach header,$(SAFED_HEADER_TARGETS), \
		cp $(header) $(CAR_SW_DIR)/tests/bare-metal/safed/payload.h; \
		$(CHS_SW_CC) $(CAR_SW_INCLUDES) $(CHS_SW_CCFLAGS) -c $(CAR_ELFLOAD_BLOCKING_SAFED_SRC_C) -o $(CAR_ELFLOAD_BLOCKING_SAFED_PATH).$(basename $(notdir $(header))).car.o; \
		$(CHS_SW_CC) $(CAR_SW_INCLUDES) -T$(CAR_LD_DIR)/l2.ld $(CHS_SW_LDFLAGS) -o $(CAR_ELFLOAD_BLOCKING_SAFED_PATH).$(basename $(notdir $(header))).car.l2.elf  $(CAR_ELFLOAD_BLOCKING_SAFED_PATH).$(basename $(notdir $(header))).car.o $(CHS_SW_LIBS) $(CAR_SW_LIBS); \
		$(CHS_SW_OBJDUMP) -d -S $(CAR_ELFLOAD_BLOCKING_SAFED_PATH).$(basename $(notdir $(header))).car.l2.elf   > $(CAR_ELFLOAD_BLOCKING_SAFED_PATH).$(basename $(notdir $(header))).car.l2.dump; \
		$(CHS_SW_CC) $(CAR_SW_INCLUDES) -T$(CHS_LD_DIR)/dram.ld $(CHS_SW_LDFLAGS) -o $(CAR_ELFLOAD_BLOCKING_SAFED_PATH).$(basename $(notdir $(header))).car.dram.elf  $(CAR_ELFLOAD_BLOCKING_SAFED_PATH).$(basename $(notdir $(header))).car.o $(CHS_SW_LIBS) $(CAR_SW_LIBS); \
		$(CHS_SW_OBJDUMP) -d -S $(CAR_ELFLOAD_BLOCKING_SAFED_PATH).$(basename $(notdir $(header))).car.dram.elf > $(CAR_ELFLOAD_BLOCKING_SAFED_PATH).$(basename $(notdir $(header))).car.dram.dump; \
		$(RM) $(CAR_SW_DIR)/tests/bare-metal/safed/payload.h; \
		$(RM) $(CAR_ELFLOAD_BLOCKING_SAFED_PATH).$(basename $(notdir $(header))).car.o; \
  )

###################
# Integer Cluster #
###################

include $(CAR_SW_DIR)/tests/bare-metal/pulpd/sw.mk

car-pulpd-sw-offload-tests:
	$(foreach header,$(PULPD_HEADER_TARGETS), \
		cp $(header) $(CAR_SW_DIR)/tests/bare-metal/pulpd/payload.h; \
		$(CHS_SW_CC) $(CAR_SW_INCLUDES) $(RISCV_CCFLAGS) -c $(CAR_ELFLOAD_PULPD_SRC_C) -o $(CAR_ELFLOAD_PULPD_PATH).$(basename $(notdir $(header))).car.o; \
		$(CHS_SW_CC) $(CAR_SW_INCLUDES) -T$(CAR_LD_DIR)/l2.ld $(RISCV_LDFLAGS) -o $(CAR_ELFLOAD_PULPD_PATH).$(basename $(notdir $(header))).car.l2.elf  $(CAR_ELFLOAD_PULPD_PATH).$(basename $(notdir $(header))).car.o $(CHS_SW_LIBS) $(CAR_SW_LIBS); \
		$(CHS_SW_OBJDUMP) -d -S $(CAR_ELFLOAD_PULPD_PATH).$(basename $(notdir $(header))).car.l2.elf   > $(CAR_ELFLOAD_PULPD_PATH).$(basename $(notdir $(header))).car.l2.dump; \
		$(CHS_SW_CC) $(CAR_SW_INCLUDES) -T$(CHS_LD_DIR)/dram.ld $(RISCV_LDFLAGS) -o $(CAR_ELFLOAD_PULPD_PATH).$(basename $(notdir $(header))).car.dram.elf  $(CAR_ELFLOAD_PULPD_PATH).$(basename $(notdir $(header))).car.o $(CHS_SW_LIBS) $(CAR_SW_LIBS); \
		$(CHS_SW_OBJDUMP) -d -S $(CAR_ELFLOAD_PULPD_PATH).$(basename $(notdir $(header))).car.dram.elf > $(CAR_ELFLOAD_PULPD_PATH).$(basename $(notdir $(header))).car.dram.dump; \
		$(RM) $(CAR_SW_DIR)/tests/bare-metal/pulpd/payload.h; \
		$(RM) $(CAR_ELFLOAD_PULPD_PATH).$(basename $(notdir $(header))).car.o; \
	)
