// Copyright 2022 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>
// Paul Scheffler <paulsc@iis.ee.ethz.ch>
//
// This header provides information defined by hardware parameters, such as
// the address map. In the future, it should be generated automatically as
// part of the SoC generation process.

#pragma once

// Base addresses provided at link time
extern void *__base_l2;

// L2
#define CAR_L2_SPM_BASE_ADDR 0x78000000
#define CAR_L2_SPM_END_ADDR 0x78400000

// Safety Island
#define CAR_SAFETY_ISLAND_SPM_BASE_ADDR 0x60000000
#define CAR_SAFETY_ISLAND_SPM_END_ADDR 0x60200000

// Integer Cluster
#define CAR_INT_CLUSTER_SPM_BASE_ADDR 0x50000000
#define CAR_INT_CLUSTER_SPM_END_ADDR 0x50040000
