# Copyright 2022 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Nicole Narr <narrn@student.ethz.ch>
# Christopher Reinwardt <creinwar@student.ethz.ch>
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
# Paul Scheffler <paulsc@iis.ee.ethz.ch>

# Set voptargs only if not already set to make overridable.
# Default on fast simulation flags.
if {![info exists VOPTARGS]} {
    set VOPTARGS "-O5 +acc=p+tb_carfield_soc. +noacc=p+carfield. +acc=r+stream_xbar"
}

set flags "-permissive -suppress 3009 -suppress 8386 -error 7"

set pargs ""
if {[info exists CHS_BOOTMODE]}   { append pargs "+CHS_BOOTMODE=${CHS_BOOTMODE} " }
if {[info exists CHS_PRELMODE]}   { append pargs "+CHS_PRELMODE=${CHS_PRELMODE} " }
if {[info exists CHS_BINARY]}     { append pargs "+CHS_BINARY=${CHS_BINARY} "     }
if {[info exists SECD_BINARY]}    { append pargs "+SECD_BINARY=${SECD_BINARY} "   }
if {[info exists SAFED_BOOTMODE]} { append pargs "+SAFED_BOOTMODE=${SAFED_BOOTMODE} " }
if {[info exists SAFED_BINARY]}   { append pargs "+SAFED_BINARY=${SAFED_BINARY} " }
if {[info exists CHS_IMAGE]}      { append pargs "+CHS_IMAGE=${CHS_IMAGE} "       }

eval "vsim -c ${TESTBENCH} -t 1ps -vopt -voptargs=\"${VOPTARGS}\"" ${pargs} ${flags}

set StdArithNoWarnings 1
set NumericStdNoWarnings 1
