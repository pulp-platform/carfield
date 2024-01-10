# Copyright 2023 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

CAR_XIL_SIM_DIR  ?= $(CAR_XIL_DIR)/flavor_vanilla/sim

CAR_XIL_SIM_SIMLIB_PATH ?= /home/$(USER)/xlib_questa-2022.3_vivado-2022.1
CAR_XIL_SIM_SIMULATOR_PATH ?= /usr/pack/questa-2022.3-bt/questasim/bin
CAR_XIL_SIM_GCC_PATH ?= /usr/pack/questa-2022.3-bt/questasim/gcc-7.4.0-linux_x86_64/bin

car-xil-sim-scripts := $(addsuffix /questa/compile.do, $(addprefix $(CAR_XIL_SIM_DIR)/ips/, $(xilinx_ips_names_vanilla)))

# Pre-generated/modified example projects (contain the simulation top level)
ifneq ($(filter xlnx_mig_ddr4,$(xilinx_ips_names_vanilla)),)
	car-xil-sim-example-projects := xlnx_mig_ddr4_ex
endif
ifneq ($(filter xlnx_mig_7_ddr3,$(xilinx_ips_names_vanilla)),)
	car-xil-sim-example-projects := xlnx_mig_7_ddr3_ex
endif

car-xil-sim-example-scripts := $(addsuffix /questa/compile.do, $(addprefix $(CAR_XIL_SIM_DIR)/ips/, $(car-xil-sim-example-projects)))

vivado_env_sim := $(vivado_env_vanilla) \
              XILINX_SIMLIB_PATH=$(CAR_XIL_SIM_SIMLIB_PATH) \
              SIMULATOR_PATH=$(CAR_XIL_SIM_SIMULATOR_PATH) \
			  GCC_PATH=$(CAR_XIL_SIM_GCC_PATH) \
			  VIVADO_PROJECT=$(CAR_XIL_DIR)/flavor_vanilla/carfield.xpr

car-xil-vlog-args := -suppress 2583 -suppress 13314

# Fetch example projects at IIS (containing SRAM behavioral models)
$(CAR_XIL_SIM_DIR)/ips/%_ex/questa/compile.do:
	mkdir -p $(CAR_XIL_SIM_DIR)/ips
	tar -xvf /usr/scratch2/wuerzburg/cykoenig/export/$*_ex.tar -C $(CAR_XIL_SIM_DIR)/ips

# Generate generic Xilinx simulation libraries
$(CAR_XIL_SIM_SIMLIB_PATH)/modelsim.ini:
	cd $(CAR_XIL_SIM_DIR) && $(vivado_env_sim) vitis-2022.1 vivado -nojournal -mode batch -source setup_simulation.tcl -tclargs "compile_simlib"

# Export IPs simulation models
$(CAR_XIL_SIM_DIR)/ips/%/questa/compile.do:
	mkdir -p $(CAR_XIL_SIM_DIR)/ips
	cd $(CAR_XIL_SIM_DIR) && $(vivado_env_sim) $(VIVADO) -nojournal -mode batch -source setup_simulation.tcl -tclargs "export_simulation"

# Generate bender script
$(CAR_XIL_SIM_DIR)/add_sources.tcl:
	$(BENDER) script vsim -t sim -t test $(common_targs) $(xilinx_targs_vanilla) $(common_defs) $(xilinx_defs_vanilla) --vlog-arg="$(car-xil-vlog-args)" > $@

# Start questa
car-xil-sim: $(CAR_XIL_DIR)/flavor_vanilla/carfield.xpr $(CAR_XIL_SIM_SIMLIB_PATH)/modelsim.ini $(car-xil-sim-example-scripts) $(car-xil-sim-scripts) $(CAR_XIL_SIM_DIR)/add_sources.tcl
	mkdir -p $(CAR_XIL_SIM_DIR)/questa_lib
	cp $(CAR_XIL_SIM_SIMLIB_PATH)/modelsim.ini $(CAR_XIL_SIM_DIR)
	chmod +w $(CAR_XIL_SIM_DIR)/modelsim.ini
	cd $(CAR_XIL_SIM_DIR) && IPS="$(xilinx_ips_names_vanilla)" questa-2022.3 vsim -work work -do "run_simulation.tcl"

# Clean
car-xil-sim-clean:
	cd $(CAR_XIL_SIM_DIR) && rm -rf *.log questa_lib work transcript vsim.wlf add_sources.tcl .Xil modelsim.ini ips

.PHONY: clean-sim sim