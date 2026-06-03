set_property PACKAGE_PIN A20 [get_ports jtag_tms_i]
set_property IOSTANDARD LVCMOS33 [get_ports jtag_tms_i]

set_property PACKAGE_PIN B20 [get_ports jtag_tdi_i]
set_property IOSTANDARD LVCMOS33 [get_ports jtag_tdi_i]

set_property PACKAGE_PIN A22 [get_ports jtag_tdo_o]
set_property IOSTANDARD LVCMOS33 [get_ports jtag_tdo_o]

set_property PACKAGE_PIN A21 [get_ports jtag_tck_i]
set_property IOSTANDARD LVCMOS33 [get_ports jtag_tck_i]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets -of_objects [get_ports jtag_tck_i]]
set_property CLOCK_BUFFER_TYPE NONE [get_nets -of_objects [get_ports jtag_tck_i]]