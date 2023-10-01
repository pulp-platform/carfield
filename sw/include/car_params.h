// Copyright 2022 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Cyril Koenig <cykoenig@iis.ee.ethz.ch>
//
// This file resolves the pointers used in car_memory_map.h
// In the linux case these pointers are attributed by calling carfield_mmap()

#pragma once

#ifndef LINUX_APP // Hardcoded const pointers
const void* car_soc_ctrl = 0x20010000;
const void* car_safety_island = 0x60000000;
const void* car_integer_cluster = 0x50000000;
const void* car_spatz_cluster = 0x51000000;
const void* car_l2_intl_0 = 0x78000000;
const void* car_l2_cont_0 = 0x78100000;
const void* car_l2_intl_1 = 0x78200000;
const void* car_l2_cont_1 = 0x78300000;

#else // Pointers to be mapped by the driver
void* car_soc_ctrl;
void* car_safety_island;
void* car_integer_cluster;
void* car_spatz_cluster;
void* car_l2_intl_0;
void* car_l2_cont_0;
void* car_l2_intl_1;
void* car_l2_cont_1;
#endif
