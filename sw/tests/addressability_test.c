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
#include "util.h"

#define N_SAMPLES 64
#define DEFAULT_SEED 0xcaca5a5adeadbeef
#define FEEDBACK 0x6c0000397f000032

uint64_t *lfsr_byte_feedback;

/* probe address range "samples" time, evenly spaced */
void probe_range_direct(volatile uintptr_t from, volatile uintptr_t to, int samples) {
    // check whether arguments passed make sense
    if ((samples < 0) && (to < from))
	return 2;

    uintptr_t addr = from;
    uintptr_t incr = ((to - from) / samples);

    for (int i = 0; i < samples; i++) {
	// write
	uint32_t expected = 0xcafedead + 0xab + i;
	axi_write(addr, expected);
	// read
	if (expected != axi_read(addr))
	    return 1;
	// increment
	addr += incr;
    }
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

void probe_range_lfsr_wrwr(volatile uintptr_t from, volatile uintptr_t to, int samples) {
    // check whether arguments passed make sense
    if ((samples < 0) && (to < from))
	return 2;

    uintptr_t addr = from;
    uintptr_t incr = ((to - from) / samples);

    uint64_t lfsr = DEFAULT_SEED;
    for (int i = 0; i < samples; i++) {
	// write
	lfsr = lfsr_64bits(lfsr, lfsr_byte_feedback);
	axi_write(addr, lfsr);
	// read
	if (lfsr != axi_read(addr))
	    return 1;
	// increment
	addr += incr;
    }
}

void probe_range_lfsr_wwrr(volatile uintptr_t from, volatile uintptr_t to, int samples) {
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
	axi_write(addr, lfsr);
	// increment
	addr += incr;
    }

    // read
    addr = from;
    lfsr = DEFAULT_SEED;
    for (int i = 0; i < samples; i++) {
	lfsr = lfsr_64bits(lfsr, lfsr_byte_feedback);
	// read
	if (lfsr != axi_read(addr))
	    return 1;
	// increment
	addr += incr;
    }

}

int main(void) {

    // Probe an address range with pseudo-random values and read after each write
    // (wrwr)

    // L2 shared memory
    probe_range_lfsr_wrwr((uint64_t *)CAR_L2_SPM_PORT1_BASE_ADDR, (uint64_t *)CAR_L2_SPM_PORT1_END_ADDR, N_SAMPLES);
    // Safety Island
    probe_range_lfsr_wrwr((uint64_t *)CAR_SAFETY_ISLAND_SPM_BASE_ADDR, (uint64_t *)CAR_SAFETY_ISLAND_SPM_END_ADDR,
			 N_SAMPLES);
    // Integer Cluster
    probe_range_lfsr_wrwr((uint64_t *)CAR_INT_CLUSTER_SPM_BASE_ADDR, (uint64_t *)CAR_INT_CLUSTER_SPM_END_ADDR,
			  N_SAMPLES);

    // HyperRAM
    probe_range_lfsr_wrwr((uint64_t *)CAR_HYPERRAM_BASE_ADDR, (uint64_t *)CAR_HYPERRAM_END_ADDR,
			  N_SAMPLES);

    // FP Cluster
    probe_range_lfsr_wrwr((uint64_t *)CAR_FP_CLUSTER_SPM_BASE_ADDR, (uint64_t *)CAR_FP_CLUSTER_SPM_END_ADDR,
			  N_SAMPLES);
    // TODO Mailboxes

    // Probe an address space with pseudo-random values and read all after
    // writing (wwrr)


    // L2 shared memory
    probe_range_lfsr_wwrr((uint64_t *)CAR_L2_SPM_PORT1_BASE_ADDR, (uint64_t *)CAR_L2_SPM_PORT1_END_ADDR, N_SAMPLES);
    // Safety Island
    probe_range_lfsr_wwrr((uint64_t *)CAR_SAFETY_ISLAND_SPM_BASE_ADDR, (uint64_t *)CAR_SAFETY_ISLAND_SPM_END_ADDR,
			  N_SAMPLES);
    // Integer Cluster
    probe_range_lfsr_wwrr((uint64_t *)CAR_INT_CLUSTER_SPM_BASE_ADDR, (uint64_t *)CAR_INT_CLUSTER_SPM_END_ADDR,
			  N_SAMPLES);
    // HyperRAM
    probe_range_lfsr_wwrr((uint64_t *)CAR_HYPERRAM_BASE_ADDR, (uint64_t *)CAR_HYPERRAM_END_ADDR,
			  N_SAMPLES);
    // FP Cluster
    probe_range_lfsr_wrwr((uint64_t *)CAR_FP_CLUSTER_SPM_BASE_ADDR, (uint64_t *)CAR_FP_CLUSTER_SPM_END_ADDR,
			  N_SAMPLES);
    // TODO Mailboxes

    return 0;
}
