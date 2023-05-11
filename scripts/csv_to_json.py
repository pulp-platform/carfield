import pandas as pd
import re
import argparse
from string import Template


header = """// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
// Robert Balas <balasr@iis.ee.ethz.ch>
// Luca Valente <luca.valente@unibo.it>x
# PLL register template
#
# Parameter (given by Python tool)
#  - src:    Number of Interrupt Sources
#  - target: Number of Targets that handle interrupt requests
#  - prio:   Max value of interrupt priorities
#  - module_instance_name: Module instance name.
{
  name: "soc_ctrl_regs",
  clock_primary: "clk_i",
  bus_interfaces: [
    { protocol: "reg_iface", direction: "device" }
  ],
  regwidth: "32",
  registers :[
"""

reg_tlp = """
    { name: "$name",
      desc: "$comment",
      swaccess: "$swa",
      hwaccess: "$hwa",
      resval: "$rv",
      fields: [
        { bits: "$bw:0" }
      ],
    }
"""

parser = argparse.ArgumentParser(description='generate your hex from slm')

parser.add_argument("--input", dest="input_file", default=None, help="Specify input file")
parser.add_argument("--output", dest="output_file", default=None, help="Specify output file")

args = parser.parse_args()

if args.input_file is None:
   raise Exception('Specify the input file!')
if args.output_file is None:
   raise Exception('Specify the output file!')


f = open(args.output_file, "a")
f.write(header)

df = pd.read_csv(args.input_file, sep=',' )

outer_ports = ""
de_assign = ""
pll_intf = ""
first_pin = 1
for index, row in df.iterrows():
    name = row['Name']
    num_bits = row['Bits']
    swa = row['SW Access']
    hwa = row['HW Access']
    defv = row['Default Value']
    desc = row['Comment']
    s = Template(reg_tlp)
    f.write(s.substitute(name=name,swa=swa,hwa=hwa,rv=defv,bw=num_bits-1,comment=desc))

f.write("], \n }")
f.close()
