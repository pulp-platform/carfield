
RISCV_PREFIX  ?=
RISCV_CC      ?= clang
RISCV_OBJDUMP ?= llvm-objdump
RISCV_OBJCOPY ?= llvm-objcopy
RISCV_AR      ?= llvm-ar
RISCV_AS      ?= llvm-as

RISCV_FLAGS    ?= -g -O2 -mcpu=snitch -mabi=ilp32d -march=rv32imafd_zfh1p0_xfrep0p1_xssr0p1_xdma0p1_xfalthalf0p1_xfquarter0p1_xfaltquarter0p1_xfvecsingle0p1_xfvechalf0p1_xfvecalthalf0p1_xfvecquarter0p1_xfvecaltquarter0p1_xfauxhalf0p1_xfauxalthalf0p1_xfauxquarter0p1_xfauxaltquarter0p1_xfauxvecsingle0p1_xfauxvechalf0p1_xfauxvecalthalf0p1_xfauxvecquarter0p1_xfauxvecaltquarter0p1_xfexpauxvechalf0p1_xfexpauxvecalthalf0p1_xfexpauxvecquarter0p1_xfexpauxvecaltquarter0p1 -ffreestanding --sysroot=$(HERO_INSTALL)/rv32imafd-ilp32d/riscv32-unknown-elf
RISCV_LDFLAGS  ?= -static -nostdlib -L$(HERO_INSTALL)/lib/clang/15.0.0/rv32imafd-ilp32d/lib/ -lclang_rt.builtins-riscv32
RISCV_CCFLAGS  ?= $(RISCV_FLAGS) -DPRINTF_DISABLE_SUPPORT_EXPONENTIAL -Iruntime

all: bin/libomptarget_device.a

bin:
	mkdir $@

bin/libomptarget_device.a: runtime/link.ld runtime/crt0.S omptarget.c runtime/printf.c runtime/sw_mailbox.c | bin
	$(RISCV_CC) -c $(RISCV_CCFLAGS) $(DEFINES_$*) runtime/crt0.S -o bin/crt0.o
	$(RISCV_CC) -c $(RISCV_CCFLAGS) $(DEFINES_$*) runtime/printf.c -o bin/printf.o
	$(RISCV_CC) -c $(RISCV_CCFLAGS) $(DEFINES_$*) runtime/sw_mailbox.c -o bin/sw_mailbox.o
	$(RISCV_CC) -c $(RISCV_CCFLAGS) $(DEFINES_$*) omptarget.c -o bin/omptarget.o
	llvm-ar rcs $@ bin/crt0.o bin/printf.o bin/sw_mailbox.o bin/omptarget.o
	$(RISCV_OBJDUMP) -S -D $@ > bin/libomptarget_device.dump

clean:
	rm bin/*
.PHONY: clean

.PRECIOUS: bin/*
