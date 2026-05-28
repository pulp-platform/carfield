// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Robert Balas <balasr@iis.ee.ethz.ch>

// Check whether all different load and store sizes work for aligned and
// unaligned cases

#include <stdint.h>
#include <stdlib.h>
#include "params.h"
#include "regs/cheshire.h"
#include "regs/soc_ctrl.h"
#include "util.h"
#include "csr.h"
#include "car_util.h"
#include "car_memory_map.h"

// trap_vector() sets this according to exception value
volatile unsigned long exception_cause;

// enter this when there is an exception
void trap_vector(void)
{
    unsigned long mcause = csr_read(CSR_MCAUSE);
    exception_cause      = mcause;

    if (mcause >> (__riscv_xlen - 1)) {
        // interrupts, should not happen
        exit(100);
    } else {
        // exceptions

        // Advance past instruction that caused exception. Take care of
        // compressed instructions. Clobbers t0 and t1.
        asm volatile("csrr t0, mepc\n\t"
                     "lb t1, 0(t0)\n\t"
                     "andi t1, t1, 0x3\n\t" // lower bits=11 means word sized
                     "not t1, t1\n\t"
                     "addi t0, t0, 0x2\n\t"
                     "bnez t1, .L1\n\t"
                     "addi t0, t0, 0x2\n\t"
                     ".L1:\n\t"
                     "csrw mepc, t0");
    }
}

// these accesses should work out of the box for cva6
int check_aligned_accesses(uintptr_t addr)
{
    uint64_t magic64 = 0xbeebdeadcafebeef;
    uint32_t magic32 = 0xcafebeef;
    uint16_t magic16 = 0xbeef;
    uint16_t magic8  = 0xbb;

    // 8 byte aligned double word
    writed(magic64, addr);
    if (readd(addr) != magic64)
        return 1;

    // 8 byte aligned word
    writew(magic32, addr);
    if (readw(addr) != magic32)
        return 2;

    // 4 byte aligned word
    writew(magic32, addr + 4);
    if (readw(addr + 4) != magic32)
        return 3;

    // 8 byte aligned half word
    writeh(magic16, addr);
    if (readh(addr) != magic16)
        return 4;

    // 2 byte aligned half word
    writeh(magic16, addr + 2);
    if (readh(addr + 2) != magic16)
        return 5;

    // 8 byte aligned byte
    writeb(magic8, addr);
    if (readb(addr) != magic8)
        return 6;

    // 1 byte aligned byte
    writeb(magic8, addr + 1);
    if (readb(addr + 1) != magic8)
        return 7;

    return 0;
}

// cva6 doesn't support unaligned accesses so it should trap
int check_trap_unaligned_accesses(uintptr_t addr)
{
    uint64_t magic64 = 0xbeebdeadcafebeef;
    uint32_t magic32 = 0xcafebeef;
    uint16_t magic16 = 0xbeef;

    // unaligned double word
    exception_cause = -1;
    fence();
    writed(magic64, addr + 1);
    if (exception_cause != CAUSE_MISALIGNED_STORE)
        return 8;

    exception_cause = -1;
    fence();

// TODO: the following read causes bus to lock up
//    readd(addr + 1);
//    if (exception_cause != CAUSE_MISALIGNED_LOAD)
//        return 9;

//    // unaligned word
//    exception_cause = -1;
//    fence();
//    writew(magic32, addr + 1);
//    if (exception_cause != CAUSE_MISALIGNED_STORE)
//        return 10;
//
//    exception_cause = -1;
//    fence();
//    readw(addr + 1);
//    if (exception_cause != CAUSE_MISALIGNED_LOAD)
//        return 11;
//
//    // unaligned half word
//    exception_cause = -1;
//    fence();
//    writew(magic16, addr + 1);
//    if (exception_cause != CAUSE_MISALIGNED_STORE)
//        return 12;
//
//    exception_cause = -1;
//    fence();
//    readw(addr + 1);
//    if (exception_cause != CAUSE_MISALIGNED_LOAD)
//        return 13;

    return 0;
}

int main(void)
{
    int e;

    if ((e = check_aligned_accesses(CAR_SAFETY_ISLAND_SPM_BASE_ADDR)) != 0)
        return e;

    if ((e = check_trap_unaligned_accesses(CAR_SAFETY_ISLAND_SPM_BASE_ADDR)) !=
        0)
        return e;

    return 0;
}
