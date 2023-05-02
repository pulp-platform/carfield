// Copyright 2022 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Yvan Tortorella <yvan.tortorella@unibo.it>

#pragma once

#include <stdint.h>

static inline volatile uint64_t axi_read(void *addr) {
    return *(volatile uint64_t *)(long)(addr);
}

static inline volatile void axi_write(void *addr, uint64_t value) {
    *(volatile uint64_t *)(long)(addr) = value;
}
