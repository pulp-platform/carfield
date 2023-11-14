// Generated register defines for MCLIC

// Copyright information found in source file:
// Copyright 2022 ETH Zurich and University of Bologna.Copyright and related rights are licensed under the Solderpad Hardware

// Licensing information found in source file:
// licensed under the Solderpad Hardware
// SPDX-License-Identifier: Apache-2.0

#ifndef _MCLIC_REG_DEFS_
#define _MCLIC_REG_DEFS_

#ifdef __cplusplus
extern "C" {
#endif
// Register width
#define MCLIC_PARAM_REG_WIDTH 32

// CLIC configuration
#define MCLIC_MCLICCFG_REG_OFFSET 0x0
#define MCLIC_MCLICCFG_MNLBITS_MASK 0xf
#define MCLIC_MCLICCFG_MNLBITS_OFFSET 0
#define MCLIC_MCLICCFG_MNLBITS_FIELD \
  ((bitfield_field32_t) { .mask = MCLIC_MCLICCFG_MNLBITS_MASK, .index = MCLIC_MCLICCFG_MNLBITS_OFFSET })
#define MCLIC_MCLICCFG_NMBITS_MASK 0x3
#define MCLIC_MCLICCFG_NMBITS_OFFSET 4
#define MCLIC_MCLICCFG_NMBITS_FIELD \
  ((bitfield_field32_t) { .mask = MCLIC_MCLICCFG_NMBITS_MASK, .index = MCLIC_MCLICCFG_NMBITS_OFFSET })
#define MCLIC_MCLICCFG_SNLBITS_MASK 0xf
#define MCLIC_MCLICCFG_SNLBITS_OFFSET 16
#define MCLIC_MCLICCFG_SNLBITS_FIELD \
  ((bitfield_field32_t) { .mask = MCLIC_MCLICCFG_SNLBITS_MASK, .index = MCLIC_MCLICCFG_SNLBITS_OFFSET })
#define MCLIC_MCLICCFG_UNLBITS_MASK 0xf
#define MCLIC_MCLICCFG_UNLBITS_OFFSET 24
#define MCLIC_MCLICCFG_UNLBITS_FIELD \
  ((bitfield_field32_t) { .mask = MCLIC_MCLICCFG_UNLBITS_MASK, .index = MCLIC_MCLICCFG_UNLBITS_OFFSET })
#define MCLIC_MCLICCFG_RESERVED_MASK 0xf
#define MCLIC_MCLICCFG_RESERVED_OFFSET 28
#define MCLIC_MCLICCFG_RESERVED_FIELD \
  ((bitfield_field32_t) { .mask = MCLIC_MCLICCFG_RESERVED_MASK, .index = MCLIC_MCLICCFG_RESERVED_OFFSET })

// CLIC enable mnxti irq forwarding logic
#define MCLIC_CLICMNXTICONF_REG_OFFSET 0x4
#define MCLIC_CLICMNXTICONF_CLICMNXTICONF_BIT 0

#ifdef __cplusplus
}  // extern "C"
#endif
#endif  // _MCLIC_REG_DEFS_
// End generated register defines for MCLIC
