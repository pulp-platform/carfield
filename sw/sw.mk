# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Nicole Narr <narrn@student.ethz.ch>
# Christopher Reinwardt <creinwar@student.ethz.ch>
# Paul Scheffler <paulsc@iis.ee.ethz.ch>

# Override this as needed
RISCV_GCC_BINROOT ?= $(dir $(shell which riscv64-unknown-elf-gcc))

DTC           ?= dtc
RISCV_AR      ?= $(RISCV_GCC_BINROOT)/riscv64-unknown-elf-ar
RISCV_CC      ?= $(RISCV_GCC_BINROOT)/riscv64-unknown-elf-gcc
RISCV_OBJCOPY ?= $(RISCV_GCC_BINROOT)/riscv64-unknown-elf-objcopy
RISCV_OBJDUMP ?= $(RISCV_GCC_BINROOT)/riscv64-unknown-elf-objdump

CAR_LD_DIR    ?= $(CAR_SW_DIR)/link


RISCV_FLAGS   ?= -DOT_PLATFORM_RV32 -march=rv64gc_zifencei -mabi=lp64d -mstrict-align -O2 -Wall -static -ffunction-sections -fdata-sections -frandom-seed=cheshire -fuse-linker-plugin -flto -Wl,-flto
RISCV_CCFLAGS ?= $(RISCV_FLAGS) -ggdb -mcmodel=medany -mexplicit-relocs -fno-builtin -fverbose-asm -pipe
RISCV_LDFLAGS ?= $(RISCV_FLAGS) -nostartfiles -Wl,--gc-sections -Wl,-L$(CAR_LD_DIR)
RISCV_ARFLAGS ?= --plugin=$(shell find $(shell dirname $(RISCV_GCC_BINROOT))/libexec/gcc/riscv64-unknown-elf/**/liblto_plugin.so)


car-sw-all: car-sw-libs car-sw-headers car-sw-tests

.PRECIOUS: %.elf %.dtb
.PHONY: car-sw-all car-sw-libs car-sw-headers car-sw-tests

################
# Dependencies #
################

CAR_SW_DEPS_INCS += -I$(CAR_LLC_DIR)/sw/include
CAR_SW_DEPS_INCS += -I$(CAR_OTP_DIR)
CAR_SW_DEPS_INCS += -I$(CAR_OTP_DIR)/sw/include

#############
# Libraries #
#############

CAR_SW_INCLUDES   ?= -I$(CAR_SW_DIR)/include $(CAR_SW_DEPS_INCS)
CAR_SW_LIB_SRCS_S  = $(wildcard $(CAR_SW_DIR)/lib/*.S $(CAR_SW_DIR)/lib/**/*.S)
CAR_SW_LIB_SRCS_C  = $(wildcard $(CAR_SW_DIR)/lib/*.c $(CAR_SW_DIR)/lib/**/*.c)
CAR_SW_LIB_SRCS_O  = $(CAR_SW_DEPS_SRCS:.c=.o) $(CAR_SW_LIB_SRCS_S:.S=.o) $(CAR_SW_LIB_SRCS_C:.c=.o)

CAR_SW_LIBS = $(CAR_SW_DIR)/lib/libcarfield.a
CHS_SW_LIBS = $(CHS_SW_DIR)/lib/libcheshire.a

$(CAR_SW_DIR)/lib/libcheshire.a: $(CAR_SW_LIB_SRCS_O)
	rm -f $@
	$(RISCV_AR) $(RISCV_ARFLAGS) -rcsv $@ $^

car-sw-libs: $(CAR_SW_LIBS)

#####################
# Header generation #
#####################

#define car_sw_gen_hdr_rule
#.PRECIOUS: $$(CAR_SW_DIR)/include/regs/$(1).h
#CAR_SW_GEN_HDRS += $$(CAR_SW_DIR)/include/regs/$(1).h
#
#$$(CAR_SW_DIR)/include/regs/$(1).h: $(2)
#	@mkdir -p $$(dir $$@)
#	$$(REGGEN) --cdefines $$< > $$@
#endef

#$(eval $(call car_sw_gen_hdr_rule,clint,$(CAR_CLINT_DIR)/src/clint.hjson $(CAR_CLINT_DIR)/.generated))

# Generate headers for OT peripherals in the bendered repo itself
#CAR_SW_GEN_HDRS += $(CAR_OTP_DIR)/.generated
#car-sw-headers: $(CAR_SW_GEN_HDRS)

###############
# Compilation #
###############

# TODO: track headers with gcc -MM!

# All objects require up-to-date patches and headers
%.o: %.c $(CAR_SW_GEN_HDRS)
	$(RISCV_CC) $(CAR_SW_INCLUDES) $(RISCV_CCFLAGS) -c $< -o $@

%.o: %.S $(CAR_SW_GEN_HDRS)
	$(RISCV_CC) $(CAR_SW_INCLUDES) $(RISCV_CCFLAGS) -c $< -o $@

define car_ld_elf_rule
.PRECIOUS: %.$(1).elf

%.$(1).elf: $$(CAR_LD_DIR)/$(1).ld %.o $(CHS_SW_LIBS) $$(CAR_SW_LIBS)
	$$(RISCV_CC) $$(CAR_SW_INCLUDES) -T$$< $$(RISCV_LDFLAGS) -o $$@ $$*.o $$(CAR_SW_LIBS)
endef

$(foreach link,$(patsubst $(CAR_LD_DIR)/%.ld,%,$(wildcard $(CAR_LD_DIR)/*.ld)),$(eval $(call car_ld_elf_rule,$(link))))

%.dump: %.elf
	$(RISCV_OBJDUMP) -d -S $< > $@

%.bin: %.elf
	$(RISCV_OBJCOPY) -O binary $< $@

%.dtb: %.dts
	@$(DTC) -I dts -O dtb -o $@ $<

%.memh: %.elf
	$(RISCV_OBJCOPY) -O verilog $< $@

###################
# GPT test images #
###################

# Create a GPT disk image from a (firmware) ROM; we add dummy partitions to test our GPT boot code.
%.gpt.bin: %.rom.bin
	rm -f $@
	truncate -s $$(( $$(stat --printf="%s" $<) + 85*512)) $@
	parted -a none $@ --script -- mktable gpt \
	    mkpart dummy0   fat32   37s   40s \
	    mkpart firmware fat16   42s  -43s \
	    mkpart dummy1   fat32  -41s  -38s
	dd if=$< of=$@ bs=512 seek=42 conv=notrunc

# Create hex file from .gpt image
%.gpt.memh: %.gpt.bin
	$(RISCV_OBJCOPY) -I binary -O verilog $< $@

#########
# Tests #
#########

CAR_SW_TEST_SRCS_S  	= $(wildcard $(CAR_SW_DIR)/tests/*.S)
CAR_SW_TEST_SRCS_C     	= $(wildcard $(CAR_SW_DIR)/tests/*.c)
CAR_SW_TEST_DRAM_DUMP  	= $(CAR_SW_TEST_SRCS_S:.S=.dram.dump) $(CAR_SW_TEST_SRCS_C:.c=.dram.dump)
CAR_SW_TEST_SPM_DUMP   	= $(CAR_SW_TEST_SRCS_S:.S=.spm.dump)  $(CAR_SW_TEST_SRCS_C:.c=.spm.dump)
CAR_SW_TEST_L2_DUMP     = $(CAR_SW_TEST_SRCS_S:.S=.l2.dump)   $(CAR_SW_TEST_SRCS_C:.c=.l2.dump)
CAR_SW_TEST_SPM_ROMH   	= $(CAR_SW_TEST_SRCS_S:.S=.rom.memh)  $(CAR_SW_TEST_SRCS_C:.c=.rom.memh)
CAR_SW_TEST_SPM_GPTH   	= $(CAR_SW_TEST_SRCS_S:.S=.gpt.memh)  $(CAR_SW_TEST_SRCS_C:.c=.gpt.memh)

car-sw-tests: $(CAR_SW_TEST_DRAM_DUMP) $(CAR_SW_TEST_SPM_DUMP) $(CAR_SW_TEST_L2_DUMP) $(CAR_SW_TEST_SPM_ROMH) $(CAR_SW_TEST_SPM_GPTH)
