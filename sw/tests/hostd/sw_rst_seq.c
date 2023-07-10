// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Robert Balas <balasr@iis.ee.ethz.ch>
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

// basic testing of warm resets

// Safety Island OK
// Spatz OK
// PULP cluster Hangs
// Security Island Hangs
// Peripherals Hangs

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
        return 2;

    // engage reset sequence for safety island
    car_reset_domain(CAR_SAFETY_RST);

    // After the reset we should only see zeros
    if (readw(CAR_SAFETY_ISLAND_PERIPHS_BASE_ADDR +
              SAFETY_SOC_CTRL_BOOTADDR_REG_OFFSET) !=
        SAFETY_ISLAND_BOOT_ADDR_RSVAL)
        return 3;

    // Spatz
    writew(magic, CAR_FP_CLUSTER_PERIPHS_BASE_ADDR +
                      SPATZ_CLUSTER_PERIPHERAL_CLUSTER_BOOT_CONTROL_REG_OFFSET);
    if (readw(CAR_FP_CLUSTER_PERIPHS_BASE_ADDR +
              SPATZ_CLUSTER_PERIPHERAL_CLUSTER_BOOT_CONTROL_REG_OFFSET) !=
        magic)
        return 4;

    car_reset_domain(CAR_SPATZ_RST);
    if (readw(CAR_FP_CLUSTER_PERIPHS_BASE_ADDR +
              SPATZ_CLUSTER_PERIPHERAL_CLUSTER_BOOT_CONTROL_REG_OFFSET) != 0)
        return 5;

    // PULP Reset
    // car_reset_domain(CAR_PULP_RST);

    // Periph Reset
    // car_reset_domain(CAR_PERIPH_RST);

    // Security Island
    // We can't access anything no way to check if the reset worked
    // car_reset_domain(CAR_SECURITY_RST);

    return 0;
}
