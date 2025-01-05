// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Cyril Koenig <cykoenig@iis.ee.ethz.ch>
//
// Simple program to test LLC enable, disable, flush and bypass

#include "regs/cheshire.h"
#include "dif/clint.h"
#include "params.h"
#include "util.h"
#include "car_memory_map.h"
#include "car_util.h"

volatile uint32_t dram_data_cached[64];
volatile uint32_t *dram_data_uncached;

int main(void) {

    // Init the HW
    car_init_start();

    // Disable CVA6 cache
    fence();
    asm volatile ("csrwi 0x701, 0" :: );

    dram_data_uncached = (uint32_t *)((void *)dram_data_cached + CAR_LLC_BYPASS_OFFSET);

    for ( int i = 0; i < 64 ; i++ ) {
        dram_data_uncached[i] = dram_data_uncached[i] + 1;
        if(dram_data_uncached[i] != 1) goto fail;
    }
    fence();

    llc_enable();

    for ( int i = 0; i < 64 ; i++ ) {
        dram_data_cached[i] = dram_data_cached[i] + 10;
        if(dram_data_cached[i] != 11) goto fail;
    }
    fence();

    for ( int i = 0; i < 64 ; i++ ) {
        dram_data_uncached[i] = dram_data_uncached[i] + 1;
        if(dram_data_uncached[i] != 2) goto fail;
    }
    fence();

    for ( int i = 0; i < 64 ; i++ ) {
        dram_data_cached[i] = dram_data_cached[i] + 10;
        if(dram_data_cached[i] != 21) goto fail;
    }
    fence();

    fence();
    llc_flush();

    for ( int i = 0; i < 64 ; i++ ) {
        dram_data_uncached[i] = dram_data_uncached[i] + 1;
        if(dram_data_uncached[i] != 22) goto fail;
    }
    fence();

    // The LLC has been flushed, thus will have the latest value (22)
    for ( int i = 0; i < 64 ; i++ ) {
        dram_data_cached[i] = dram_data_cached[i] + 10;
        if(dram_data_cached[i] != 32) goto fail;
    }
    fence();

    for ( int i = 0; i < 64 ; i++ ) {
        dram_data_uncached[i] = dram_data_uncached[i] + 1;
        if(dram_data_uncached[i] != 23) goto fail;
    }
    fence();

    // From now on, we are not anymore synched with the DRAM content
    for ( int i = 0; i < 64 ; i++ ) {
        dram_data_cached[i] = dram_data_cached[i] + 10;
        if(dram_data_cached[i] != 42) goto fail;
    }
    fence();

    llc_disable();

    for ( int i = 0; i < 64 ; i++ ) {
        if(dram_data_cached[i] != dram_data_uncached[i]) goto fail;
    }

    // Stress a bit more the LLC with the icache
    llc_enable();
    fencei();
    llc_disable();

    return 0;
    fail:
    return 1;
}
