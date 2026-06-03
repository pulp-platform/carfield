# Minimal constraints for first PS+Carfield BD bring-up on ZCU102.
##############################
# Minimal ZCU102 constraints #
##############################

# -------------------------
# System clock
# -------------------------
set_property PACKAGE_PIN AL7 [get_ports sys_clk_n]
set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_clk_n]

set_property PACKAGE_PIN AL8 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_clk_p]

# -------------------------
# UART
# -------------------------
set_property PACKAGE_PIN E13 [get_ports uart_rx_i]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rx_i]

set_property PACKAGE_PIN F13 [get_ports uart_tx_o]
set_property IOSTANDARD LVCMOS33 [get_ports uart_tx_o]

# -------------------------
# CPU reset
# -------------------------
set_property PACKAGE_PIN AM13 [get_ports cpu_reset]
set_property IOSTANDARD LVCMOS33 [get_ports cpu_reset]

# -------------------------
# LEDs
# -------------------------
set_property PACKAGE_PIN AG14 [get_ports {led_o[0]}]
set_property PACKAGE_PIN AF13 [get_ports {led_o[1]}]
set_property PACKAGE_PIN AE13 [get_ports {led_o[2]}]
set_property PACKAGE_PIN AJ14 [get_ports {led_o[3]}]
set_property PACKAGE_PIN AJ15 [get_ports {led_o[4]}]
set_property PACKAGE_PIN AH13 [get_ports {led_o[5]}]
set_property PACKAGE_PIN AH14 [get_ports {led_o[6]}]
set_property PACKAGE_PIN AL12 [get_ports {led_o[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_o[*]}]