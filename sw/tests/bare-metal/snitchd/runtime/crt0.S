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

    # Initialize integer registers
crt0.init_int_regs:
    li        x1, 0
    li        x4, 0
    li        x5, 0
    li        x6, 0
    li        x7, 0
    li        x8, 0
    li        x9, 0
    li        x10, 0
    li        x11, 0
    li        x12, 0
    li        x13, 0
    li        x14, 0
    li        x15, 0
    li        x16, 0
    li        x17, 0
    li        x18, 0
    li        x19, 0
    li        x20, 0
    li        x10, 0
    li        x21, 0
    li        x22, 0
    li        x23, 0
    li        x24, 0
    li        x25, 0
    li        x26, 0
    li        x27, 0
    li        x28, 0
    li        x29, 0
    li        x30, 0
    li        x31, 0

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
crt0.init_core_info:
    li        t0, 0x10  # load cluster's hartid offset
    csrr      a0, mhartid  # shift core's hartid such that first core is 0
    sub       a0, a0, t0
    li        a1, 9  # load the number of cores per cluster

crt0.big_hack:
    li        t3, 0x51020000
    la        t4, tcdm_end_address_reg
    sw        t3, 0(t4)
    li        t3, 0x51020190
    la        t4, barrier_reg
    sw        t3, 0(t4)

    # Read hartid and number of cores in the cluster.
crt0.init_stack:
    la        sp, tcdm_end_address_reg  # load stack top from peripheral register
    lw        sp, 0(sp)
    addi      sp, sp, -8  # set 8 bytes aside for the main return value
    sw        zero, 0(sp)
    slli      t0, a0, 10  # set 2**10 bytes of stack space aside for each hart
    sub       sp, sp, t0
    slli      t0, a0, 3   # misalign stacks in the TCDM to reduce banking conflicts
    add       sp, sp, t0

    # Synchronize cores.
crt0.pre_barrier:
    csrr x0, 0x7C2
    la        t0, barrier_reg
    lw        t0, 0(t0)
    mv        zero, t0

    # Execute the main function.
crt0.main:
    call      main
    la        s0, tcdm_end_address_reg  # add return value to special slot
    lw        s0, 0(s0)
    addi      s0, s0, -8
    #amoadd.w  zero, a0, (s0)
    #la        t0, fetch_enable_reg
    #sw        zero, 0(t0)
 
    # Synchronize cores.
crt0.post_barrier:
    csrr x0, 0x7C2
    la        t0, barrier_reg
    lw        t0, 0(t0)
    mv        zero, t0

    # Write execution result to EOC register.
#crt0.end:
#    la        t0, cluster_base_hart_id_reg
#    lw        t0, 0(t0)
#    csrr      t1, mhartid
#    bne       t0, t1, crt0.loop_back  # only first core writes to EOC address
#    #lw        a0, 0(s0)  # load accumulated return value from special slot
#    slli      a0, a0, 0  # shift in a 1 LSB to indicate execution completion
#    ori       a0, a0, 1
#    la        t0, eoc_address
#    sw        a0, 0(t0)
#    mv        t0, zero
#
#crt0.loop_back:
#    la        t0, bootrom_start 
#    jr        t0
#

crt0.trap:
    j crt0.trap
