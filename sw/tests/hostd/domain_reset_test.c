// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>
//
// Simple payload to test bootmodes

#include "dif/clint.h"
#include "dif/uart.h"
#include "params.h"
#include "regs/cheshire.h"
#include "regs/soc_ctrl.h"
#include "util.h"
#include "car_util.h"

int main(void) {

    // Isolate domain
    domain_sw_reset(CARFIELD_SAFETY_ISLAND_ISOLATE_REG_OFFSET, CARFIELD_SAFETY_ISLAND_ISOLATE_STATUS_REG_OFFSET,
                    CARFIELD_SAFETY_ISLAND_CLK_EN_REG_OFFSET, CARFIELD_SAFETY_ISLAND_RST_REG_OFFSET);

        return 0;
}
