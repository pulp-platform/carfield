// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Robert Balas <balasr@iis.ee.ethz.ch>

// Basic testing of the virtualized clic's registers

#include <stdint.h>
#include <inttypes.h>
#include "dif/uart.h"
#include "params.h"
#include "regs/cheshire.h"
#include "regs/clic.h"
#include "regs/clicint.h"
#include "util.h"
#include "car_util.h"
#include "car_memory_map.h"
#include "printf.h"

static int probe_rw(uint64_t addr, uint32_t val)
{
    writew(val, addr);
    uint32_t ret = readw(addr);
    return !(ret == val);
}

#define VCLIC_RW_TEST_REG(NAME, VAL)                                                                                     \
    err = probe_rw(CAR_CLIC_CFG_BASE_ADDR(0) + NAME, VAL);                                                                 \
    if (err) {                                                                                                         \
        printf("error: rw " #NAME "\n");                                                                               \
        uart_write_flush(&__base_uart);                                                                                \
        return 1;                                                                                                      \
    }

int main(void)
{
    int err = 0;

    // Init UART
    uint32_t rtc_freq   = *reg32(&__base_regs, CHESHIRE_RTC_FREQ_REG_OFFSET);
    uint64_t reset_freq = clint_get_core_freq(rtc_freq, 2500);
    uart_init(&__base_uart, reset_freq, 115200);

    uint32_t mclicconf = readw(CAR_CLIC_CFG_BASE_ADDR(0) + MCLIC_MCLICCFG_REG_OFFSET);

    // Run basic register rw tests
    VCLIC_RW_TEST_REG(MCLIC_MCLICCFG_REG_OFFSET, mclicconf | 0x3);
    VCLIC_RW_TEST_REG(CLICINT_CLICINT_REG_OFFSET(1), 0x100);
    VCLIC_RW_TEST_REG(CLICINT_CLICINT_REG_OFFSET(75), 0x100);

    // supervisor
    VCLIC_RW_TEST_REG(0x08000, 1);

    // VCLIC regs
    VCLIC_RW_TEST_REG(0x0e000, 1);

    uart_write_flush(&__base_uart);

    return 0;
}
