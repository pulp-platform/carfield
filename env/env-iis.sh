# Copyright 2022 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#

# Set environment variables to choose of which island we have to compile the sw
export PULPD_PRESENT=1
export SAFED_PRESENT=0
export SECURED_PRESENT=1
export SPATZD_PRESENT=1

# set up environment variables for rtl simulation
ROOTD=$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")/.." && pwd)
export PATH=/usr/pack/riscv-1.0-kgf/riscv64-gcc-11.2.0/bin:$PATH # RV64 GCC toolchain
export SAFED_RISCV=/usr/pack/riscv-1.0-kgf/pulp-gcc-2.6.0/bin/riscv32-unknown-elf
export PULPD_RISCV=/usr/pack/pulpsdk-1.0-kgf/artifactory/pulp-sdk-release/pkg/pulp_riscv_gcc/1.0.16/bin/riscv32-unknown-elf
export SPATZD_RISCV=/usr/pack/riscv-1.0-kgf/riscv64-gcc-9.5.0/bin/riscv64-unknown-elf
export QUESTA=questa-2023.4
