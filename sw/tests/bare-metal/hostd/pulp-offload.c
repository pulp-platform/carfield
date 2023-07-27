// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Yvan Tortorella <yvan.tortorella@unibo.it>
//
// Bare-metal offload test for the PULP cluster

#include <stdio.h>
#include <stdint.h>

#include "car_memory_map.h"
#include "car_util.h"
#include "dif/clint.h"
#include "dif/uart.h"
#include "params.h"
#include "regs/cheshire.h"
#include "util.h"
#include "payload.h"

int main(void)
{
  char str[] = "Cluster boot.\r\n";
  uint32_t rtc_freq = *reg32(&__base_regs, CHESHIRE_RTC_FREQ_REG_OFFSET);
  uint64_t reset_freq = clint_get_core_freq(rtc_freq, 2500);

  load_binary();

  volatile uint32_t pulp_boot_default = 0x78008080;

  pulp_cluster_set_bootaddress(pulp_boot_default);

  uart_init(&__base_uart, reset_freq, 115200);
  uart_write_str(&__base_uart, str, sizeof(str));
  uart_write_flush(&__base_uart);

  pulp_cluster_start();

  pulp_cluster_wait_eoc();

  return 0;

}
