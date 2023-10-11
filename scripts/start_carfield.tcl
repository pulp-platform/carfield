# Copyright 2022 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Nicole Narr <narrn@student.ethz.ch>
# Christopher Reinwardt <creinwar@student.ethz.ch>
# Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
# Paul Scheffler <paulsc@iis.ee.ethz.ch>

set flags ""
if {[info exists VSIM_FLAGS]}     { append flags "${VSIM_FLAGS}" }

set pargs ""
if {[info exists SECURE_BOOT]}    { append pargs "+SECURE_BOOT=${SECURE_BOOT} "       }
if {[info exists CHS_BOOTMODE]}   { append pargs "+CHS_BOOTMODE=${CHS_BOOTMODE} "     }
if {[info exists CHS_PRELMODE]}   { append pargs "+CHS_PRELMODE=${CHS_PRELMODE} "     }
if {[info exists CHS_BINARY]}     { append pargs "+CHS_BINARY=${CHS_BINARY} "         }
if {[info exists SECD_BINARY]}    { append pargs "+SECD_BINARY=${SECD_BINARY} "       }
if {[info exists SECD_BOOTMODE]}  { append pargs "+SECD_BOOTMODE=${SECD_BOOTMODE} "   }
if {[info exists SECD_IMAGE]}     { append pargs "+SECD_IMAGE=${SECD_IMAGE} "         }
if {[info exists SAFED_BOOTMODE]} { append pargs "+SAFED_BOOTMODE=${SAFED_BOOTMODE} " }
if {[info exists SAFED_BINARY]}   { append pargs "+SAFED_BINARY=${SAFED_BINARY} "     }
if {[info exists SPATZD_BOOTMODE]} { append pargs "+SPATZD_BOOTMODE=${SPATZD_BOOTMODE} " }
if {[info exists SPATZD_BINARY]  } { append pargs "+SPATZD_BINARY=${SPATZD_BINARY} "     }
if {[info exists CHS_IMAGE]}      { append pargs "+CHS_IMAGE=${CHS_IMAGE} "           }

eval "vsim ${TESTBENCH}_opt -t 1ps" ${flags} ${pargs}

set StdArithNoWarnings 1
set NumericStdNoWarnings 1
