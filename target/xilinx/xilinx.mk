# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Nicole Narr <narrn@student.ethz.ch>
# Christopher Reinwardt <creinwar@student.ethz.ch>
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

PROJECT       ?= carfield
# Board in      {vcu128}
BOARD         ?= vcu128
ip-dir        := $(CAR_XIL_DIR)/xilinx
USE_ARTIFACTS ?= 0


# Select board specific variables
ifeq ($(BOARD),vcu128)
	XILINX_PART  ?= xcvu37p-fsvh2892-2L-e
	XILINX_BOARD ?= xilinx.com:vcu128:part0:1.0
	XILINX_PORT  ?= 3232
	FPGA_PATH    ?= xilinx_tcf/Xilinx/091847100638A
	XILINX_HOST  ?= bordcomputer
	ips-names    := xlnx_mig_ddr4 xlnx_clk_wiz xlnx_vio
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
              BIT=$(bit)                    \
              IP_PATHS="$(foreach ip-name,$(ips-names),xilinx/$(ip-name)/$(ip-name).srcs/sources_1/ip/$(ip-name)/$(ip-name).xci)" \
              ROUTED_DCP=$(ROUTED_DCP)      \
              CHECK_TIMING=$(CHECK_TIMING)  \
			  ELABORATION_ONLY=$(ELABORATION_ONLY)

MODE        ?= gui
VIVADOFLAGS ?= -nojournal -mode $(MODE)

car-xil-all: $(bit)

# Generate mcs from bitstream
$(mcs): $(bit)
	cd $(CAR_XIL_DIR) && $(VIVADOENV) $(VIVADO) $(VIVADOFLAGS) -source scripts/write_cfgmem.tcl -tclargs $@ $^

# Compile bitstream
$(bit): $(ips) $(CAR_XIL_DIR)/scripts/add_sources.tcl
	@mkdir -p $(out)
	cd $(CAR_XIL_DIR) && $(VIVADOENV) $(VIVADO) $(VIVADOFLAGS) -source scripts/prologue.tcl -source scripts/run.tcl
	@if [[ -z ${ELABORATION_ONLY} ]] || [ "${ELABORATION_ONLY}" -eq "0" ]; then \
		cp $(CAR_XIL_DIR)/$(PROJECT).runs/impl_1/*.ltx $(out); \
		cp $(CAR_XIL_DIR)/$(PROJECT).runs/impl_1/*_routed.dcp $(out); \
		cp $(CAR_XIL_DIR)/$(PROJECT).runs/impl_1/*.bit $(out); \
	fi

# Generate ips
%.xci:
	@echo $@
	@echo $(CAR_XIL_DIR)
	@echo "Generating IP $(basename $@)"
	IP_NAME=$(basename $(notdir $@)) ; cd $(ip-dir)/$$IP_NAME && make clean && USE_ARTIFACTS=$(USE_ARTIFACTS) VIVADOENV="$(subst ",\",$(VIVADOENV))" VIVADO="$(VIVADO)" make
	IP_NAME=$(basename $(notdir $@)) ; cp $(ip-dir)/$$IP_NAME/$$IP_NAME.srcs/sources_1/ip/$$IP_NAME/$$IP_NAME.xci $@

car-xil-gui:
	@echo "Starting $(vivado) GUI"
	cd $(CAR_XIL_DIR) && $(VIVADOENV) $(VIVADO) -nojournal -mode gui $(PROJECT).xpr &

car-xil-program: #$(bit)
	@echo "Programming board $(BOARD) ($(XILINX_PART))"
	$(VIVADOENV) $(VIVADO) $(VIVADOFLAGS) -source $(CAR_XIL_DIR)/scripts/program.tcl

car-xil-flash: $(CAR_SW_DIR)/boot/linux.gpt.bin
	$(VIVADOENV) FILE=$< OFFSET=0 $(VIVADO) $(VIVADOFLAGS) -source $(CAR_XIL_DIR)/scripts/flash_spi.tcl

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
