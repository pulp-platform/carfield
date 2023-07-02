# Copyright 2023 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Author: Yvan Tortorella <yvan.tortorella@unibo.it>
# Author: Matteo Perotti <mperotti@iis.ee.ethz.ch>

# bender targets
common_targs += -t cva6
common_targs += -t mchan
common_targs += -t spatz
common_targs += -t integer_cluster
common_targs += -t cv32e40p_use_ff_regfile
common_targs += -t cv64a6_imafdcsclic_sv39
common_targs += -t rtl

# bender defines
common_defs += -D FEATURE_ICACHE_STAT
common_defs += -D PRIVATE_ICACHE
common_defs += -D HIERARCHY_ICACHE_32BIT
common_defs += -D CLUSTER_ALIAS
