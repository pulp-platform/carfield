// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
//

#include <stdio.h>
#include <stdint.h>

#include "car_memory_map.h"
#include "io.h"
#include "dif/clint.h"
#include "dif/uart.h"
#include "params.h"
#include "regs/cheshire.h"
#include "util.h"
#include "payload.h"
#include "car_util.h"

int main(void)
{
	// Set IOMMU to bare
	writew(0x1, car_iommu + 0x10);

	// Ungate the cluster
	car_enable_domain(CAR_SPATZ_RST);

	// Here we assume that the offloader has to poll a status register to catch the end of
	// computation of the Safety Island. Therefore, the offloading is blocking.
	uint32_t ret = snitchd_offloader_blocking();

	return ret;
}
