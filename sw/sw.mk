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

CAR_LD_DIR     ?= $(CAR_SW_DIR)/link
CAR_SW_LDFLAGS ?= $(CHS_SW_LDFLAGS) -L$(CAR_LD_DIR)

car-sw-all: car-sw-libs car-sw-tests

.PRECIOUS: %.elf %.dtb
.PHONY: car-sw-all car-sw-libs car-sw-headers car-sw-tests

# Libraries
CAR_PULPD_BARE    ?= $(CAR_SW_DIR)/tests/bare-metal/pulpd
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
	$$(CHS_SW_CC) $$(CAR_SW_INCLUDES) -T$$< $$(CAR_SW_LDFLAGS) -o $$@ $$(filter-out $$<,$$^)
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

car-sw-tests: $(CAR_SW_TEST_DRAM_DUMP) $(CAR_SW_TEST_SPM_DUMP) $(CAR_SW_TEST_L2_DUMP) $(CAR_SW_TEST_SPM_ROMH) $(CAR_SW_TEST_SPM_GPTH) car-pulpd-sw-offload-tests car-safed-sw-offload-tests mibench-automotive

# Generate ELFs for blocking offload from cheshire. We execute from L2 or dram.
# Template function for offload tests
define offload_tests_template
	$(foreach header,$(1), \
		cp $(header) $(CAR_SW_DIR)/tests/bare-metal/$(2)/payload.h; \
		$(CHS_SW_CC) $(CAR_SW_INCLUDES) $(CHS_SW_CCFLAGS) -c $(3) -o $(4).$(basename $(notdir $(header))).car.o; \
		$(CHS_SW_CC) $(CAR_SW_INCLUDES) -T$(CAR_LD_DIR)/l2.ld $(CAR_SW_LDFLAGS) -o $(4).$(basename $(notdir $(header))).car.l2.elf  $(4).$(basename $(notdir $(header))).car.o $(CHS_SW_LIBS) $(CAR_SW_LIBS); \
		$(CHS_SW_OBJDUMP) -d -S $(4).$(basename $(notdir $(header))).car.l2.elf > $(4).$(basename $(notdir $(header))).car.l2.dump; \
		$(CHS_SW_CC) $(CAR_SW_INCLUDES) -T$(CHS_LD_DIR)/dram.ld $(CAR_SW_LDFLAGS) -o $(4).$(basename $(notdir $(header))).car.dram.elf  $(4).$(basename $(notdir $(header))).car.o $(CHS_SW_LIBS) $(CAR_SW_LIBS); \
		$(CHS_SW_OBJDUMP) -d -S $(4).$(basename $(notdir $(header))).car.dram.elf > $(4).$(basename $(notdir $(header))).car.dram.dump; \
		$(RM) $(CAR_SW_DIR)/tests/bare-metal/$(2)/payload.h; \
		$(RM) $(4).$(basename $(notdir $(header))).car.o; \
	)
endef

#################
# Safety Island #
#################

include $(CAR_SW_DIR)/tests/bare-metal/safed/sw.mk

car-safed-sw-offload-tests:
	$(call offload_tests_template,$(SAFED_HEADER_TARGETS),safed,$(CAR_ELFLOAD_BLOCKING_SAFED_SRC_C),$(CAR_ELFLOAD_BLOCKING_SAFED_PATH))

###################
# Integer Cluster #
###################

include $(CAR_SW_DIR)/tests/bare-metal/pulpd/sw.mk

car-pulpd-sw-offload-tests:
	$(call offload_tests_template,$(PULPD_HEADER_TARGETS),pulpd,$(CAR_ELFLOAD_PULPD_SRC_C),$(CAR_ELFLOAD_PULPD_PATH))

# Benchmarks

# Mibench
MIBENCH_DIR := $(CAR_SW_DIR)/benchmarks/mibench
CC       := $(CHS_SW_CC)
OBJDUMP  := $(CHS_SW_OBJDUMP)
INCLUDES := $(CAR_SW_INCLUDES)
CCFLAGS  := $(CHS_SW_CCFLAGS)
LDFLAGS  := $(CAR_SW_LDFLAGS)
LDLIBS   += $(CHS_SW_LIBS)
LDLIBS   += $(CAR_SW_LIBS)
LDLINK   := -T$(CAR_LD_DIR)/l2.ld

-include $(MIBENCH_DIR)/mibench.mk

.PHONY: mibench-automotive mibench-automotive-basicmath mibench-automotive-bitcount mibench-automotive-qsort mibench-automotive-susan
mibench-automotive: automotive
mibench-automotive-basicmath: automotive-basicmath
mibench-automotive-bitcount: automotive-bitcount
mibench-automotive-qsort: automotive-qsort
mibench-automotive-susan: automotive-susan

###################
# GPT Linux image #
###################

# Create full Linux disk image
$(CAR_SW_DIR)/boot/linux.gpt.bin: $(CHS_SW_DIR)/boot/zsl.rom.bin $(CAR_SW_DIR)/boot/carfield.dtb $(CAR_SW_DIR)/boot/install64/fw_payload.bin $(CAR_SW_DIR)/boot/install64/uImage
	truncate -s $(CHS_SW_DISK_SIZE) $@
	sgdisk --clear -g --set-alignment=1 \
		--new=1:64:96 --typecode=1:$(CHS_SW_ZSL_TGUID) \
		--new=2:128:159 --typecode=2:$(CHS_SW_DTB_TGUID) \
		--new=3:2048:8191 --typecode=3:$(CHS_SW_FW_TGUID) \
		--new=4:8192:24575 --typecode=4:8300 \
		--new=5:24576:0 --typecode=5:8200 \
		$@
	dd if=$(word 1,$^) of=$@ bs=512 seek=64 conv=notrunc
	dd if=$(word 2,$^) of=$@ bs=512 seek=128 conv=notrunc
	dd if=$(word 3,$^) of=$@ bs=512 seek=2048 conv=notrunc
	dd if=$(word 4,$^) of=$@ bs=512 seek=8192 conv=notrunc

#########################
# Linux app compilation #
#########################
#
#CAR_CVA6_SDK      ?= $(realpath cva6-sdk)
#CAR_CROSS_COMPILE := $(CAR_CVA6_SDK)/buildroot/output/host/bin/riscv64-buildroot-linux-gnu-
#CAR_APP_CC        := $(CAR_CROSS_COMPILE)gcc
#CAR_APP_OBJDUMP   := $(CAR_CROSS_COMPILE)objdump
#CAR_APP_CCFLAGS   := -std=gnu99 -O0 -g
#
#%.car.app: %.car.o
#	$(CAR_APP_CC) $(CAR_SW_INCLUDES) -o $@ $<
#
#%.car.dump: %.car.o
#	$(CAR_APP_OBJDUMP) -S -d $< > $@
#
#%.car.o: %.c
#	$(CAR_APP_CC) $(CAR_SW_INCLUDES) $(CAR_APP_CCFLAGS) -c $< -o $@
