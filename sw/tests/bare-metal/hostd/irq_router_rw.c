// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Robert Balas <balasr@iis.ee.ethz.ch>

// Basic testing of the irq router's configuration registers
#include <stdint.h>
#include "dif/uart.h"
#include "params.h"
#include "regs/cheshire.h"
#include "regs/irq_router.h"
#include "util.h"
#include "car_util.h"
#include "car_memory_map.h"
#include "printf.h"

static int check_irq_routed(enum car_irq_router_target target)
{
    for (int i = 0; i < IRQ_ROUTER_NUM_IRQ_SRCS; i++) {
        uint32_t val = readw(CAR_IRQ_ROUTER_BASE_ADDR + IRQ_ROUTER_IRQ_TARGET_MASK_REG_OFFSET(i));
        if (!(val & target)) {
            printf("FAIL irq=%d, val=%d\n", i, val);
            uart_write_flush(&__base_uart);
            return 1;
        }
    }

    return 0;
}

int main(void)
{
    int err = 0;

    // Init the HW
    car_init_start();

    // Init Uart
    uint32_t rtc_freq   = *reg32(&__base_regs, CHESHIRE_RTC_FREQ_REG_OFFSET);
    uint64_t reset_freq = clint_get_core_freq(rtc_freq, 2500);
    uart_init(&__base_uart, reset_freq, 115200);

    // after reset, all irqs should be routed to the plic
    err = check_irq_routed(IRQ_ROUTER_TARGET_PLIC);
    if (err) {
        printf("check_irq_routed() failed for core 0\n");
        uart_write_flush(&__base_uart);
        return 1;
    }

    // enable all interrupt for cva6 core 0
    err = car_irq_router_range_enable(0, IRQ_ROUTER_NUM_IRQ_SRCS, IRQ_ROUTER_TARGET_CVA6_CLIC0);
    if (err) {
        printf("car_irq_router_range_enable() failed\n");
        uart_write_flush(&__base_uart);
        return 1;
    }

    // check that they are enabled
    err = check_irq_routed(IRQ_ROUTER_TARGET_CVA6_CLIC0);
    if (err) {
        printf("check_irq_routed() failed for core 1\n");
        uart_write_flush(&__base_uart);
        return 1;
    }

    // enable all interrupt for cva6 core 0
    err = car_irq_router_range_enable(0, IRQ_ROUTER_NUM_IRQ_SRCS, IRQ_ROUTER_TARGET_CVA6_CLIC1);
    if (err) {
        printf("car_irq_router_range_enable() failed\n");
        uart_write_flush(&__base_uart);
        return 1;
    }

    // check that they are enabled
    err = check_irq_routed(IRQ_ROUTER_TARGET_CVA6_CLIC1);
    if (err) {
        printf("check_irq_routed() failed for core 1\n");
        uart_write_flush(&__base_uart);
        return 1;
    }

    // enable all interrupt for safety island
    err = car_irq_router_range_enable(0, IRQ_ROUTER_NUM_IRQ_SRCS, IRQ_ROUTER_TARGET_SAFETY_ISLAND);
    if (err) {
        printf("car_irq_router_range_enable() failed\n");
        uart_write_flush(&__base_uart);
        return 1;
    }

    // check that they are enabled
    err = check_irq_routed(IRQ_ROUTER_TARGET_SAFETY_ISLAND);
    if (err) {
        printf("check_irq_routed() failed for safety island\n");
        uart_write_flush(&__base_uart);
        return 1;
    }

    // disable all interrupts in router
    err = car_irq_router_range_disable(0, IRQ_ROUTER_NUM_IRQ_SRCS,
                                       IRQ_ROUTER_TARGET_PLIC | IRQ_ROUTER_TARGET_CVA6_CLIC0 |
                                           IRQ_ROUTER_TARGET_CVA6_CLIC1 | IRQ_ROUTER_TARGET_SAFETY_ISLAND);
    if (err) {
        printf("car_irq_router_range_enable() failed\n");
        uart_write_flush(&__base_uart);
        return 1;
    }

    // check that they are gone
    for (int i = 0; i < IRQ_ROUTER_NUM_IRQ_SRCS; i++) {
        uint32_t val = readw(CAR_IRQ_ROUTER_BASE_ADDR + IRQ_ROUTER_IRQ_TARGET_MASK_REG_OFFSET(i));
        if (val != 0) {
            printf("irq router interrupt disables failed\n");
            uart_write_flush(&__base_uart);
            return 1;
        }
    }

    uart_write_flush(&__base_uart);
    return 0;
}
