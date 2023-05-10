
ip-paths := $(addsuffix /questa/compile.do, $(addprefix sim/ips/, $(ips-names)))

XILINX_SIMLIB_PATH ?= ~/xlib_questa-2022.3
SIMULATOR_PATH ?= /usr/pack/questa-2022.3-bt/questasim/bin
GCC_PATH ?= /usr/pack/questa-2022.3-bt/questasim/gcc-7.4.0-linux_x86_64/bin


VIVADOENV_SIM := $(VIVADOENV) \
              XILINX_SIMLIB_PATH=$(XILINX_SIMLIB_PATH) \
              SIMULATOR_PATH=$(SIMULATOR_PATH) \
			  GCC_PATH=$(GCC_PATH)
VLOG_ARGS := -suppress 2583 -suppress 13314

$(XILINX_SIMLIB_PATH)/modelsim.ini:
	cd sim && $(VIVADOENV_SIM) vitis-2022.1 vivado -nojournal -mode batch -source setup_simulation.tcl -tclargs "compile_simlib"

sim/ips/xlnx_mig_ddr4/questa/compile.do:
	cd sim && $(VIVADOENV_SIM) $(VIVADO) -nojournal -mode batch -source setup_simulation.tcl -tclargs "export_simulation"

scripts/add_sources_vsim.tcl:
	$(BENDER) script vsim -t sim -t test -t fpga $(bender-targets) $(DEFINES) $(TARGETS) --vlog-arg="$(VLOG_ARGS)" > $@

sim: scripts/add_sources_vsim.tcl $(XILINX_SIMLIB_PATH)/modelsim.ini
	cd sim && questa-2022.3 vsim -work work -modelsimini $(XILINX_SIMLIB_PATH)/modelsim.ini -do "run_simulation.tcl"

clean-sim:
	rm -rf sim/*.log sim/questa_lib sim/work sim/transcript sim/vsim.wlf scripts/vsim_cheshire.tcl sim/.Xil sim/modelsim.ini

.PHONY: clean-sim sim
