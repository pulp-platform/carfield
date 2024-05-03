# Copyright 2022 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#

# set up environment variables for rtl simulation
ROOTD=$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")/.." && pwd)
[[ -d "$ROOTD/pulp_cluster/pulp-runtime" ]] && source "$ROOTD/pulp_cluster/pulp-runtime/configs/astral-cluster.sh"
