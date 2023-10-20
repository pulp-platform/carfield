// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Robert Balas <balasr@iis.ee.ethz.ch>
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

// Header definition for irq_router
// Note that this is not auto-generated due to limitations of reggen

#ifndef _IRQ_ROUTER_REG_DEFS_
#define _IRQ_ROUTER_REG_DEFS_

// Register width
#define IRQ_ROUTER_PARAM_REG_WIDTH 32

// Target selection bitmask control register
#define IRQ_ROUTER_IRQ_TARGET_MASK_REG_OFFSET(i) (0x0 + 0x4 * i)

#define IRQ_ROUTER_NUM_IRQ_SRCS 59
#define IRQ_ROUTER_NUM_TARGETS 4

enum car_irq_router_target {
    IRQ_ROUTER_TARGET_NONE          = 0,
    IRQ_ROUTER_TARGET_PLIC          = 1,
    IRQ_ROUTER_TARGET_CVA6_CLIC0    = 1 << 1,
    IRQ_ROUTER_TARGET_CVA6_CLIC1    = 1 << 2,
    IRQ_ROUTER_TARGET_SAFETY_ISLAND = 1 << 3,
};

#endif // _IRQ_ROUTER_REG_DEFS_
