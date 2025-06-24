# Copyright 2020 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

.section .text.init
_start:
    .globl _start

    la      t0, crt0.trap
    csrw    mtvec, t0

    fence
    fence.i

    # Initialize global pointer
crt0.init_global_pointer:
    .option push
    .option norelax
1:  auipc     gp, %pcrel_hi(__global_pointer$)
    addi      gp, gp, %pcrel_lo(1b)
    .option pop

    # Initialize integer registers done in bootrom

    # Initialize float registers (if the core has F/D extension)
crt0.init_float_regs:
    csrr      t0, misa
    andi      t0, t0, (1 << 5)  # F/D flag is bit 5
    beqz      t0, 1f
    fmv.s.x   f0, x0
    fmv.s.x   f1, x0
    fmv.s.x   f2, x0
    fmv.s.x   f3, x0
    fmv.s.x   f4, x0
    fmv.s.x   f5, x0
    fmv.s.x   f6, x0
    fmv.s.x   f7, x0
    fmv.s.x   f8, x0
    fmv.s.x   f9, x0
    fmv.s.x   f10, x0
    fmv.s.x   f11, x0
    fmv.s.x   f12, x0
    fmv.s.x   f13, x0
    fmv.s.x   f14, x0
    fmv.s.x   f15, x0
    fmv.s.x   f16, x0
    fmv.s.x   f17, x0
    fmv.s.x   f18, x0
    fmv.s.x   f19, x0
    fmv.s.x   f20, x0
    fmv.s.x   f10, x0
    fmv.s.x   f21, x0
    fmv.s.x   f22, x0
    fmv.s.x   f23, x0
    fmv.s.x   f24, x0
    fmv.s.x   f25, x0
    fmv.s.x   f26, x0
    fmv.s.x   f27, x0
    fmv.s.x   f28, x0
    fmv.s.x   f29, x0
    fmv.s.x   f30, x0
    fmv.s.x   f31, x0
1:
    # Read hartid and number of cores in the cluster.
    # Note that a1 contains pointer to bootdata (set-up in bootrom)
crt0.init_core_info:
    lw        t0, 8(a1)  # load hartid_base
    csrr      a2, mhartid  # shift core's hartid such that first core is 0
    sub       a2, a2, t0
    mv        s1, a2
    # Read hartid and number of cores in the cluster.
crt0.init_stack:
    lw        sp, 12(a1) # load tcdm_start
    mv        s2, sp
    lw        t1, 16(a1) # load tcdm_size
    add       sp, t1, sp # compute tcdm end address
    addi      sp, sp, -8  # set 8 bytes aside for the main return value
    sw        zero, 0(sp)
    slli      t0, a2, 10  # set 2**10 bytes of stack space aside for each hart
    sub       sp, sp, t0
    slli      t0, a2, 3   # misalign stacks in the TCDM to reduce banking conflicts
    add       sp, sp, t0

    # Synchronize cores.
crt0.pre_main_barrier:
    csrr      x0, 0x7C2

    # Execute the main function.
crt0.main:
    call      main
    lw        s0, 0(s0)
    addi      s0, s0, -8
    bnez      s1, crt0.post_barrier
    li        t0, 1<<31
    or        a0, t0, a0 # Add a 1 at the msb of return value
    la        t1, eoc_address
    sw        a0, 0(t1) # Write return value to the beginning of tcdm

    # Synchronize cores.
crt0.post_barrier:
    csrr x0, 0x7C2

crt0.trap:
    j crt0.trap
