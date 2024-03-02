# Copyright 2022 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

# List available IPs
xilinx_available_ips = xlnx_clk_wiz xlnx_mig_ddr4 xlnx_vio carfield_ip

# Include IP and add top level building rule (%.xci) and enable artifacts management
define xlnx_ips_vars_and_deps =
include $(CAR_XIL_DIR)/xilinx_ips/$(1)/$(1).mk
ARTIFACTS_PATHS_$(1)   := $$(addprefix $$(ROOT_$(1))/, $$(ARTIFACTS_FILES_$(1)))
ARTIFACTS_VALS_$(1)    := $$(foreach var, $$(ARTIFACTS_VARS_$(1)), $$(var)=$$($$(var)))

ifeq ($(XILINX_USE_ARTIFACTS)$$(XILINX_USE_ARTIFACTS_$(1)),11)
$(CAR_XIL_DIR)/xilinx_ips/$(1)/%.xci: xilinx-ip-load-artifacts-$(1) $$(IP_DEP_$(1)) $(CAR_XIL_DIR)/xilinx_ips/$(1)/$(1).xpr xilinx-ip-save-artifacts-$(1)
else
$(CAR_XIL_DIR)/xilinx_ips/$(1)/%.xci: $$(IP_DEP_$(1)) $(CAR_XIL_DIR)/xilinx_ips/$(1)/$(1).xpr
endif
	@echo "IP $(1) : Done"

$(CAR_XIL_DIR)/xilinx_ips/$(1)/$(1).xpr:
	cd $$(ROOT_$(1)) && $(vivado_env) $(VIVADO) -mode batch -source tcl/run.tcl

.PRECIOUS: $(CAR_XIL_DIR)/xilinx_ips/$(1)/$(1).xpr $(CAR_XIL_DIR)/xilinx_ips/$(1)/%.xci
endef

# Call xlnx_ips_vars_and_deps
$(foreach ip, $(xilinx_available_ips), $(eval $(call xlnx_ips_vars_and_deps,$(ip))))

# Define inputs used to differentiate artifacts
$(CAR_XIL_DIR)/xilinx_ips/%/.generated_env:
	echo $(VIVADO) $(XILINX_PROJECT) > $@
	echo $(ARTIFACTS_VALS_$*) >> $@
	echo $(ARTIFACTS_FILES_$*) >> $@
	sha256sum $(ARTIFACTS_PATHS_$*) | awk '{print $$1}' >> $@

# Define artifact hash
$(CAR_XIL_DIR)/xilinx_ips/%/.generated_sha256: $(CAR_XIL_DIR)/xilinx_ips/%/.generated_env
	sha256sum $< | awk '{print $$1}' > $@

# Phonies can not use wildcards
define xlnx_ips_phonies =
# Load artifact based on hash
xilinx-ip-load-artifacts-$(1): $(CAR_XIL_DIR)/xilinx_ips/$(1)/.generated_sha256
	@if [ -z "$(XILINX_ARTIFACTS_ROOT)" ]; then \
		echo "Error: XILINX_ARTIFACTS_ROOT missing"; \
		exit 1; \
	fi
	@if [ -d "$(XILINX_ARTIFACTS_ROOT)/`cat $$<`" ]; then \
		echo -e $(TERM_GREEN)"Fetching $(1) from $(XILINX_ARTIFACTS_ROOT)/`cat $$<`"$(TERM_NC); \
		cp -r $(XILINX_ARTIFACTS_ROOT)/`cat $$<`/* $(ROOT_$(1)); \
	else \
		echo -e "$(1) not found in $(XILINX_ARTIFACTS_ROOT)/`cat $$<`"; \
	fi

# Save artifact based on hash
xilinx-ip-save-artifacts-$(1): $(CAR_XIL_DIR)/xilinx_ips/$(1)/.generated_sha256 $(CAR_XIL_DIR)/xilinx_ips/$(1)/$(1).xpr
	@if [ ! -d "$(XILINX_ARTIFACTS_ROOT)/`cat $$<`" ]; then \
		cp -r $(ROOT_$(1)) $(XILINX_ARTIFACTS_ROOT)/`cat $$<`; \
		chmod -R g+rw $(XILINX_ARTIFACTS_ROOT)/`cat $$<`; \
	fi

# Delete all the project.* generated folders
xilinx-ip-clean-$(1):
	@if [ -z "$$(ROOT_$(1))" ]; then echo "Error: Cannot find ROOT_$(1)" exit 1; fi;
	find $$(ROOT_$(1)) -mindepth 1 -type d -name "$(1).*" -exec rm -r {} +
	cd $$(ROOT_$(1)) && rm -rf $(1) .generated_env .generated_sha256 vivado* .Xil *.xpr tcl/add_sources* xgui component.xml
.PHONY: xilinx-ip-load-artifacts-$(1) xilinx-ip-save-artifacts-$(1) xilinx-ip-clean-$(1)
endef

# Call xlnx_ips_phonies
$(foreach ip, $(xilinx_available_ips), $(eval $(call xlnx_ips_phonies,$(ip))))

xilinx-ip-clean-all: $(addprefix xilinx-ip-clean-,$(xilinx_available_ips))

# Note: We do not PHONY the three rules above for lisibility since
# PHONY rules cannot use wildcards... but these files won't exist anyways
