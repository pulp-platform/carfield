# Copyright 2022 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#

# set up environment variables for rtl simulation
ROOTD=$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")/.." && pwd)
export PATH="/usr/pack/riscv-1.0-kgf/riscv64-gcc-11.2.0/bin:$PATH" # RV64 GCC toolchain
export PATH="/usr/pack/riscv-1.0-kgf/pulp-gcc-2.6.0/bin:$PATH" # RV32 GCC toolchain
export QUESTA=questa-2022.3
[[ -d "$ROOTD/safety_island/sw/pulp-freertos" ]] && source "$ROOTD/safety_island/sw/pulp-freertos/env/safety-island.sh" #TODO add carfield target in freertos
[[ -d "$ROOTD/safety_island/sw/pulp-runtime" ]] && source "$ROOTD/safety_island/sw/pulp-runtime/configs/carfield.sh"
