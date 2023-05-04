# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Nicole Narr <narrn@student.ethz.ch>
# Christopher Reinwardt <creinwar@student.ethz.ch>
# Paul Scheffler <paulsc@iis.ee.ethz.ch>
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

CAR_LD_DIR    ?= $(CAR_SW_DIR)/link

RISCV_LDFLAGS ?= $(RISCV_FLAGS) -nostartfiles -Wl,--gc-sections -Wl,) -L$(CHS_LD_DIR) -L$(CAR_LD_DIR)

car-sw-all: car-sw-libs car-sw-tests

.PRECIOUS: %.elf %.dtb
.PHONY: car-sw-all car-sw-libs car-sw-headers car-sw-tests

#############
# Libraries #
#############

CAR_SW_INCLUDES    = -I$(CAR_SW_DIR)/include -I$(CHS_SW_DIR)/include $(CHS_SW_DEPS_INCS)
CAR_SW_LIB_SRCS_S  = $(wildcard $(CAR_SW_DIR)/lib/*.S $(CAR_SW_DIR)/lib/**/*.S)
CAR_SW_LIB_SRCS_C  = $(wildcard $(CAR_SW_DIR)/lib/*.c $(CAR_SW_DIR)/lib/**/*.c)
CAR_SW_LIB_SRCS_O  = $(CAR_SW_DEPS_SRCS:.c=.o) $(CAR_SW_LIB_SRCS_S:.S=.o) $(CAR_SW_LIB_SRCS_C:.c=.o)

CAR_SW_LIBS = $(CAR_SW_DIR)/lib/libcarfield.a

$(CAR_SW_DIR)/lib/libcarfield.a: $(CAR_SW_LIB_SRCS_O)
	$(RISCV_AR) $(RISCV_ARFLAGS) -rcsv $@ $^

car-sw-libs: $(CAR_SW_LIBS)

###############
# Compilation #
###############

# All objects require up-to-date patches and headers
%.car.o: %.c
	@echo $(CAR_SW_INCLUDES)
	$(RISCV_CC) $(CAR_SW_INCLUDES) $(RISCV_CCFLAGS) -c $< -o $@

%.car.o: %.S
	$(RISCV_CC) $(CAR_SW_INCLUDES) $(RISCV_CCFLAGS) -c $< -o $@

define car_ld_elf_rule
.PRECIOUS: %.car.$(1).elf

%.car.$(1).elf: $$(CAR_LD_DIR)/$(1).ld %.car.o $(CHS_SW_LIBS) $$(CAR_SW_LIBS)
	$$(RISCV_CC) $$(CAR_SW_INCLUDES) -T$$< $$(RISCV_LDFLAGS) -o $$@ $$(filter-out $$<,$$^)
endef

$(foreach link,$(patsubst $(CAR_LD_DIR)/%.ld,%,$(wildcard $(CAR_LD_DIR)/*.ld)),$(eval $(call car_ld_elf_rule,$(link))))

#########
# Tests #
#########

CAR_SW_TEST_SRCS_S	= $(wildcard $(CAR_SW_DIR)/tests/*.S)
CAR_SW_TEST_SRCS_C	= $(wildcard $(CAR_SW_DIR)/tests/*.c)

CAR_SW_TEST_DRAM_DUMP	= $(CAR_SW_TEST_SRCS_S:.S=.car.dram.dump) $(CAR_SW_TEST_SRCS_C:.c=.car.dram.dump)
CAR_SW_TEST_SPM_DUMP	= $(CAR_SW_TEST_SRCS_S:.S=.car.spm.dump)  $(CAR_SW_TEST_SRCS_C:.c=.car.spm.dump)
CAR_SW_TEST_L2_DUMP	= $(CAR_SW_TEST_SRCS_S:.S=.car.l2.dump)   $(CAR_SW_TEST_SRCS_C:.c=.car.l2.dump)
CAR_SW_TEST_SPM_ROMH	= $(CAR_SW_TEST_SRCS_S:.S=.car.rom.memh)  $(CAR_SW_TEST_SRCS_C:.c=.car.rom.memh)
CAR_SW_TEST_SPM_GPTH	= $(CAR_SW_TEST_SRCS_S:.S=.car.gpt.memh)  $(CAR_SW_TEST_SRCS_C:.c=.car.gpt.memh)

car-sw-tests: $(CAR_SW_TEST_DRAM_DUMP) $(CAR_SW_TEST_SPM_DUMP) $(CAR_SW_TEST_L2_DUMP) $(CAR_SW_TEST_SPM_ROMH) $(CAR_SW_TEST_SPM_GPTH)
