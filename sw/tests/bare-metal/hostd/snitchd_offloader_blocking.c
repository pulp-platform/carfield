// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
//

#include <stdio.h>
#include <stdlib.h>

#include "io.h"
#include "regs/cheshire.h"
#include "dif/clint.h"
#include "dif/uart.h"
#include "params.h"
#include "util.h"
#include "car_util.h"
#include "car_params.h"
#include "printf.h"
#include "car_iommu.h"

int main(void)
{
    // Init the HW

    set_iommu_bare();

    // s1pt_map(0x78000000, 0x78000000, 0x10000);
    // // Init device directory table for device 0
	// root_ddt[0].tc = DC_TC_VALID;
	// root_ddt[0].iohgatp = 0;
	// root_ddt[0].ta = 0;
	// root_ddt[0].fsc = (((uintptr_t)&(s1pt[0][0])) >> 12) | (IOSATP_MODE_SV39);
    // set_iommu_1lvl();

    // Spatz Island
    car_enable_domain(CAR_SPATZ_RST);

    load_binary();
    fencei();

    writew(ELF_BOOT_ADDR, 0x51000000);
	writew(0, 0x5100000c);
	fence();

	// Cluster interrupt
    writew(0xffff, 0x51020000 + 0x1a0);
	writew(0, 0x51020000 + 0x1a0);

    volatile uint32_t snitchd_corestatus;
    volatile uintptr_t *snitchd_corestatus_addr = (uintptr_t*)0x5100000c;

    while (!(uint32_t)readw(snitchd_corestatus_addr))
    	;
    snitchd_corestatus = (uint32_t) readw(snitchd_corestatus_addr);

    return snitchd_corestatus>>1;
}
