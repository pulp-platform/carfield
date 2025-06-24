# Copyright 2023 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Author: Yvan Tortorella <yvan.tortorella@unibo.it>
# Author: Matteo Perotti <mperotti@iis.ee.ethz.ch>

# Runtime-selectable Carfield configuration
CARFIELD_CONFIG ?= carfield_l2dual_spatz_periph

# bender targets
common_targs += -t cva6
common_targs += -t mchan
common_targs += -t snitch_cluster
common_targs += -t snitch_cluster_wrapper
common_targs += -t integer_cluster
common_targs += -t cv32e40p_use_ff_regfile
common_targs += -t scm_use_fpga_scm
common_targs += -t cv64a6_imafdchsclic_sv39_hpdcache_wt_fence
common_targs += -t rtl
common_targs += -t deprecated
common_targs += --exclude neureka --exclude opentitan
# Carfield config target.
common_targs += -t $(CARFIELD_CONFIG)

# bender defines
common_defs += -D FEATURE_ICACHE_STAT
common_defs += -D PRIVATE_ICACHE
common_defs += -D HIERARCHY_ICACHE_32BIT
common_defs += -D ICAHE_USE_FF
common_defs += -D CLUSTER_ALIAS
