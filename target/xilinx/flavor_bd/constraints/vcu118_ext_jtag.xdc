
set_property PACKAGE_PIN N30     [get_ports jtag_tdo_o] ;# B25 - H17 (FMCP_HSPC_LA11_N) - J1.08 - TDO
# Todo change invalid lvcmos
set_property IOSTANDARD LVCMOS12 [get_ports jtag_tdo_o]

set_property PACKAGE_PIN P30     [get_ports jtag_tck_i] ;# B26 - H16 (FMCP_HSPC_LA11_P) - J1.06 - TCK
set_property IOSTANDARD LVCMOS12 [get_ports jtag_tck_i] ;

set_property PACKAGE_PIN N28     [get_ports jtag_tms_i] ;# H22 - G16 (FMCP_HSPC_LA12_N) - J1.12 - TNS
set_property IOSTANDARD LVCMOS12 [get_ports jtag_tms_i] ;

set_property PACKAGE_PIN M30     [get_ports jtag_tdi_i] ;# J22 - G15 (FMCP_HSPC_LA12_P) - J1.10 - TDI
set_property IOSTANDARD LVCMOS12 [get_ports jtag_tdi_i]
