// Copyright 2011-2014, Wind River Systems, Inc.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
// Copyright 2023 ETH Zurich
// Author: Robert Balas (balasr@iis.ee.ethz.ch)

#ifndef __BITS_H
#define __BITS_H

#include <stdbool.h>

/* Helper to pass a int as a pointer or vice-versa. */
#define POINTER_TO_UINT(x) ((uintptr_t) (x))
#define UINT_TO_POINTER(x) ((void *) (uintptr_t) (x))
#define POINTER_TO_INT(x)  ((intptr_t) (x))
#define INT_TO_POINTER(x)  ((void *) (intptr_t) (x))

#if !(defined (__CHAR_BIT__) && defined (__SIZEOF_LONG__))
#	error Missing required predefined macros for BITS_PER_LONG calculation
#endif

#define BITS_PER_LONG	(__CHAR_BIT__ * __SIZEOF_LONG__)
/* Create a contiguous bitmask starting at bit position @l and ending at
 * position @h.
 */
#define GENMASK(h, l) \
	(((~0UL) - (1UL << (l)) + 1) & (~0UL >> (BITS_PER_LONG - 1 - (h))))

/* KB, MB, GB */
#define KB(x) ((x) << 10)
#define MB(x) (KB(x) << 10)
#define GB(x) (MB(x) << 10)

/* KHZ, MHZ */
#define KHZ(x) ((x) * 1000)
#define MHZ(x) (KHZ(x) * 1000)

#ifndef BIT
#if defined(_ASMLANGUAGE)
#define BIT(n)  (1 << (n))
#else
#define BIT(n)  (1UL << (n))
#endif
#endif

/**
 * @brief Macro sets or clears bit depending on boolean value
 *
 * @param var Variable to be altered
 * @param bit Bit number
 * @param set Value 0 clears bit, any other value sets bit
 */
#define WRITE_BIT(var, bit, set) \
	((var) = (set) ? ((var) | BIT(bit)) : ((var) & ~BIT(bit)))

#define BIT_MASK(n) (BIT(n) - 1)


/**
 * @brief Convenience macro reads or sets register fields
 *
 * @param FIELD Register name
 * @param v value of bits
 */
#define REG_SET(FIELD, v) (((v) << FIELD##_SHIFT) & FIELD##_MASK)
#define REG_GET(FIELD, v) (((v) & FIELD##_MASK) >> FIELD##_SHIFT)

#endif
