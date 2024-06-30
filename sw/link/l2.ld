/* Copyright 2022 ETH Zurich and University of Bologna. */
/* Licensed under the Apache License, Version 2.0, see LICENSE for details. */
/* SPDX-License-Identifier: Apache-2.0 */

/* Nicole Narr <narrn@student.ethz.ch> */
/* Christopher Reinwardt <creinwar@student.ethz.ch> */
/* Paul Scheffler <paulsc@iis.ee.ethz.ch> */
/* Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch> */

INCLUDE common.ldh

MEMORY {
  l2 (rwx)    : ORIGIN = 0x78000000, LENGTH = 128K
}

SECTIONS {
  /* Keep binaries lean */
/*  /DISCARD/ : { *(.riscv.attributes) *(.comment) } */

  /* Global and stack pointer */
  /* By default, keep the calling context (boot ROM) stack pointer */
/*  __global_pointer$ = ADDR(.misc) + SIZEOF(.misc) / 2;
  __stack_pointer$  = 0; */

  __base_l2       = ORIGIN(l2);
}

SECTIONS {
  __stack_pointer$  = ORIGIN(l2) + LENGTH(l2) - 8;

  .text : {
    *(.text._start)
    *(.text)
    *(.text.*)
  } > l2

  .misc : ALIGN(16) {
    *(.rodata)
    *(.rodata.*)
    *(.data)
    *(.data.*)
    *(.srodata)
    *(.srodata.*)
    *(.sdata)
    *(.sdata.*)
  } > l2

  . = ALIGN(32);
  __bss_start = .;
  .bss : {
    *(.bss)
    *(.bss.*)
    *(.sbss)
    *(.sbss.*)
  } > l2
  . = ALIGN(32);
  __bss_end = .;

  .bulk : ALIGN(16) {
    *(.bulk)
    *(.bulk.*)
  } > l2
}
