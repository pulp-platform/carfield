# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

# Output bitstream
xilinx_bit_vanilla := $(CAR_XIL_DIR)/flavor_vanilla/out/carfield_top_xilinx.bit

# This flavor requires pre-compiled Xilinx IPs (which may depend on the board)
xilinx_ips_names_vanilla_vcu128  := xlnx_mig_ddr4 xlnx_clk_wiz xlnx_vio
xilinx_ips_names_vanilla := $(xilinx_ips_names_vanilla_${XILINX_BOARD})
# Path to compiled ips
xilinx_ips_paths_vanilla = $(foreach ip-name,$(xilinx_ips_names_vanilla),$(xilinx_ip_dir)/$(ip-name)/$(ip-name).srcs/sources_1/ip/$(ip-name)/$(ip-name).xci)

# Flavor specific bender args
# (added enabled ips in bender args, used by phy_definitions.svh)
xilinx_targs_vanilla  = $(xilinx_targs_common) $(foreach ip-name,$(xilinx_ips_names_vanilla),$(addprefix -t ,$(ip-name)))
xilinx_targs_vanilla += -t xilinx_vanilla $(addprefix -t ,$(XILINX_BOARD))
xilinx_defs_vanilla := $(common_defs) $(xilinx_defs_common)

# Vivado variables
vivado_env_vanilla := \
    XILINX_PROJECT=$(XILINX_PROJECT) \
    XILINX_BOARD=$(XILINX_BOARD) \
    XILINX_PART=$(xilinx_part) \
    XILINX_BOARD_LONG=$(xilinx_board_long) \
    XILINX_PORT=$(XILINX_PORT) \
    XILINX_HOST=$(XILINX_HOST) \
    XILINX_FPGA_PATH=$(XILINX_FPGA_PATH) \
    XILINX_BIT=$(xilinx_bit) \
    XILINX_IP_PATHS="$(xilinx_ips_paths_vanilla)" \
    ROUTED_DCP=$(ROUTED_DCP) \
    XILINX_CHECK_TIMING=$(XILINX_CHECK_TIMING) \
    XILINX_ELABORATION_ONLY=$(XILINX_ELABORATION_ONLY)

# Generate bender scripts (! attention ! modified on the fly)
$(CAR_XIL_DIR)/flavor_vanilla/scripts/add_sources.tcl: Bender.yml
	$(BENDER) script vivado $(common_targs) $(xilinx_targs_vanilla) $(common_defs) $(xilinx_defs_vanilla) > $@
	cp $@ $@.bak
# Remove ibex's vendored prim includes as they conflict with opentitan's vendored prim includes
	grep -v -P "lowrisc_ip/ip/prim/rtl" $@ > $@-tmp
	mv $@-tmp $@
# Override system verilog files
	$(CAR_XIL_DIR)/scripts/overrides.sh $@
	echo "" >> $@

# Compile bitstream
$(CAR_XIL_DIR)/flavor_vanilla/out/%.bit: $(xilinx_ips_paths_vanilla) $(CAR_XIL_DIR)/flavor_vanilla/scripts/add_sources.tcl
	@mkdir -p $(CAR_XIL_DIR)/flavor_vanilla/out
	cd $(CAR_XIL_DIR)/flavor_vanilla && $(vivado_env) $(VIVADO) $(VIVADO_FLAGS) -source scripts/run.tcl
	find $(CAR_XIL_DIR)/flavor_vanilla -name "*.ltx" -o -name "*.bit" -o -name "*routed.rpt" | xargs -I {} cp {} $(CAR_XIL_DIR)/flavor_vanilla/out

car-xil-clean-vanilla:
	cd $(CAR_XIL_DIR)/flavor_vanilla && rm -rf scripts/add_sources.tcl* *.log *.jou *.str *.mif carfield.* .Xil/

.PHONY: car-xil-clean-vanilla
