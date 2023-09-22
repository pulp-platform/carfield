# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

CAR_ROOT ?= $(shell pwd)
BENDER   ?= bender -d $(CAR_ROOT)

include carfield.mk
