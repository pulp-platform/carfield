// Generated register defines for safety_soc_ctrl

// Copyright information found in source file:
// Copyright 2023 ETH Zurich and University of Bologna

// Licensing information found in source file:
// 
// SPDX-License-Identifier: SHL-0.51

#ifndef _SAFETY_SOC_CTRL_REG_DEFS_
#define _SAFETY_SOC_CTRL_REG_DEFS_

#ifdef __cplusplus
extern "C" {
#endif
// Register width
#define SAFETY_SOC_CTRL_PARAM_REG_WIDTH 32

// Core Boot Address
#define SAFETY_SOC_CTRL_BOOTADDR_REG_OFFSET 0x0

// Core Fetch Enable
#define SAFETY_SOC_CTRL_FETCHEN_REG_OFFSET 0x4
#define SAFETY_SOC_CTRL_FETCHEN_FETCHEN_BIT 0

// Core Return Status (return value, EOC)
#define SAFETY_SOC_CTRL_CORESTATUS_REG_OFFSET 0x8

// Core Boot Mode
#define SAFETY_SOC_CTRL_BOOTMODE_REG_OFFSET 0xc
#define SAFETY_SOC_CTRL_BOOTMODE_BOOTMODE_MASK 0x3
#define SAFETY_SOC_CTRL_BOOTMODE_BOOTMODE_OFFSET 0
#define SAFETY_SOC_CTRL_BOOTMODE_BOOTMODE_FIELD \
  ((bitfield_field32_t) { .mask = SAFETY_SOC_CTRL_BOOTMODE_BOOTMODE_MASK, .index = SAFETY_SOC_CTRL_BOOTMODE_BOOTMODE_OFFSET })

#ifdef __cplusplus
}  // extern "C"
#endif
#endif  // _SAFETY_SOC_CTRL_REG_DEFS_
// End generated register defines for safety_soc_ctrl