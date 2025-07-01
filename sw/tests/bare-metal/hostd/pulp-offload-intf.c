// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Luca Valente <luca.valente@unibo.it>
//
// Bare-metal offload test for the PULP cluster with interference

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
#include "printf.h"

#define LCL

long int buffer[128];

void read_from_cache(int l1_way_size, int stride) {
    asm volatile("": : :"memory");
    for(volatile int j = 0; j < l1_way_size; j++)
    {
      * ( ( volatile long int * ) &buffer[j] );
    }
    asm volatile("": : :"memory");
    for(volatile int j = 0; j < l1_way_size; j++)
    {
      * ( ( volatile long int * ) &buffer[j*stride]);
    }
    asm volatile("": : :"memory");
}

long unsigned sweep(int stride)
{

  int l1_way_size = 4 * 1024 / 8;
  int working_set = l1_way_size * stride * 8;

  volatile long unsigned cycle_start;

  for(int i = 0; i < 10; i++)
  {
    if(i==1)
    {
      cycle_start = get_mcycle();
    }
    read_from_cache(l1_way_size, stride);
  }

  volatile long unsigned cycles = get_mcycle() - cycle_start;

  #ifdef VERBOSE
  printf("%3dKB        , %6d     \r\n",
           working_set / 1024, (int)cycles);
  #endif

  return cycles;
}

int main(void)
{
  // Set the LLC as LLC
  axi_llc_reg32_all_cache(&__base_llc);
  writew(0x18,CAR_HYPERBUS_CFG_BASE_ADDR+0x18);
  volatile uint32_t pulp_ret_val = 0;
  // Init the HW
  // PULP Island
  #ifdef LCL
  car_enable_domain(CAR_PULP_RST);
  char str[] = "Cluster boot.\r\n";
  uint32_t rtc_freq = *reg32(&__base_regs, CHESHIRE_RTC_FREQ_REG_OFFSET);
  uint64_t reset_freq = clint_get_core_freq(rtc_freq, 2500);

  load_binary();

  volatile uint32_t pulp_boot_default = ELF_BOOT_ADDR;

  pulp_cluster_set_bootaddress(pulp_boot_default);

  uart_init(&__base_uart, reset_freq, 115200);
  uart_write_str(&__base_uart, str, sizeof(str));
  uart_write_flush(&__base_uart);

  pulp_cluster_start();
  #endif

  #ifdef VERBOSE
  printf("Buffer: %x\n", buffer);
  #endif

  volatile long unsigned cycles[5];
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

  printf("Done\n");

  return pulp_ret_val;

}
