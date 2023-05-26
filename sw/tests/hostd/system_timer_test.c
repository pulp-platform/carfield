// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
//

#include "car_memory_map.h"
#include "car_util.h"
#include "dif/clint.h"
#include "dif/uart.h"
#include "params.h"
#include "regs/cheshire.h"
#include "regs/system_timer.h"
#include "util.h"

#define assert(expression) \
    do { \
	if (!expression) { \
	    return 1; \
	} \
    } while (0)

#define DUMMY_TIMER_CNT_GOLDEN 8070
#define HYPER_DUMMY_TIMER_CNT_GOLDEN 8192

int main(void) {

    // Reset system timer
    axi_write(CAR_SYSTEM_TIMER_BASE_ADDR + TIMER_RESET_LO_OFFSET, 1);

    // Start system timer
    axi_write(CAR_SYSTEM_TIMER_BASE_ADDR + TIMER_START_LO_OFFSET, 1);

    for (volatile int i = 0; i < 500; i++)
	;

    // Stop system timer
    axi_write(CAR_SYSTEM_TIMER_BASE_ADDR + TIMER_CFG_LO_OFFSET, 0);

    // Get system timer count
    volatile int time = axi_read(CAR_SYSTEM_TIMER_BASE_ADDR + TIMER_CNT_LO_OFFSET);

    // Note: the result is checked against a golden value that is probed from
    // the waveforms, to check if the value is correctly read from sw.
    if ( (time != DUMMY_TIMER_CNT_GOLDEN) && (time != HYPER_DUMMY_TIMER_CNT_GOLDEN) ) {
    	return 1;
    }
    
    return 0;
}
