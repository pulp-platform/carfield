# Copyright 2020 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51

#include <encoding.h>

.global _start
// Boot data is defined in a C++ namespace
.extern BOOTDATA

_start:
  // Clear integer registers
  mv x1, x0
  mv x2, x0
  mv x3, x0
  mv x4, x0
  mv x5, x0
  mv x6, x0
  mv x7, x0
  mv x8, x0
  mv x9, x0
  mv x10, x0
  mv x11, x0
  mv x12, x0
  mv x13, x0
  mv x14, x0
  mv x15, x0
  mv x16, x0
  mv x17, x0
  mv x18, x0
  mv x19, x0
  mv x20, x0
  mv x21, x0
  mv x22, x0
  mv x23, x0
  mv x24, x0
  mv x25, x0
  mv x26, x0
  mv x27, x0
  mv x28, x0
  mv x29, x0
  mv x30, x0
  mv x31, x0
  // Set exception vector
  la      t1, exception
  csrw    mtvec, t1
  // Set main arguments
  csrr    a0, mhartid
  la      a1, BOOTDATA
  // Enable machine cluster interrupts
  li t1, (1<<19)
  csrw mie, t1
  // Get bootdata
#  la      a1, _ZN3sim8BOOTDATAE
  // Wait for the wakeup interrupt
  wfi
  // Load the start address of the TCDM
  lw      t2, 0xc(a1)
  // Load the entry point
  lw      t2, 0(t2)
  // Jump to the entry point
  jr      t2
exception:
  wfi
  j     exception
  nop
  nop
  nop
  nop
