# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Nicole Narr <narrn@student.ethz.ch>
# Christopher Reinwardt <creinwar@student.ethz.ch>
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

PROJECT      ?= carfield
# Board in     {genesys2, zcu102, vcu128}
BOARD        ?= vcu128
ip-dir       := $(CAR_XIL_DIR)/xilinx

ELABORATION_ONLY ?= 0

# Select board specific variables
ifeq ($(BOARD),vcu128)
	XILINX_PART  ?= xcvu37p-fsvh2892-2L-e
	XILINX_BOARD ?= xilinx.com:vcu128:part0:1.0
	ips-names    := xlnx_clk_wiz xlnx_vio
endif
ifeq ($(BOARD),genesys2)
	XILINX_PART  ?= xc7k325tffg900-2
	XILINX_BOARD ?= digilentinc.com:genesys2:part0:1.1
	ips-names    := xlnx_mig_7_ddr3 xlnx_clk_wiz xlnx_vio
	FPGA_PATH    ?= xilinx_tcf/Digilent/200300A8C60DB
endif
ifeq ($(BOARD),zcu102)
	XILINX_PART    ?= xczu9eg-ffvb1156-2-e
	XILINX_BOARD   ?= xilinx.com:zcu102:part0:3.4
	ips-names      := xlnx_mig_ddr4 xlnx_clk_wiz xlnx_vio
endif

# Location of ip outputs
ips := $(addprefix $(CAR_XIL_DIR)/,$(addsuffix .xci ,$(basename $(ips-names))))
# Derive bender args from enabled ips
xilinx_targs += $(foreach ip-name,$(ips-names),$(addprefix -t ,$(ip-name)))
xilinx_targs += $(addprefix -t ,$(BOARD))

# Outputs
out := $(CAR_XIL_DIR)/out
bit := $(out)/$(PROJECT)_top_xilinx.bit
mcs := $(out)/$(PROJECT)_top_xilinx.mcs

# Vivado variables
VIVADOENV ?=  PROJECT=$(PROJECT)            \
              BOARD=$(BOARD)                \
              XILINX_PART=$(XILINX_PART)    \
              XILINX_BOARD=$(XILINX_BOARD)  \
              PORT=$(XILINX_PORT)           \
              HOST=$(XILINX_HOST)           \
              FPGA_PATH=$(FPGA_PATH)        \
              BIT=$(bit)
MODE        ?= gui
VIVADOFLAGS ?= -nojournal -mode $(MODE) -source scripts/prologue.tcl

car-xil-all: $(bit)

# Generate mcs from bitstream
$(mcs): $(bit)
	cd $(CAR_XIL_DIR) && $(VIVADOENV) $(VIVADO) $(VIVADOFLAGS) -source scripts/write_cfgmem.tcl -tclargs $@ $^

# Compile bitstream
$(bit): $(ips) $(CAR_XIL_DIR)/scripts/add_sources.tcl
	@mkdir -p $(out)
	cd $(CAR_XIL_DIR) && $(VIVADOENV) $(VIVADO) $(VIVADOFLAGS) -source scripts/run.tcl -tclargs $(ELABORATION_ONLY)
	if [ "$(ELABORATION_ONLY)" -eq 0 ]; then cp $(CAR_XIL_DIR)/$(PROJECT).runs/impl_1/$(PROJECT)* $(out); fi

# Generate ips
%.xci:
	@echo $@
	@echo $(CAR_XIL_DIR)
	@echo "Generating IP $(basename $@)"
	IP_NAME=$(basename $(notdir $@)) ; cd $(ip-dir)/$$IP_NAME && $(MAKE) clean && $(VIVADOENV) VIVADO="$(VIVADO)" $(MAKE)
	IP_NAME=$(basename $(notdir $@)) ; cp $(ip-dir)/$$IP_NAME/$$IP_NAME.srcs/sources_1/ip/$$IP_NAME/$$IP_NAME.xci $@

car-xil-gui:
	@echo "Starting $(vivado) GUI"
	cd $(CAR_XIL_DIR) && $(VIVADOENV) $(VIVADO) -nojournal -mode gui $(PROJECT).xpr &

car-xil-program: #$(bit)
	@echo "Programming board $(BOARD) ($(XILINX_PART))"
	cd $(CAR_XIL_DIR) && $(VIVADOENV) $(VIVADO) $(VIVADOFLAGS) -source scripts/program.tcl

car-xil-clean:
	cd $(CAR_XIL_DIR) && rm -rf scripts/add_sources.tcl* *.log *.jou *.str *.mif *.xci *.xpr .Xil/ $(out) $(PROJECT).srcs $(PROJECT).cache $(PROJECT).hw $(PROJECT).ioplanning $(PROJECT).ip_user_files $(PROJECT).runs $(PROJECT).sim

# Re-compile only top and not ips
car-xil-rebuild-top:
	${MAKE} car-xil-clean
	find $(CAR_XIL_DIR)/xilinx -wholename "**/*.srcs/**/*.xci" | xargs -n 1 -I {} cp {} $(CAR_XIL_DIR)
	${MAKE} $(bit)

# Bender !! attention, the bender script is modified !!
$(CAR_XIL_DIR)/scripts/add_sources.tcl: Bender.yml
	$(BENDER) script vivado $(common_targs) $(xilinx_targs) $(common_defs) $(xilinx_defs) > $@
	cp $@ $@.bak
# Remove ibex's vendored prim includes as they conflict with opentitan's vendored prim includes
	grep -v -P "lowrisc_ip/ip/prim/rtl" $@ > $@-tmp
	mv $@-tmp $@
# Override system verilog files
	$(CAR_XIL_DIR)/scripts/overrides.sh $@
	echo "" >> $@

.PHONY: car-xil-gui car-xil-program car-xil-clean car-xil-rebuild-top car-xil-all
