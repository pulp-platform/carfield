// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
//

#ifndef __CAR_UTIL_H
#define __CAR_UTIL_H

#include "util.h"
#include "car_memory_map.h"
#include "io.h"

// val = 1: isolation
// val = 0: deisolation
void set_domain_isolation(uint32_t val, uint32_t isolate_offset, uint32_t isolate_status_offset) {
    writew(val, CAR_SOC_CTRL_BASE_ADDR + isolate_offset);
    fence();
    while (readw(CAR_SOC_CTRL_BASE_ADDR + isolate_status_offset) != val)
	;
}

void set_clk_enable_domain(uint32_t val, uint32_t offset) {
    writew(val, CAR_SOC_CTRL_BASE_ADDR + offset);
    fence();
}

void set_reset_n_domain(uint32_t val, uint32_t offset) {
    writew(val, CAR_SOC_CTRL_BASE_ADDR + offset);
    fence();
}

void domain_sw_reset(uint32_t isolate_offset, uint32_t isolate_offset_status, uint32_t clk_en_offset,
		     uint32_t reset_n_offset) {

    set_domain_isolation(1, isolate_offset, isolate_offset_status);

    // Disable domain's clock
    writew(0, CAR_SOC_CTRL_BASE_ADDR + clk_en_offset);

    // Reset cycle
    writew(0, CAR_SOC_CTRL_BASE_ADDR + reset_n_offset);
    writew(1, CAR_SOC_CTRL_BASE_ADDR + reset_n_offset);

    // Re-enable domain's clock
    writew(1, CAR_SOC_CTRL_BASE_ADDR + clk_en_offset);

    set_domain_isolation(0, isolate_offset, isolate_offset_status);
}

#endif
