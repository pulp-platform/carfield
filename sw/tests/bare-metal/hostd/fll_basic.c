// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Victor Isachi <victor.isachi@unibo.it>
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>
//
// Simple payload to test bootmodes

#include "regs/cheshire.h"
#include "dif/clint.h"
#include "dif/uart.h"
#include "params.h"
#include "util.h"
#include "car_util.h"
#include "printf.h"

#define FLL_STATUS_REG_I  (0x20020000)
#define FLL_CONFIG_REG_I  (0x20020008)
#define FLL_CONFIG_REG_II (0x20020010)
#define FLL_INTEGR_REG    (0x20020018)

#define FLL_DCO_CODE_MASK (0x03FF0000)
#define FLL_CLK_DIV_MASK  (0x3C000000)
#define FLL_CLK_MUL_MASK  (0x0000FFFF)
#define FLL_MODE_MASK     (0x80000000)

#define FLL_DCO_CODE_OFFSET (16)
#define FLL_CLK_DIV_OFFSET  (26)
#define FLL_CLK_MUL_OFFSET  (0)
#define FLL_MODE_OFFSET     (31)

inline uint32_t write_bitfield(uint32_t src_reg, uint32_t bitfield_mask, uint32_t bitfield_offset, uint32_t val){
    return (src_reg & ~bitfield_mask) | (val << bitfield_offset);
}

int main(void) {

    // Put SMP Hart to sleep
    if (hart_id() != 0) wfi();

    uint32_t config_reg_1;

    config_reg_1 = readw(FLL_CONFIG_REG_I);
    config_reg_1 = write_bitfield(config_reg_1, FLL_DCO_CODE_MASK, FLL_DCO_CODE_OFFSET, 0x1F5);
    config_reg_1 = write_bitfield(config_reg_1, FLL_CLK_DIV_MASK, FLL_CLK_DIV_OFFSET, 0x1);
    writew(config_reg_1, FLL_CONFIG_REG_I);

    config_reg_1 = readw(FLL_CONFIG_REG_I);
    config_reg_1 = write_bitfield(config_reg_1, FLL_CLK_DIV_MASK, FLL_CLK_DIV_OFFSET, 0x2);
    config_reg_1 = write_bitfield(config_reg_1, FLL_CLK_MUL_MASK, FLL_CLK_MUL_OFFSET, 0x3);
    config_reg_1 = write_bitfield(config_reg_1, FLL_MODE_MASK, FLL_MODE_OFFSET, 0x1);
    writew(config_reg_1, FLL_CONFIG_REG_I);

    // Init the HW
    car_init_start();

    printf("Hi\n");
    return 0;
}
