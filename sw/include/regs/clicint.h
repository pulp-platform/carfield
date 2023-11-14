// Generated register defines for CLICINT

// Copyright information found in source file:
// Copyright 2022 ETH Zurich and University of Bologna.Copyright and related rights are licensed under the Solderpad Hardware

// Licensing information found in source file:
// licensed under the Solderpad Hardware
// SPDX-License-Identifier: Apache-2.0

#ifndef _CLICINT_REG_DEFS_
#define _CLICINT_REG_DEFS_

#ifdef __cplusplus
extern "C" {
#endif
// Register width
#define CLICINT_PARAM_REG_WIDTH 32

// CLIC interrupt pending, enable, attribute and control
#define CLICINT_CLICINT_REG_OFFSET(id) (0x1000 + 0x4 * id)
//#define CLICINT_CLICINT_REG_OFFSET 0x0
#define CLICINT_CLICINT_IP_BIT 0
#define CLICINT_CLICINT_IE_BIT 8
#define CLICINT_CLICINT_ATTR_SHV_BIT 16
#define CLICINT_CLICINT_ATTR_TRIG_MASK 0x3
#define CLICINT_CLICINT_ATTR_TRIG_OFFSET 17
#define CLICINT_CLICINT_ATTR_TRIG_FIELD \
  ((bitfield_field32_t) { .mask = CLICINT_CLICINT_ATTR_TRIG_MASK, .index = CLICINT_CLICINT_ATTR_TRIG_OFFSET })
#define CLICINT_CLICINT_ATTR_MODE_MASK 0x3
#define CLICINT_CLICINT_ATTR_MODE_OFFSET 22
#define CLICINT_CLICINT_ATTR_MODE_FIELD \
  ((bitfield_field32_t) { .mask = CLICINT_CLICINT_ATTR_MODE_MASK, .index = CLICINT_CLICINT_ATTR_MODE_OFFSET })
#define CLICINT_CLICINT_CTL_MASK 0xff
#define CLICINT_CLICINT_CTL_OFFSET 24
#define CLICINT_CLICINT_CTL_FIELD \
  ((bitfield_field32_t) { .mask = CLICINT_CLICINT_CTL_MASK, .index = CLICINT_CLICINT_CTL_OFFSET })

#ifdef __cplusplus
}  // extern "C"
#endif
#endif  // _CLICINT_REG_DEFS_
// End generated register defines for CLICINT
