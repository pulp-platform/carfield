// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "car_memory_map.h"
#include "car_util.h"
#include "regs/cheshire.h"
#include "sw/device/lib/dif/dif_rv_plic.h" // to be changed accoridng to correct hash
#include "dif/clint.h"
#include "dif/uart.h"
#include "params.h"
#include "util.h"
#include <stdio.h>
#include <stdlib.h>

static dif_rv_plic_t plic0;

int main(int argc, char const *argv[]) {
    int mbox_id = 51;                                             // index of mbox irq in the irq vector input to the PLIC
    int prio = 0x1;
    int a,b,c,d,e;
    bool t;
    unsigned global_irq_en   = 0x00001808;  
    unsigned external_irq_en = 0x00000800;
    asm volatile("csrw  mstatus, %0\n" : : "r"(global_irq_en  ));     // Set global interrupt enable in CVA6 csr
    asm volatile("csrw  mie, %0\n"     : : "r"(external_irq_en));     // Set external interrupt enable in CVA6 csr
    // PLIC setup
    mmio_region_t plic_base_addr = mmio_region_from_addr(0x04000000); 
    t = dif_rv_plic_init(plic_base_addr, &plic0);
    t = dif_rv_plic_irq_set_priority(&plic0, mbox_id, prio);
    t = dif_rv_plic_irq_set_enabled(&plic0, mbox_id, 0, kDifToggleEnabled);
    axi_write(0x40000008, 0xBAADC0DE); 
    axi_write(0x40000010, 0xBAADC0DE);
    axi_write(0x40000014, 0xBAADC0DE);
    axi_write(0x40000018, 0xBAADC0DE);
    axi_write(0x4000001C, 0xBAADC0DE);
    a = axi_read(0x40000008);          
    b = axi_read(0x40000010);
    c = axi_read(0x40000014);
    d = axi_read(0x40000018);
    e = axi_read(0x4000001C); 
    if( a == 0xBAADC0DE && b == 0xBAADC0DE && c == 0xBAADC0DE && d == 0xBAADC0DE && e == 0xBAADC0DE)
      axi_write(0x40000020, 0x00000001);    // ring doorbell if mailbox is accessible
    wfi();
    return 0;
}
