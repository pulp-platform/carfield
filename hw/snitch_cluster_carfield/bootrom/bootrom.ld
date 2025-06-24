/* Copyright 2020 ETH Zurich and University of Bologna. */
/* Solderpad Hardware License, Version 0.51, see LICENSE for details. */
/* SPDX-License-Identifier: SHL-0.51 */
ENTRY(_start)

MEMORY {
  rom (rx): ORIGIN = 0x02000000, LENGTH = 0x1000
}

SECTIONS
{
  . = 0x02000000;
  .text : {
    *(.text._start)
    *(.text)
    *(.text.*)
  } > rom
  .data : {
    *(.data)
    *(.rodata)
  } > rom
}
