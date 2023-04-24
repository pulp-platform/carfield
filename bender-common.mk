# Copyright 2021 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Author: Yvan Tortorella <yvan.tortorella@unibo.it>
# Author: Matteo Perotti <mperotti@iis.ee.ethz.ch>

# bender targets
common_targs += -t rtl
common_targs += -t cva6

# bender defines
common_defs += -D FEATURE_ICACHE_STAT
common_defs += -D PRIVATE_ICACHE
common_defs += -D HIERARCHY_ICACHE_32BIT
common_defs += -D TARGET_SPATZ
