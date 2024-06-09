# Copyright 2023 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Author: Yvan Tortorella <yvan.tortorella@unibo.it>
# Author: Matteo Perotti <mperotti@iis.ee.ethz.ch>

# Runtime-selectable Carfield configuration
CARFIELD_CONFIG ?= carfield_l2dual_secure_pulp_periph_can

# bender targets
common_targs += -t cva6
common_targs += -t mchan
common_targs += -t integer_cluster
common_targs += -t cv32e40p_use_ff_regfile
common_targs += -t scm_use_fpga_scm
common_targs += -t cv64a6_imafdcsclic_sv39
common_targs += -t rtl
# The `snitch_cluster` target is needed for iDMA backend generation
common_targs += -t snitch_cluster
# The `deprecated` is needed for the redundancy cells, used as a
# temporary fix before updating the ECC SRAMs
common_targs += -t deprecated
# Carfield config target.
common_targs += -t $(CARFIELD_CONFIG)

# bender defines
common_defs += -D FEATURE_ICACHE_STAT
common_defs += -D PRIVATE_ICACHE
common_defs += -D HIERARCHY_ICACHE_32BIT
common_defs += -D ICAHE_USE_FF
common_defs += -D CLUSTER_ALIAS

# Island exclusion
ifeq ($(shell echo $(PULPD_PRESENT)), 0)
common_targs += -e pulp_cluster
endif

ifeq ($(shell echo $(SAFED_PRESENT)), 0)
common_targs += -e safety_island
else
common_defs += -D SAFED_ENABLE
endif

ifeq ($(shell echo $(SPATZD_PRESENT)), 0)
common_targs += -e spatz
else
common_targs += -t spatz
common_defs += -D SPATZ_ENABLE
endif

ifeq ($(shell echo $(SECURED_PRESENT)), 0)
common_targs += -e opentitan
endif
