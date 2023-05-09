# This script was generated automatically by bender.
set ROOT "/scratch/ypicod/carfield/carfield"
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/tech_cells_generic-d95320ba3d51d1fc/src/fpga/pad_functional_xilinx.sv \
    $ROOT/.bender/git/checkouts/tech_cells_generic-d95320ba3d51d1fc/src/fpga/tc_clk_xilinx.sv \
    $ROOT/.bender/git/checkouts/tech_cells_generic-d95320ba3d51d1fc/src/fpga/tc_sram_xilinx.sv \
    $ROOT/.bender/git/checkouts/tech_cells_generic-d95320ba3d51d1fc/src/rtl/tc_sram_impl.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/tech_cells_generic-d95320ba3d51d1fc/src/deprecated/pulp_clock_gating_async.sv \
    $ROOT/.bender/git/checkouts/tech_cells_generic-d95320ba3d51d1fc/src/deprecated/cluster_clk_cells.sv \
    $ROOT/.bender/git/checkouts/tech_cells_generic-d95320ba3d51d1fc/src/deprecated/pulp_clk_cells.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/binary_to_gray.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/cb_filter_pkg.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/cc_onehot.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/cf_math_pkg.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/clk_int_div.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/delta_counter.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/ecc_pkg.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/edge_propagator_tx.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/exp_backoff.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/fifo_v3.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/gray_to_binary.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/isochronous_4phase_handshake.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/isochronous_spill_register.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/lfsr.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/lfsr_16bit.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/lfsr_8bit.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/mv_filter.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/onehot_to_bin.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/plru_tree.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/popcount.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/rr_arb_tree.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/rstgen_bypass.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/serial_deglitch.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/shift_reg.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/shift_reg_gated.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/spill_register_flushable.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_demux.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_filter.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_fork.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_intf.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_join.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_mux.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_throttle.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/sub_per_hash.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/sync.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/sync_wedge.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/unread.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/read.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/cdc_reset_ctrlr_pkg.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/addr_decode_napot.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/cdc_2phase.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/cdc_4phase.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/addr_decode.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/cb_filter.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/cdc_fifo_2phase.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/counter.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/ecc_decode.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/ecc_encode.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/edge_detect.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/lzc.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/max_counter.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/rstgen.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/spill_register.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_delay.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_fifo.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_fork_dynamic.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/clk_mux_glitch_free.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/cdc_reset_ctrlr.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/cdc_fifo_gray.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/fall_through_register.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/id_queue.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_to_mem.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_arbiter_flushable.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_fifo_optimal_wrap.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_register.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_xbar.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/cdc_fifo_gray_clearable.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/cdc_2phase_clearable.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/mem_to_banks.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_arbiter.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/stream_omega_net.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/deprecated/clock_divider_counter.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/deprecated/clk_div.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/deprecated/find_first_one.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/deprecated/generic_LFSR_8bit.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/deprecated/generic_fifo.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/deprecated/prioarbiter.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/deprecated/pulp_sync.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/deprecated/pulp_sync_wedge.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/deprecated/rrarbiter.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/deprecated/clock_divider.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/deprecated/fifo_v2.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/deprecated/fifo_v1.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/edge_propagator_ack.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/edge_propagator.sv \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/src/edge_propagator_rx.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/apb-c6f8389f0453b267/src/apb_pkg.sv \
    $ROOT/.bender/git/checkouts/apb-c6f8389f0453b267/src/apb_intf.sv \
    $ROOT/.bender/git/checkouts/apb-c6f8389f0453b267/src/apb_err_slv.sv \
    $ROOT/.bender/git/checkouts/apb-c6f8389f0453b267/src/apb_regs.sv \
    $ROOT/.bender/git/checkouts/apb-c6f8389f0453b267/src/apb_cdc.sv \
    $ROOT/.bender/git/checkouts/apb-c6f8389f0453b267/src/apb_demux.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_pkg.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_intf.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_atop_filter.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_burst_splitter.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_bus_compare.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_cdc_dst.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_cdc_src.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_cut.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_delayer.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_demux.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_dw_downsizer.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_dw_upsizer.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_fifo.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_id_remap.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_id_prepend.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_isolate.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_join.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_lite_demux.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_lite_from_mem.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_lite_join.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_lite_lfsr.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_lite_mailbox.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_lite_mux.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_lite_regs.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_lite_to_apb.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_lite_to_axi.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_modify_address.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_mux.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_rw_join.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_rw_split.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_serializer.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_slave_compare.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_throttle.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_to_mem.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_cdc.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_err_slv.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_dw_converter.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_from_mem.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_id_serialize.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_lfsr.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_multicut.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_to_axi_lite.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_to_mem_banked.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_to_mem_interleaved.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_to_mem_split.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_iw_converter.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_lite_xbar.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_xbar.sv \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/src/axi_xp.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-e8cd831eee8ecbaa/hdl/defs_div_sqrt_mvp.sv \
    $ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-e8cd831eee8ecbaa/hdl/iteration_div_sqrt_mvp.sv \
    $ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-e8cd831eee8ecbaa/hdl/control_mvp.sv \
    $ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-e8cd831eee8ecbaa/hdl/norm_div_sqrt_mvp.sv \
    $ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-e8cd831eee8ecbaa/hdl/preprocess_mvp.sv \
    $ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-e8cd831eee8ecbaa/hdl/nrbd_nrsc_mvp.sv \
    $ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-e8cd831eee8ecbaa/hdl/div_sqrt_top_mvp.sv \
    $ROOT/.bender/git/checkouts/fpu_div_sqrt_mvp-e8cd831eee8ecbaa/hdl/div_sqrt_mvp_wrapper.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/fpnew-993909aeaf167088/src/fpnew_pkg.sv \
    $ROOT/.bender/git/checkouts/fpnew-993909aeaf167088/src/fpnew_cast_multi.sv \
    $ROOT/.bender/git/checkouts/fpnew-993909aeaf167088/src/fpnew_classifier.sv \
    $ROOT/.bender/git/checkouts/fpnew-993909aeaf167088/src/fpnew_divsqrt_multi.sv \
    $ROOT/.bender/git/checkouts/fpnew-993909aeaf167088/src/fpnew_fma.sv \
    $ROOT/.bender/git/checkouts/fpnew-993909aeaf167088/src/fpnew_fma_multi.sv \
    $ROOT/.bender/git/checkouts/fpnew-993909aeaf167088/src/fpnew_noncomp.sv \
    $ROOT/.bender/git/checkouts/fpnew-993909aeaf167088/src/fpnew_opgroup_block.sv \
    $ROOT/.bender/git/checkouts/fpnew-993909aeaf167088/src/fpnew_opgroup_fmt_slice.sv \
    $ROOT/.bender/git/checkouts/fpnew-993909aeaf167088/src/fpnew_opgroup_multifmt_slice.sv \
    $ROOT/.bender/git/checkouts/fpnew-993909aeaf167088/src/fpnew_rounding.sv \
    $ROOT/.bender/git/checkouts/fpnew-993909aeaf167088/src/fpnew_top.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/src/reg_intf.sv \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/vendor/lowrisc_opentitan/src/prim_subreg_arb.sv \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/vendor/lowrisc_opentitan/src/prim_subreg_ext.sv \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/src/apb_to_reg.sv \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/src/axi_to_reg.sv \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/src/periph_to_reg.sv \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/src/reg_cdc.sv \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/src/reg_demux.sv \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/src/reg_err_slv.sv \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/src/reg_mux.sv \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/src/reg_to_apb.sv \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/src/reg_to_mem.sv \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/src/reg_uniform.sv \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/src/reg_to_tlul.sv \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/vendor/lowrisc_opentitan/src/prim_subreg_shadow.sv \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/vendor/lowrisc_opentitan/src/prim_subreg.sv \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/src/axi_lite_to_reg.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/apb_uart-211e1b8a7d292c67/src/slib_clock_div.sv \
    $ROOT/.bender/git/checkouts/apb_uart-211e1b8a7d292c67/src/slib_counter.sv \
    $ROOT/.bender/git/checkouts/apb_uart-211e1b8a7d292c67/src/slib_edge_detect.sv \
    $ROOT/.bender/git/checkouts/apb_uart-211e1b8a7d292c67/src/slib_fifo.sv \
    $ROOT/.bender/git/checkouts/apb_uart-211e1b8a7d292c67/src/slib_input_filter.sv \
    $ROOT/.bender/git/checkouts/apb_uart-211e1b8a7d292c67/src/slib_input_sync.sv \
    $ROOT/.bender/git/checkouts/apb_uart-211e1b8a7d292c67/src/slib_mv_filter.sv \
    $ROOT/.bender/git/checkouts/apb_uart-211e1b8a7d292c67/src/uart_baudgen.sv \
    $ROOT/.bender/git/checkouts/apb_uart-211e1b8a7d292c67/src/uart_interrupt.sv \
    $ROOT/.bender/git/checkouts/apb_uart-211e1b8a7d292c67/src/uart_receiver.sv \
    $ROOT/.bender/git/checkouts/apb_uart-211e1b8a7d292c67/src/uart_transmitter.sv \
    $ROOT/.bender/git/checkouts/apb_uart-211e1b8a7d292c67/src/apb_uart.sv \
    $ROOT/.bender/git/checkouts/apb_uart-211e1b8a7d292c67/src/apb_uart_wrap.sv \
    $ROOT/.bender/git/checkouts/apb_uart-211e1b8a7d292c67/src/reg_uart_wrap.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/axi_llc_pkg.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/axi_llc_burst_cutter.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/axi_llc_data_way.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/axi_llc_merge_unit.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/axi_llc_read_unit.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/axi_llc_reg_pkg.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/axi_llc_reg_top.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/axi_llc_write_unit.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/eviction_refill/axi_llc_ax_master.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/eviction_refill/axi_llc_r_master.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/eviction_refill/axi_llc_w_master.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/hit_miss_detect/axi_llc_evict_box.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/hit_miss_detect/axi_llc_lock_box_bloom.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/hit_miss_detect/axi_llc_miss_counters.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/hit_miss_detect/axi_llc_tag_pattern_gen.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/axi_llc_chan_splitter.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/axi_llc_evict_unit.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/axi_llc_refill_unit.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/axi_llc_ways.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/hit_miss_detect/axi_llc_tag_store.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/axi_llc_config.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/axi_llc_hit_miss.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/axi_llc_top.sv \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/src/axi_llc_reg_wrap.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/axi_riscv_atomics-12dd0526264c4858/src/axi_res_tbl.sv \
    $ROOT/.bender/git/checkouts/axi_riscv_atomics-12dd0526264c4858/src/axi_riscv_amos_alu.sv \
    $ROOT/.bender/git/checkouts/axi_riscv_atomics-12dd0526264c4858/src/axi_riscv_amos.sv \
    $ROOT/.bender/git/checkouts/axi_riscv_atomics-12dd0526264c4858/src/axi_riscv_lrsc.sv \
    $ROOT/.bender/git/checkouts/axi_riscv_atomics-12dd0526264c4858/src/axi_riscv_atomics.sv \
    $ROOT/.bender/git/checkouts/axi_riscv_atomics-12dd0526264c4858/src/axi_riscv_lrsc_wrap.sv \
    $ROOT/.bender/git/checkouts/axi_riscv_atomics-12dd0526264c4858/src/axi_riscv_amos_wrap.sv \
    $ROOT/.bender/git/checkouts/axi_riscv_atomics-12dd0526264c4858/src/axi_riscv_atomics_wrap.sv \
    $ROOT/.bender/git/checkouts/axi_riscv_atomics-12dd0526264c4858/src/axi_riscv_atomics_structs.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/axi_vga-93374c914bf177ea/src/axi_vga_reg_pkg.sv \
    $ROOT/.bender/git/checkouts/axi_vga-93374c914bf177ea/src/axi_vga_reg_top.sv \
    $ROOT/.bender/git/checkouts/axi_vga-93374c914bf177ea/src/axi_vga_timing_fsm.sv \
    $ROOT/.bender/git/checkouts/axi_vga-93374c914bf177ea/src/axi_vga_fetcher.sv \
    $ROOT/.bender/git/checkouts/axi_vga-93374c914bf177ea/src/axi_vga.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/clint-a6086775a6581901/src/clint_reg_pkg.sv \
    $ROOT/.bender/git/checkouts/clint-a6086775a6581901/src/clint_reg_top.sv \
    $ROOT/.bender/git/checkouts/clint-a6086775a6581901/src/clint.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/include/cv64a6_imafdcsclic_sv39_config_pkg.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/include/riscv_pkg.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/include/ariane_dm_pkg.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/include/ariane_pkg.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/mmu_sv39/tlb.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/mmu_sv39/mmu.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/mmu_sv39/ptw.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cva6_clic_controller.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/include/ariane_rvfi_pkg.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/include/ariane_axi_pkg.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/include/wt_cache_pkg.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/include/std_cache_pkg.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/include/axi_intf.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/vendor/pulp-platform/fpga-support/rtl/SyncDpRam.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/vendor/pulp-platform/fpga-support/rtl/AsyncDpRam.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/vendor/pulp-platform/fpga-support/rtl/AsyncThreePortRam.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/include/cvxif_pkg.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cvxif_example/include/cvxif_instr_pkg.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cvxif_fu.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cvxif_example/cvxif_example_coprocessor.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cvxif_example/instr_decoder.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/corev_apu/tb/ariane.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cva6.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/alu.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/fpu_wrap.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/branch_unit.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/compressed_decoder.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/controller.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/csr_buffer.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/csr_regfile.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/decoder.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/ex_stage.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/instr_realign.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/id_stage.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/issue_read_operands.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/issue_stage.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/load_unit.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/load_store_unit.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/lsu_bypass.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/mult.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/multiplier.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/serdiv.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/perf_counters.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/ariane_regfile_ff.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/ariane_regfile_fpga.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/re_name.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/scoreboard.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/store_buffer.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/amo_buffer.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/store_unit.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/commit_stage.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/axi_shim.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/frontend/btb.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/frontend/bht.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/frontend/ras.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/frontend/instr_scan.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/frontend/instr_queue.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/frontend/frontend.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/wt_dcache_ctrl.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/wt_dcache_mem.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/wt_dcache_missunit.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/wt_dcache_wbuffer.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/wt_dcache.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/cva6_icache.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/wt_cache_subsystem.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/wt_axi_adapter.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/tag_cmp.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/cache_ctrl.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/amo_alu.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/wt_l15_adapter.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/axi_adapter.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/miss_handler.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/std_nbdcache.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/cva6_icache_axi_wrapper.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/cache_subsystem/std_cache_subsystem.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/pmp/src/pmp.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/core/pmp/src/pmp_entry.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/common/local/util/sram.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/common/local/util/tc_sram_fpga_wrapper.sv \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/vendor/pulp-platform/fpga-support/rtl/SyncSpRamBeNx64.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/frontends/idma_transfer_id_gen.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/idma_pkg.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/idma_stream_fifo.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/idma_buffer.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/idma_error_handler.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/idma_channel_coupler.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/idma_axi_transport_layer.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/idma_axi_lite_transport_layer.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/idma_obi_transport_layer.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/idma_legalizer.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/idma_backend.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/legacy/axi_dma_backend.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/legacy/midends/idma_2D_midend.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/midends/idma_nd_midend.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/frontends/register_32bit_2d/idma_reg32_2d_frontend_reg_pkg.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/frontends/register_32bit_2d/idma_reg32_2d_frontend_reg_top.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/frontends/register_32bit_2d/idma_reg32_2d_frontend.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/frontends/register_64bit/idma_reg64_frontend_reg_pkg.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/frontends/register_64bit/idma_reg64_frontend_reg_top.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/frontends/register_64bit/idma_reg64_frontend.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/frontends/desc64/idma_desc64_reg_pkg.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/frontends/desc64/idma_desc64_reg_top.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/frontends/desc64/idma_desc64_shared_counter.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/frontends/desc64/idma_desc64_reg_wrapper.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/frontends/desc64/idma_desc64_top.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/systems/cva6_reg/dma_core_wrap.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/synth_wrapper/idma_backend_synth.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/synth_wrapper/idma_lite_backend_synth.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/synth_wrapper/idma_obi_backend_synth.sv \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/synth_wrapper/idma_nd_backend_synth.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/prim/prim_pulp_platform/prim_flop_2sync.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/prim/prim_pulp_platform/prim_flop_en.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/prim/rtl/prim_fifo_sync_cnt.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/prim/rtl/prim_util_pkg.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/prim/rtl/prim_max_tree.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/prim/rtl/prim_sync_reqack.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/prim/rtl/prim_sync_reqack_data.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/prim/rtl/prim_pulse_sync.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/prim/rtl/prim_packer_fifo.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/prim/rtl/prim_fifo_sync.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/prim/rtl/prim_filter_ctr.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/prim/rtl/prim_intr_hw.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/prim/rtl/prim_fifo_async.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/gpio/rtl/gpio_reg_pkg.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/i2c/rtl/i2c_reg_pkg.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/rv_plic/rtl/rv_plic_reg_pkg.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/spi_host/rtl/spi_host_reg_pkg.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/gpio/rtl/gpio_reg_top.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/i2c/rtl/i2c_reg_top.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/rv_plic/rtl/rv_plic_reg_top.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/spi_host/rtl/spi_host_reg_top.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/i2c/rtl/i2c_pkg.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/i2c/rtl/i2c_fsm.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/rv_plic/rtl/rv_plic_gateway.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/spi_host/rtl/spi_host_byte_merge.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/spi_host/rtl/spi_host_byte_select.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/spi_host/rtl/spi_host_cmd_pkg.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/spi_host/rtl/spi_host_command_queue.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/spi_host/rtl/spi_host_fsm.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/spi_host/rtl/spi_host_window.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/spi_host/rtl/spi_host_data_fifos.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/spi_host/rtl/spi_host_shift_register.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/i2c/rtl/i2c_core.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/rv_plic/rtl/rv_plic_target.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/spi_host/rtl/spi_host_core.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/gpio/rtl/gpio.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/i2c/rtl/i2c.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/spi_host/rtl/spi_host.sv \
    $ROOT/.bender/git/checkouts/opentitan_peripherals-2583769709cf5461/src/rv_plic/rtl/rv_plic.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/riscv-dbg-b64c14faf71cdc77/src/dm_pkg.sv \
    $ROOT/.bender/git/checkouts/riscv-dbg-b64c14faf71cdc77/debug_rom/debug_rom.sv \
    $ROOT/.bender/git/checkouts/riscv-dbg-b64c14faf71cdc77/debug_rom/debug_rom_one_scratch.sv \
    $ROOT/.bender/git/checkouts/riscv-dbg-b64c14faf71cdc77/src/dm_csrs.sv \
    $ROOT/.bender/git/checkouts/riscv-dbg-b64c14faf71cdc77/src/dm_mem.sv \
    $ROOT/.bender/git/checkouts/riscv-dbg-b64c14faf71cdc77/src/dmi_cdc.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/riscv-dbg-b64c14faf71cdc77/src/dmi_jtag_tap.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/riscv-dbg-b64c14faf71cdc77/src/dm_sba.sv \
    $ROOT/.bender/git/checkouts/riscv-dbg-b64c14faf71cdc77/src/dm_top.sv \
    $ROOT/.bender/git/checkouts/riscv-dbg-b64c14faf71cdc77/src/dmi_jtag.sv \
    $ROOT/.bender/git/checkouts/riscv-dbg-b64c14faf71cdc77/src/dm_obi_top.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/regs/serial_link_reg_pkg.sv \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/regs/serial_link_reg_top.sv \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/regs/serial_link_single_channel_reg_pkg.sv \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/regs/serial_link_single_channel_reg_top.sv \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/serial_link_pkg.sv \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/channel_allocator/stream_chopper.sv \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/channel_allocator/stream_dechopper.sv \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/channel_allocator/channel_despread_sfr.sv \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/channel_allocator/channel_spread_sfr.sv \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/channel_allocator/serial_link_channel_allocator.sv \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/serial_link_network.sv \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/serial_link_data_link.sv \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/serial_link_physical.sv \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/serial_link.sv \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/serial_link_occamy_wrapper.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/serial_link_synth_wrapper.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/cheshire-e43a74e52373abd8/hw/bootrom/cheshire_bootrom.sv \
    $ROOT/.bender/git/checkouts/cheshire-e43a74e52373abd8/hw/regs/cheshire_reg_pkg.sv \
    $ROOT/.bender/git/checkouts/cheshire-e43a74e52373abd8/hw/regs/cheshire_reg_top.sv \
    $ROOT/.bender/git/checkouts/cheshire-e43a74e52373abd8/hw/cheshire_pkg.sv \
    $ROOT/.bender/git/checkouts/cheshire-e43a74e52373abd8/hw/cheshire_soc.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/.bender/git/checkouts/cheshire-e43a74e52373abd8/target/xilinx/src/fan_ctrl.sv \
    $ROOT/.bender/git/checkouts/cheshire-e43a74e52373abd8/target/xilinx/src/cheshire_top_xilinx.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/hw/carfield_pkg.sv \
    $ROOT/hw/cheshire_wrap.sv \
    $ROOT/hw/l2_wrap.sv \
    $ROOT/hw/carfield.sv \
]
add_files -norecurse -fileset [current_fileset] [list \
    $ROOT/target/xilinx/src/carfield_top_xilinx.sv \
]

set_property include_dirs [list \
    $ROOT/.bender/git/checkouts/apb-c6f8389f0453b267/include \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/include \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/include \
    $ROOT/.bender/git/checkouts/cheshire-e43a74e52373abd8/hw/include \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/include \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/common/local/util \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/include \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/include \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/axis/include \
] [current_fileset]

set_property include_dirs [list \
    $ROOT/.bender/git/checkouts/apb-c6f8389f0453b267/include \
    $ROOT/.bender/git/checkouts/axi-4c2e2b8175068864/include \
    $ROOT/.bender/git/checkouts/axi_llc-4bb86ca029494bde/include \
    $ROOT/.bender/git/checkouts/cheshire-e43a74e52373abd8/hw/include \
    $ROOT/.bender/git/checkouts/common_cells-06efff9a80d84f83/include \
    $ROOT/.bender/git/checkouts/cva6-48d158aa4c114467/common/local/util \
    $ROOT/.bender/git/checkouts/idma-07f959b66ee78d26/src/include \
    $ROOT/.bender/git/checkouts/register_interface-45a59d22d77c26b1/include \
    $ROOT/.bender/git/checkouts/serial_link-23da1e4e1f191a9b/src/axis/include \
] [current_fileset -simset]

set_property verilog_define [list \
    TARGET_CV64A6_IMAFDCSCLIC_SV39 \
    TARGET_CVA6 \
    TARGET_FPGA \
    TARGET_SYNTHESIS \
    TARGET_VCU128 \
    TARGET_VIVADO \
    TARGET_XILINX \
] [current_fileset]

set_property verilog_define [list \
    TARGET_CV64A6_IMAFDCSCLIC_SV39 \
    TARGET_CVA6 \
    TARGET_FPGA \
    TARGET_SYNTHESIS \
    TARGET_VCU128 \
    TARGET_VIVADO \
    TARGET_XILINX \
] [current_fileset -simset]
