// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Mattia Sinigaglia <mattia.sinigaglia5@unibo.it>
//

#include "car_memory_map.h"
#include "io.h"
#include "regs/cheshire.h"
#include "sw/device/lib/dif/dif_rv_plic.h" // to be changed accoridng to correct hash
#include "dif/clint.h"
#include "dif/uart.h"
#include "params.h"
#include "util.h"
#include <stdio.h>
#include <stdlib.h>



int main(void) {

    // Init the HW
    car_init_start();

    char str[] = "FP Cluster boot.\r\n";
    uint32_t rtc_freq = *reg32(&__base_regs, CHESHIRE_RTC_FREQ_REG_OFFSET);
    uint64_t reset_freq = clint_get_core_freq(rtc_freq, 2500);

    load_binary();

    writew(0x78003EE0, SPATZ_CLUSTER_PERIPHERAL_CLUSTER_BOOT_CONTROL_REG_OFFSET);

    // Mailbox  base addr CAR_MBOX_BASE_ADDR
    for (int id = 0; id < 2; id++){
    	// Set Spatz id Interrupt
    	writew(0x00000001, MBOX_CAR_INT_SND_SET(id));

    	// Enable Spatz id Interrupt
    	writew(0x00000001, MBOX_CAR_INT_SND_EN(id));

    }
    wfi();
    return 0;
}