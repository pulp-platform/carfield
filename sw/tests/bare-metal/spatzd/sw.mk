# Copyright 2025 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

CAR_SPATZD_SW := $(CAR_SW_DIR)/tests/bare-metal/spatzd

.PHONY: spatzd-compile-binaries spatzd-copy-binaries spatzd-sw-all spatzd-sw-clean

spatzd-compile-binaries:
	$(MAKE) -C $(SPATZD_MAKEDIR) \
	  BENDER=$(BENDER_PATH) \
	  LLVM_INSTALL_DIR=$(LLVM_INSTALL_DIR) \
	  GCC_INSTALL_DIR=$(GCC_INSTALL_DIR) \
	  SPATZ_CLUSTER_CFG=$(SPATZD_CFG) \
	  sw

spatzd-copy-binaries: spatzd-compile-binaries
	@find \
	  $(SPATZD_MAKEDIR)/sw/build/spatzBenchmarks \
	  -type f ! -name '*.o' ! -name '*.bin' -print0 \
	| xargs -0 file \
	| awk -F: '/ELF/ {print $$1}' \
	| xargs -r cp -t $(CAR_SPATZD_SW)

spatzd-sw-all: spatzd-copy-binaries
	@find $(CAR_SPATZD_SW) -maxdepth 1 -type f ! -name '*.mk' ! -name '*.h' \
	  -exec $(VENV)/python $(CAR_ROOT)/scripts/elf2header.py \
	           --binary {} --vectors {}.h \; \

SPATZD_HEADER_TARGETS := $(wildcard $(CAR_SPATZD_SW)/*.h)

spatzd-sw-clean:
	@rm -rf $(CAR_SPATZD_SW)/*.h
