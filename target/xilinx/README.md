## Xilinx compile flow

The Xilinx compile flow is divided in flavors:
- vanilla : A pure-verilog compile flow which does not use block design but pre-generates IPs source code.
- bd : A block design based compile flow which pre-packages a Carfield IP and builds a bitstream out of it.

User inputs variables are defined in xilinx.mk and written in capital letters (ex: XILINX_BOARD), while derived variables are writted in lower case (ex: xilinx_bit).
