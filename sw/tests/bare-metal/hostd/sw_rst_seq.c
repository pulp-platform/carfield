// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Robert Balas <balasr@iis.ee.ethz.ch>
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

// Basic testing of warm resets. This test is executed only from LLC/SPM since it tests SW reset on
// shared L2 and hyperbus memory controller.

#include <stdint.h>
#include "params.h"
#include "regs/cheshire.h"
#include "regs/soc_ctrl.h"
#include "regs/safety_soc_ctrl.h"
#include "regs/spatz_cluster_peripheral.h"
#include "util.h"
#include "car_util.h"
#include "car_memory_map.h"

int main(void)
{
    // Safety Island

    // We write a bunch of bytes to the safety island's boot register and check
    // that it reads the reset value after a warm reset. Note that we can't use
    // the safety island's scratchpad for that since it is not resetable
    uint64_t magic = 0xcafebeef;

    // Write a pattern to safety island boot addr
    writew(magic, CAR_SAFETY_ISLAND_PERIPHS_BASE_ADDR +
		      SAFETY_SOC_CTRL_BOOTADDR_REG_OFFSET);

    // Double check
    if (readw(CAR_SAFETY_ISLAND_PERIPHS_BASE_ADDR +
	      SAFETY_SOC_CTRL_BOOTADDR_REG_OFFSET) != magic)
	return ESAFEDNOACCES;

    // engage reset sequence for safety island
    car_reset_domain(CAR_SAFETY_RST);

    // After the reset we should only see zeros
    if (readw(CAR_SAFETY_ISLAND_PERIPHS_BASE_ADDR +
	      SAFETY_SOC_CTRL_BOOTADDR_REG_OFFSET) !=
	SAFETY_ISLAND_BOOT_ADDR_RSVAL)
	return ESAFEDNOACCES;

    // Spatz
    writew(magic, CAR_FP_CLUSTER_PERIPHS_BASE_ADDR +
		      SPATZ_CLUSTER_PERIPHERAL_CLUSTER_BOOT_CONTROL_REG_OFFSET);
    if (readw(CAR_FP_CLUSTER_PERIPHS_BASE_ADDR +
	      SPATZ_CLUSTER_PERIPHERAL_CLUSTER_BOOT_CONTROL_REG_OFFSET) !=
	magic)
	return EFPCLNOACCES;

    car_reset_domain(CAR_SPATZ_RST);
    if (readw(CAR_FP_CLUSTER_PERIPHS_BASE_ADDR +
	      SPATZ_CLUSTER_PERIPHERAL_CLUSTER_BOOT_CONTROL_REG_OFFSET) != 0)
	return EFPCLNOACCES;

    // PULP Reset
    writew(magic, CAR_INT_CLUSTER_BOOT_ADDR_REG);
    if (readw(CAR_INT_CLUSTER_BOOT_ADDR_REG) != magic)
	return EINTCLNOACCES;

    volatile uint32_t pulp_boot_addr_rst_value = 0x78200000;
    car_reset_domain(CAR_PULP_RST);
    if (readw(CAR_INT_CLUSTER_BOOT_ADDR_REG) != pulp_boot_addr_rst_value)
	return EINTCLNOACCES;

    // L2 Reset
    // Memory doesn't have a reset so this needs to be checked manually
    car_reset_domain(CAR_L2_RST);

    // Security Island
    // We can't access anything so this needs to be checked manually
    car_reset_domain(CAR_SECURITY_RST);

    return 0;
}
