// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
//

#include "car_linux_mmap.h"
#include "car_memory_map.h"
#include "car_util.h"
#include "dif/clint.h"
#include "dif/uart.h"
#include "io.h"
#include "params.h"
#include "regs/cheshire.h"
#include "util.h"

#define N_SAMPLES 1024
#define DEFAULT_SEED 0xcaca5a5adeadbeef
#define FEEDBACK 0x6c0000397f000032

#define DUMP_REGION(PTR, SIZE, LINE)                                           \
    do {                                                                       \
        printf("\nDumping region %s\n", #PTR);                                 \
        for (int i = 0; i < SIZE; i++) {                                       \
            if (i % LINE == 0)                                                 \
                printf("\n%#04x - ", i);                                       \
            printf("%02x ", ((uint8_t *)PTR)[i]);                              \
        }                                                                      \
        printf("\n");                                                          \
    } while (0)

uint64_t *lfsr_byte_feedback;

/* probe address range "samples" time, evenly spaced */
int probe_range_direct(volatile uintptr_t from, volatile uintptr_t to,
                       int samples) {
    // check whether arguments passed make sense
    if ((samples < 0) && (to < from))
        return 2;

    uintptr_t addr = from;

    if(samples > (to - from)) samples = to - from;

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

uint32_t lfsr_iter_bit(uint64_t lfsr) {
    return (lfsr & 1) ? ((lfsr >> 1) ^ FEEDBACK) : (lfsr >> 1);
}

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

int probe_range_lfsr_wrwr(volatile uintptr_t from, volatile uintptr_t to,
                          int samples) {
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

int probe_range_lfsr_wwrr(volatile uintptr_t from, volatile uintptr_t to,
                          int samples) {
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

int main(int argc, char *argv[]) {

    int errors = 0;
    char *device_path;
    int device_fd;

    // Receive device path as argument (/dev/carfield for instance)
    if (argc != 2) {
        printf("Wrong usage : %s device\n", argv[0]);
        return -1;
    }

    device_path = argv[1];
    device_fd = open(device_path, O_RDWR | O_SYNC);

    carfield_platform_init(device_fd);

    // Probe an address range with pseudo-random values and read after each
    // write
    // (wrwr)

    // L2 shared memory
    if (car_l2_intl_1) {
        errors += probe_range_lfsr_wrwr(
            (uint64_t *)CAR_L2_SPM_PORT1_INTERLEAVED_BASE_ADDR(car_l2_intl_1),
            (uint64_t *)CAR_L2_SPM_PORT1_INTERLEAVED_END_ADDR(car_l2_intl_1),
            N_SAMPLES);
        if (errors) {
            printf("ERROR on car_l2_intl_1\n");
        }
        DUMP_REGION(car_l2_intl_1, 64, 8);
    } else printf("NOT FOUND car_l2_intl_1\n");

    if (car_l2_cont_1) {
        errors += probe_range_lfsr_wrwr(
            (uint64_t *)CAR_L2_SPM_PORT1_CONTIGUOUS_BASE_ADDR(car_l2_cont_1),
            (uint64_t *)CAR_L2_SPM_PORT1_CONTIGUOUS_END_ADDR(car_l2_cont_1),
            N_SAMPLES);
        if (errors) {
            printf("ERROR on car_l2_cont_1\n");
        }
        DUMP_REGION(CAR_L2_SPM_PORT1_CONTIGUOUS_BASE_ADDR(car_l2_cont_1), 64, 8);
    } else printf("NOT FOUND car_l2_cont_1\n");


    // Safety Island
    if (car_safety_island) {
        errors += probe_range_lfsr_wrwr(
            (uint64_t *)CAR_SAFETY_ISLAND_SPM_BASE_ADDR(car_safety_island),
            (uint64_t *)CAR_SAFETY_ISLAND_SPM_END_ADDR(car_safety_island),
            N_SAMPLES);
        if (errors) {
            printf("ERROR on car_safety_island\n");
        }
        DUMP_REGION(CAR_SAFETY_ISLAND_SPM_BASE_ADDR(car_safety_island), 64, 8);
    } else printf("NOT FOUND car_safety_island\n");


    // Integer Cluster
    if (car_integer_cluster) {
        errors += probe_range_lfsr_wrwr(
            (uint64_t *)CAR_INT_CLUSTER_SPM_BASE_ADDR(car_integer_cluster),
            (uint64_t *)CAR_INT_CLUSTER_SPM_END_ADDR(car_integer_cluster),
            N_SAMPLES);
        if (errors) {
            printf("ERROR on car_integer_cluster\n");
        }
        DUMP_REGION(CAR_INT_CLUSTER_SPM_BASE_ADDR(car_integer_cluster), 64, 8);
    } else printf("NOT FOUND car_integer_cluster\n");

    // FP Cluster
    if (car_spatz_cluster) {
        errors += probe_range_lfsr_wrwr(
            (uint64_t *)CAR_FP_CLUSTER_SPM_BASE_ADDR(car_spatz_cluster),
            (uint64_t *)CAR_FP_CLUSTER_SPM_END_ADDR(car_spatz_cluster),
            N_SAMPLES);
        if (errors) {
            printf("ERROR on car_spatz_cluster\n");
        }
        DUMP_REGION(CAR_FP_CLUSTER_SPM_BASE_ADDR(car_spatz_cluster), 64, 8);
    } else printf("NOT FOUND car_spatz_cluster\n");

    return errors;
}
