
source ../scripts/add_sources_vsim.tcl

# Note : this testbench does not implenent the ddr4 memory model
set TESTBENCH "tb_carfield_top_xilinx glbl"

set XLIB_ARGS "-L xpm -L unisims_ver -L unimacro_ver"

if {![info exists VOPTARGS]} {
    set VOPTARGS "-O5 +acc"
}

set flags "-permissive -suppress 3009 -suppress 8386 -error 7"

set pargs ""
if {[info exists BOOTMODE]} { append pargs "+BOOTMODE=${BOOTMODE} " }
if {[info exists PRELMODE]} { append pargs "+PRELMODE=${PRELMODE} " }
if {[info exists BINARY]}   { append pargs "+BINARY=${BINARY} " }
if {[info exists IMAGE]}    { append pargs "+IMAGE=${IMAGE} " }

vlog -incr -sv ../src/glbl.v


eval "vsim ${TESTBENCH} -t 1ps -vopt -voptargs=\"${VOPTARGS}\"" ${XLIB_ARGS} ${pargs} ${flags}

set StdArithNoWarnings 1
set NumericStdNoWarnings 1