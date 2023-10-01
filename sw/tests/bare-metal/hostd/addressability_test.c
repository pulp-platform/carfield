// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
//

#include "car_memory_map.h"
#include "dif/clint.h"
#include "dif/uart.h"
#include "io.h"
#include "car_util.h"
#include "params.h"
#include "regs/cheshire.h"
#include "util.h"

#define N_SAMPLES 64
#define DEFAULT_SEED 0xcaca5a5adeadbeef
#define FEEDBACK 0x6c0000397f000032

int diyprintf(char *str, int size) {
    // char str[] = "Hello World!\r\n";
    uint32_t rtc_freq = *reg32(&__base_regs, CHESHIRE_RTC_FREQ_REG_OFFSET);
    uint64_t reset_freq = clint_get_core_freq(rtc_freq, 2500);
    uart_init(&__base_uart, reset_freq, 115200);
    uart_write_str(&__base_uart, str, size);
    uart_write_flush(&__base_uart);
    return 0;
}

uint64_t *lfsr_byte_feedback;

/* probe address range "samples" time, evenly spaced */
int probe_range_direct(volatile uintptr_t from, volatile uintptr_t to, int samples) {
    // check whether arguments passed make sense
    if ((samples < 0) && (to < from))
        return 2;

    uintptr_t addr = from;
    uintptr_t incr = ((to - from) / samples);

    for (int i = 0; i < samples; i++) {
        // write
        uint32_t expected = 0xcafedead + 0xab + i;
        writed(expected, addr);
        // read
        if (expected != readd(addr))
            return 1;
        // increment
        addr += incr;
    }
    return 0;
}

uint32_t lfsr_iter_bit(uint64_t lfsr) { return (lfsr & 1) ? ((lfsr >> 1) ^ FEEDBACK) : (lfsr >> 1); }

uint32_t lfsr_iter_byte(uint64_t lfsr, uint64_t *lfsr_byte_feedback) {
    uint32_t l = lfsr;
    for (int i = 0; i < 8; i++)
        l = lfsr_iter_bit(l);
    return l;
}

uint32_t lfsr_iter_word(uint64_t lfsr, uint64_t *lfsr_byte_feedback) {
    uint32_t l = lfsr_iter_byte(lfsr, lfsr_byte_feedback);
    l = lfsr_iter_byte(l, lfsr_byte_feedback);
    l = lfsr_iter_byte(l, lfsr_byte_feedback);
    return lfsr_iter_byte(l, lfsr_byte_feedback);
}

uint64_t lfsr_64bits(uint64_t lfsr, uint64_t *lfsr_byte_feedback) {
    uint64_t l = lfsr_iter_byte(lfsr, lfsr_byte_feedback);
    l = lfsr_iter_byte(l, lfsr_byte_feedback);
    l = lfsr_iter_byte(l, lfsr_byte_feedback);
    l = lfsr_iter_byte(l, lfsr_byte_feedback);
    l = lfsr_iter_byte(l, lfsr_byte_feedback);
    l = lfsr_iter_byte(l, lfsr_byte_feedback);
    l = lfsr_iter_byte(l, lfsr_byte_feedback);
    return lfsr_iter_byte(l, lfsr_byte_feedback);
}

int probe_range_lfsr_wrwr(volatile uintptr_t from, volatile uintptr_t to, int samples) {
    // check whether arguments passed make sense
    if ((samples < 0) && (to < from))
        return 2;

    uintptr_t addr = from;
    uintptr_t incr = ((to - from) / samples);

    uint64_t lfsr = DEFAULT_SEED;
    for (int i = 0; i < samples; i++) {
        // write
        lfsr = lfsr_64bits(lfsr, lfsr_byte_feedback);
        writed(lfsr, addr);
        fence();
        // read
        if (lfsr != readd(addr))
            return 1;
        // increment
        addr += incr;
    }
    return 0;
}

int probe_range_lfsr_wwrr(volatile uintptr_t from, volatile uintptr_t to, int samples) {
    // check whether arguments passed make sense
    if ((samples < 0) && (to < from))
        return 2;

    uintptr_t addr = from;
    uintptr_t incr = ((to - from) / samples);

    // write
    uint64_t lfsr = DEFAULT_SEED;
    for (int i = 0; i < samples; i++) {
        lfsr = lfsr_64bits(lfsr, lfsr_byte_feedback);
        // write
        writed(lfsr, addr);
        // increment
        addr += incr;
    }

    fence();

    // read
    addr = from;
    lfsr = DEFAULT_SEED;
    for (int i = 0; i < samples; i++) {
        lfsr = lfsr_64bits(lfsr, lfsr_byte_feedback);
        // read
        if (lfsr != readd(addr))
            return 1;
        // increment
        addr += incr;
    }

    return 0;
}

int main(void) {

    // Init the HW
    car_init_start();

    int errors = 0;

    // Probe an address range with pseudo-random values and read after each write
    // (wrwr)

    // L2 shared memory
    errors += probe_range_lfsr_wrwr((uint64_t *)CAR_L2_SPM_PORT1_INTERLEAVED_BASE_ADDR(car_l2_intl_1),
                                    (uint64_t *)CAR_L2_SPM_PORT1_INTERLEAVED_END_ADDR(car_l2_intl_1), N_SAMPLES);
    if (errors) {
        char str[] = "1\n";
        diyprintf(str, sizeof(str));
    }

    errors += probe_range_lfsr_wrwr((uint64_t *)CAR_L2_SPM_PORT1_CONTIGUOUS_BASE_ADDR(car_l2_cont_1),
                                    (uint64_t *)CAR_L2_SPM_PORT1_CONTIGUOUS_END_ADDR(car_l2_cont_1), N_SAMPLES);
    if (errors) {
        char str[] = "2\n";
        diyprintf(str, sizeof(str));
    }

    // Safety Island
    errors += probe_range_lfsr_wrwr((uint64_t *)CAR_SAFETY_ISLAND_SPM_BASE_ADDR(car_safety_island),
                                    (uint64_t *)CAR_SAFETY_ISLAND_SPM_END_ADDR(car_safety_island), N_SAMPLES);
    if (errors) {
        char str[] = "3\n";
        diyprintf(str, sizeof(str));
    }
    // Integer Cluster
    errors += probe_range_lfsr_wrwr((uint64_t *)CAR_INT_CLUSTER_SPM_BASE_ADDR(car_integer_cluster), (uint64_t *)CAR_INT_CLUSTER_SPM_END_ADDR(car_integer_cluster),
                                    N_SAMPLES);
    if (errors) {
        char str[] = "4\n";
        diyprintf(str, sizeof(str));
    }
    // HyperRAM
    errors += probe_range_lfsr_wrwr((uint64_t *)CAR_HYPERRAM_BASE_ADDR, (uint64_t *)CAR_HYPERRAM_END_ADDR, N_SAMPLES);
    if (errors) {
        char str[] = "5\n";
        diyprintf(str, sizeof(str));
    }
    // FP Cluster
    errors += probe_range_lfsr_wrwr((uint64_t *)CAR_FP_CLUSTER_SPM_BASE_ADDR(car_spatz_cluster), (uint64_t *)CAR_FP_CLUSTER_SPM_END_ADDR(car_spatz_cluster),
                                    N_SAMPLES);
    if (errors) {
        char str[] = "6\n";
        diyprintf(str, sizeof(str));
    }
    // TODO Mailboxes

    // Probe an address space with pseudo-random values and read all after
    // writing (wwrr)

    // L2 shared memory
    errors += probe_range_lfsr_wwrr((uint64_t *)CAR_L2_SPM_PORT1_INTERLEAVED_BASE_ADDR(car_l2_intl_1),
                                    (uint64_t *)CAR_L2_SPM_PORT1_INTERLEAVED_END_ADDR(car_l2_intl_1), N_SAMPLES);
    if (errors) {
        char str[] = "7\n";
        diyprintf(str, sizeof(str));
    }
    errors += probe_range_lfsr_wwrr((uint64_t *)CAR_L2_SPM_PORT1_CONTIGUOUS_BASE_ADDR(car_l2_cont_1),
                                    (uint64_t *)CAR_L2_SPM_PORT1_CONTIGUOUS_END_ADDR(car_l2_cont_1), N_SAMPLES);
    if (errors) {
        char str[] = "8\n";
        diyprintf(str, sizeof(str));
    }

    // Safety Island
    errors += probe_range_lfsr_wwrr((uint64_t *)CAR_SAFETY_ISLAND_SPM_BASE_ADDR(car_safety_island),
                                    (uint64_t *)CAR_SAFETY_ISLAND_SPM_END_ADDR(car_safety_island), N_SAMPLES);
    if (errors) {
        char str[] = "9\n";
        diyprintf(str, sizeof(str));
    }
    // Integer Cluster
    errors += probe_range_lfsr_wwrr((uint64_t *)CAR_INT_CLUSTER_SPM_BASE_ADDR(car_integer_cluster), (uint64_t *)CAR_INT_CLUSTER_SPM_END_ADDR(car_integer_cluster),
                                    N_SAMPLES);
    if (errors) {
        char str[] = "a\n";
        diyprintf(str, sizeof(str));
    }
    // HyperRAM
    errors += probe_range_lfsr_wwrr((uint64_t *)CAR_HYPERRAM_BASE_ADDR, (uint64_t *)CAR_HYPERRAM_END_ADDR, N_SAMPLES);
    if (errors) {
        char str[] = "b\n";
        diyprintf(str, sizeof(str));
    }
    // FP Cluster
    errors += probe_range_lfsr_wrwr((uint64_t *)CAR_FP_CLUSTER_SPM_BASE_ADDR(car_spatz_cluster), (uint64_t *)CAR_FP_CLUSTER_SPM_END_ADDR(car_spatz_cluster),
                                    N_SAMPLES);
    if (errors) {
        char str[] = "c\n";
        diyprintf(str, sizeof(str));
    }
    // TODO Mailboxes

    return errors;
}
