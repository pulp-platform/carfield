// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Yvan Tortorella <yvan.tortorella@unibo.it>
//
// Test for HMR functionalities.

#include "car_util.h"
#include "printf.h"

int main(void) {

  // We read the number of available harts.
  uint32_t NumHarts = readw(CHESHIRE_NUM_INT_HARTS);

  // SMP hart waits for the other one completion.
  if (hart_id() != 0) wfi();

  printf("Hey there, it's CVA6 %d!\n", hart_id());
  
  // The non SMP hart wakes up the SMP one, then goes to sleep
  // waiting for the SMP one to wake him up.
  writew(0x1, CAR_CLINT_BASE_ADDR + 0x4*((NumHarts-1) - hart_id()));
  writew(0x0, CAR_CLINT_BASE_ADDR + 0x4*((NumHarts-1) - hart_id()));

  wfi();

  // Only non SMP hart returns.
  return 0;
}
