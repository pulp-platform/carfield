# Copyright 2022 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#

# set up environment variables for rtl simulation
ROOTD=$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")/.." && pwd)
export PATH="/usr/pack/riscv-1.0-kgf/riscv64-gcc-11.2.0/bin:$PATH"
export RISCV=/usr/pack/riscv-1.0-kgf/riscv64-gcc-11.2.0
export QUESTA=questa-2022.3
