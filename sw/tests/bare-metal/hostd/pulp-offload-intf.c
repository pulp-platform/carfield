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
#include "csr.h"
#include "util.h"
#include "payload.h"
#include "printf.h"

long int * buffer; // 8 bytes * 256 * 1024 byte = 2 MB

void read_from_cache(int l1_way_size, int stride) {
    asm volatile("": : :"memory");
    for(int j = 0; j < l1_way_size; j++)
    {
      * ( ( volatile long int * ) &buffer[j] );
    }
    asm volatile("": : :"memory");
    for(int j = 0; j < l1_way_size; j++)
    {
      * ( ( volatile long int * ) &buffer[(j+0)*stride]);
    }
    asm volatile("": : :"memory");
}

int sweep(int stride)
{

  int l1_way_size = 4 * 1024 / 8;
  int working_set = l1_way_size * stride * 8;

  long unsigned cycle_start;

  for(int i = 0; i < 10; i++)
  {
    if(i==1)
    {
      cycle_start = get_mcycle();
    }
    read_from_cache(l1_way_size, stride);
  }

  long unsigned cycles = get_mcycle() - cycle_start;

  #ifdef VERBOSE
  printf("%3dKB        , %6d     \r\n",
           working_set / 1024, (int)cycles);
  #endif

  return (int)cycles;
}

int main(void)
{
  // Set the LLC as LLC
  axi_llc_reg32_all_cache(&__base_llc);
  int pulp_ret_val = 0;
  // Init the HW
  // PULP Island
  #ifdef LCL
  car_enable_domain(CAR_PULP_RST);
  char str[] = "Cluster boot.\r\n";
  uint32_t rtc_freq = *reg32(&__base_regs, CHESHIRE_RTC_FREQ_REG_OFFSET);
  uint64_t reset_freq = clint_get_core_freq(rtc_freq, 2500);

  load_binary();

  volatile uint32_t pulp_boot_default = 0x78008080;
  volatile uint32_t pulp_ret_val = 0;

  pulp_cluster_set_bootaddress(pulp_boot_default);

  uart_init(&__base_uart, reset_freq, 115200);
  uart_write_str(&__base_uart, str, sizeof(str));
  uart_write_flush(&__base_uart);

  pulp_cluster_start();
  #endif

  long unsigned cycles[5];
  int j=0;
  for( int i = 4; i<128; i=i*2){
    cycles[j] = sweep(i);
    j++;
  }

  #ifdef LCL
  pulp_cluster_wait_eoc();

  pulp_ret_val = pulp_cluster_get_return();
  #endif
  

  for(int i=0;i<5;i++)
    printf("%d\r\n",cycles[i]);

  return pulp_ret_val;

}
