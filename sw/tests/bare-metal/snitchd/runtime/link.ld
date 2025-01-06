/* Copyright 2020 ETH Zurich and University of Bologna. */
/* Solderpad Hardware License, Version 0.51, see LICENSE for details. */
/* SPDX-License-Identifier: SHL-0.51 */

OUTPUT_ARCH( "riscv" )
ENTRY(_start)

MEMORY
{
    L1   (rwxa)  : ORIGIN = 0x51000000, LENGTH = 0x20000
    L2   (rwxa)  : ORIGIN = 0x78000000, LENGTH = 0x400000
}

SECTIONS
{
  .init :
  {
    . = ALIGN(4);
  }
  /* The program code and other data goes into L2 */
  .text :
  {
    . = ALIGN(4);
    *(.text.init)
    *(.text.startup)
    *(.text)
    *(.text*)
    *(.text)
    . = ALIGN(4);
    _etext = .;
  } >L2

  .rodata :
  {
    . = ALIGN(4);
    *(.rodata)
    *(.rodata*)
    . = ALIGN(4);
  } >L2

  /* HTIF */
  .htif         : { } >L2

  /* Thread Local Storage sections  */
  .tdata    :
  {
    __tdata_start = .;
    *(.tdata .tdata.* .gnu.linkonce.td.*)
    __tdata_end = .;
  }
  .tbss :
  {
    __tbss_start = .;
    *(.tbss .tbss.* .gnu.linkonce.tb.*)
    *(.tcommon)
    __tbss_end = .;
  }
  /* add a section after .tbss to put the __tbss_end symbol into for
     the LLD linker */
  .tbssend : { __tbss_end2 = .; }

  /* used by the startup to initialize data */
  _sidata = LOADADDR(.data);

  /* small data section that can be addressed through the global pointer */
  .sdata          :
  {
    __SDATA_BEGIN__ = .;
    __global_pointer$ = . + 0x7f0;
    *(.srodata.cst16) *(.srodata.cst8) *(.srodata.cst4) *(.srodata.cst2) *(.srodata .srodata.*)
    *(.sdata .sdata.* .gnu.linkonce.s.*)
  } >L2

  /* Initialized data sections goes into L2 */
  .data :
  {
    __DATA_BEGIN__ = .;
    *(.data .data.* .gnu.linkonce.d.*)
    SORT(CONSTRUCTORS)
  } >L2
  _edata = .; PROVIDE (edata = .);

  /* small bss section */
  . = .;
  __bss_start = .;
  .sbss           :
  {
    *(.dynsbss)
    *(.sbss .sbss.* .gnu.linkonce.sb.*)
    *(.scommon)
  } >L2

  /* Uninitialized data section */
  .bss            :
  {
   *(.dynbss)
   *(.bss .bss.* .gnu.linkonce.b.*)
   *(COMMON)
   /* Align here to ensure that the .bss section occupies space up to
      _end.  Align after .bss to ensure correct alignment even if the
      .bss section disappears because there are no input sections. */
   . = ALIGN(. != 0 ? 32 / 8 : 1);
  } >L2
  . = ALIGN(32 / 8);
  . = SEGMENT_START("ldata-segment", .);
  . = ALIGN(32 / 8);
  __BSS_END__ = .;
  _end = .; PROVIDE (end = .);

  /* Uninitialized data section in L2 */
  .dram :
  {
    *(.dram)
    _edram = .;
  } >L2

  .init_l1 :
  { 
    jump_address = .;
    . = . + 0x4;
    scratch_reg = .;
    . = . + 0x4;
    tcdm_end_address_reg = .;
    . = . + 0x4;
    barrier_reg = .;
    . = . + 0x4;
    *(.init_l1)
  } >L1

  .noinit_l1 (NOLOAD) :
  { 
    . = ALIGN(16);
    *(.noinit_l1)
  } >L1

  . = ALIGN(16);
  l1_alloc_base = .;
}
