# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

# Output bitstream
xilinx_bit_bd = $(CAR_XIL_DIR)/flavor_bd/out/design_1_wrapper.bit

# This flavor requires pre-compiled Xilinx IPs
xilinx_ips_names_bd := carfield_ip
# Path to compiled ips
xilinx_ips_paths_bd := $(foreach ip-name,$(xilinx_ips_names_bd),$(xilinx_ip_dir)/$(ip-name)/$(ip-name).srcs/sources_1/ip/$(ip-name)/$(ip-name).xci)

# Vivado variables
vivado_env_bd := \
    XILINX_PROJECT=$(XILINX_PROJECT) \
    XILINX_BOARD=$(XILINX_BOARD) \
    XILINX_PART=$(xilinx_part) \
    XILINX_BOARD_LONG=$(xilinx_board_long) \
    XILINX_PORT=$(XILINX_PORT) \
    XILINX_HOST=$(XILINX_HOST) \
    XILINX_FPGA_PATH=$(XILINX_FPGA_PATH) \
    XILINX_BIT=$(xilinx_bit) \
    GEN_NO_HYPERBUS=$(GEN_NO_HYPERBUS) \
    GEN_EXT_JTAG=$(GEN_EXT_JTAG) \
    XILINX_ROUTED_DCP=$(XILINX_ROUTED_DCP) \
    XILINX_CHECK_TIMING=$(XILINX_CHECK_TIMING) \
    XILINX_ELABORATION_ONLY=$(XILINX_ELABORATION_ONLY)

# Flavor specific bender args
xilinx_targs_bd := $(common_targs) $(xilinx_targs_common) -t xilinx_bd -t $(XILINX_BOARD)
xilinx_defs_bd := $(common_defs) $(xilinx_defs_common)

# Add includes files for block design
$(CAR_XIL_DIR)/flavor_bd/scripts/add_includes.tcl:
	${BENDER} script vivado --only-defines --only-includes $(xilinx_targs_bd) $(xilinx_defs_bd) > $@
# Remove ibex's vendored prim includes as they conflict with opentitan's vendored prim includes
	grep -v -P "lowrisc_ip/ip/prim/rtl" $@ > $@-tmp
	mv $@-tmp $@

# Build block design bitstream
$(CAR_XIL_DIR)/flavor_bd/out/%.bit: $(xilinx_ips_paths_bd) $(CAR_XIL_DIR)/flavor_bd/scripts/add_includes.tcl
	mkdir -p $(CAR_XIL_DIR)/flavor_bd/out
	cd $(CAR_XIL_DIR)/flavor_bd && $(vivado_env_bd) $(VIVADO) $(VIVADO_FLAGS) -source scripts/run.tcl
	find $(CAR_XIL_DIR)/flavor_bd -name "*.ltx" -o -name "*.bit" -o -name "*routed.rpt" | xargs -I {} cp {} $(CAR_XIL_DIR)/flavor_bd/out

car-xil-clean-bd:
	cd $(CAR_XIL_DIR)/flavor_bd && rm -rf scripts/add_includes.tcl* *.log *.jou *.str *.mif carfield_$(XILINX_BOARD) .Xil/

.PHONY: car-xil-clean-bd
