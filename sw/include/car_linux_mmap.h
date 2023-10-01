// Copyright 2022 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Cyril Koenig <cykoenig@iis.ee.ethz.ch>
//
// This file wraps mmap calls to the Carfield driver

#pragma once

#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>

#include <sys/mman.h> // mmap

#include "car_params.h" // car_soc_ctrl, ...

int carfield_mmap(int device_fd, unsigned int page_offset, size_t length,
                  void **res) {
    *res = mmap(NULL, length, PROT_READ | PROT_WRITE, MAP_SHARED, device_fd,
                page_offset * getpagesize());

    if (*res == MAP_FAILED) {
        printf("mmap() failed %s for offset: %x length: %x\n", strerror(errno),
               page_offset, length);
        *res = NULL;
        return -EIO;
    }
    return 0;
}

int carfield_platform_init(int fd) {
    if (carfield_mmap(fd, 0, 0x1000, &car_soc_ctrl)) {
        printf("mmap() failed for car_soc_ctrl\n");
    }
    if (carfield_mmap(fd, 10, 0x100000, &car_l2_intl_0)) {
        printf("mmap() failed for car_l2_intl_0\n");
    }
    if (carfield_mmap(fd, 11, 0x100000, &car_l2_cont_0)) {
        printf("mmap() failed for car_l2_cont_0\n");
    }
    if (carfield_mmap(fd, 12, 0x100000, &car_l2_intl_1)) {
        printf("mmap() failed for car_l2_intl_1\n");
    }
    if (carfield_mmap(fd, 13, 0x100000, &car_l2_cont_1)) {
        printf("mmap() failed for car_l2_cont_1\n");
    }
    if (carfield_mmap(fd, 100, 0x800000, &car_safety_island)) {
        printf("mmap() failed for car_safety_island\n");
    }
    if (carfield_mmap(fd, 200, 0x800000, &car_integer_cluster)) {
        printf("mmap() failed for car_integer_cluster\n");
    }
    if (carfield_mmap(fd, 300, 0x800000, &car_spatz_cluster)) {
        printf("mmap() failed for car_spatz_cluster\n");
    }
}
