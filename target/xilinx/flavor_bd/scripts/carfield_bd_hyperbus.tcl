# Copyright 2020 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

set pad_hyper_ck [ create_bd_port -dir IO pad_hyper_ck ]
set pad_hyper_ckn [ create_bd_port -dir IO pad_hyper_ckn ]
set pad_hyper_csn [ create_bd_port -dir IO -from 1 -to 0 pad_hyper_csn ]
set pad_hyper_dq [ create_bd_port -dir IO -from 7 -to 0 pad_hyper_dq ]
set pad_hyper_rwds [ create_bd_port -dir IO pad_hyper_rwds ]

connect_bd_net [get_bd_ports pad_hyper_csn] [get_bd_pins carfield_xilinx_ip_0/pad_hyper_csn]
connect_bd_net [get_bd_ports pad_hyper_ck] [get_bd_pins carfield_xilinx_ip_0/pad_hyper_ck]
connect_bd_net [get_bd_ports pad_hyper_ckn] [get_bd_pins carfield_xilinx_ip_0/pad_hyper_ckn]
connect_bd_net [get_bd_ports pad_hyper_rwds] [get_bd_pins carfield_xilinx_ip_0/pad_hyper_rwds]
connect_bd_net [get_bd_ports pad_hyper_dq] [get_bd_pins carfield_xilinx_ip_0/pad_hyper_dq]
