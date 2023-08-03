# Copyright 2022 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#

# set up environment variables for rtl simulation
ROOTD=$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")/.." && pwd)
[[ -d "$ROOTD/safety_island/sw/pulp-freertos" ]] && source "$ROOTD/safety_island/sw/pulp-freertos/env/safety-island.sh" #TODO add carfield target in freertos
[[ -d "$ROOTD/safety_island/sw/pulp-runtime" ]] && source "$ROOTD/safety_island/sw/pulp-runtime/configs/carfield.sh"
