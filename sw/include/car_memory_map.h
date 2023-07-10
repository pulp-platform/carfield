// Copyright 2022 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>
// Paul Scheffler <paulsc@iis.ee.ethz.ch>
// Robert Balas <balasr@iis.ee.ethz.ch>
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
//
// This header provides information defined by hardware parameters, such as
// the address map. In the future, it should be generated automatically as
// part of the SoC generation process.

#ifndef __CAR_MEMORY_MAP_H
#define __CAR_MEMORY_MAP_H

// Base addresses provided at link time
extern void *__base_l2;

// Main Islands and accelerators

// L2 port 0
#define CAR_L2_SPM_PORT0_INTERLEAVED_BASE_ADDR 0x78000000
#define CAR_L2_SPM_PORT0_INTERLEAVED_END_ADDR  0x78100000
#define CAR_L2_SPM_PORT0_CONTIGUOUS_BASE_ADDR  0x78100000
#define CAR_L2_SPM_PORT0_CONTIGUOUS_END_ADDR   0x78200000

// L2 port 1
#define CAR_L2_SPM_PORT1_INTERLEAVED_BASE_ADDR 0x78200000
#define CAR_L2_SPM_PORT1_INTERLEAVED_END_ADDR  0x78300000
#define CAR_L2_SPM_PORT1_CONTIGUOUS_BASE_ADDR  0x78300000
#define CAR_L2_SPM_PORT1_CONTIGUOUS_END_ADDR   0x78400000

// Safety Island
#define CAR_SAFETY_ISLAND_SPM_BASE_ADDR 0x60000000
#define CAR_SAFETY_ISLAND_SPM_END_ADDR  0x60020000

#define CAR_SAFETY_ISLAND_PERIPHS_BASE_ADDR 0x60200000
#define CAR_SAFETY_ISLAND_PERIPHS_END_ADDR 0x60300000

// Integer Cluster
#define CAR_INT_CLUSTER_SPM_BASE_ADDR 0x50000000
#define CAR_INT_CLUSTER_SPM_END_ADDR  0x50040000

// Floating Point Spatz Cluster
#define CAR_FP_CLUSTER_SPM_BASE_ADDR 0x51000000
#define CAR_FP_CLUSTER_SPM_END_ADDR  0x51020000

#define CAR_FP_CLUSTER_PERIPHS_BASE_ADDR 0x51020000
// #define CAR_FP_CLUSTER_PERIPHS_END_ADDR  unknown

// HyperRAM
#define CAR_HYPERRAM_BASE_ADDR 0x80400000
#define CAR_HYPERRAM_END_ADDR  0x80800000

// Peripheral devices
#define CAR_PERIPHS_BASE_ADDR        0x20000000

#define CAR_ETHERNET_OFFSET          0x0000
#define CAR_CAN_OFFSET               0x1000
#define CAR_SYSTEM_TIMER_OFFSET      0x4000
#define CAR_ADVANCED_TIMER_OFFSET    0x5000
#define CAR_WATCHDOG_TIMER_OFFSET    0x7000
#define CAR_HYPERBUS_CFG_OFFSET      0x9000
#define CAR_PAD_CFG_OFFSET           0xa000
#define CAR_SOC_CTRL_OFFSET         0x10000

#define CAR_ETHERNET_BASE_ADDR       (CAR_PERIPHS_BASE_ADDR + CAR_ETHERNET_OFFSET)
#define CAR_CAN_BASE_ADDR            (CAR_PERIPHS_BASE_ADDR + CAR_CAN_OFFSET)
#define CAR_SYSTEM_TIMER_BASE_ADDR   (CAR_PERIPHS_BASE_ADDR + CAR_SYSTEM_TIMER_OFFSET)
#define CAR_ADVANCED_TIMER_BASE_ADDR (CAR_PERIPHS_BASE_ADDR + CAR_ADVANCED_TIMER_OFFSET)
#define CAR_WATCHDOG_TIMER_BASE_ADDR (CAR_PERIPHS_BASE_ADDR + CAR_WATCHDOG_TIMER_OFFSET)
#define CAR_HYPERBUS_CFG_BASE_ADDR   (CAR_PERIPHS_BASE_ADDR + CAR_HYPERBUS_CFG_OFFSET)
#define CAR_PAD_CFG_BASE_ADDR        (CAR_PERIPHS_BASE_ADDR + CAR_PAD_CFG_OFFSET)
#define CAR_SOC_CTRL_BASE_ADDR       (CAR_PERIPHS_BASE_ADDR + CAR_SOC_CTRL_OFFSET)

#define CAR_MBOX_BASE_ADDR           0x40000000

#endif /* __CAR_MEMORY_MAP_H */
