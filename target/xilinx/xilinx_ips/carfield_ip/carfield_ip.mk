# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

ROOT_carfield_ip                 := $(CAR_XIL_DIR)/xilinx_ips/carfield_ip
XILINX_USE_ARTIFACTS_carfield_ip := 0

# Add additional requirements for this ip
IP_DEP_carfield_ip := $(CAR_XIL_DIR)/xilinx_ips/carfield_ip/tcl/add_sources.tcl

# Generate the bender script for the ip
$(CAR_XIL_DIR)/xilinx_ips/carfield_ip/tcl/add_sources.tcl: Bender.yml
# Add source files for ip
	$(BENDER) script vivado $(xilinx_targs) $(common_defs) $(xilinx_defs_bd) > $@
	mv $@ $@.bak
# Remove ibex's vendored prim includes as they conflict with opentitan's vendored prim includes
	grep -v -P "lowrisc_ip/ip/prim/rtl" $@.bak > $@
