
$(SNITCHD_ROOT)/target/snitch_cluster/generated/snitch_cluster_wrapper.sv \
$(SNITCHD_ROOT)/target/snitch_cluster/generated/bootdata.cc: | venv
	SNRT_BUILD_APPS=OFF \
	LLVM_BINROOT="#" \
	CLUSTERGEN="$(PYTHON) $(ROOT)/util/clustergen.py" \
	CFG_OVERRIDE=$(CAR_ROOT)/hw/configs/snitch_cluster.hjson \
	make -C $(SNITCHD_ROOT)/target/snitch_cluster $@

$(CAR_HW_DIR)/snitch_cluster_carfield/bootrom/%.elf: $(CAR_HW_DIR)/snitch_cluster_carfield/bootrom/%.S $(CAR_HW_DIR)/snitch_cluster_carfield/bootrom/%.ld \
                                                     $(SNITCHD_ROOT)/target/snitch_cluster/generated/bootdata.cc
	$(CHS_SW_CC) -mabi=ilp32d -march=rv32imafd -static -nostartfiles -T$(word 2,$^) $(word 1,$^) $(word 3,$^) -I$(SNITCHD_ROOT)/target/common/test -I$(SNITCHD_ROOT)/sw/deps/riscv-opcodes -o $@
.PRECIOUS: $(CAR_HW_DIR)/snitch_cluster_carfield/bootrom/%.elf
$(CAR_HW_DIR)/snitch_cluster_carfield/bootrom/snitch_cluster_bootrom.sv: $(CAR_HW_DIR)/snitch_cluster_carfield/bootrom/bootrom.bin $(CAR_HW_DIR)/snitch_cluster_carfield/bootrom/bootrom.dump
	$(CHS_ROOT)/util/gen_bootrom.py --sv-module snitch_cluster_bootrom $< > $@

.PHONY: snitchd-hw-init
snitchd-hw-init: $(addprefix $(SNITCHD_ROOT)/target/snitch_cluster/generated/,bootdata.cc snitch_cluster_wrapper.sv) $(CAR_HW_DIR)/snitch_cluster_carfield/bootrom/snitch_cluster_bootrom.sv

#	$(CHS_ROOT)/util/gen_bootrom.py --sv-module snitch_cluster_bootrom $(SNITCHD_ROOT)/target/snitch_cluster/test/bootrom.bin > $(SNITCHD_ROOT)/target/snitch_cluster/generated/snitch_cluster_bootrom.sv

#$(SNITCHD_ROOT)/target/snitch_cluster/$(GENERATED_DIR)/bootdata.cc
