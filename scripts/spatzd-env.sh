# Copyright 2022 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#

# set up environment variables for rtl simulation
ROOTD=$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")/.." && pwd)
export LLVM_SPATZ_DIR=/usr/pack/riscv-1.0-kgf/spatz-llvm-2023.08.10
export GCC_SPATZ_DIR=
