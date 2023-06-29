// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
//

#include "car_memory_map.h"
#include "io.h"
#include "dif/clint.h"
#include "dif/uart.h"
#include "params.h"
#include "regs/cheshire.h"
#include "regs/system_timer.h"
#include "util.h"

// TODO: This test is really brittle. Its only purpose is to test timer accesses when the timer is
// configured in freerunning mode and check if the value is within a sensible range. A better test
// uses a periodic timer and checks if the periodic interrupts are taken. It will replace the
// current test when interrupts are tested in the SoC.

#define assert(expression) \
    do { \
	if (!expression) { \
	    return 1; \
	} \
    } while (0)

#define DUMMY_TIMER_CNT_GOLDEN_MIN 8050
#define DUMMY_TIMER_CNT_GOLDEN_MAX 8280

int main(void) {

    // Reset system timer
    writed(1, CAR_SYSTEM_TIMER_BASE_ADDR + TIMER_RESET_LO_OFFSET);

    // Start system timer
    writed(1, CAR_SYSTEM_TIMER_BASE_ADDR + TIMER_START_LO_OFFSET);

    for (volatile int i = 0; i < 500; i++)
	;

    // Stop system timer
    writed(0, CAR_SYSTEM_TIMER_BASE_ADDR + TIMER_CFG_LO_OFFSET);

    // Get system timer count
    volatile int time = readd(CAR_SYSTEM_TIMER_BASE_ADDR + TIMER_CNT_LO_OFFSET);

    // Note: the result is checked against a golden value that is probed from
    // the waveforms, to check if the value is correctly read from sw.
    if (time <= DUMMY_TIMER_CNT_GOLDEN_MIN || time >= DUMMY_TIMER_CNT_GOLDEN_MAX) {
	return 1;
    }

    return 0;
}
