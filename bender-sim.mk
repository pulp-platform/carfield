# Copyright 2023 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51
#
# Author: Alessandro Ottaviano <aottaviano@unibo.it>
# Author: Michael Rogenmoser <michaero@iis.ee.ethz.ch>

# bender targets
sim_targs += -t sim
sim_targs += -t test
sim_targs += -t simulation
ifeq ($(TECH_SIM), 1)
	sim_targs += -t tech_sim
	sim_defs  += -D INITIALIZE_MEMORY
	sim_defs  += -D INITIALIZE_OUTPUT
endif
