# Copyright 2025 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>
#
set_property PACKAGE_PIN N30     [get_ports jtag_tdo_o]
set_property IOSTANDARD LVCMOS12 [get_ports jtag_tdo_o]

set_property PACKAGE_PIN P30     [get_ports jtag_tck_i]
set_property IOSTANDARD LVCMOS12 [get_ports jtag_tck_i]

set_property PACKAGE_PIN N28     [get_ports jtag_tms_i]
set_property IOSTANDARD LVCMOS12 [get_ports jtag_tms_i]

set_property PACKAGE_PIN M30     [get_ports jtag_tdi_i]
set_property IOSTANDARD LVCMOS12 [get_ports jtag_tdi_i]
