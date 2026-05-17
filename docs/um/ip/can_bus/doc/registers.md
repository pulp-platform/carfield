## Summary

| Name                                                                                                          | Offset   |   Length | Description                                                                    |
|:--------------------------------------------------------------------------------------------------------------|:---------|---------:|:-------------------------------------------------------------------------------|
| can_bus.[`ahb_ifc_hsel_valid`](#ahb_ifc_hsel_valid)                                                           | 0x0      |        4 | Auto-extracted signal hsel_valid from ahb_ifc.vhd                              |
| can_bus.[`ahb_ifc_write_acc_d`](#ahb_ifc_write_acc_d)                                                         | 0x4      |        4 | Auto-extracted signal write_acc_d from ahb_ifc.vhd                             |
| can_bus.[`ahb_ifc_write_acc_q`](#ahb_ifc_write_acc_q)                                                         | 0x8      |        4 | Auto-extracted signal write_acc_q from ahb_ifc.vhd                             |
| can_bus.[`ahb_ifc_haddr_q`](#ahb_ifc_haddr_q)                                                                 | 0xc      |        4 | Auto-extracted signal haddr_q from ahb_ifc.vhd                                 |
| can_bus.[`ahb_ifc_h_ready_raw`](#ahb_ifc_h_ready_raw)                                                         | 0x10     |        4 | Auto-extracted signal h_ready_raw from ahb_ifc.vhd                             |
| can_bus.[`ahb_ifc_sbe_d`](#ahb_ifc_sbe_d)                                                                     | 0x14     |        4 | Auto-extracted signal sbe_d from ahb_ifc.vhd                                   |
| can_bus.[`ahb_ifc_sbe_q`](#ahb_ifc_sbe_q)                                                                     | 0x18     |        4 | Auto-extracted signal sbe_q from ahb_ifc.vhd                                   |
| can_bus.[`ahb_ifc_swr_i`](#ahb_ifc_swr_i)                                                                     | 0x1c     |        4 | Auto-extracted signal swr_i from ahb_ifc.vhd                                   |
| can_bus.[`ahb_ifc_srd_i`](#ahb_ifc_srd_i)                                                                     | 0x20     |        4 | Auto-extracted signal srd_i from ahb_ifc.vhd                                   |
| can_bus.[`bit_destuffing_discard_stuff_bit`](#bit_destuffing_discard_stuff_bit)                               | 0x24     |        4 | Auto-extracted signal discard_stuff_bit from bit_destuffing.vhd                |
| can_bus.[`bit_destuffing_non_fix_to_fix_chng`](#bit_destuffing_non_fix_to_fix_chng)                           | 0x28     |        4 | Auto-extracted signal non_fix_to_fix_chng from bit_destuffing.vhd              |
| can_bus.[`bit_destuffing_stuff_lvl_reached`](#bit_destuffing_stuff_lvl_reached)                               | 0x2c     |        4 | Auto-extracted signal stuff_lvl_reached from bit_destuffing.vhd                |
| can_bus.[`bit_destuffing_stuff_rule_violate`](#bit_destuffing_stuff_rule_violate)                             | 0x30     |        4 | Auto-extracted signal stuff_rule_violate from bit_destuffing.vhd               |
| can_bus.[`bit_destuffing_enable_prev`](#bit_destuffing_enable_prev)                                           | 0x34     |        4 | Auto-extracted signal enable_prev from bit_destuffing.vhd                      |
| can_bus.[`bit_destuffing_fixed_prev_q`](#bit_destuffing_fixed_prev_q)                                         | 0x38     |        4 | Auto-extracted signal fixed_prev_q from bit_destuffing.vhd                     |
| can_bus.[`bit_destuffing_fixed_prev_d`](#bit_destuffing_fixed_prev_d)                                         | 0x3c     |        4 | Auto-extracted signal fixed_prev_d from bit_destuffing.vhd                     |
| can_bus.[`bit_destuffing_same_bits_erase`](#bit_destuffing_same_bits_erase)                                   | 0x40     |        4 | Auto-extracted signal same_bits_erase from bit_destuffing.vhd                  |
| can_bus.[`bit_destuffing_destuffed_q`](#bit_destuffing_destuffed_q)                                           | 0x44     |        4 | Auto-extracted signal destuffed_q from bit_destuffing.vhd                      |
| can_bus.[`bit_destuffing_destuffed_d`](#bit_destuffing_destuffed_d)                                           | 0x48     |        4 | Auto-extracted signal destuffed_d from bit_destuffing.vhd                      |
| can_bus.[`bit_destuffing_stuff_err_q`](#bit_destuffing_stuff_err_q)                                           | 0x4c     |        4 | Auto-extracted signal stuff_err_q from bit_destuffing.vhd                      |
| can_bus.[`bit_destuffing_stuff_err_d`](#bit_destuffing_stuff_err_d)                                           | 0x50     |        4 | Auto-extracted signal stuff_err_d from bit_destuffing.vhd                      |
| can_bus.[`bit_destuffing_prev_val_q`](#bit_destuffing_prev_val_q)                                             | 0x54     |        4 | Auto-extracted signal prev_val_q from bit_destuffing.vhd                       |
| can_bus.[`bit_destuffing_prev_val_d`](#bit_destuffing_prev_val_d)                                             | 0x58     |        4 | Auto-extracted signal prev_val_d from bit_destuffing.vhd                       |
| can_bus.[`bit_err_detector_bit_err_d`](#bit_err_detector_bit_err_d)                                           | 0x5c     |        4 | Auto-extracted signal bit_err_d from bit_err_detector.vhd                      |
| can_bus.[`bit_err_detector_bit_err_q`](#bit_err_detector_bit_err_q)                                           | 0x60     |        4 | Auto-extracted signal bit_err_q from bit_err_detector.vhd                      |
| can_bus.[`bit_err_detector_bit_err_ssp_capt_d`](#bit_err_detector_bit_err_ssp_capt_d)                         | 0x64     |        4 | Auto-extracted signal bit_err_ssp_capt_d from bit_err_detector.vhd             |
| can_bus.[`bit_err_detector_bit_err_ssp_capt_q`](#bit_err_detector_bit_err_ssp_capt_q)                         | 0x68     |        4 | Auto-extracted signal bit_err_ssp_capt_q from bit_err_detector.vhd             |
| can_bus.[`bit_err_detector_bit_err_ssp_valid`](#bit_err_detector_bit_err_ssp_valid)                           | 0x6c     |        4 | Auto-extracted signal bit_err_ssp_valid from bit_err_detector.vhd              |
| can_bus.[`bit_err_detector_bit_err_ssp_condition`](#bit_err_detector_bit_err_ssp_condition)                   | 0x70     |        4 | Auto-extracted signal bit_err_ssp_condition from bit_err_detector.vhd          |
| can_bus.[`bit_err_detector_bit_err_norm_valid`](#bit_err_detector_bit_err_norm_valid)                         | 0x74     |        4 | Auto-extracted signal bit_err_norm_valid from bit_err_detector.vhd             |
| can_bus.[`bit_filter_masked_input`](#bit_filter_masked_input)                                                 | 0x78     |        4 | Auto-extracted signal masked_input from bit_filter.vhd                         |
| can_bus.[`bit_filter_masked_value`](#bit_filter_masked_value)                                                 | 0x7c     |        4 | Auto-extracted signal masked_value from bit_filter.vhd                         |
| can_bus.[`bit_segment_meter_sel_tseg1`](#bit_segment_meter_sel_tseg1)                                         | 0x80     |        4 | Auto-extracted signal sel_tseg1 from bit_segment_meter.vhd                     |
| can_bus.[`bit_segment_meter_exp_seg_length_ce`](#bit_segment_meter_exp_seg_length_ce)                         | 0x84     |        4 | Auto-extracted signal exp_seg_length_ce from bit_segment_meter.vhd             |
| can_bus.[`bit_segment_meter_phase_err_mt_sjw`](#bit_segment_meter_phase_err_mt_sjw)                           | 0x88     |        4 | Auto-extracted signal phase_err_mt_sjw from bit_segment_meter.vhd              |
| can_bus.[`bit_segment_meter_phase_err_eq_sjw`](#bit_segment_meter_phase_err_eq_sjw)                           | 0x8c     |        4 | Auto-extracted signal phase_err_eq_sjw from bit_segment_meter.vhd              |
| can_bus.[`bit_segment_meter_exit_ph2_immediate`](#bit_segment_meter_exit_ph2_immediate)                       | 0x90     |        4 | Auto-extracted signal exit_ph2_immediate from bit_segment_meter.vhd            |
| can_bus.[`bit_segment_meter_exit_segm_regular`](#bit_segment_meter_exit_segm_regular)                         | 0x94     |        4 | Auto-extracted signal exit_segm_regular from bit_segment_meter.vhd             |
| can_bus.[`bit_segment_meter_exit_segm_regular_tseg1`](#bit_segment_meter_exit_segm_regular_tseg1)             | 0x98     |        4 | Auto-extracted signal exit_segm_regular_tseg1 from bit_segment_meter.vhd       |
| can_bus.[`bit_segment_meter_exit_segm_regular_tseg2`](#bit_segment_meter_exit_segm_regular_tseg2)             | 0x9c     |        4 | Auto-extracted signal exit_segm_regular_tseg2 from bit_segment_meter.vhd       |
| can_bus.[`bit_segment_meter_sjw_mt_zero`](#bit_segment_meter_sjw_mt_zero)                                     | 0xa0     |        4 | Auto-extracted signal sjw_mt_zero from bit_segment_meter.vhd                   |
| can_bus.[`bit_segment_meter_use_basic_segm_length`](#bit_segment_meter_use_basic_segm_length)                 | 0xa4     |        4 | Auto-extracted signal use_basic_segm_length from bit_segment_meter.vhd         |
| can_bus.[`bit_segment_meter_phase_err_sjw_by_one`](#bit_segment_meter_phase_err_sjw_by_one)                   | 0xa8     |        4 | Auto-extracted signal phase_err_sjw_by_one from bit_segment_meter.vhd          |
| can_bus.[`bit_segment_meter_shorten_tseg1_after_tseg2`](#bit_segment_meter_shorten_tseg1_after_tseg2)         | 0xac     |        4 | Auto-extracted signal shorten_tseg1_after_tseg2 from bit_segment_meter.vhd     |
| can_bus.[`bit_stuffing_data_out_i`](#bit_stuffing_data_out_i)                                                 | 0xb0     |        4 | Auto-extracted signal data_out_i from bit_stuffing.vhd                         |
| can_bus.[`bit_stuffing_data_halt_q`](#bit_stuffing_data_halt_q)                                               | 0xb4     |        4 | Auto-extracted signal data_halt_q from bit_stuffing.vhd                        |
| can_bus.[`bit_stuffing_data_halt_d`](#bit_stuffing_data_halt_d)                                               | 0xb8     |        4 | Auto-extracted signal data_halt_d from bit_stuffing.vhd                        |
| can_bus.[`bit_stuffing_fixed_reg_q`](#bit_stuffing_fixed_reg_q)                                               | 0xbc     |        4 | Auto-extracted signal fixed_reg_q from bit_stuffing.vhd                        |
| can_bus.[`bit_stuffing_fixed_reg_d`](#bit_stuffing_fixed_reg_d)                                               | 0xc0     |        4 | Auto-extracted signal fixed_reg_d from bit_stuffing.vhd                        |
| can_bus.[`bit_stuffing_enable_prev`](#bit_stuffing_enable_prev)                                               | 0xc4     |        4 | Auto-extracted signal enable_prev from bit_stuffing.vhd                        |
| can_bus.[`bit_stuffing_non_fix_to_fix_chng`](#bit_stuffing_non_fix_to_fix_chng)                               | 0xc8     |        4 | Auto-extracted signal non_fix_to_fix_chng from bit_stuffing.vhd                |
| can_bus.[`bit_stuffing_stuff_lvl_reached`](#bit_stuffing_stuff_lvl_reached)                                   | 0xcc     |        4 | Auto-extracted signal stuff_lvl_reached from bit_stuffing.vhd                  |
| can_bus.[`bit_stuffing_same_bits_rst_trig`](#bit_stuffing_same_bits_rst_trig)                                 | 0xd0     |        4 | Auto-extracted signal same_bits_rst_trig from bit_stuffing.vhd                 |
| can_bus.[`bit_stuffing_same_bits_rst`](#bit_stuffing_same_bits_rst)                                           | 0xd4     |        4 | Auto-extracted signal same_bits_rst from bit_stuffing.vhd                      |
| can_bus.[`bit_stuffing_insert_stuff_bit`](#bit_stuffing_insert_stuff_bit)                                     | 0xd8     |        4 | Auto-extracted signal insert_stuff_bit from bit_stuffing.vhd                   |
| can_bus.[`bit_stuffing_data_out_d_ena`](#bit_stuffing_data_out_d_ena)                                         | 0xdc     |        4 | Auto-extracted signal data_out_d_ena from bit_stuffing.vhd                     |
| can_bus.[`bit_stuffing_data_out_d`](#bit_stuffing_data_out_d)                                                 | 0xe0     |        4 | Auto-extracted signal data_out_d from bit_stuffing.vhd                         |
| can_bus.[`bit_stuffing_data_out_ce`](#bit_stuffing_data_out_ce)                                               | 0xe4     |        4 | Auto-extracted signal data_out_ce from bit_stuffing.vhd                        |
| can_bus.[`bit_time_cfg_capture_drv_tq_nbt`](#bit_time_cfg_capture_drv_tq_nbt)                                 | 0xe8     |        4 | Auto-extracted signal drv_tq_nbt from bit_time_cfg_capture.vhd                 |
| can_bus.[`bit_time_cfg_capture_drv_prs_nbt`](#bit_time_cfg_capture_drv_prs_nbt)                               | 0xec     |        4 | Auto-extracted signal drv_prs_nbt from bit_time_cfg_capture.vhd                |
| can_bus.[`bit_time_cfg_capture_drv_ph1_nbt`](#bit_time_cfg_capture_drv_ph1_nbt)                               | 0xf0     |        4 | Auto-extracted signal drv_ph1_nbt from bit_time_cfg_capture.vhd                |
| can_bus.[`bit_time_cfg_capture_drv_ph2_nbt`](#bit_time_cfg_capture_drv_ph2_nbt)                               | 0xf4     |        4 | Auto-extracted signal drv_ph2_nbt from bit_time_cfg_capture.vhd                |
| can_bus.[`bit_time_cfg_capture_drv_sjw_nbt`](#bit_time_cfg_capture_drv_sjw_nbt)                               | 0xf8     |        4 | Auto-extracted signal drv_sjw_nbt from bit_time_cfg_capture.vhd                |
| can_bus.[`bit_time_cfg_capture_drv_tq_dbt`](#bit_time_cfg_capture_drv_tq_dbt)                                 | 0xfc     |        4 | Auto-extracted signal drv_tq_dbt from bit_time_cfg_capture.vhd                 |
| can_bus.[`bit_time_cfg_capture_drv_prs_dbt`](#bit_time_cfg_capture_drv_prs_dbt)                               | 0x100    |        4 | Auto-extracted signal drv_prs_dbt from bit_time_cfg_capture.vhd                |
| can_bus.[`bit_time_cfg_capture_drv_ph1_dbt`](#bit_time_cfg_capture_drv_ph1_dbt)                               | 0x104    |        4 | Auto-extracted signal drv_ph1_dbt from bit_time_cfg_capture.vhd                |
| can_bus.[`bit_time_cfg_capture_drv_ph2_dbt`](#bit_time_cfg_capture_drv_ph2_dbt)                               | 0x108    |        4 | Auto-extracted signal drv_ph2_dbt from bit_time_cfg_capture.vhd                |
| can_bus.[`bit_time_cfg_capture_drv_sjw_dbt`](#bit_time_cfg_capture_drv_sjw_dbt)                               | 0x10c    |        4 | Auto-extracted signal drv_sjw_dbt from bit_time_cfg_capture.vhd                |
| can_bus.[`bit_time_cfg_capture_tseg1_nbt_d`](#bit_time_cfg_capture_tseg1_nbt_d)                               | 0x110    |        4 | Auto-extracted signal tseg1_nbt_d from bit_time_cfg_capture.vhd                |
| can_bus.[`bit_time_cfg_capture_tseg1_dbt_d`](#bit_time_cfg_capture_tseg1_dbt_d)                               | 0x114    |        4 | Auto-extracted signal tseg1_dbt_d from bit_time_cfg_capture.vhd                |
| can_bus.[`bit_time_cfg_capture_drv_ena`](#bit_time_cfg_capture_drv_ena)                                       | 0x118    |        4 | Auto-extracted signal drv_ena from bit_time_cfg_capture.vhd                    |
| can_bus.[`bit_time_cfg_capture_drv_ena_reg`](#bit_time_cfg_capture_drv_ena_reg)                               | 0x11c    |        4 | Auto-extracted signal drv_ena_reg from bit_time_cfg_capture.vhd                |
| can_bus.[`bit_time_cfg_capture_drv_ena_reg_2`](#bit_time_cfg_capture_drv_ena_reg_2)                           | 0x120    |        4 | Auto-extracted signal drv_ena_reg_2 from bit_time_cfg_capture.vhd              |
| can_bus.[`bit_time_cfg_capture_capture`](#bit_time_cfg_capture_capture)                                       | 0x124    |        4 | Auto-extracted signal capture from bit_time_cfg_capture.vhd                    |
| can_bus.[`bit_time_counters_tq_counter_d`](#bit_time_counters_tq_counter_d)                                   | 0x128    |        4 | Auto-extracted signal tq_counter_d from bit_time_counters.vhd                  |
| can_bus.[`bit_time_counters_tq_counter_q`](#bit_time_counters_tq_counter_q)                                   | 0x12c    |        4 | Auto-extracted signal tq_counter_q from bit_time_counters.vhd                  |
| can_bus.[`bit_time_counters_tq_counter_ce`](#bit_time_counters_tq_counter_ce)                                 | 0x130    |        4 | Auto-extracted signal tq_counter_ce from bit_time_counters.vhd                 |
| can_bus.[`bit_time_counters_tq_counter_allow`](#bit_time_counters_tq_counter_allow)                           | 0x134    |        4 | Auto-extracted signal tq_counter_allow from bit_time_counters.vhd              |
| can_bus.[`bit_time_counters_tq_edge_i`](#bit_time_counters_tq_edge_i)                                         | 0x138    |        4 | Auto-extracted signal tq_edge_i from bit_time_counters.vhd                     |
| can_bus.[`bit_time_counters_segm_counter_d`](#bit_time_counters_segm_counter_d)                               | 0x13c    |        4 | Auto-extracted signal segm_counter_d from bit_time_counters.vhd                |
| can_bus.[`bit_time_counters_segm_counter_q`](#bit_time_counters_segm_counter_q)                               | 0x140    |        4 | Auto-extracted signal segm_counter_q from bit_time_counters.vhd                |
| can_bus.[`bit_time_counters_segm_counter_ce`](#bit_time_counters_segm_counter_ce)                             | 0x144    |        4 | Auto-extracted signal segm_counter_ce from bit_time_counters.vhd               |
| can_bus.[`bit_time_fsm_bt_fsm_ce`](#bit_time_fsm_bt_fsm_ce)                                                   | 0x148    |        4 | Auto-extracted signal bt_fsm_ce from bit_time_fsm.vhd                          |
| can_bus.[`bus_sampling_drv_ena`](#bus_sampling_drv_ena)                                                       | 0x14c    |        4 | Auto-extracted signal drv_ena from bus_sampling.vhd                            |
| can_bus.[`bus_sampling_drv_ssp_offset`](#bus_sampling_drv_ssp_offset)                                         | 0x150    |        4 | Auto-extracted signal drv_ssp_offset from bus_sampling.vhd                     |
| can_bus.[`bus_sampling_drv_ssp_delay_select`](#bus_sampling_drv_ssp_delay_select)                             | 0x154    |        4 | Auto-extracted signal drv_ssp_delay_select from bus_sampling.vhd               |
| can_bus.[`bus_sampling_data_rx_synced`](#bus_sampling_data_rx_synced)                                         | 0x158    |        4 | Auto-extracted signal data_rx_synced from bus_sampling.vhd                     |
| can_bus.[`bus_sampling_prev_Sample`](#bus_sampling_prev_sample)                                               | 0x15c    |        4 | Auto-extracted signal prev_Sample from bus_sampling.vhd                        |
| can_bus.[`bus_sampling_sample_sec_i`](#bus_sampling_sample_sec_i)                                             | 0x160    |        4 | Auto-extracted signal sample_sec_i from bus_sampling.vhd                       |
| can_bus.[`bus_sampling_data_tx_delayed`](#bus_sampling_data_tx_delayed)                                       | 0x164    |        4 | Auto-extracted signal data_tx_delayed from bus_sampling.vhd                    |
| can_bus.[`bus_sampling_edge_rx_valid`](#bus_sampling_edge_rx_valid)                                           | 0x168    |        4 | Auto-extracted signal edge_rx_valid from bus_sampling.vhd                      |
| can_bus.[`bus_sampling_edge_tx_valid`](#bus_sampling_edge_tx_valid)                                           | 0x16c    |        4 | Auto-extracted signal edge_tx_valid from bus_sampling.vhd                      |
| can_bus.[`bus_sampling_ssp_delay`](#bus_sampling_ssp_delay)                                                   | 0x170    |        4 | Auto-extracted signal ssp_delay from bus_sampling.vhd                          |
| can_bus.[`bus_sampling_tx_trigger_q`](#bus_sampling_tx_trigger_q)                                             | 0x174    |        4 | Auto-extracted signal tx_trigger_q from bus_sampling.vhd                       |
| can_bus.[`bus_sampling_tx_trigger_ssp`](#bus_sampling_tx_trigger_ssp)                                         | 0x178    |        4 | Auto-extracted signal tx_trigger_ssp from bus_sampling.vhd                     |
| can_bus.[`bus_sampling_shift_regs_res_d`](#bus_sampling_shift_regs_res_d)                                     | 0x17c    |        4 | Auto-extracted signal shift_regs_res_d from bus_sampling.vhd                   |
| can_bus.[`bus_sampling_shift_regs_res_q`](#bus_sampling_shift_regs_res_q)                                     | 0x180    |        4 | Auto-extracted signal shift_regs_res_q from bus_sampling.vhd                   |
| can_bus.[`bus_sampling_shift_regs_res_q_scan`](#bus_sampling_shift_regs_res_q_scan)                           | 0x184    |        4 | Auto-extracted signal shift_regs_res_q_scan from bus_sampling.vhd              |
| can_bus.[`bus_sampling_ssp_enable`](#bus_sampling_ssp_enable)                                                 | 0x188    |        4 | Auto-extracted signal ssp_enable from bus_sampling.vhd                         |
| can_bus.[`bus_traffic_counters_tx_ctr_i`](#bus_traffic_counters_tx_ctr_i)                                     | 0x18c    |        4 | Auto-extracted signal tx_ctr_i from bus_traffic_counters.vhd                   |
| can_bus.[`bus_traffic_counters_rx_ctr_i`](#bus_traffic_counters_rx_ctr_i)                                     | 0x190    |        4 | Auto-extracted signal rx_ctr_i from bus_traffic_counters.vhd                   |
| can_bus.[`bus_traffic_counters_tx_ctr_rst_n_d`](#bus_traffic_counters_tx_ctr_rst_n_d)                         | 0x194    |        4 | Auto-extracted signal tx_ctr_rst_n_d from bus_traffic_counters.vhd             |
| can_bus.[`bus_traffic_counters_tx_ctr_rst_n_q`](#bus_traffic_counters_tx_ctr_rst_n_q)                         | 0x198    |        4 | Auto-extracted signal tx_ctr_rst_n_q from bus_traffic_counters.vhd             |
| can_bus.[`bus_traffic_counters_tx_ctr_rst_n_q_scan`](#bus_traffic_counters_tx_ctr_rst_n_q_scan)               | 0x19c    |        4 | Auto-extracted signal tx_ctr_rst_n_q_scan from bus_traffic_counters.vhd        |
| can_bus.[`bus_traffic_counters_rx_ctr_rst_n_d`](#bus_traffic_counters_rx_ctr_rst_n_d)                         | 0x1a0    |        4 | Auto-extracted signal rx_ctr_rst_n_d from bus_traffic_counters.vhd             |
| can_bus.[`bus_traffic_counters_rx_ctr_rst_n_q`](#bus_traffic_counters_rx_ctr_rst_n_q)                         | 0x1a4    |        4 | Auto-extracted signal rx_ctr_rst_n_q from bus_traffic_counters.vhd             |
| can_bus.[`bus_traffic_counters_rx_ctr_rst_n_q_scan`](#bus_traffic_counters_rx_ctr_rst_n_q_scan)               | 0x1a8    |        4 | Auto-extracted signal rx_ctr_rst_n_q_scan from bus_traffic_counters.vhd        |
| can_bus.[`can_apb_tb_s_apb_paddr`](#can_apb_tb_s_apb_paddr)                                                   | 0x1ac    |        4 | Auto-extracted signal s_apb_paddr from can_apb_tb.vhd                          |
| can_bus.[`can_apb_tb_s_apb_penable`](#can_apb_tb_s_apb_penable)                                               | 0x1b0    |        4 | Auto-extracted signal s_apb_penable from can_apb_tb.vhd                        |
| can_bus.[`can_apb_tb_s_apb_pprot`](#can_apb_tb_s_apb_pprot)                                                   | 0x1b4    |        4 | Auto-extracted signal s_apb_pprot from can_apb_tb.vhd                          |
| can_bus.[`can_apb_tb_s_apb_prdata`](#can_apb_tb_s_apb_prdata)                                                 | 0x1b8    |        4 | Auto-extracted signal s_apb_prdata from can_apb_tb.vhd                         |
| can_bus.[`can_apb_tb_s_apb_pready`](#can_apb_tb_s_apb_pready)                                                 | 0x1bc    |        4 | Auto-extracted signal s_apb_pready from can_apb_tb.vhd                         |
| can_bus.[`can_apb_tb_s_apb_psel`](#can_apb_tb_s_apb_psel)                                                     | 0x1c0    |        4 | Auto-extracted signal s_apb_psel from can_apb_tb.vhd                           |
| can_bus.[`can_apb_tb_s_apb_pslverr`](#can_apb_tb_s_apb_pslverr)                                               | 0x1c4    |        4 | Auto-extracted signal s_apb_pslverr from can_apb_tb.vhd                        |
| can_bus.[`can_apb_tb_s_apb_pstrb`](#can_apb_tb_s_apb_pstrb)                                                   | 0x1c8    |        4 | Auto-extracted signal s_apb_pstrb from can_apb_tb.vhd                          |
| can_bus.[`can_apb_tb_s_apb_pwdata`](#can_apb_tb_s_apb_pwdata)                                                 | 0x1cc    |        4 | Auto-extracted signal s_apb_pwdata from can_apb_tb.vhd                         |
| can_bus.[`can_apb_tb_s_apb_pwrite`](#can_apb_tb_s_apb_pwrite)                                                 | 0x1d0    |        4 | Auto-extracted signal s_apb_pwrite from can_apb_tb.vhd                         |
| can_bus.[`can_core_drv_clr_rx_ctr`](#can_core_drv_clr_rx_ctr)                                                 | 0x1d4    |        4 | Auto-extracted signal drv_clr_rx_ctr from can_core.vhd                         |
| can_bus.[`can_core_drv_clr_tx_ctr`](#can_core_drv_clr_tx_ctr)                                                 | 0x1d8    |        4 | Auto-extracted signal drv_clr_tx_ctr from can_core.vhd                         |
| can_bus.[`can_core_drv_bus_mon_ena`](#can_core_drv_bus_mon_ena)                                               | 0x1dc    |        4 | Auto-extracted signal drv_bus_mon_ena from can_core.vhd                        |
| can_bus.[`can_core_drv_ena`](#can_core_drv_ena)                                                               | 0x1e0    |        4 | Auto-extracted signal drv_ena from can_core.vhd                                |
| can_bus.[`can_core_rec_ident_i`](#can_core_rec_ident_i)                                                       | 0x1e4    |        4 | Auto-extracted signal rec_ident_i from can_core.vhd                            |
| can_bus.[`can_core_rec_dlc_i`](#can_core_rec_dlc_i)                                                           | 0x1e8    |        4 | Auto-extracted signal rec_dlc_i from can_core.vhd                              |
| can_bus.[`can_core_rec_ident_type_i`](#can_core_rec_ident_type_i)                                             | 0x1ec    |        4 | Auto-extracted signal rec_ident_type_i from can_core.vhd                       |
| can_bus.[`can_core_rec_frame_type_i`](#can_core_rec_frame_type_i)                                             | 0x1f0    |        4 | Auto-extracted signal rec_frame_type_i from can_core.vhd                       |
| can_bus.[`can_core_rec_is_rtr_i`](#can_core_rec_is_rtr_i)                                                     | 0x1f4    |        4 | Auto-extracted signal rec_is_rtr_i from can_core.vhd                           |
| can_bus.[`can_core_rec_brs_i`](#can_core_rec_brs_i)                                                           | 0x1f8    |        4 | Auto-extracted signal rec_brs_i from can_core.vhd                              |
| can_bus.[`can_core_rec_esi_i`](#can_core_rec_esi_i)                                                           | 0x1fc    |        4 | Auto-extracted signal rec_esi_i from can_core.vhd                              |
| can_bus.[`can_core_alc`](#can_core_alc)                                                                       | 0x200    |        4 | Auto-extracted signal alc from can_core.vhd                                    |
| can_bus.[`can_core_erc_capture`](#can_core_erc_capture)                                                       | 0x204    |        4 | Auto-extracted signal erc_capture from can_core.vhd                            |
| can_bus.[`can_core_is_transmitter`](#can_core_is_transmitter)                                                 | 0x208    |        4 | Auto-extracted signal is_transmitter from can_core.vhd                         |
| can_bus.[`can_core_is_receiver`](#can_core_is_receiver)                                                       | 0x20c    |        4 | Auto-extracted signal is_receiver from can_core.vhd                            |
| can_bus.[`can_core_is_idle`](#can_core_is_idle)                                                               | 0x210    |        4 | Auto-extracted signal is_idle from can_core.vhd                                |
| can_bus.[`can_core_arbitration_lost_i`](#can_core_arbitration_lost_i)                                         | 0x214    |        4 | Auto-extracted signal arbitration_lost_i from can_core.vhd                     |
| can_bus.[`can_core_set_transmitter`](#can_core_set_transmitter)                                               | 0x218    |        4 | Auto-extracted signal set_transmitter from can_core.vhd                        |
| can_bus.[`can_core_set_receiver`](#can_core_set_receiver)                                                     | 0x21c    |        4 | Auto-extracted signal set_receiver from can_core.vhd                           |
| can_bus.[`can_core_set_idle`](#can_core_set_idle)                                                             | 0x220    |        4 | Auto-extracted signal set_idle from can_core.vhd                               |
| can_bus.[`can_core_is_err_active`](#can_core_is_err_active)                                                   | 0x224    |        4 | Auto-extracted signal is_err_active from can_core.vhd                          |
| can_bus.[`can_core_is_err_passive`](#can_core_is_err_passive)                                                 | 0x228    |        4 | Auto-extracted signal is_err_passive from can_core.vhd                         |
| can_bus.[`can_core_is_bus_off_i`](#can_core_is_bus_off_i)                                                     | 0x22c    |        4 | Auto-extracted signal is_bus_off_i from can_core.vhd                           |
| can_bus.[`can_core_err_detected_i`](#can_core_err_detected_i)                                                 | 0x230    |        4 | Auto-extracted signal err_detected_i from can_core.vhd                         |
| can_bus.[`can_core_primary_err`](#can_core_primary_err)                                                       | 0x234    |        4 | Auto-extracted signal primary_err from can_core.vhd                            |
| can_bus.[`can_core_act_err_ovr_flag`](#can_core_act_err_ovr_flag)                                             | 0x238    |        4 | Auto-extracted signal act_err_ovr_flag from can_core.vhd                       |
| can_bus.[`can_core_err_delim_late`](#can_core_err_delim_late)                                                 | 0x23c    |        4 | Auto-extracted signal err_delim_late from can_core.vhd                         |
| can_bus.[`can_core_set_err_active`](#can_core_set_err_active)                                                 | 0x240    |        4 | Auto-extracted signal set_err_active from can_core.vhd                         |
| can_bus.[`can_core_err_ctrs_unchanged`](#can_core_err_ctrs_unchanged)                                         | 0x244    |        4 | Auto-extracted signal err_ctrs_unchanged from can_core.vhd                     |
| can_bus.[`can_core_stuff_enable`](#can_core_stuff_enable)                                                     | 0x248    |        4 | Auto-extracted signal stuff_enable from can_core.vhd                           |
| can_bus.[`can_core_destuff_enable`](#can_core_destuff_enable)                                                 | 0x24c    |        4 | Auto-extracted signal destuff_enable from can_core.vhd                         |
| can_bus.[`can_core_fixed_stuff`](#can_core_fixed_stuff)                                                       | 0x250    |        4 | Auto-extracted signal fixed_stuff from can_core.vhd                            |
| can_bus.[`can_core_tx_frame_no_sof`](#can_core_tx_frame_no_sof)                                               | 0x254    |        4 | Auto-extracted signal tx_frame_no_sof from can_core.vhd                        |
| can_bus.[`can_core_stuff_length`](#can_core_stuff_length)                                                     | 0x258    |        4 | Auto-extracted signal stuff_length from can_core.vhd                           |
| can_bus.[`can_core_dst_ctr`](#can_core_dst_ctr)                                                               | 0x25c    |        4 | Auto-extracted signal dst_ctr from can_core.vhd                                |
| can_bus.[`can_core_bst_ctr`](#can_core_bst_ctr)                                                               | 0x260    |        4 | Auto-extracted signal bst_ctr from can_core.vhd                                |
| can_bus.[`can_core_stuff_err`](#can_core_stuff_err)                                                           | 0x264    |        4 | Auto-extracted signal stuff_err from can_core.vhd                              |
| can_bus.[`can_core_crc_enable`](#can_core_crc_enable)                                                         | 0x268    |        4 | Auto-extracted signal crc_enable from can_core.vhd                             |
| can_bus.[`can_core_crc_spec_enable`](#can_core_crc_spec_enable)                                               | 0x26c    |        4 | Auto-extracted signal crc_spec_enable from can_core.vhd                        |
| can_bus.[`can_core_crc_calc_from_rx`](#can_core_crc_calc_from_rx)                                             | 0x270    |        4 | Auto-extracted signal crc_calc_from_rx from can_core.vhd                       |
| can_bus.[`can_core_crc_15`](#can_core_crc_15)                                                                 | 0x274    |        4 | Auto-extracted signal crc_15 from can_core.vhd                                 |
| can_bus.[`can_core_crc_17`](#can_core_crc_17)                                                                 | 0x278    |        4 | Auto-extracted signal crc_17 from can_core.vhd                                 |
| can_bus.[`can_core_crc_21`](#can_core_crc_21)                                                                 | 0x27c    |        4 | Auto-extracted signal crc_21 from can_core.vhd                                 |
| can_bus.[`can_core_sp_control_i`](#can_core_sp_control_i)                                                     | 0x280    |        4 | Auto-extracted signal sp_control_i from can_core.vhd                           |
| can_bus.[`can_core_sp_control_q`](#can_core_sp_control_q)                                                     | 0x284    |        4 | Auto-extracted signal sp_control_q from can_core.vhd                           |
| can_bus.[`can_core_sync_control_i`](#can_core_sync_control_i)                                                 | 0x288    |        4 | Auto-extracted signal sync_control_i from can_core.vhd                         |
| can_bus.[`can_core_ssp_reset_i`](#can_core_ssp_reset_i)                                                       | 0x28c    |        4 | Auto-extracted signal ssp_reset_i from can_core.vhd                            |
| can_bus.[`can_core_tran_delay_meas_i`](#can_core_tran_delay_meas_i)                                           | 0x290    |        4 | Auto-extracted signal tran_delay_meas_i from can_core.vhd                      |
| can_bus.[`can_core_tran_valid_i`](#can_core_tran_valid_i)                                                     | 0x294    |        4 | Auto-extracted signal tran_valid_i from can_core.vhd                           |
| can_bus.[`can_core_rec_valid_i`](#can_core_rec_valid_i)                                                       | 0x298    |        4 | Auto-extracted signal rec_valid_i from can_core.vhd                            |
| can_bus.[`can_core_br_shifted_i`](#can_core_br_shifted_i)                                                     | 0x29c    |        4 | Auto-extracted signal br_shifted_i from can_core.vhd                           |
| can_bus.[`can_core_fcs_changed_i`](#can_core_fcs_changed_i)                                                   | 0x2a0    |        4 | Auto-extracted signal fcs_changed_i from can_core.vhd                          |
| can_bus.[`can_core_err_warning_limit_i`](#can_core_err_warning_limit_i)                                       | 0x2a4    |        4 | Auto-extracted signal err_warning_limit_i from can_core.vhd                    |
| can_bus.[`can_core_tx_err_ctr`](#can_core_tx_err_ctr)                                                         | 0x2a8    |        4 | Auto-extracted signal tx_err_ctr from can_core.vhd                             |
| can_bus.[`can_core_rx_err_ctr`](#can_core_rx_err_ctr)                                                         | 0x2ac    |        4 | Auto-extracted signal rx_err_ctr from can_core.vhd                             |
| can_bus.[`can_core_norm_err_ctr`](#can_core_norm_err_ctr)                                                     | 0x2b0    |        4 | Auto-extracted signal norm_err_ctr from can_core.vhd                           |
| can_bus.[`can_core_data_err_ctr`](#can_core_data_err_ctr)                                                     | 0x2b4    |        4 | Auto-extracted signal data_err_ctr from can_core.vhd                           |
| can_bus.[`can_core_pc_tx_trigger`](#can_core_pc_tx_trigger)                                                   | 0x2b8    |        4 | Auto-extracted signal pc_tx_trigger from can_core.vhd                          |
| can_bus.[`can_core_pc_rx_trigger`](#can_core_pc_rx_trigger)                                                   | 0x2bc    |        4 | Auto-extracted signal pc_rx_trigger from can_core.vhd                          |
| can_bus.[`can_core_pc_tx_data_nbs`](#can_core_pc_tx_data_nbs)                                                 | 0x2c0    |        4 | Auto-extracted signal pc_tx_data_nbs from can_core.vhd                         |
| can_bus.[`can_core_pc_rx_data_nbs`](#can_core_pc_rx_data_nbs)                                                 | 0x2c4    |        4 | Auto-extracted signal pc_rx_data_nbs from can_core.vhd                         |
| can_bus.[`can_core_crc_data_tx_wbs`](#can_core_crc_data_tx_wbs)                                               | 0x2c8    |        4 | Auto-extracted signal crc_data_tx_wbs from can_core.vhd                        |
| can_bus.[`can_core_crc_data_tx_nbs`](#can_core_crc_data_tx_nbs)                                               | 0x2cc    |        4 | Auto-extracted signal crc_data_tx_nbs from can_core.vhd                        |
| can_bus.[`can_core_crc_data_rx_wbs`](#can_core_crc_data_rx_wbs)                                               | 0x2d0    |        4 | Auto-extracted signal crc_data_rx_wbs from can_core.vhd                        |
| can_bus.[`can_core_crc_data_rx_nbs`](#can_core_crc_data_rx_nbs)                                               | 0x2d4    |        4 | Auto-extracted signal crc_data_rx_nbs from can_core.vhd                        |
| can_bus.[`can_core_crc_trig_tx_wbs`](#can_core_crc_trig_tx_wbs)                                               | 0x2d8    |        4 | Auto-extracted signal crc_trig_tx_wbs from can_core.vhd                        |
| can_bus.[`can_core_crc_trig_tx_nbs`](#can_core_crc_trig_tx_nbs)                                               | 0x2dc    |        4 | Auto-extracted signal crc_trig_tx_nbs from can_core.vhd                        |
| can_bus.[`can_core_crc_trig_rx_wbs`](#can_core_crc_trig_rx_wbs)                                               | 0x2e0    |        4 | Auto-extracted signal crc_trig_rx_wbs from can_core.vhd                        |
| can_bus.[`can_core_crc_trig_rx_nbs`](#can_core_crc_trig_rx_nbs)                                               | 0x2e4    |        4 | Auto-extracted signal crc_trig_rx_nbs from can_core.vhd                        |
| can_bus.[`can_core_bst_data_in`](#can_core_bst_data_in)                                                       | 0x2e8    |        4 | Auto-extracted signal bst_data_in from can_core.vhd                            |
| can_bus.[`can_core_bst_data_out`](#can_core_bst_data_out)                                                     | 0x2ec    |        4 | Auto-extracted signal bst_data_out from can_core.vhd                           |
| can_bus.[`can_core_bst_trigger`](#can_core_bst_trigger)                                                       | 0x2f0    |        4 | Auto-extracted signal bst_trigger from can_core.vhd                            |
| can_bus.[`can_core_data_halt`](#can_core_data_halt)                                                           | 0x2f4    |        4 | Auto-extracted signal data_halt from can_core.vhd                              |
| can_bus.[`can_core_bds_data_in`](#can_core_bds_data_in)                                                       | 0x2f8    |        4 | Auto-extracted signal bds_data_in from can_core.vhd                            |
| can_bus.[`can_core_bds_data_out`](#can_core_bds_data_out)                                                     | 0x2fc    |        4 | Auto-extracted signal bds_data_out from can_core.vhd                           |
| can_bus.[`can_core_bds_trigger`](#can_core_bds_trigger)                                                       | 0x300    |        4 | Auto-extracted signal bds_trigger from can_core.vhd                            |
| can_bus.[`can_core_destuffed`](#can_core_destuffed)                                                           | 0x304    |        4 | Auto-extracted signal destuffed from can_core.vhd                              |
| can_bus.[`can_core_tx_ctr`](#can_core_tx_ctr)                                                                 | 0x308    |        4 | Auto-extracted signal tx_ctr from can_core.vhd                                 |
| can_bus.[`can_core_rx_ctr`](#can_core_rx_ctr)                                                                 | 0x30c    |        4 | Auto-extracted signal rx_ctr from can_core.vhd                                 |
| can_bus.[`can_core_tx_data_wbs_i`](#can_core_tx_data_wbs_i)                                                   | 0x310    |        4 | Auto-extracted signal tx_data_wbs_i from can_core.vhd                          |
| can_bus.[`can_core_lpb_dominant`](#can_core_lpb_dominant)                                                     | 0x314    |        4 | Auto-extracted signal lpb_dominant from can_core.vhd                           |
| can_bus.[`can_core_form_err`](#can_core_form_err)                                                             | 0x318    |        4 | Auto-extracted signal form_err from can_core.vhd                               |
| can_bus.[`can_core_ack_err`](#can_core_ack_err)                                                               | 0x31c    |        4 | Auto-extracted signal ack_err from can_core.vhd                                |
| can_bus.[`can_core_crc_err`](#can_core_crc_err)                                                               | 0x320    |        4 | Auto-extracted signal crc_err from can_core.vhd                                |
| can_bus.[`can_core_is_arbitration`](#can_core_is_arbitration)                                                 | 0x324    |        4 | Auto-extracted signal is_arbitration from can_core.vhd                         |
| can_bus.[`can_core_is_control`](#can_core_is_control)                                                         | 0x328    |        4 | Auto-extracted signal is_control from can_core.vhd                             |
| can_bus.[`can_core_is_data`](#can_core_is_data)                                                               | 0x32c    |        4 | Auto-extracted signal is_data from can_core.vhd                                |
| can_bus.[`can_core_is_stuff_count`](#can_core_is_stuff_count)                                                 | 0x330    |        4 | Auto-extracted signal is_stuff_count from can_core.vhd                         |
| can_bus.[`can_core_is_crc`](#can_core_is_crc)                                                                 | 0x334    |        4 | Auto-extracted signal is_crc from can_core.vhd                                 |
| can_bus.[`can_core_is_crc_delim`](#can_core_is_crc_delim)                                                     | 0x338    |        4 | Auto-extracted signal is_crc_delim from can_core.vhd                           |
| can_bus.[`can_core_is_ack_field`](#can_core_is_ack_field)                                                     | 0x33c    |        4 | Auto-extracted signal is_ack_field from can_core.vhd                           |
| can_bus.[`can_core_is_ack_delim`](#can_core_is_ack_delim)                                                     | 0x340    |        4 | Auto-extracted signal is_ack_delim from can_core.vhd                           |
| can_bus.[`can_core_is_eof`](#can_core_is_eof)                                                                 | 0x344    |        4 | Auto-extracted signal is_eof from can_core.vhd                                 |
| can_bus.[`can_core_is_err_frm`](#can_core_is_err_frm)                                                         | 0x348    |        4 | Auto-extracted signal is_err_frm from can_core.vhd                             |
| can_bus.[`can_core_is_intermission`](#can_core_is_intermission)                                               | 0x34c    |        4 | Auto-extracted signal is_intermission from can_core.vhd                        |
| can_bus.[`can_core_is_suspend`](#can_core_is_suspend)                                                         | 0x350    |        4 | Auto-extracted signal is_suspend from can_core.vhd                             |
| can_bus.[`can_core_is_overload_i`](#can_core_is_overload_i)                                                   | 0x354    |        4 | Auto-extracted signal is_overload_i from can_core.vhd                          |
| can_bus.[`can_core_is_sof`](#can_core_is_sof)                                                                 | 0x358    |        4 | Auto-extracted signal is_sof from can_core.vhd                                 |
| can_bus.[`can_core_sof_pulse_i`](#can_core_sof_pulse_i)                                                       | 0x35c    |        4 | Auto-extracted signal sof_pulse_i from can_core.vhd                            |
| can_bus.[`can_core_load_init_vect`](#can_core_load_init_vect)                                                 | 0x360    |        4 | Auto-extracted signal load_init_vect from can_core.vhd                         |
| can_bus.[`can_core_retr_ctr_i`](#can_core_retr_ctr_i)                                                         | 0x364    |        4 | Auto-extracted signal retr_ctr_i from can_core.vhd                             |
| can_bus.[`can_core_decrement_rec`](#can_core_decrement_rec)                                                   | 0x368    |        4 | Auto-extracted signal decrement_rec from can_core.vhd                          |
| can_bus.[`can_core_bit_err_after_ack_err`](#can_core_bit_err_after_ack_err)                                   | 0x36c    |        4 | Auto-extracted signal bit_err_after_ack_err from can_core.vhd                  |
| can_bus.[`can_core_is_pexs`](#can_core_is_pexs)                                                               | 0x370    |        4 | Auto-extracted signal is_pexs from can_core.vhd                                |
| can_bus.[`can_crc_drv_fd_type`](#can_crc_drv_fd_type)                                                         | 0x374    |        4 | Auto-extracted signal drv_fd_type from can_crc.vhd                             |
| can_bus.[`can_crc_init_vect_15`](#can_crc_init_vect_15)                                                       | 0x378    |        4 | Auto-extracted signal init_vect_15 from can_crc.vhd                            |
| can_bus.[`can_crc_init_vect_17`](#can_crc_init_vect_17)                                                       | 0x37c    |        4 | Auto-extracted signal init_vect_17 from can_crc.vhd                            |
| can_bus.[`can_crc_init_vect_21`](#can_crc_init_vect_21)                                                       | 0x380    |        4 | Auto-extracted signal init_vect_21 from can_crc.vhd                            |
| can_bus.[`can_crc_crc_17_21_data_in`](#can_crc_crc_17_21_data_in)                                             | 0x384    |        4 | Auto-extracted signal crc_17_21_data_in from can_crc.vhd                       |
| can_bus.[`can_crc_crc_17_21_trigger`](#can_crc_crc_17_21_trigger)                                             | 0x388    |        4 | Auto-extracted signal crc_17_21_trigger from can_crc.vhd                       |
| can_bus.[`can_crc_crc_15_data_in`](#can_crc_crc_15_data_in)                                                   | 0x38c    |        4 | Auto-extracted signal crc_15_data_in from can_crc.vhd                          |
| can_bus.[`can_crc_crc_15_trigger`](#can_crc_crc_15_trigger)                                                   | 0x390    |        4 | Auto-extracted signal crc_15_trigger from can_crc.vhd                          |
| can_bus.[`can_crc_crc_ena_15`](#can_crc_crc_ena_15)                                                           | 0x394    |        4 | Auto-extracted signal crc_ena_15 from can_crc.vhd                              |
| can_bus.[`can_crc_crc_ena_17_21`](#can_crc_crc_ena_17_21)                                                     | 0x398    |        4 | Auto-extracted signal crc_ena_17_21 from can_crc.vhd                           |
| can_bus.[`can_top_ahb_ctu_can_data_in`](#can_top_ahb_ctu_can_data_in)                                         | 0x39c    |        4 | Auto-extracted signal ctu_can_data_in from can_top_ahb.vhd                     |
| can_bus.[`can_top_ahb_ctu_can_data_out`](#can_top_ahb_ctu_can_data_out)                                       | 0x3a0    |        4 | Auto-extracted signal ctu_can_data_out from can_top_ahb.vhd                    |
| can_bus.[`can_top_ahb_ctu_can_adress`](#can_top_ahb_ctu_can_adress)                                           | 0x3a4    |        4 | Auto-extracted signal ctu_can_adress from can_top_ahb.vhd                      |
| can_bus.[`can_top_ahb_ctu_can_scs`](#can_top_ahb_ctu_can_scs)                                                 | 0x3a8    |        4 | Auto-extracted signal ctu_can_scs from can_top_ahb.vhd                         |
| can_bus.[`can_top_ahb_ctu_can_srd`](#can_top_ahb_ctu_can_srd)                                                 | 0x3ac    |        4 | Auto-extracted signal ctu_can_srd from can_top_ahb.vhd                         |
| can_bus.[`can_top_ahb_ctu_can_swr`](#can_top_ahb_ctu_can_swr)                                                 | 0x3b0    |        4 | Auto-extracted signal ctu_can_swr from can_top_ahb.vhd                         |
| can_bus.[`can_top_ahb_ctu_can_sbe`](#can_top_ahb_ctu_can_sbe)                                                 | 0x3b4    |        4 | Auto-extracted signal ctu_can_sbe from can_top_ahb.vhd                         |
| can_bus.[`can_top_ahb_res_n_out_i`](#can_top_ahb_res_n_out_i)                                                 | 0x3b8    |        4 | Auto-extracted signal res_n_out_i from can_top_ahb.vhd                         |
| can_bus.[`can_top_apb_reg_data_in`](#can_top_apb_reg_data_in)                                                 | 0x3bc    |        4 | Auto-extracted signal reg_data_in from can_top_apb.vhd                         |
| can_bus.[`can_top_apb_reg_data_out`](#can_top_apb_reg_data_out)                                               | 0x3c0    |        4 | Auto-extracted signal reg_data_out from can_top_apb.vhd                        |
| can_bus.[`can_top_apb_reg_addr`](#can_top_apb_reg_addr)                                                       | 0x3c4    |        4 | Auto-extracted signal reg_addr from can_top_apb.vhd                            |
| can_bus.[`can_top_apb_reg_be`](#can_top_apb_reg_be)                                                           | 0x3c8    |        4 | Auto-extracted signal reg_be from can_top_apb.vhd                              |
| can_bus.[`can_top_apb_reg_rden`](#can_top_apb_reg_rden)                                                       | 0x3cc    |        4 | Auto-extracted signal reg_rden from can_top_apb.vhd                            |
| can_bus.[`can_top_apb_reg_wren`](#can_top_apb_reg_wren)                                                       | 0x3d0    |        4 | Auto-extracted signal reg_wren from can_top_apb.vhd                            |
| can_bus.[`can_top_level_drv_bus`](#can_top_level_drv_bus)                                                     | 0x3d4    |        4 | Auto-extracted signal drv_bus from can_top_level.vhd                           |
| can_bus.[`can_top_level_stat_bus`](#can_top_level_stat_bus)                                                   | 0x3d8    |        4 | Auto-extracted signal stat_bus from can_top_level.vhd                          |
| can_bus.[`can_top_level_res_n_sync`](#can_top_level_res_n_sync)                                               | 0x3dc    |        4 | Auto-extracted signal res_n_sync from can_top_level.vhd                        |
| can_bus.[`can_top_level_res_core_n`](#can_top_level_res_core_n)                                               | 0x3e0    |        4 | Auto-extracted signal res_core_n from can_top_level.vhd                        |
| can_bus.[`can_top_level_res_soft_n`](#can_top_level_res_soft_n)                                               | 0x3e4    |        4 | Auto-extracted signal res_soft_n from can_top_level.vhd                        |
| can_bus.[`can_top_level_sp_control`](#can_top_level_sp_control)                                               | 0x3e8    |        4 | Auto-extracted signal sp_control from can_top_level.vhd                        |
| can_bus.[`can_top_level_rx_buf_size`](#can_top_level_rx_buf_size)                                             | 0x3ec    |        4 | Auto-extracted signal rx_buf_size from can_top_level.vhd                       |
| can_bus.[`can_top_level_rx_full`](#can_top_level_rx_full)                                                     | 0x3f0    |        4 | Auto-extracted signal rx_full from can_top_level.vhd                           |
| can_bus.[`can_top_level_rx_empty`](#can_top_level_rx_empty)                                                   | 0x3f4    |        4 | Auto-extracted signal rx_empty from can_top_level.vhd                          |
| can_bus.[`can_top_level_rx_frame_count`](#can_top_level_rx_frame_count)                                       | 0x3f8    |        4 | Auto-extracted signal rx_frame_count from can_top_level.vhd                    |
| can_bus.[`can_top_level_rx_mem_free`](#can_top_level_rx_mem_free)                                             | 0x3fc    |        4 | Auto-extracted signal rx_mem_free from can_top_level.vhd                       |
| can_bus.[`can_top_level_rx_read_pointer`](#can_top_level_rx_read_pointer)                                     | 0x400    |        4 | Auto-extracted signal rx_read_pointer from can_top_level.vhd                   |
| can_bus.[`can_top_level_rx_write_pointer`](#can_top_level_rx_write_pointer)                                   | 0x404    |        4 | Auto-extracted signal rx_write_pointer from can_top_level.vhd                  |
| can_bus.[`can_top_level_rx_data_overrun`](#can_top_level_rx_data_overrun)                                     | 0x408    |        4 | Auto-extracted signal rx_data_overrun from can_top_level.vhd                   |
| can_bus.[`can_top_level_rx_read_buff`](#can_top_level_rx_read_buff)                                           | 0x40c    |        4 | Auto-extracted signal rx_read_buff from can_top_level.vhd                      |
| can_bus.[`can_top_level_rx_mof`](#can_top_level_rx_mof)                                                       | 0x410    |        4 | Auto-extracted signal rx_mof from can_top_level.vhd                            |
| can_bus.[`can_top_level_txtb_port_a_data`](#can_top_level_txtb_port_a_data)                                   | 0x414    |        4 | Auto-extracted signal txtb_port_a_data from can_top_level.vhd                  |
| can_bus.[`can_top_level_txtb_port_a_address`](#can_top_level_txtb_port_a_address)                             | 0x418    |        4 | Auto-extracted signal txtb_port_a_address from can_top_level.vhd               |
| can_bus.[`can_top_level_txtb_port_a_cs`](#can_top_level_txtb_port_a_cs)                                       | 0x41c    |        4 | Auto-extracted signal txtb_port_a_cs from can_top_level.vhd                    |
| can_bus.[`can_top_level_txtb_port_a_be`](#can_top_level_txtb_port_a_be)                                       | 0x420    |        4 | Auto-extracted signal txtb_port_a_be from can_top_level.vhd                    |
| can_bus.[`can_top_level_txtb_sw_cmd_index`](#can_top_level_txtb_sw_cmd_index)                                 | 0x424    |        4 | Auto-extracted signal txtb_sw_cmd_index from can_top_level.vhd                 |
| can_bus.[`can_top_level_txt_buf_failed_bof`](#can_top_level_txt_buf_failed_bof)                               | 0x428    |        4 | Auto-extracted signal txt_buf_failed_bof from can_top_level.vhd                |
| can_bus.[`can_top_level_int_vector`](#can_top_level_int_vector)                                               | 0x42c    |        4 | Auto-extracted signal int_vector from can_top_level.vhd                        |
| can_bus.[`can_top_level_int_ena`](#can_top_level_int_ena)                                                     | 0x430    |        4 | Auto-extracted signal int_ena from can_top_level.vhd                           |
| can_bus.[`can_top_level_int_mask`](#can_top_level_int_mask)                                                   | 0x434    |        4 | Auto-extracted signal int_mask from can_top_level.vhd                          |
| can_bus.[`can_top_level_rec_ident`](#can_top_level_rec_ident)                                                 | 0x438    |        4 | Auto-extracted signal rec_ident from can_top_level.vhd                         |
| can_bus.[`can_top_level_rec_dlc`](#can_top_level_rec_dlc)                                                     | 0x43c    |        4 | Auto-extracted signal rec_dlc from can_top_level.vhd                           |
| can_bus.[`can_top_level_rec_ident_type`](#can_top_level_rec_ident_type)                                       | 0x440    |        4 | Auto-extracted signal rec_ident_type from can_top_level.vhd                    |
| can_bus.[`can_top_level_rec_frame_type`](#can_top_level_rec_frame_type)                                       | 0x444    |        4 | Auto-extracted signal rec_frame_type from can_top_level.vhd                    |
| can_bus.[`can_top_level_rec_is_rtr`](#can_top_level_rec_is_rtr)                                               | 0x448    |        4 | Auto-extracted signal rec_is_rtr from can_top_level.vhd                        |
| can_bus.[`can_top_level_rec_brs`](#can_top_level_rec_brs)                                                     | 0x44c    |        4 | Auto-extracted signal rec_brs from can_top_level.vhd                           |
| can_bus.[`can_top_level_rec_esi`](#can_top_level_rec_esi)                                                     | 0x450    |        4 | Auto-extracted signal rec_esi from can_top_level.vhd                           |
| can_bus.[`can_top_level_store_data_word`](#can_top_level_store_data_word)                                     | 0x454    |        4 | Auto-extracted signal store_data_word from can_top_level.vhd                   |
| can_bus.[`can_top_level_sof_pulse`](#can_top_level_sof_pulse)                                                 | 0x458    |        4 | Auto-extracted signal sof_pulse from can_top_level.vhd                         |
| can_bus.[`can_top_level_store_metadata`](#can_top_level_store_metadata)                                       | 0x45c    |        4 | Auto-extracted signal store_metadata from can_top_level.vhd                    |
| can_bus.[`can_top_level_store_data`](#can_top_level_store_data)                                               | 0x460    |        4 | Auto-extracted signal store_data from can_top_level.vhd                        |
| can_bus.[`can_top_level_rec_valid`](#can_top_level_rec_valid)                                                 | 0x464    |        4 | Auto-extracted signal rec_valid from can_top_level.vhd                         |
| can_bus.[`can_top_level_rec_abort`](#can_top_level_rec_abort)                                                 | 0x468    |        4 | Auto-extracted signal rec_abort from can_top_level.vhd                         |
| can_bus.[`can_top_level_store_metadata_f`](#can_top_level_store_metadata_f)                                   | 0x46c    |        4 | Auto-extracted signal store_metadata_f from can_top_level.vhd                  |
| can_bus.[`can_top_level_store_data_f`](#can_top_level_store_data_f)                                           | 0x470    |        4 | Auto-extracted signal store_data_f from can_top_level.vhd                      |
| can_bus.[`can_top_level_rec_valid_f`](#can_top_level_rec_valid_f)                                             | 0x474    |        4 | Auto-extracted signal rec_valid_f from can_top_level.vhd                       |
| can_bus.[`can_top_level_rec_abort_f`](#can_top_level_rec_abort_f)                                             | 0x478    |        4 | Auto-extracted signal rec_abort_f from can_top_level.vhd                       |
| can_bus.[`can_top_level_txtb_hw_cmd_int`](#can_top_level_txtb_hw_cmd_int)                                     | 0x47c    |        4 | Auto-extracted signal txtb_hw_cmd_int from can_top_level.vhd                   |
| can_bus.[`can_top_level_is_bus_off`](#can_top_level_is_bus_off)                                               | 0x480    |        4 | Auto-extracted signal is_bus_off from can_top_level.vhd                        |
| can_bus.[`can_top_level_txtb_available`](#can_top_level_txtb_available)                                       | 0x484    |        4 | Auto-extracted signal txtb_available from can_top_level.vhd                    |
| can_bus.[`can_top_level_txtb_port_b_clk_en`](#can_top_level_txtb_port_b_clk_en)                               | 0x488    |        4 | Auto-extracted signal txtb_port_b_clk_en from can_top_level.vhd                |
| can_bus.[`can_top_level_tran_dlc`](#can_top_level_tran_dlc)                                                   | 0x48c    |        4 | Auto-extracted signal tran_dlc from can_top_level.vhd                          |
| can_bus.[`can_top_level_tran_is_rtr`](#can_top_level_tran_is_rtr)                                             | 0x490    |        4 | Auto-extracted signal tran_is_rtr from can_top_level.vhd                       |
| can_bus.[`can_top_level_tran_ident_type`](#can_top_level_tran_ident_type)                                     | 0x494    |        4 | Auto-extracted signal tran_ident_type from can_top_level.vhd                   |
| can_bus.[`can_top_level_tran_frame_type`](#can_top_level_tran_frame_type)                                     | 0x498    |        4 | Auto-extracted signal tran_frame_type from can_top_level.vhd                   |
| can_bus.[`can_top_level_tran_brs`](#can_top_level_tran_brs)                                                   | 0x49c    |        4 | Auto-extracted signal tran_brs from can_top_level.vhd                          |
| can_bus.[`can_top_level_tran_identifier`](#can_top_level_tran_identifier)                                     | 0x4a0    |        4 | Auto-extracted signal tran_identifier from can_top_level.vhd                   |
| can_bus.[`can_top_level_tran_word`](#can_top_level_tran_word)                                                 | 0x4a4    |        4 | Auto-extracted signal tran_word from can_top_level.vhd                         |
| can_bus.[`can_top_level_tran_frame_valid`](#can_top_level_tran_frame_valid)                                   | 0x4a8    |        4 | Auto-extracted signal tran_frame_valid from can_top_level.vhd                  |
| can_bus.[`can_top_level_txtb_changed`](#can_top_level_txtb_changed)                                           | 0x4ac    |        4 | Auto-extracted signal txtb_changed from can_top_level.vhd                      |
| can_bus.[`can_top_level_txtb_clk_en`](#can_top_level_txtb_clk_en)                                             | 0x4b0    |        4 | Auto-extracted signal txtb_clk_en from can_top_level.vhd                       |
| can_bus.[`can_top_level_err_detected`](#can_top_level_err_detected)                                           | 0x4b4    |        4 | Auto-extracted signal err_detected from can_top_level.vhd                      |
| can_bus.[`can_top_level_fcs_changed`](#can_top_level_fcs_changed)                                             | 0x4b8    |        4 | Auto-extracted signal fcs_changed from can_top_level.vhd                       |
| can_bus.[`can_top_level_err_warning_limit`](#can_top_level_err_warning_limit)                                 | 0x4bc    |        4 | Auto-extracted signal err_warning_limit from can_top_level.vhd                 |
| can_bus.[`can_top_level_arbitration_lost`](#can_top_level_arbitration_lost)                                   | 0x4c0    |        4 | Auto-extracted signal arbitration_lost from can_top_level.vhd                  |
| can_bus.[`can_top_level_tran_valid`](#can_top_level_tran_valid)                                               | 0x4c4    |        4 | Auto-extracted signal tran_valid from can_top_level.vhd                        |
| can_bus.[`can_top_level_br_shifted`](#can_top_level_br_shifted)                                               | 0x4c8    |        4 | Auto-extracted signal br_shifted from can_top_level.vhd                        |
| can_bus.[`can_top_level_is_overload`](#can_top_level_is_overload)                                             | 0x4cc    |        4 | Auto-extracted signal is_overload from can_top_level.vhd                       |
| can_bus.[`can_top_level_rx_triggers`](#can_top_level_rx_triggers)                                             | 0x4d0    |        4 | Auto-extracted signal rx_triggers from can_top_level.vhd                       |
| can_bus.[`can_top_level_tx_trigger`](#can_top_level_tx_trigger)                                               | 0x4d4    |        4 | Auto-extracted signal tx_trigger from can_top_level.vhd                        |
| can_bus.[`can_top_level_sync_control`](#can_top_level_sync_control)                                           | 0x4d8    |        4 | Auto-extracted signal sync_control from can_top_level.vhd                      |
| can_bus.[`can_top_level_no_pos_resync`](#can_top_level_no_pos_resync)                                         | 0x4dc    |        4 | Auto-extracted signal no_pos_resync from can_top_level.vhd                     |
| can_bus.[`can_top_level_nbt_ctrs_en`](#can_top_level_nbt_ctrs_en)                                             | 0x4e0    |        4 | Auto-extracted signal nbt_ctrs_en from can_top_level.vhd                       |
| can_bus.[`can_top_level_dbt_ctrs_en`](#can_top_level_dbt_ctrs_en)                                             | 0x4e4    |        4 | Auto-extracted signal dbt_ctrs_en from can_top_level.vhd                       |
| can_bus.[`can_top_level_trv_delay`](#can_top_level_trv_delay)                                                 | 0x4e8    |        4 | Auto-extracted signal trv_delay from can_top_level.vhd                         |
| can_bus.[`can_top_level_rx_data_wbs`](#can_top_level_rx_data_wbs)                                             | 0x4ec    |        4 | Auto-extracted signal rx_data_wbs from can_top_level.vhd                       |
| can_bus.[`can_top_level_tx_data_wbs`](#can_top_level_tx_data_wbs)                                             | 0x4f0    |        4 | Auto-extracted signal tx_data_wbs from can_top_level.vhd                       |
| can_bus.[`can_top_level_ssp_reset`](#can_top_level_ssp_reset)                                                 | 0x4f4    |        4 | Auto-extracted signal ssp_reset from can_top_level.vhd                         |
| can_bus.[`can_top_level_tran_delay_meas`](#can_top_level_tran_delay_meas)                                     | 0x4f8    |        4 | Auto-extracted signal tran_delay_meas from can_top_level.vhd                   |
| can_bus.[`can_top_level_bit_err`](#can_top_level_bit_err)                                                     | 0x4fc    |        4 | Auto-extracted signal bit_err from can_top_level.vhd                           |
| can_bus.[`can_top_level_sample_sec`](#can_top_level_sample_sec)                                               | 0x500    |        4 | Auto-extracted signal sample_sec from can_top_level.vhd                        |
| can_bus.[`can_top_level_btmc_reset`](#can_top_level_btmc_reset)                                               | 0x504    |        4 | Auto-extracted signal btmc_reset from can_top_level.vhd                        |
| can_bus.[`can_top_level_dbt_measure_start`](#can_top_level_dbt_measure_start)                                 | 0x508    |        4 | Auto-extracted signal dbt_measure_start from can_top_level.vhd                 |
| can_bus.[`can_top_level_gen_first_ssp`](#can_top_level_gen_first_ssp)                                         | 0x50c    |        4 | Auto-extracted signal gen_first_ssp from can_top_level.vhd                     |
| can_bus.[`can_top_level_sync_edge`](#can_top_level_sync_edge)                                                 | 0x510    |        4 | Auto-extracted signal sync_edge from can_top_level.vhd                         |
| can_bus.[`can_top_level_tq_edge`](#can_top_level_tq_edge)                                                     | 0x514    |        4 | Auto-extracted signal tq_edge from can_top_level.vhd                           |
| can_bus.[`can_top_level_tst_rdata_rx_buf`](#can_top_level_tst_rdata_rx_buf)                                   | 0x518    |        4 | Auto-extracted signal tst_rdata_rx_buf from can_top_level.vhd                  |
| can_bus.[`clk_gate_clk_en_q`](#clk_gate_clk_en_q)                                                             | 0x51c    |        4 | Auto-extracted signal clk_en_q from clk_gate.vhd                               |
| can_bus.[`control_counter_ctrl_ctr_ce`](#control_counter_ctrl_ctr_ce)                                         | 0x520    |        4 | Auto-extracted signal ctrl_ctr_ce from control_counter.vhd                     |
| can_bus.[`control_counter_compl_ctr_ce`](#control_counter_compl_ctr_ce)                                       | 0x524    |        4 | Auto-extracted signal compl_ctr_ce from control_counter.vhd                    |
| can_bus.[`control_registers_reg_map_reg_sel`](#control_registers_reg_map_reg_sel)                             | 0x528    |        4 | Auto-extracted signal reg_sel from control_registers_reg_map.vhd               |
| can_bus.[`control_registers_reg_map_read_data_mux_in`](#control_registers_reg_map_read_data_mux_in)           | 0x52c    |        4 | Auto-extracted signal read_data_mux_in from control_registers_reg_map.vhd      |
| can_bus.[`control_registers_reg_map_read_data_mask_n`](#control_registers_reg_map_read_data_mask_n)           | 0x530    |        4 | Auto-extracted signal read_data_mask_n from control_registers_reg_map.vhd      |
| can_bus.[`control_registers_reg_map_read_mux_ena`](#control_registers_reg_map_read_mux_ena)                   | 0x534    |        4 | Auto-extracted signal read_mux_ena from control_registers_reg_map.vhd          |
| can_bus.[`crc_calc_crc_q`](#crc_calc_crc_q)                                                                   | 0x538    |        4 | Auto-extracted signal crc_q from crc_calc.vhd                                  |
| can_bus.[`crc_calc_crc_nxt`](#crc_calc_crc_nxt)                                                               | 0x53c    |        4 | Auto-extracted signal crc_nxt from crc_calc.vhd                                |
| can_bus.[`crc_calc_crc_shift`](#crc_calc_crc_shift)                                                           | 0x540    |        4 | Auto-extracted signal crc_shift from crc_calc.vhd                              |
| can_bus.[`crc_calc_crc_shift_n_xor`](#crc_calc_crc_shift_n_xor)                                               | 0x544    |        4 | Auto-extracted signal crc_shift_n_xor from crc_calc.vhd                        |
| can_bus.[`crc_calc_crc_d`](#crc_calc_crc_d)                                                                   | 0x548    |        4 | Auto-extracted signal crc_d from crc_calc.vhd                                  |
| can_bus.[`crc_calc_crc_ce`](#crc_calc_crc_ce)                                                                 | 0x54c    |        4 | Auto-extracted signal crc_ce from crc_calc.vhd                                 |
| can_bus.[`data_edge_detector_rx_data_prev`](#data_edge_detector_rx_data_prev)                                 | 0x550    |        4 | Auto-extracted signal rx_data_prev from data_edge_detector.vhd                 |
| can_bus.[`data_edge_detector_tx_data_prev`](#data_edge_detector_tx_data_prev)                                 | 0x554    |        4 | Auto-extracted signal tx_data_prev from data_edge_detector.vhd                 |
| can_bus.[`data_edge_detector_rx_data_sync_prev`](#data_edge_detector_rx_data_sync_prev)                       | 0x558    |        4 | Auto-extracted signal rx_data_sync_prev from data_edge_detector.vhd            |
| can_bus.[`data_edge_detector_rx_edge_i`](#data_edge_detector_rx_edge_i)                                       | 0x55c    |        4 | Auto-extracted signal rx_edge_i from data_edge_detector.vhd                    |
| can_bus.[`data_edge_detector_tx_edge_i`](#data_edge_detector_tx_edge_i)                                       | 0x560    |        4 | Auto-extracted signal tx_edge_i from data_edge_detector.vhd                    |
| can_bus.[`data_mux_sel_data`](#data_mux_sel_data)                                                             | 0x564    |        4 | Auto-extracted signal sel_data from data_mux.vhd                               |
| can_bus.[`data_mux_saturated_data`](#data_mux_saturated_data)                                                 | 0x568    |        4 | Auto-extracted signal saturated_data from data_mux.vhd                         |
| can_bus.[`data_mux_masked_data`](#data_mux_masked_data)                                                       | 0x56c    |        4 | Auto-extracted signal masked_data from data_mux.vhd                            |
| can_bus.[`dlc_decoder_data_len_8_to_64`](#dlc_decoder_data_len_8_to_64)                                       | 0x570    |        4 | Auto-extracted signal data_len_8_to_64 from dlc_decoder.vhd                    |
| can_bus.[`dlc_decoder_data_len_can_2_0`](#dlc_decoder_data_len_can_2_0)                                       | 0x574    |        4 | Auto-extracted signal data_len_can_2_0 from dlc_decoder.vhd                    |
| can_bus.[`dlc_decoder_data_len_can_fd`](#dlc_decoder_data_len_can_fd)                                         | 0x578    |        4 | Auto-extracted signal data_len_can_fd from dlc_decoder.vhd                     |
| can_bus.[`endian_swapper_swapped`](#endian_swapper_swapped)                                                   | 0x57c    |        4 | Auto-extracted signal swapped from endian_swapper.vhd                          |
| can_bus.[`err_counters_tx_err_ctr_ce`](#err_counters_tx_err_ctr_ce)                                           | 0x580    |        4 | Auto-extracted signal tx_err_ctr_ce from err_counters.vhd                      |
| can_bus.[`err_counters_rx_err_ctr_ce`](#err_counters_rx_err_ctr_ce)                                           | 0x584    |        4 | Auto-extracted signal rx_err_ctr_ce from err_counters.vhd                      |
| can_bus.[`err_counters_modif_tx_ctr`](#err_counters_modif_tx_ctr)                                             | 0x588    |        4 | Auto-extracted signal modif_tx_ctr from err_counters.vhd                       |
| can_bus.[`err_counters_modif_rx_ctr`](#err_counters_modif_rx_ctr)                                             | 0x58c    |        4 | Auto-extracted signal modif_rx_ctr from err_counters.vhd                       |
| can_bus.[`err_counters_nom_err_ctr_ce`](#err_counters_nom_err_ctr_ce)                                         | 0x590    |        4 | Auto-extracted signal nom_err_ctr_ce from err_counters.vhd                     |
| can_bus.[`err_counters_data_err_ctr_ce`](#err_counters_data_err_ctr_ce)                                       | 0x594    |        4 | Auto-extracted signal data_err_ctr_ce from err_counters.vhd                    |
| can_bus.[`err_counters_res_err_ctrs_d`](#err_counters_res_err_ctrs_d)                                         | 0x598    |        4 | Auto-extracted signal res_err_ctrs_d from err_counters.vhd                     |
| can_bus.[`err_counters_res_err_ctrs_q`](#err_counters_res_err_ctrs_q)                                         | 0x59c    |        4 | Auto-extracted signal res_err_ctrs_q from err_counters.vhd                     |
| can_bus.[`err_counters_res_err_ctrs_q_scan`](#err_counters_res_err_ctrs_q_scan)                               | 0x5a0    |        4 | Auto-extracted signal res_err_ctrs_q_scan from err_counters.vhd                |
| can_bus.[`err_detector_err_frm_req_i`](#err_detector_err_frm_req_i)                                           | 0x5a4    |        4 | Auto-extracted signal err_frm_req_i from err_detector.vhd                      |
| can_bus.[`err_detector_err_type_d`](#err_detector_err_type_d)                                                 | 0x5a8    |        4 | Auto-extracted signal err_type_d from err_detector.vhd                         |
| can_bus.[`err_detector_err_type_q`](#err_detector_err_type_q)                                                 | 0x5ac    |        4 | Auto-extracted signal err_type_q from err_detector.vhd                         |
| can_bus.[`err_detector_err_pos_q`](#err_detector_err_pos_q)                                                   | 0x5b0    |        4 | Auto-extracted signal err_pos_q from err_detector.vhd                          |
| can_bus.[`err_detector_form_err_i`](#err_detector_form_err_i)                                                 | 0x5b4    |        4 | Auto-extracted signal form_err_i from err_detector.vhd                         |
| can_bus.[`err_detector_crc_match_c`](#err_detector_crc_match_c)                                               | 0x5b8    |        4 | Auto-extracted signal crc_match_c from err_detector.vhd                        |
| can_bus.[`err_detector_crc_match_d`](#err_detector_crc_match_d)                                               | 0x5bc    |        4 | Auto-extracted signal crc_match_d from err_detector.vhd                        |
| can_bus.[`err_detector_crc_match_q`](#err_detector_crc_match_q)                                               | 0x5c0    |        4 | Auto-extracted signal crc_match_q from err_detector.vhd                        |
| can_bus.[`err_detector_dst_ctr_grey`](#err_detector_dst_ctr_grey)                                             | 0x5c4    |        4 | Auto-extracted signal dst_ctr_grey from err_detector.vhd                       |
| can_bus.[`err_detector_dst_parity`](#err_detector_dst_parity)                                                 | 0x5c8    |        4 | Auto-extracted signal dst_parity from err_detector.vhd                         |
| can_bus.[`err_detector_stuff_count_check`](#err_detector_stuff_count_check)                                   | 0x5cc    |        4 | Auto-extracted signal stuff_count_check from err_detector.vhd                  |
| can_bus.[`err_detector_crc_15_ok`](#err_detector_crc_15_ok)                                                   | 0x5d0    |        4 | Auto-extracted signal crc_15_ok from err_detector.vhd                          |
| can_bus.[`err_detector_crc_17_ok`](#err_detector_crc_17_ok)                                                   | 0x5d4    |        4 | Auto-extracted signal crc_17_ok from err_detector.vhd                          |
| can_bus.[`err_detector_crc_21_ok`](#err_detector_crc_21_ok)                                                   | 0x5d8    |        4 | Auto-extracted signal crc_21_ok from err_detector.vhd                          |
| can_bus.[`err_detector_stuff_count_ok`](#err_detector_stuff_count_ok)                                         | 0x5dc    |        4 | Auto-extracted signal stuff_count_ok from err_detector.vhd                     |
| can_bus.[`err_detector_rx_crc_15`](#err_detector_rx_crc_15)                                                   | 0x5e0    |        4 | Auto-extracted signal rx_crc_15 from err_detector.vhd                          |
| can_bus.[`err_detector_rx_crc_17`](#err_detector_rx_crc_17)                                                   | 0x5e4    |        4 | Auto-extracted signal rx_crc_17 from err_detector.vhd                          |
| can_bus.[`err_detector_rx_crc_21`](#err_detector_rx_crc_21)                                                   | 0x5e8    |        4 | Auto-extracted signal rx_crc_21 from err_detector.vhd                          |
| can_bus.[`fault_confinement_drv_ewl`](#fault_confinement_drv_ewl)                                             | 0x5ec    |        4 | Auto-extracted signal drv_ewl from fault_confinement.vhd                       |
| can_bus.[`fault_confinement_drv_erp`](#fault_confinement_drv_erp)                                             | 0x5f0    |        4 | Auto-extracted signal drv_erp from fault_confinement.vhd                       |
| can_bus.[`fault_confinement_drv_ctr_val`](#fault_confinement_drv_ctr_val)                                     | 0x5f4    |        4 | Auto-extracted signal drv_ctr_val from fault_confinement.vhd                   |
| can_bus.[`fault_confinement_drv_ctr_sel`](#fault_confinement_drv_ctr_sel)                                     | 0x5f8    |        4 | Auto-extracted signal drv_ctr_sel from fault_confinement.vhd                   |
| can_bus.[`fault_confinement_drv_ena`](#fault_confinement_drv_ena)                                             | 0x5fc    |        4 | Auto-extracted signal drv_ena from fault_confinement.vhd                       |
| can_bus.[`fault_confinement_tx_err_ctr_i`](#fault_confinement_tx_err_ctr_i)                                   | 0x600    |        4 | Auto-extracted signal tx_err_ctr_i from fault_confinement.vhd                  |
| can_bus.[`fault_confinement_rx_err_ctr_i`](#fault_confinement_rx_err_ctr_i)                                   | 0x604    |        4 | Auto-extracted signal rx_err_ctr_i from fault_confinement.vhd                  |
| can_bus.[`fault_confinement_inc_one`](#fault_confinement_inc_one)                                             | 0x608    |        4 | Auto-extracted signal inc_one from fault_confinement.vhd                       |
| can_bus.[`fault_confinement_inc_eight`](#fault_confinement_inc_eight)                                         | 0x60c    |        4 | Auto-extracted signal inc_eight from fault_confinement.vhd                     |
| can_bus.[`fault_confinement_dec_one`](#fault_confinement_dec_one)                                             | 0x610    |        4 | Auto-extracted signal dec_one from fault_confinement.vhd                       |
| can_bus.[`fault_confinement_drv_rom_ena`](#fault_confinement_drv_rom_ena)                                     | 0x614    |        4 | Auto-extracted signal drv_rom_ena from fault_confinement.vhd                   |
| can_bus.[`fault_confinement_fsm_tx_err_ctr_mt_erp`](#fault_confinement_fsm_tx_err_ctr_mt_erp)                 | 0x618    |        4 | Auto-extracted signal tx_err_ctr_mt_erp from fault_confinement_fsm.vhd         |
| can_bus.[`fault_confinement_fsm_rx_err_ctr_mt_erp`](#fault_confinement_fsm_rx_err_ctr_mt_erp)                 | 0x61c    |        4 | Auto-extracted signal rx_err_ctr_mt_erp from fault_confinement_fsm.vhd         |
| can_bus.[`fault_confinement_fsm_tx_err_ctr_mt_ewl`](#fault_confinement_fsm_tx_err_ctr_mt_ewl)                 | 0x620    |        4 | Auto-extracted signal tx_err_ctr_mt_ewl from fault_confinement_fsm.vhd         |
| can_bus.[`fault_confinement_fsm_rx_err_ctr_mt_ewl`](#fault_confinement_fsm_rx_err_ctr_mt_ewl)                 | 0x624    |        4 | Auto-extracted signal rx_err_ctr_mt_ewl from fault_confinement_fsm.vhd         |
| can_bus.[`fault_confinement_fsm_tx_err_ctr_mt_255`](#fault_confinement_fsm_tx_err_ctr_mt_255)                 | 0x628    |        4 | Auto-extracted signal tx_err_ctr_mt_255 from fault_confinement_fsm.vhd         |
| can_bus.[`fault_confinement_fsm_err_warning_limit_d`](#fault_confinement_fsm_err_warning_limit_d)             | 0x62c    |        4 | Auto-extracted signal err_warning_limit_d from fault_confinement_fsm.vhd       |
| can_bus.[`fault_confinement_fsm_err_warning_limit_q`](#fault_confinement_fsm_err_warning_limit_q)             | 0x630    |        4 | Auto-extracted signal err_warning_limit_q from fault_confinement_fsm.vhd       |
| can_bus.[`fault_confinement_fsm_fc_fsm_res_d`](#fault_confinement_fsm_fc_fsm_res_d)                           | 0x634    |        4 | Auto-extracted signal fc_fsm_res_d from fault_confinement_fsm.vhd              |
| can_bus.[`fault_confinement_fsm_fc_fsm_res_q`](#fault_confinement_fsm_fc_fsm_res_q)                           | 0x638    |        4 | Auto-extracted signal fc_fsm_res_q from fault_confinement_fsm.vhd              |
| can_bus.[`fault_confinement_rules_inc_one_i`](#fault_confinement_rules_inc_one_i)                             | 0x63c    |        4 | Auto-extracted signal inc_one_i from fault_confinement_rules.vhd               |
| can_bus.[`fault_confinement_rules_inc_eight_i`](#fault_confinement_rules_inc_eight_i)                         | 0x640    |        4 | Auto-extracted signal inc_eight_i from fault_confinement_rules.vhd             |
| can_bus.[`frame_filters_drv_filter_A_mask`](#frame_filters_drv_filter_a_mask)                                 | 0x644    |        4 | Auto-extracted signal drv_filter_A_mask from frame_filters.vhd                 |
| can_bus.[`frame_filters_drv_filter_A_ctrl`](#frame_filters_drv_filter_a_ctrl)                                 | 0x648    |        4 | Auto-extracted signal drv_filter_A_ctrl from frame_filters.vhd                 |
| can_bus.[`frame_filters_drv_filter_A_bits`](#frame_filters_drv_filter_a_bits)                                 | 0x64c    |        4 | Auto-extracted signal drv_filter_A_bits from frame_filters.vhd                 |
| can_bus.[`frame_filters_int_filter_A_valid`](#frame_filters_int_filter_a_valid)                               | 0x650    |        4 | Auto-extracted signal int_filter_A_valid from frame_filters.vhd                |
| can_bus.[`frame_filters_drv_filter_B_mask`](#frame_filters_drv_filter_b_mask)                                 | 0x654    |        4 | Auto-extracted signal drv_filter_B_mask from frame_filters.vhd                 |
| can_bus.[`frame_filters_drv_filter_B_ctrl`](#frame_filters_drv_filter_b_ctrl)                                 | 0x658    |        4 | Auto-extracted signal drv_filter_B_ctrl from frame_filters.vhd                 |
| can_bus.[`frame_filters_drv_filter_B_bits`](#frame_filters_drv_filter_b_bits)                                 | 0x65c    |        4 | Auto-extracted signal drv_filter_B_bits from frame_filters.vhd                 |
| can_bus.[`frame_filters_int_filter_B_valid`](#frame_filters_int_filter_b_valid)                               | 0x660    |        4 | Auto-extracted signal int_filter_B_valid from frame_filters.vhd                |
| can_bus.[`frame_filters_drv_filter_C_mask`](#frame_filters_drv_filter_c_mask)                                 | 0x664    |        4 | Auto-extracted signal drv_filter_C_mask from frame_filters.vhd                 |
| can_bus.[`frame_filters_drv_filter_C_ctrl`](#frame_filters_drv_filter_c_ctrl)                                 | 0x668    |        4 | Auto-extracted signal drv_filter_C_ctrl from frame_filters.vhd                 |
| can_bus.[`frame_filters_drv_filter_C_bits`](#frame_filters_drv_filter_c_bits)                                 | 0x66c    |        4 | Auto-extracted signal drv_filter_C_bits from frame_filters.vhd                 |
| can_bus.[`frame_filters_int_filter_C_valid`](#frame_filters_int_filter_c_valid)                               | 0x670    |        4 | Auto-extracted signal int_filter_C_valid from frame_filters.vhd                |
| can_bus.[`frame_filters_drv_filter_ran_ctrl`](#frame_filters_drv_filter_ran_ctrl)                             | 0x674    |        4 | Auto-extracted signal drv_filter_ran_ctrl from frame_filters.vhd               |
| can_bus.[`frame_filters_drv_filter_ran_lo_th`](#frame_filters_drv_filter_ran_lo_th)                           | 0x678    |        4 | Auto-extracted signal drv_filter_ran_lo_th from frame_filters.vhd              |
| can_bus.[`frame_filters_drv_filter_ran_hi_th`](#frame_filters_drv_filter_ran_hi_th)                           | 0x67c    |        4 | Auto-extracted signal drv_filter_ran_hi_th from frame_filters.vhd              |
| can_bus.[`frame_filters_int_filter_ran_valid`](#frame_filters_int_filter_ran_valid)                           | 0x680    |        4 | Auto-extracted signal int_filter_ran_valid from frame_filters.vhd              |
| can_bus.[`frame_filters_drv_filters_ena`](#frame_filters_drv_filters_ena)                                     | 0x684    |        4 | Auto-extracted signal drv_filters_ena from frame_filters.vhd                   |
| can_bus.[`frame_filters_int_data_type`](#frame_filters_int_data_type)                                         | 0x688    |        4 | Auto-extracted signal int_data_type from frame_filters.vhd                     |
| can_bus.[`frame_filters_int_data_ctrl`](#frame_filters_int_data_ctrl)                                         | 0x68c    |        4 | Auto-extracted signal int_data_ctrl from frame_filters.vhd                     |
| can_bus.[`frame_filters_filter_A_enable`](#frame_filters_filter_a_enable)                                     | 0x690    |        4 | Auto-extracted signal filter_A_enable from frame_filters.vhd                   |
| can_bus.[`frame_filters_filter_B_enable`](#frame_filters_filter_b_enable)                                     | 0x694    |        4 | Auto-extracted signal filter_B_enable from frame_filters.vhd                   |
| can_bus.[`frame_filters_filter_C_enable`](#frame_filters_filter_c_enable)                                     | 0x698    |        4 | Auto-extracted signal filter_C_enable from frame_filters.vhd                   |
| can_bus.[`frame_filters_filter_range_enable`](#frame_filters_filter_range_enable)                             | 0x69c    |        4 | Auto-extracted signal filter_range_enable from frame_filters.vhd               |
| can_bus.[`frame_filters_filter_result`](#frame_filters_filter_result)                                         | 0x6a0    |        4 | Auto-extracted signal filter_result from frame_filters.vhd                     |
| can_bus.[`frame_filters_ident_valid_d`](#frame_filters_ident_valid_d)                                         | 0x6a4    |        4 | Auto-extracted signal ident_valid_d from frame_filters.vhd                     |
| can_bus.[`frame_filters_ident_valid_q`](#frame_filters_ident_valid_q)                                         | 0x6a8    |        4 | Auto-extracted signal ident_valid_q from frame_filters.vhd                     |
| can_bus.[`frame_filters_drv_drop_remote_frames`](#frame_filters_drv_drop_remote_frames)                       | 0x6ac    |        4 | Auto-extracted signal drv_drop_remote_frames from frame_filters.vhd            |
| can_bus.[`frame_filters_drop_rtr_frame`](#frame_filters_drop_rtr_frame)                                       | 0x6b0    |        4 | Auto-extracted signal drop_rtr_frame from frame_filters.vhd                    |
| can_bus.[`inf_ram_wrapper_int_read_data`](#inf_ram_wrapper_int_read_data)                                     | 0x6b4    |        4 | Auto-extracted signal int_read_data from inf_ram_wrapper.vhd                   |
| can_bus.[`inf_ram_wrapper_byte_we`](#inf_ram_wrapper_byte_we)                                                 | 0x6b8    |        4 | Auto-extracted signal byte_we from inf_ram_wrapper.vhd                         |
| can_bus.[`int_manager_drv_int_vect_clr`](#int_manager_drv_int_vect_clr)                                       | 0x6bc    |        4 | Auto-extracted signal drv_int_vect_clr from int_manager.vhd                    |
| can_bus.[`int_manager_drv_int_ena_set`](#int_manager_drv_int_ena_set)                                         | 0x6c0    |        4 | Auto-extracted signal drv_int_ena_set from int_manager.vhd                     |
| can_bus.[`int_manager_drv_int_ena_clr`](#int_manager_drv_int_ena_clr)                                         | 0x6c4    |        4 | Auto-extracted signal drv_int_ena_clr from int_manager.vhd                     |
| can_bus.[`int_manager_drv_int_mask_set`](#int_manager_drv_int_mask_set)                                       | 0x6c8    |        4 | Auto-extracted signal drv_int_mask_set from int_manager.vhd                    |
| can_bus.[`int_manager_drv_int_mask_clr`](#int_manager_drv_int_mask_clr)                                       | 0x6cc    |        4 | Auto-extracted signal drv_int_mask_clr from int_manager.vhd                    |
| can_bus.[`int_manager_int_ena_i`](#int_manager_int_ena_i)                                                     | 0x6d0    |        4 | Auto-extracted signal int_ena_i from int_manager.vhd                           |
| can_bus.[`int_manager_int_mask_i`](#int_manager_int_mask_i)                                                   | 0x6d4    |        4 | Auto-extracted signal int_mask_i from int_manager.vhd                          |
| can_bus.[`int_manager_int_vect_i`](#int_manager_int_vect_i)                                                   | 0x6d8    |        4 | Auto-extracted signal int_vect_i from int_manager.vhd                          |
| can_bus.[`int_manager_int_input_active`](#int_manager_int_input_active)                                       | 0x6dc    |        4 | Auto-extracted signal int_input_active from int_manager.vhd                    |
| can_bus.[`int_manager_int_i`](#int_manager_int_i)                                                             | 0x6e0    |        4 | Auto-extracted signal int_i from int_manager.vhd                               |
| can_bus.[`int_module_int_mask_i`](#int_module_int_mask_i)                                                     | 0x6e4    |        4 | Auto-extracted signal int_mask_i from int_module.vhd                           |
| can_bus.[`int_module_int_ena_i`](#int_module_int_ena_i)                                                       | 0x6e8    |        4 | Auto-extracted signal int_ena_i from int_module.vhd                            |
| can_bus.[`int_module_int_mask_load`](#int_module_int_mask_load)                                               | 0x6ec    |        4 | Auto-extracted signal int_mask_load from int_module.vhd                        |
| can_bus.[`int_module_int_mask_next`](#int_module_int_mask_next)                                               | 0x6f0    |        4 | Auto-extracted signal int_mask_next from int_module.vhd                        |
| can_bus.[`memory_reg_reg_value_r`](#memory_reg_reg_value_r)                                                   | 0x6f4    |        4 | Auto-extracted signal reg_value_r from memory_reg.vhd                          |
| can_bus.[`memory_reg_wr_select`](#memory_reg_wr_select)                                                       | 0x6f8    |        4 | Auto-extracted signal wr_select from memory_reg.vhd                            |
| can_bus.[`memory_reg_wr_select_expanded`](#memory_reg_wr_select_expanded)                                     | 0x6fc    |        4 | Auto-extracted signal wr_select_expanded from memory_reg.vhd                   |
| can_bus.[`memory_registers_status_comb`](#memory_registers_status_comb)                                       | 0x700    |        4 | Auto-extracted signal status_comb from memory_registers.vhd                    |
| can_bus.[`memory_registers_can_core_cs`](#memory_registers_can_core_cs)                                       | 0x704    |        4 | Auto-extracted signal can_core_cs from memory_registers.vhd                    |
| can_bus.[`memory_registers_control_registers_cs`](#memory_registers_control_registers_cs)                     | 0x708    |        4 | Auto-extracted signal control_registers_cs from memory_registers.vhd           |
| can_bus.[`memory_registers_control_registers_cs_reg`](#memory_registers_control_registers_cs_reg)             | 0x70c    |        4 | Auto-extracted signal control_registers_cs_reg from memory_registers.vhd       |
| can_bus.[`memory_registers_test_registers_cs`](#memory_registers_test_registers_cs)                           | 0x710    |        4 | Auto-extracted signal test_registers_cs from memory_registers.vhd              |
| can_bus.[`memory_registers_test_registers_cs_reg`](#memory_registers_test_registers_cs_reg)                   | 0x714    |        4 | Auto-extracted signal test_registers_cs_reg from memory_registers.vhd          |
| can_bus.[`memory_registers_control_registers_rdata`](#memory_registers_control_registers_rdata)               | 0x718    |        4 | Auto-extracted signal control_registers_rdata from memory_registers.vhd        |
| can_bus.[`memory_registers_test_registers_rdata`](#memory_registers_test_registers_rdata)                     | 0x71c    |        4 | Auto-extracted signal test_registers_rdata from memory_registers.vhd           |
| can_bus.[`memory_registers_is_err_active`](#memory_registers_is_err_active)                                   | 0x720    |        4 | Auto-extracted signal is_err_active from memory_registers.vhd                  |
| can_bus.[`memory_registers_is_err_passive`](#memory_registers_is_err_passive)                                 | 0x724    |        4 | Auto-extracted signal is_err_passive from memory_registers.vhd                 |
| can_bus.[`memory_registers_is_bus_off`](#memory_registers_is_bus_off)                                         | 0x728    |        4 | Auto-extracted signal is_bus_off from memory_registers.vhd                     |
| can_bus.[`memory_registers_is_transmitter`](#memory_registers_is_transmitter)                                 | 0x72c    |        4 | Auto-extracted signal is_transmitter from memory_registers.vhd                 |
| can_bus.[`memory_registers_is_receiver`](#memory_registers_is_receiver)                                       | 0x730    |        4 | Auto-extracted signal is_receiver from memory_registers.vhd                    |
| can_bus.[`memory_registers_is_idle`](#memory_registers_is_idle)                                               | 0x734    |        4 | Auto-extracted signal is_idle from memory_registers.vhd                        |
| can_bus.[`memory_registers_reg_lock_1_active`](#memory_registers_reg_lock_1_active)                           | 0x738    |        4 | Auto-extracted signal reg_lock_1_active from memory_registers.vhd              |
| can_bus.[`memory_registers_reg_lock_2_active`](#memory_registers_reg_lock_2_active)                           | 0x73c    |        4 | Auto-extracted signal reg_lock_2_active from memory_registers.vhd              |
| can_bus.[`memory_registers_soft_res_q_n`](#memory_registers_soft_res_q_n)                                     | 0x740    |        4 | Auto-extracted signal soft_res_q_n from memory_registers.vhd                   |
| can_bus.[`memory_registers_ewl_padded`](#memory_registers_ewl_padded)                                         | 0x744    |        4 | Auto-extracted signal ewl_padded from memory_registers.vhd                     |
| can_bus.[`memory_registers_control_regs_clk_en`](#memory_registers_control_regs_clk_en)                       | 0x748    |        4 | Auto-extracted signal control_regs_clk_en from memory_registers.vhd            |
| can_bus.[`memory_registers_test_regs_clk_en`](#memory_registers_test_regs_clk_en)                             | 0x74c    |        4 | Auto-extracted signal test_regs_clk_en from memory_registers.vhd               |
| can_bus.[`memory_registers_clk_control_regs`](#memory_registers_clk_control_regs)                             | 0x750    |        4 | Auto-extracted signal clk_control_regs from memory_registers.vhd               |
| can_bus.[`memory_registers_clk_test_regs`](#memory_registers_clk_test_regs)                                   | 0x754    |        4 | Auto-extracted signal clk_test_regs from memory_registers.vhd                  |
| can_bus.[`memory_registers_rx_buf_mode`](#memory_registers_rx_buf_mode)                                       | 0x758    |        4 | Auto-extracted signal rx_buf_mode from memory_registers.vhd                    |
| can_bus.[`memory_registers_rx_move_cmd`](#memory_registers_rx_move_cmd)                                       | 0x75c    |        4 | Auto-extracted signal rx_move_cmd from memory_registers.vhd                    |
| can_bus.[`memory_registers_ctr_pres_sel_q`](#memory_registers_ctr_pres_sel_q)                                 | 0x760    |        4 | Auto-extracted signal ctr_pres_sel_q from memory_registers.vhd                 |
| can_bus.[`operation_control_drv_ena`](#operation_control_drv_ena)                                             | 0x764    |        4 | Auto-extracted signal drv_ena from operation_control.vhd                       |
| can_bus.[`operation_control_go_to_off`](#operation_control_go_to_off)                                         | 0x768    |        4 | Auto-extracted signal go_to_off from operation_control.vhd                     |
| can_bus.[`prescaler_drv_ena`](#prescaler_drv_ena)                                                             | 0x76c    |        4 | Auto-extracted signal drv_ena from prescaler.vhd                               |
| can_bus.[`prescaler_tseg1_nbt`](#prescaler_tseg1_nbt)                                                         | 0x770    |        4 | Auto-extracted signal tseg1_nbt from prescaler.vhd                             |
| can_bus.[`prescaler_tseg2_nbt`](#prescaler_tseg2_nbt)                                                         | 0x774    |        4 | Auto-extracted signal tseg2_nbt from prescaler.vhd                             |
| can_bus.[`prescaler_brp_nbt`](#prescaler_brp_nbt)                                                             | 0x778    |        4 | Auto-extracted signal brp_nbt from prescaler.vhd                               |
| can_bus.[`prescaler_sjw_nbt`](#prescaler_sjw_nbt)                                                             | 0x77c    |        4 | Auto-extracted signal sjw_nbt from prescaler.vhd                               |
| can_bus.[`prescaler_tseg1_dbt`](#prescaler_tseg1_dbt)                                                         | 0x780    |        4 | Auto-extracted signal tseg1_dbt from prescaler.vhd                             |
| can_bus.[`prescaler_tseg2_dbt`](#prescaler_tseg2_dbt)                                                         | 0x784    |        4 | Auto-extracted signal tseg2_dbt from prescaler.vhd                             |
| can_bus.[`prescaler_brp_dbt`](#prescaler_brp_dbt)                                                             | 0x788    |        4 | Auto-extracted signal brp_dbt from prescaler.vhd                               |
| can_bus.[`prescaler_sjw_dbt`](#prescaler_sjw_dbt)                                                             | 0x78c    |        4 | Auto-extracted signal sjw_dbt from prescaler.vhd                               |
| can_bus.[`prescaler_segment_end`](#prescaler_segment_end)                                                     | 0x790    |        4 | Auto-extracted signal segment_end from prescaler.vhd                           |
| can_bus.[`prescaler_h_sync_valid`](#prescaler_h_sync_valid)                                                   | 0x794    |        4 | Auto-extracted signal h_sync_valid from prescaler.vhd                          |
| can_bus.[`prescaler_is_tseg1`](#prescaler_is_tseg1)                                                           | 0x798    |        4 | Auto-extracted signal is_tseg1 from prescaler.vhd                              |
| can_bus.[`prescaler_is_tseg2`](#prescaler_is_tseg2)                                                           | 0x79c    |        4 | Auto-extracted signal is_tseg2 from prescaler.vhd                              |
| can_bus.[`prescaler_resync_edge_valid`](#prescaler_resync_edge_valid)                                         | 0x7a0    |        4 | Auto-extracted signal resync_edge_valid from prescaler.vhd                     |
| can_bus.[`prescaler_h_sync_edge_valid`](#prescaler_h_sync_edge_valid)                                         | 0x7a4    |        4 | Auto-extracted signal h_sync_edge_valid from prescaler.vhd                     |
| can_bus.[`prescaler_segm_counter_nbt`](#prescaler_segm_counter_nbt)                                           | 0x7a8    |        4 | Auto-extracted signal segm_counter_nbt from prescaler.vhd                      |
| can_bus.[`prescaler_segm_counter_dbt`](#prescaler_segm_counter_dbt)                                           | 0x7ac    |        4 | Auto-extracted signal segm_counter_dbt from prescaler.vhd                      |
| can_bus.[`prescaler_exit_segm_req_nbt`](#prescaler_exit_segm_req_nbt)                                         | 0x7b0    |        4 | Auto-extracted signal exit_segm_req_nbt from prescaler.vhd                     |
| can_bus.[`prescaler_exit_segm_req_dbt`](#prescaler_exit_segm_req_dbt)                                         | 0x7b4    |        4 | Auto-extracted signal exit_segm_req_dbt from prescaler.vhd                     |
| can_bus.[`prescaler_tq_edge_nbt`](#prescaler_tq_edge_nbt)                                                     | 0x7b8    |        4 | Auto-extracted signal tq_edge_nbt from prescaler.vhd                           |
| can_bus.[`prescaler_tq_edge_dbt`](#prescaler_tq_edge_dbt)                                                     | 0x7bc    |        4 | Auto-extracted signal tq_edge_dbt from prescaler.vhd                           |
| can_bus.[`prescaler_rx_trig_req`](#prescaler_rx_trig_req)                                                     | 0x7c0    |        4 | Auto-extracted signal rx_trig_req from prescaler.vhd                           |
| can_bus.[`prescaler_tx_trig_req`](#prescaler_tx_trig_req)                                                     | 0x7c4    |        4 | Auto-extracted signal tx_trig_req from prescaler.vhd                           |
| can_bus.[`prescaler_start_edge`](#prescaler_start_edge)                                                       | 0x7c8    |        4 | Auto-extracted signal start_edge from prescaler.vhd                            |
| can_bus.[`prescaler_bt_ctr_clear`](#prescaler_bt_ctr_clear)                                                   | 0x7cc    |        4 | Auto-extracted signal bt_ctr_clear from prescaler.vhd                          |
| can_bus.[`priority_decoder_l0_valid`](#priority_decoder_l0_valid)                                             | 0x7d0    |        4 | Auto-extracted signal l0_valid from priority_decoder.vhd                       |
| can_bus.[`priority_decoder_l1_valid`](#priority_decoder_l1_valid)                                             | 0x7d4    |        4 | Auto-extracted signal l1_valid from priority_decoder.vhd                       |
| can_bus.[`priority_decoder_l1_winner`](#priority_decoder_l1_winner)                                           | 0x7d8    |        4 | Auto-extracted signal l1_winner from priority_decoder.vhd                      |
| can_bus.[`priority_decoder_l2_valid`](#priority_decoder_l2_valid)                                             | 0x7dc    |        4 | Auto-extracted signal l2_valid from priority_decoder.vhd                       |
| can_bus.[`priority_decoder_l2_winner`](#priority_decoder_l2_winner)                                           | 0x7e0    |        4 | Auto-extracted signal l2_winner from priority_decoder.vhd                      |
| can_bus.[`priority_decoder_l3_valid`](#priority_decoder_l3_valid)                                             | 0x7e4    |        4 | Auto-extracted signal l3_valid from priority_decoder.vhd                       |
| can_bus.[`priority_decoder_l3_winner`](#priority_decoder_l3_winner)                                           | 0x7e8    |        4 | Auto-extracted signal l3_winner from priority_decoder.vhd                      |
| can_bus.[`protocol_control_drv_can_fd_ena`](#protocol_control_drv_can_fd_ena)                                 | 0x7ec    |        4 | Auto-extracted signal drv_can_fd_ena from protocol_control.vhd                 |
| can_bus.[`protocol_control_drv_bus_mon_ena`](#protocol_control_drv_bus_mon_ena)                               | 0x7f0    |        4 | Auto-extracted signal drv_bus_mon_ena from protocol_control.vhd                |
| can_bus.[`protocol_control_drv_retr_lim_ena`](#protocol_control_drv_retr_lim_ena)                             | 0x7f4    |        4 | Auto-extracted signal drv_retr_lim_ena from protocol_control.vhd               |
| can_bus.[`protocol_control_drv_retr_th`](#protocol_control_drv_retr_th)                                       | 0x7f8    |        4 | Auto-extracted signal drv_retr_th from protocol_control.vhd                    |
| can_bus.[`protocol_control_drv_self_test_ena`](#protocol_control_drv_self_test_ena)                           | 0x7fc    |        4 | Auto-extracted signal drv_self_test_ena from protocol_control.vhd              |
| can_bus.[`protocol_control_drv_ack_forb`](#protocol_control_drv_ack_forb)                                     | 0x800    |        4 | Auto-extracted signal drv_ack_forb from protocol_control.vhd                   |
| can_bus.[`protocol_control_drv_ena`](#protocol_control_drv_ena)                                               | 0x804    |        4 | Auto-extracted signal drv_ena from protocol_control.vhd                        |
| can_bus.[`protocol_control_drv_fd_type`](#protocol_control_drv_fd_type)                                       | 0x808    |        4 | Auto-extracted signal drv_fd_type from protocol_control.vhd                    |
| can_bus.[`protocol_control_drv_int_loopback_ena`](#protocol_control_drv_int_loopback_ena)                     | 0x80c    |        4 | Auto-extracted signal drv_int_loopback_ena from protocol_control.vhd           |
| can_bus.[`protocol_control_drv_bus_off_reset`](#protocol_control_drv_bus_off_reset)                           | 0x810    |        4 | Auto-extracted signal drv_bus_off_reset from protocol_control.vhd              |
| can_bus.[`protocol_control_drv_ssp_delay_select`](#protocol_control_drv_ssp_delay_select)                     | 0x814    |        4 | Auto-extracted signal drv_ssp_delay_select from protocol_control.vhd           |
| can_bus.[`protocol_control_drv_pex`](#protocol_control_drv_pex)                                               | 0x818    |        4 | Auto-extracted signal drv_pex from protocol_control.vhd                        |
| can_bus.[`protocol_control_drv_cpexs`](#protocol_control_drv_cpexs)                                           | 0x81c    |        4 | Auto-extracted signal drv_cpexs from protocol_control.vhd                      |
| can_bus.[`protocol_control_tran_word_swapped`](#protocol_control_tran_word_swapped)                           | 0x820    |        4 | Auto-extracted signal tran_word_swapped from protocol_control.vhd              |
| can_bus.[`protocol_control_err_frm_req`](#protocol_control_err_frm_req)                                       | 0x824    |        4 | Auto-extracted signal err_frm_req from protocol_control.vhd                    |
| can_bus.[`protocol_control_tx_load_base_id`](#protocol_control_tx_load_base_id)                               | 0x828    |        4 | Auto-extracted signal tx_load_base_id from protocol_control.vhd                |
| can_bus.[`protocol_control_tx_load_ext_id`](#protocol_control_tx_load_ext_id)                                 | 0x82c    |        4 | Auto-extracted signal tx_load_ext_id from protocol_control.vhd                 |
| can_bus.[`protocol_control_tx_load_dlc`](#protocol_control_tx_load_dlc)                                       | 0x830    |        4 | Auto-extracted signal tx_load_dlc from protocol_control.vhd                    |
| can_bus.[`protocol_control_tx_load_data_word`](#protocol_control_tx_load_data_word)                           | 0x834    |        4 | Auto-extracted signal tx_load_data_word from protocol_control.vhd              |
| can_bus.[`protocol_control_tx_load_stuff_count`](#protocol_control_tx_load_stuff_count)                       | 0x838    |        4 | Auto-extracted signal tx_load_stuff_count from protocol_control.vhd            |
| can_bus.[`protocol_control_tx_load_crc`](#protocol_control_tx_load_crc)                                       | 0x83c    |        4 | Auto-extracted signal tx_load_crc from protocol_control.vhd                    |
| can_bus.[`protocol_control_tx_shift_ena`](#protocol_control_tx_shift_ena)                                     | 0x840    |        4 | Auto-extracted signal tx_shift_ena from protocol_control.vhd                   |
| can_bus.[`protocol_control_tx_dominant`](#protocol_control_tx_dominant)                                       | 0x844    |        4 | Auto-extracted signal tx_dominant from protocol_control.vhd                    |
| can_bus.[`protocol_control_rx_clear`](#protocol_control_rx_clear)                                             | 0x848    |        4 | Auto-extracted signal rx_clear from protocol_control.vhd                       |
| can_bus.[`protocol_control_rx_store_base_id`](#protocol_control_rx_store_base_id)                             | 0x84c    |        4 | Auto-extracted signal rx_store_base_id from protocol_control.vhd               |
| can_bus.[`protocol_control_rx_store_ext_id`](#protocol_control_rx_store_ext_id)                               | 0x850    |        4 | Auto-extracted signal rx_store_ext_id from protocol_control.vhd                |
| can_bus.[`protocol_control_rx_store_ide`](#protocol_control_rx_store_ide)                                     | 0x854    |        4 | Auto-extracted signal rx_store_ide from protocol_control.vhd                   |
| can_bus.[`protocol_control_rx_store_rtr`](#protocol_control_rx_store_rtr)                                     | 0x858    |        4 | Auto-extracted signal rx_store_rtr from protocol_control.vhd                   |
| can_bus.[`protocol_control_rx_store_edl`](#protocol_control_rx_store_edl)                                     | 0x85c    |        4 | Auto-extracted signal rx_store_edl from protocol_control.vhd                   |
| can_bus.[`protocol_control_rx_store_dlc`](#protocol_control_rx_store_dlc)                                     | 0x860    |        4 | Auto-extracted signal rx_store_dlc from protocol_control.vhd                   |
| can_bus.[`protocol_control_rx_store_esi`](#protocol_control_rx_store_esi)                                     | 0x864    |        4 | Auto-extracted signal rx_store_esi from protocol_control.vhd                   |
| can_bus.[`protocol_control_rx_store_brs`](#protocol_control_rx_store_brs)                                     | 0x868    |        4 | Auto-extracted signal rx_store_brs from protocol_control.vhd                   |
| can_bus.[`protocol_control_rx_store_stuff_count`](#protocol_control_rx_store_stuff_count)                     | 0x86c    |        4 | Auto-extracted signal rx_store_stuff_count from protocol_control.vhd           |
| can_bus.[`protocol_control_rx_shift_ena`](#protocol_control_rx_shift_ena)                                     | 0x870    |        4 | Auto-extracted signal rx_shift_ena from protocol_control.vhd                   |
| can_bus.[`protocol_control_rx_shift_in_sel`](#protocol_control_rx_shift_in_sel)                               | 0x874    |        4 | Auto-extracted signal rx_shift_in_sel from protocol_control.vhd                |
| can_bus.[`protocol_control_rec_is_rtr_i`](#protocol_control_rec_is_rtr_i)                                     | 0x878    |        4 | Auto-extracted signal rec_is_rtr_i from protocol_control.vhd                   |
| can_bus.[`protocol_control_rec_dlc_d`](#protocol_control_rec_dlc_d)                                           | 0x87c    |        4 | Auto-extracted signal rec_dlc_d from protocol_control.vhd                      |
| can_bus.[`protocol_control_rec_dlc_q`](#protocol_control_rec_dlc_q)                                           | 0x880    |        4 | Auto-extracted signal rec_dlc_q from protocol_control.vhd                      |
| can_bus.[`protocol_control_rec_frame_type_i`](#protocol_control_rec_frame_type_i)                             | 0x884    |        4 | Auto-extracted signal rec_frame_type_i from protocol_control.vhd               |
| can_bus.[`protocol_control_ctrl_ctr_pload`](#protocol_control_ctrl_ctr_pload)                                 | 0x888    |        4 | Auto-extracted signal ctrl_ctr_pload from protocol_control.vhd                 |
| can_bus.[`protocol_control_ctrl_ctr_pload_val`](#protocol_control_ctrl_ctr_pload_val)                         | 0x88c    |        4 | Auto-extracted signal ctrl_ctr_pload_val from protocol_control.vhd             |
| can_bus.[`protocol_control_ctrl_ctr_ena`](#protocol_control_ctrl_ctr_ena)                                     | 0x890    |        4 | Auto-extracted signal ctrl_ctr_ena from protocol_control.vhd                   |
| can_bus.[`protocol_control_ctrl_ctr_zero`](#protocol_control_ctrl_ctr_zero)                                   | 0x894    |        4 | Auto-extracted signal ctrl_ctr_zero from protocol_control.vhd                  |
| can_bus.[`protocol_control_ctrl_ctr_one`](#protocol_control_ctrl_ctr_one)                                     | 0x898    |        4 | Auto-extracted signal ctrl_ctr_one from protocol_control.vhd                   |
| can_bus.[`protocol_control_ctrl_counted_byte`](#protocol_control_ctrl_counted_byte)                           | 0x89c    |        4 | Auto-extracted signal ctrl_counted_byte from protocol_control.vhd              |
| can_bus.[`protocol_control_ctrl_counted_byte_index`](#protocol_control_ctrl_counted_byte_index)               | 0x8a0    |        4 | Auto-extracted signal ctrl_counted_byte_index from protocol_control.vhd        |
| can_bus.[`protocol_control_ctrl_ctr_mem_index`](#protocol_control_ctrl_ctr_mem_index)                         | 0x8a4    |        4 | Auto-extracted signal ctrl_ctr_mem_index from protocol_control.vhd             |
| can_bus.[`protocol_control_compl_ctr_ena`](#protocol_control_compl_ctr_ena)                                   | 0x8a8    |        4 | Auto-extracted signal compl_ctr_ena from protocol_control.vhd                  |
| can_bus.[`protocol_control_reinteg_ctr_clr`](#protocol_control_reinteg_ctr_clr)                               | 0x8ac    |        4 | Auto-extracted signal reinteg_ctr_clr from protocol_control.vhd                |
| can_bus.[`protocol_control_reinteg_ctr_enable`](#protocol_control_reinteg_ctr_enable)                         | 0x8b0    |        4 | Auto-extracted signal reinteg_ctr_enable from protocol_control.vhd             |
| can_bus.[`protocol_control_reinteg_ctr_expired`](#protocol_control_reinteg_ctr_expired)                       | 0x8b4    |        4 | Auto-extracted signal reinteg_ctr_expired from protocol_control.vhd            |
| can_bus.[`protocol_control_retr_ctr_clear`](#protocol_control_retr_ctr_clear)                                 | 0x8b8    |        4 | Auto-extracted signal retr_ctr_clear from protocol_control.vhd                 |
| can_bus.[`protocol_control_retr_ctr_add`](#protocol_control_retr_ctr_add)                                     | 0x8bc    |        4 | Auto-extracted signal retr_ctr_add from protocol_control.vhd                   |
| can_bus.[`protocol_control_retr_limit_reached`](#protocol_control_retr_limit_reached)                         | 0x8c0    |        4 | Auto-extracted signal retr_limit_reached from protocol_control.vhd             |
| can_bus.[`protocol_control_form_err_i`](#protocol_control_form_err_i)                                         | 0x8c4    |        4 | Auto-extracted signal form_err_i from protocol_control.vhd                     |
| can_bus.[`protocol_control_ack_err_i`](#protocol_control_ack_err_i)                                           | 0x8c8    |        4 | Auto-extracted signal ack_err_i from protocol_control.vhd                      |
| can_bus.[`protocol_control_crc_check`](#protocol_control_crc_check)                                           | 0x8cc    |        4 | Auto-extracted signal crc_check from protocol_control.vhd                      |
| can_bus.[`protocol_control_bit_err_arb`](#protocol_control_bit_err_arb)                                       | 0x8d0    |        4 | Auto-extracted signal bit_err_arb from protocol_control.vhd                    |
| can_bus.[`protocol_control_crc_match`](#protocol_control_crc_match)                                           | 0x8d4    |        4 | Auto-extracted signal crc_match from protocol_control.vhd                      |
| can_bus.[`protocol_control_crc_err_i`](#protocol_control_crc_err_i)                                           | 0x8d8    |        4 | Auto-extracted signal crc_err_i from protocol_control.vhd                      |
| can_bus.[`protocol_control_crc_clear_match_flag`](#protocol_control_crc_clear_match_flag)                     | 0x8dc    |        4 | Auto-extracted signal crc_clear_match_flag from protocol_control.vhd           |
| can_bus.[`protocol_control_crc_src`](#protocol_control_crc_src)                                               | 0x8e0    |        4 | Auto-extracted signal crc_src from protocol_control.vhd                        |
| can_bus.[`protocol_control_err_pos`](#protocol_control_err_pos)                                               | 0x8e4    |        4 | Auto-extracted signal err_pos from protocol_control.vhd                        |
| can_bus.[`protocol_control_is_arbitration_i`](#protocol_control_is_arbitration_i)                             | 0x8e8    |        4 | Auto-extracted signal is_arbitration_i from protocol_control.vhd               |
| can_bus.[`protocol_control_bit_err_enable`](#protocol_control_bit_err_enable)                                 | 0x8ec    |        4 | Auto-extracted signal bit_err_enable from protocol_control.vhd                 |
| can_bus.[`protocol_control_tx_data_nbs_i`](#protocol_control_tx_data_nbs_i)                                   | 0x8f0    |        4 | Auto-extracted signal tx_data_nbs_i from protocol_control.vhd                  |
| can_bus.[`protocol_control_rx_crc`](#protocol_control_rx_crc)                                                 | 0x8f4    |        4 | Auto-extracted signal rx_crc from protocol_control.vhd                         |
| can_bus.[`protocol_control_rx_stuff_count`](#protocol_control_rx_stuff_count)                                 | 0x8f8    |        4 | Auto-extracted signal rx_stuff_count from protocol_control.vhd                 |
| can_bus.[`protocol_control_fixed_stuff_i`](#protocol_control_fixed_stuff_i)                                   | 0x8fc    |        4 | Auto-extracted signal fixed_stuff_i from protocol_control.vhd                  |
| can_bus.[`protocol_control_arbitration_lost_i`](#protocol_control_arbitration_lost_i)                         | 0x900    |        4 | Auto-extracted signal arbitration_lost_i from protocol_control.vhd             |
| can_bus.[`protocol_control_alc_id_field`](#protocol_control_alc_id_field)                                     | 0x904    |        4 | Auto-extracted signal alc_id_field from protocol_control.vhd                   |
| can_bus.[`protocol_control_drv_rom_ena`](#protocol_control_drv_rom_ena)                                       | 0x908    |        4 | Auto-extracted signal drv_rom_ena from protocol_control.vhd                    |
| can_bus.[`protocol_control_fsm_state_reg_ce`](#protocol_control_fsm_state_reg_ce)                             | 0x90c    |        4 | Auto-extracted signal state_reg_ce from protocol_control_fsm.vhd               |
| can_bus.[`protocol_control_fsm_no_data_transmitter`](#protocol_control_fsm_no_data_transmitter)               | 0x910    |        4 | Auto-extracted signal no_data_transmitter from protocol_control_fsm.vhd        |
| can_bus.[`protocol_control_fsm_no_data_receiver`](#protocol_control_fsm_no_data_receiver)                     | 0x914    |        4 | Auto-extracted signal no_data_receiver from protocol_control_fsm.vhd           |
| can_bus.[`protocol_control_fsm_no_data_field`](#protocol_control_fsm_no_data_field)                           | 0x918    |        4 | Auto-extracted signal no_data_field from protocol_control_fsm.vhd              |
| can_bus.[`protocol_control_fsm_ctrl_ctr_pload_i`](#protocol_control_fsm_ctrl_ctr_pload_i)                     | 0x91c    |        4 | Auto-extracted signal ctrl_ctr_pload_i from protocol_control_fsm.vhd           |
| can_bus.[`protocol_control_fsm_ctrl_ctr_pload_unaliged`](#protocol_control_fsm_ctrl_ctr_pload_unaliged)       | 0x920    |        4 | Auto-extracted signal ctrl_ctr_pload_unaliged from protocol_control_fsm.vhd    |
| can_bus.[`protocol_control_fsm_crc_use_21`](#protocol_control_fsm_crc_use_21)                                 | 0x924    |        4 | Auto-extracted signal crc_use_21 from protocol_control_fsm.vhd                 |
| can_bus.[`protocol_control_fsm_crc_use_17`](#protocol_control_fsm_crc_use_17)                                 | 0x928    |        4 | Auto-extracted signal crc_use_17 from protocol_control_fsm.vhd                 |
| can_bus.[`protocol_control_fsm_crc_src_i`](#protocol_control_fsm_crc_src_i)                                   | 0x92c    |        4 | Auto-extracted signal crc_src_i from protocol_control_fsm.vhd                  |
| can_bus.[`protocol_control_fsm_crc_length_i`](#protocol_control_fsm_crc_length_i)                             | 0x930    |        4 | Auto-extracted signal crc_length_i from protocol_control_fsm.vhd               |
| can_bus.[`protocol_control_fsm_tran_data_length`](#protocol_control_fsm_tran_data_length)                     | 0x934    |        4 | Auto-extracted signal tran_data_length from protocol_control_fsm.vhd           |
| can_bus.[`protocol_control_fsm_rec_data_length`](#protocol_control_fsm_rec_data_length)                       | 0x938    |        4 | Auto-extracted signal rec_data_length from protocol_control_fsm.vhd            |
| can_bus.[`protocol_control_fsm_rec_data_length_c`](#protocol_control_fsm_rec_data_length_c)                   | 0x93c    |        4 | Auto-extracted signal rec_data_length_c from protocol_control_fsm.vhd          |
| can_bus.[`protocol_control_fsm_data_length_c`](#protocol_control_fsm_data_length_c)                           | 0x940    |        4 | Auto-extracted signal data_length_c from protocol_control_fsm.vhd              |
| can_bus.[`protocol_control_fsm_data_length_shifted_c`](#protocol_control_fsm_data_length_shifted_c)           | 0x944    |        4 | Auto-extracted signal data_length_shifted_c from protocol_control_fsm.vhd      |
| can_bus.[`protocol_control_fsm_data_length_bits_c`](#protocol_control_fsm_data_length_bits_c)                 | 0x948    |        4 | Auto-extracted signal data_length_bits_c from protocol_control_fsm.vhd         |
| can_bus.[`protocol_control_fsm_is_fd_frame`](#protocol_control_fsm_is_fd_frame)                               | 0x94c    |        4 | Auto-extracted signal is_fd_frame from protocol_control_fsm.vhd                |
| can_bus.[`protocol_control_fsm_frame_start`](#protocol_control_fsm_frame_start)                               | 0x950    |        4 | Auto-extracted signal frame_start from protocol_control_fsm.vhd                |
| can_bus.[`protocol_control_fsm_tx_frame_ready`](#protocol_control_fsm_tx_frame_ready)                         | 0x954    |        4 | Auto-extracted signal tx_frame_ready from protocol_control_fsm.vhd             |
| can_bus.[`protocol_control_fsm_ide_is_arbitration`](#protocol_control_fsm_ide_is_arbitration)                 | 0x958    |        4 | Auto-extracted signal ide_is_arbitration from protocol_control_fsm.vhd         |
| can_bus.[`protocol_control_fsm_arbitration_lost_condition`](#protocol_control_fsm_arbitration_lost_condition) | 0x95c    |        4 | Auto-extracted signal arbitration_lost_condition from protocol_control_fsm.vhd |
| can_bus.[`protocol_control_fsm_arbitration_lost_i`](#protocol_control_fsm_arbitration_lost_i)                 | 0x960    |        4 | Auto-extracted signal arbitration_lost_i from protocol_control_fsm.vhd         |
| can_bus.[`protocol_control_fsm_tx_failed`](#protocol_control_fsm_tx_failed)                                   | 0x964    |        4 | Auto-extracted signal tx_failed from protocol_control_fsm.vhd                  |
| can_bus.[`protocol_control_fsm_store_metadata_d`](#protocol_control_fsm_store_metadata_d)                     | 0x968    |        4 | Auto-extracted signal store_metadata_d from protocol_control_fsm.vhd           |
| can_bus.[`protocol_control_fsm_store_data_d`](#protocol_control_fsm_store_data_d)                             | 0x96c    |        4 | Auto-extracted signal store_data_d from protocol_control_fsm.vhd               |
| can_bus.[`protocol_control_fsm_rec_valid_d`](#protocol_control_fsm_rec_valid_d)                               | 0x970    |        4 | Auto-extracted signal rec_valid_d from protocol_control_fsm.vhd                |
| can_bus.[`protocol_control_fsm_rec_abort_d`](#protocol_control_fsm_rec_abort_d)                               | 0x974    |        4 | Auto-extracted signal rec_abort_d from protocol_control_fsm.vhd                |
| can_bus.[`protocol_control_fsm_go_to_suspend`](#protocol_control_fsm_go_to_suspend)                           | 0x978    |        4 | Auto-extracted signal go_to_suspend from protocol_control_fsm.vhd              |
| can_bus.[`protocol_control_fsm_go_to_stuff_count`](#protocol_control_fsm_go_to_stuff_count)                   | 0x97c    |        4 | Auto-extracted signal go_to_stuff_count from protocol_control_fsm.vhd          |
| can_bus.[`protocol_control_fsm_rx_store_base_id_i`](#protocol_control_fsm_rx_store_base_id_i)                 | 0x980    |        4 | Auto-extracted signal rx_store_base_id_i from protocol_control_fsm.vhd         |
| can_bus.[`protocol_control_fsm_rx_store_ext_id_i`](#protocol_control_fsm_rx_store_ext_id_i)                   | 0x984    |        4 | Auto-extracted signal rx_store_ext_id_i from protocol_control_fsm.vhd          |
| can_bus.[`protocol_control_fsm_rx_store_ide_i`](#protocol_control_fsm_rx_store_ide_i)                         | 0x988    |        4 | Auto-extracted signal rx_store_ide_i from protocol_control_fsm.vhd             |
| can_bus.[`protocol_control_fsm_rx_store_rtr_i`](#protocol_control_fsm_rx_store_rtr_i)                         | 0x98c    |        4 | Auto-extracted signal rx_store_rtr_i from protocol_control_fsm.vhd             |
| can_bus.[`protocol_control_fsm_rx_store_edl_i`](#protocol_control_fsm_rx_store_edl_i)                         | 0x990    |        4 | Auto-extracted signal rx_store_edl_i from protocol_control_fsm.vhd             |
| can_bus.[`protocol_control_fsm_rx_store_dlc_i`](#protocol_control_fsm_rx_store_dlc_i)                         | 0x994    |        4 | Auto-extracted signal rx_store_dlc_i from protocol_control_fsm.vhd             |
| can_bus.[`protocol_control_fsm_rx_store_esi_i`](#protocol_control_fsm_rx_store_esi_i)                         | 0x998    |        4 | Auto-extracted signal rx_store_esi_i from protocol_control_fsm.vhd             |
| can_bus.[`protocol_control_fsm_rx_store_brs_i`](#protocol_control_fsm_rx_store_brs_i)                         | 0x99c    |        4 | Auto-extracted signal rx_store_brs_i from protocol_control_fsm.vhd             |
| can_bus.[`protocol_control_fsm_rx_store_stuff_count_i`](#protocol_control_fsm_rx_store_stuff_count_i)         | 0x9a0    |        4 | Auto-extracted signal rx_store_stuff_count_i from protocol_control_fsm.vhd     |
| can_bus.[`protocol_control_fsm_rx_clear_i`](#protocol_control_fsm_rx_clear_i)                                 | 0x9a4    |        4 | Auto-extracted signal rx_clear_i from protocol_control_fsm.vhd                 |
| can_bus.[`protocol_control_fsm_tx_load_base_id_i`](#protocol_control_fsm_tx_load_base_id_i)                   | 0x9a8    |        4 | Auto-extracted signal tx_load_base_id_i from protocol_control_fsm.vhd          |
| can_bus.[`protocol_control_fsm_tx_load_ext_id_i`](#protocol_control_fsm_tx_load_ext_id_i)                     | 0x9ac    |        4 | Auto-extracted signal tx_load_ext_id_i from protocol_control_fsm.vhd           |
| can_bus.[`protocol_control_fsm_tx_load_dlc_i`](#protocol_control_fsm_tx_load_dlc_i)                           | 0x9b0    |        4 | Auto-extracted signal tx_load_dlc_i from protocol_control_fsm.vhd              |
| can_bus.[`protocol_control_fsm_tx_load_data_word_i`](#protocol_control_fsm_tx_load_data_word_i)               | 0x9b4    |        4 | Auto-extracted signal tx_load_data_word_i from protocol_control_fsm.vhd        |
| can_bus.[`protocol_control_fsm_tx_load_stuff_count_i`](#protocol_control_fsm_tx_load_stuff_count_i)           | 0x9b8    |        4 | Auto-extracted signal tx_load_stuff_count_i from protocol_control_fsm.vhd      |
| can_bus.[`protocol_control_fsm_tx_load_crc_i`](#protocol_control_fsm_tx_load_crc_i)                           | 0x9bc    |        4 | Auto-extracted signal tx_load_crc_i from protocol_control_fsm.vhd              |
| can_bus.[`protocol_control_fsm_tx_shift_ena_i`](#protocol_control_fsm_tx_shift_ena_i)                         | 0x9c0    |        4 | Auto-extracted signal tx_shift_ena_i from protocol_control_fsm.vhd             |
| can_bus.[`protocol_control_fsm_form_err_i`](#protocol_control_fsm_form_err_i)                                 | 0x9c4    |        4 | Auto-extracted signal form_err_i from protocol_control_fsm.vhd                 |
| can_bus.[`protocol_control_fsm_ack_err_i`](#protocol_control_fsm_ack_err_i)                                   | 0x9c8    |        4 | Auto-extracted signal ack_err_i from protocol_control_fsm.vhd                  |
| can_bus.[`protocol_control_fsm_ack_err_flag`](#protocol_control_fsm_ack_err_flag)                             | 0x9cc    |        4 | Auto-extracted signal ack_err_flag from protocol_control_fsm.vhd               |
| can_bus.[`protocol_control_fsm_ack_err_flag_clr`](#protocol_control_fsm_ack_err_flag_clr)                     | 0x9d0    |        4 | Auto-extracted signal ack_err_flag_clr from protocol_control_fsm.vhd           |
| can_bus.[`protocol_control_fsm_crc_err_i`](#protocol_control_fsm_crc_err_i)                                   | 0x9d4    |        4 | Auto-extracted signal crc_err_i from protocol_control_fsm.vhd                  |
| can_bus.[`protocol_control_fsm_bit_err_arb_i`](#protocol_control_fsm_bit_err_arb_i)                           | 0x9d8    |        4 | Auto-extracted signal bit_err_arb_i from protocol_control_fsm.vhd              |
| can_bus.[`protocol_control_fsm_sp_control_switch_data`](#protocol_control_fsm_sp_control_switch_data)         | 0x9dc    |        4 | Auto-extracted signal sp_control_switch_data from protocol_control_fsm.vhd     |
| can_bus.[`protocol_control_fsm_sp_control_switch_nominal`](#protocol_control_fsm_sp_control_switch_nominal)   | 0x9e0    |        4 | Auto-extracted signal sp_control_switch_nominal from protocol_control_fsm.vhd  |
| can_bus.[`protocol_control_fsm_switch_to_ssp`](#protocol_control_fsm_switch_to_ssp)                           | 0x9e4    |        4 | Auto-extracted signal switch_to_ssp from protocol_control_fsm.vhd              |
| can_bus.[`protocol_control_fsm_sp_control_ce`](#protocol_control_fsm_sp_control_ce)                           | 0x9e8    |        4 | Auto-extracted signal sp_control_ce from protocol_control_fsm.vhd              |
| can_bus.[`protocol_control_fsm_sp_control_d`](#protocol_control_fsm_sp_control_d)                             | 0x9ec    |        4 | Auto-extracted signal sp_control_d from protocol_control_fsm.vhd               |
| can_bus.[`protocol_control_fsm_sp_control_q_i`](#protocol_control_fsm_sp_control_q_i)                         | 0x9f0    |        4 | Auto-extracted signal sp_control_q_i from protocol_control_fsm.vhd             |
| can_bus.[`protocol_control_fsm_ssp_reset_i`](#protocol_control_fsm_ssp_reset_i)                               | 0x9f4    |        4 | Auto-extracted signal ssp_reset_i from protocol_control_fsm.vhd                |
| can_bus.[`protocol_control_fsm_sync_control_d`](#protocol_control_fsm_sync_control_d)                         | 0x9f8    |        4 | Auto-extracted signal sync_control_d from protocol_control_fsm.vhd             |
| can_bus.[`protocol_control_fsm_sync_control_q`](#protocol_control_fsm_sync_control_q)                         | 0x9fc    |        4 | Auto-extracted signal sync_control_q from protocol_control_fsm.vhd             |
| can_bus.[`protocol_control_fsm_perform_hsync`](#protocol_control_fsm_perform_hsync)                           | 0xa00    |        4 | Auto-extracted signal perform_hsync from protocol_control_fsm.vhd              |
| can_bus.[`protocol_control_fsm_primary_err_i`](#protocol_control_fsm_primary_err_i)                           | 0xa04    |        4 | Auto-extracted signal primary_err_i from protocol_control_fsm.vhd              |
| can_bus.[`protocol_control_fsm_err_delim_late_i`](#protocol_control_fsm_err_delim_late_i)                     | 0xa08    |        4 | Auto-extracted signal err_delim_late_i from protocol_control_fsm.vhd           |
| can_bus.[`protocol_control_fsm_set_err_active_i`](#protocol_control_fsm_set_err_active_i)                     | 0xa0c    |        4 | Auto-extracted signal set_err_active_i from protocol_control_fsm.vhd           |
| can_bus.[`protocol_control_fsm_set_transmitter_i`](#protocol_control_fsm_set_transmitter_i)                   | 0xa10    |        4 | Auto-extracted signal set_transmitter_i from protocol_control_fsm.vhd          |
| can_bus.[`protocol_control_fsm_set_receiver_i`](#protocol_control_fsm_set_receiver_i)                         | 0xa14    |        4 | Auto-extracted signal set_receiver_i from protocol_control_fsm.vhd             |
| can_bus.[`protocol_control_fsm_set_idle_i`](#protocol_control_fsm_set_idle_i)                                 | 0xa18    |        4 | Auto-extracted signal set_idle_i from protocol_control_fsm.vhd                 |
| can_bus.[`protocol_control_fsm_first_err_delim_d`](#protocol_control_fsm_first_err_delim_d)                   | 0xa1c    |        4 | Auto-extracted signal first_err_delim_d from protocol_control_fsm.vhd          |
| can_bus.[`protocol_control_fsm_first_err_delim_q`](#protocol_control_fsm_first_err_delim_q)                   | 0xa20    |        4 | Auto-extracted signal first_err_delim_q from protocol_control_fsm.vhd          |
| can_bus.[`protocol_control_fsm_stuff_enable_set`](#protocol_control_fsm_stuff_enable_set)                     | 0xa24    |        4 | Auto-extracted signal stuff_enable_set from protocol_control_fsm.vhd           |
| can_bus.[`protocol_control_fsm_stuff_enable_clear`](#protocol_control_fsm_stuff_enable_clear)                 | 0xa28    |        4 | Auto-extracted signal stuff_enable_clear from protocol_control_fsm.vhd         |
| can_bus.[`protocol_control_fsm_destuff_enable_set`](#protocol_control_fsm_destuff_enable_set)                 | 0xa2c    |        4 | Auto-extracted signal destuff_enable_set from protocol_control_fsm.vhd         |
| can_bus.[`protocol_control_fsm_destuff_enable_clear`](#protocol_control_fsm_destuff_enable_clear)             | 0xa30    |        4 | Auto-extracted signal destuff_enable_clear from protocol_control_fsm.vhd       |
| can_bus.[`protocol_control_fsm_bit_err_disable`](#protocol_control_fsm_bit_err_disable)                       | 0xa34    |        4 | Auto-extracted signal bit_err_disable from protocol_control_fsm.vhd            |
| can_bus.[`protocol_control_fsm_bit_err_disable_receiver`](#protocol_control_fsm_bit_err_disable_receiver)     | 0xa38    |        4 | Auto-extracted signal bit_err_disable_receiver from protocol_control_fsm.vhd   |
| can_bus.[`protocol_control_fsm_sof_pulse_i`](#protocol_control_fsm_sof_pulse_i)                               | 0xa3c    |        4 | Auto-extracted signal sof_pulse_i from protocol_control_fsm.vhd                |
| can_bus.[`protocol_control_fsm_compl_ctr_ena_i`](#protocol_control_fsm_compl_ctr_ena_i)                       | 0xa40    |        4 | Auto-extracted signal compl_ctr_ena_i from protocol_control_fsm.vhd            |
| can_bus.[`protocol_control_fsm_tick_state_reg`](#protocol_control_fsm_tick_state_reg)                         | 0xa44    |        4 | Auto-extracted signal tick_state_reg from protocol_control_fsm.vhd             |
| can_bus.[`protocol_control_fsm_br_shifted_i`](#protocol_control_fsm_br_shifted_i)                             | 0xa48    |        4 | Auto-extracted signal br_shifted_i from protocol_control_fsm.vhd               |
| can_bus.[`protocol_control_fsm_is_arbitration_i`](#protocol_control_fsm_is_arbitration_i)                     | 0xa4c    |        4 | Auto-extracted signal is_arbitration_i from protocol_control_fsm.vhd           |
| can_bus.[`protocol_control_fsm_crc_spec_enable_i`](#protocol_control_fsm_crc_spec_enable_i)                   | 0xa50    |        4 | Auto-extracted signal crc_spec_enable_i from protocol_control_fsm.vhd          |
| can_bus.[`protocol_control_fsm_load_init_vect_i`](#protocol_control_fsm_load_init_vect_i)                     | 0xa54    |        4 | Auto-extracted signal load_init_vect_i from protocol_control_fsm.vhd           |
| can_bus.[`protocol_control_fsm_drv_bus_off_reset_q`](#protocol_control_fsm_drv_bus_off_reset_q)               | 0xa58    |        4 | Auto-extracted signal drv_bus_off_reset_q from protocol_control_fsm.vhd        |
| can_bus.[`protocol_control_fsm_retr_ctr_clear_i`](#protocol_control_fsm_retr_ctr_clear_i)                     | 0xa5c    |        4 | Auto-extracted signal retr_ctr_clear_i from protocol_control_fsm.vhd           |
| can_bus.[`protocol_control_fsm_retr_ctr_add_i`](#protocol_control_fsm_retr_ctr_add_i)                         | 0xa60    |        4 | Auto-extracted signal retr_ctr_add_i from protocol_control_fsm.vhd             |
| can_bus.[`protocol_control_fsm_decrement_rec_i`](#protocol_control_fsm_decrement_rec_i)                       | 0xa64    |        4 | Auto-extracted signal decrement_rec_i from protocol_control_fsm.vhd            |
| can_bus.[`protocol_control_fsm_retr_ctr_add_block`](#protocol_control_fsm_retr_ctr_add_block)                 | 0xa68    |        4 | Auto-extracted signal retr_ctr_add_block from protocol_control_fsm.vhd         |
| can_bus.[`protocol_control_fsm_retr_ctr_add_block_clr`](#protocol_control_fsm_retr_ctr_add_block_clr)         | 0xa6c    |        4 | Auto-extracted signal retr_ctr_add_block_clr from protocol_control_fsm.vhd     |
| can_bus.[`protocol_control_fsm_block_txtb_unlock`](#protocol_control_fsm_block_txtb_unlock)                   | 0xa70    |        4 | Auto-extracted signal block_txtb_unlock from protocol_control_fsm.vhd          |
| can_bus.[`protocol_control_fsm_tx_frame_no_sof_d`](#protocol_control_fsm_tx_frame_no_sof_d)                   | 0xa74    |        4 | Auto-extracted signal tx_frame_no_sof_d from protocol_control_fsm.vhd          |
| can_bus.[`protocol_control_fsm_tx_frame_no_sof_q`](#protocol_control_fsm_tx_frame_no_sof_q)                   | 0xa78    |        4 | Auto-extracted signal tx_frame_no_sof_q from protocol_control_fsm.vhd          |
| can_bus.[`protocol_control_fsm_ctrl_signal_upd`](#protocol_control_fsm_ctrl_signal_upd)                       | 0xa7c    |        4 | Auto-extracted signal ctrl_signal_upd from protocol_control_fsm.vhd            |
| can_bus.[`protocol_control_fsm_clr_bus_off_rst_flg`](#protocol_control_fsm_clr_bus_off_rst_flg)               | 0xa80    |        4 | Auto-extracted signal clr_bus_off_rst_flg from protocol_control_fsm.vhd        |
| can_bus.[`protocol_control_fsm_pex_on_fdf_enable`](#protocol_control_fsm_pex_on_fdf_enable)                   | 0xa84    |        4 | Auto-extracted signal pex_on_fdf_enable from protocol_control_fsm.vhd          |
| can_bus.[`protocol_control_fsm_pex_on_res_enable`](#protocol_control_fsm_pex_on_res_enable)                   | 0xa88    |        4 | Auto-extracted signal pex_on_res_enable from protocol_control_fsm.vhd          |
| can_bus.[`protocol_control_fsm_rx_data_nbs_prev`](#protocol_control_fsm_rx_data_nbs_prev)                     | 0xa8c    |        4 | Auto-extracted signal rx_data_nbs_prev from protocol_control_fsm.vhd           |
| can_bus.[`protocol_control_fsm_pexs_set`](#protocol_control_fsm_pexs_set)                                     | 0xa90    |        4 | Auto-extracted signal pexs_set from protocol_control_fsm.vhd                   |
| can_bus.[`protocol_control_fsm_tran_frame_type_i`](#protocol_control_fsm_tran_frame_type_i)                   | 0xa94    |        4 | Auto-extracted signal tran_frame_type_i from protocol_control_fsm.vhd          |
| can_bus.[`protocol_control_fsm_txtb_clk_en_d`](#protocol_control_fsm_txtb_clk_en_d)                           | 0xa98    |        4 | Auto-extracted signal txtb_clk_en_d from protocol_control_fsm.vhd              |
| can_bus.[`protocol_control_fsm_txtb_clk_en_q`](#protocol_control_fsm_txtb_clk_en_q)                           | 0xa9c    |        4 | Auto-extracted signal txtb_clk_en_q from protocol_control_fsm.vhd              |
| can_bus.[`reintegration_counter_reinteg_ctr_ce`](#reintegration_counter_reinteg_ctr_ce)                       | 0xaa0    |        4 | Auto-extracted signal reinteg_ctr_ce from reintegration_counter.vhd            |
| can_bus.[`retransmitt_counter_retr_ctr_ce`](#retransmitt_counter_retr_ctr_ce)                                 | 0xaa4    |        4 | Auto-extracted signal retr_ctr_ce from retransmitt_counter.vhd                 |
| can_bus.[`rst_sync_rff`](#rst_sync_rff)                                                                       | 0xaa8    |        4 | Auto-extracted signal rff from rst_sync.vhd                                    |
| can_bus.[`rx_buffer_drv_erase_rx`](#rx_buffer_drv_erase_rx)                                                   | 0xaac    |        4 | Auto-extracted signal drv_erase_rx from rx_buffer.vhd                          |
| can_bus.[`rx_buffer_drv_read_start`](#rx_buffer_drv_read_start)                                               | 0xab0    |        4 | Auto-extracted signal drv_read_start from rx_buffer.vhd                        |
| can_bus.[`rx_buffer_drv_clr_ovr`](#rx_buffer_drv_clr_ovr)                                                     | 0xab4    |        4 | Auto-extracted signal drv_clr_ovr from rx_buffer.vhd                           |
| can_bus.[`rx_buffer_drv_rtsopt`](#rx_buffer_drv_rtsopt)                                                       | 0xab8    |        4 | Auto-extracted signal drv_rtsopt from rx_buffer.vhd                            |
| can_bus.[`rx_buffer_read_pointer`](#rx_buffer_read_pointer)                                                   | 0xabc    |        4 | Auto-extracted signal read_pointer from rx_buffer.vhd                          |
| can_bus.[`rx_buffer_read_pointer_inc_1`](#rx_buffer_read_pointer_inc_1)                                       | 0xac0    |        4 | Auto-extracted signal read_pointer_inc_1 from rx_buffer.vhd                    |
| can_bus.[`rx_buffer_write_pointer`](#rx_buffer_write_pointer)                                                 | 0xac4    |        4 | Auto-extracted signal write_pointer from rx_buffer.vhd                         |
| can_bus.[`rx_buffer_write_pointer_raw`](#rx_buffer_write_pointer_raw)                                         | 0xac8    |        4 | Auto-extracted signal write_pointer_raw from rx_buffer.vhd                     |
| can_bus.[`rx_buffer_write_pointer_ts`](#rx_buffer_write_pointer_ts)                                           | 0xacc    |        4 | Auto-extracted signal write_pointer_ts from rx_buffer.vhd                      |
| can_bus.[`rx_buffer_rx_mem_free_i`](#rx_buffer_rx_mem_free_i)                                                 | 0xad0    |        4 | Auto-extracted signal rx_mem_free_i from rx_buffer.vhd                         |
| can_bus.[`rx_buffer_memory_write_data`](#rx_buffer_memory_write_data)                                         | 0xad4    |        4 | Auto-extracted signal memory_write_data from rx_buffer.vhd                     |
| can_bus.[`rx_buffer_data_overrun_flg`](#rx_buffer_data_overrun_flg)                                           | 0xad8    |        4 | Auto-extracted signal data_overrun_flg from rx_buffer.vhd                      |
| can_bus.[`rx_buffer_data_overrun_i`](#rx_buffer_data_overrun_i)                                               | 0xadc    |        4 | Auto-extracted signal data_overrun_i from rx_buffer.vhd                        |
| can_bus.[`rx_buffer_overrun_condition`](#rx_buffer_overrun_condition)                                         | 0xae0    |        4 | Auto-extracted signal overrun_condition from rx_buffer.vhd                     |
| can_bus.[`rx_buffer_rx_empty_i`](#rx_buffer_rx_empty_i)                                                       | 0xae4    |        4 | Auto-extracted signal rx_empty_i from rx_buffer.vhd                            |
| can_bus.[`rx_buffer_is_free_word`](#rx_buffer_is_free_word)                                                   | 0xae8    |        4 | Auto-extracted signal is_free_word from rx_buffer.vhd                          |
| can_bus.[`rx_buffer_commit_rx_frame`](#rx_buffer_commit_rx_frame)                                             | 0xaec    |        4 | Auto-extracted signal commit_rx_frame from rx_buffer.vhd                       |
| can_bus.[`rx_buffer_commit_overrun_abort`](#rx_buffer_commit_overrun_abort)                                   | 0xaf0    |        4 | Auto-extracted signal commit_overrun_abort from rx_buffer.vhd                  |
| can_bus.[`rx_buffer_read_increment`](#rx_buffer_read_increment)                                               | 0xaf4    |        4 | Auto-extracted signal read_increment from rx_buffer.vhd                        |
| can_bus.[`rx_buffer_write_raw_OK`](#rx_buffer_write_raw_ok)                                                   | 0xaf8    |        4 | Auto-extracted signal write_raw_OK from rx_buffer.vhd                          |
| can_bus.[`rx_buffer_write_raw_intent`](#rx_buffer_write_raw_intent)                                           | 0xafc    |        4 | Auto-extracted signal write_raw_intent from rx_buffer.vhd                      |
| can_bus.[`rx_buffer_write_ts`](#rx_buffer_write_ts)                                                           | 0xb00    |        4 | Auto-extracted signal write_ts from rx_buffer.vhd                              |
| can_bus.[`rx_buffer_stored_ts`](#rx_buffer_stored_ts)                                                         | 0xb04    |        4 | Auto-extracted signal stored_ts from rx_buffer.vhd                             |
| can_bus.[`rx_buffer_data_selector`](#rx_buffer_data_selector)                                                 | 0xb08    |        4 | Auto-extracted signal data_selector from rx_buffer.vhd                         |
| can_bus.[`rx_buffer_store_ts_wr_ptr`](#rx_buffer_store_ts_wr_ptr)                                             | 0xb0c    |        4 | Auto-extracted signal store_ts_wr_ptr from rx_buffer.vhd                       |
| can_bus.[`rx_buffer_inc_ts_wr_ptr`](#rx_buffer_inc_ts_wr_ptr)                                                 | 0xb10    |        4 | Auto-extracted signal inc_ts_wr_ptr from rx_buffer.vhd                         |
| can_bus.[`rx_buffer_reset_overrun_flag`](#rx_buffer_reset_overrun_flag)                                       | 0xb14    |        4 | Auto-extracted signal reset_overrun_flag from rx_buffer.vhd                    |
| can_bus.[`rx_buffer_frame_form_w`](#rx_buffer_frame_form_w)                                                   | 0xb18    |        4 | Auto-extracted signal frame_form_w from rx_buffer.vhd                          |
| can_bus.[`rx_buffer_timestamp_capture`](#rx_buffer_timestamp_capture)                                         | 0xb1c    |        4 | Auto-extracted signal timestamp_capture from rx_buffer.vhd                     |
| can_bus.[`rx_buffer_timestamp_capture_ce`](#rx_buffer_timestamp_capture_ce)                                   | 0xb20    |        4 | Auto-extracted signal timestamp_capture_ce from rx_buffer.vhd                  |
| can_bus.[`rx_buffer_RAM_write`](#rx_buffer_ram_write)                                                         | 0xb24    |        4 | Auto-extracted signal RAM_write from rx_buffer.vhd                             |
| can_bus.[`rx_buffer_RAM_data_out`](#rx_buffer_ram_data_out)                                                   | 0xb28    |        4 | Auto-extracted signal RAM_data_out from rx_buffer.vhd                          |
| can_bus.[`rx_buffer_RAM_write_address`](#rx_buffer_ram_write_address)                                         | 0xb2c    |        4 | Auto-extracted signal RAM_write_address from rx_buffer.vhd                     |
| can_bus.[`rx_buffer_RAM_read_address`](#rx_buffer_ram_read_address)                                           | 0xb30    |        4 | Auto-extracted signal RAM_read_address from rx_buffer.vhd                      |
| can_bus.[`rx_buffer_rx_buf_res_n_d`](#rx_buffer_rx_buf_res_n_d)                                               | 0xb34    |        4 | Auto-extracted signal rx_buf_res_n_d from rx_buffer.vhd                        |
| can_bus.[`rx_buffer_rx_buf_res_n_q`](#rx_buffer_rx_buf_res_n_q)                                               | 0xb38    |        4 | Auto-extracted signal rx_buf_res_n_q from rx_buffer.vhd                        |
| can_bus.[`rx_buffer_rx_buf_res_n_q_scan`](#rx_buffer_rx_buf_res_n_q_scan)                                     | 0xb3c    |        4 | Auto-extracted signal rx_buf_res_n_q_scan from rx_buffer.vhd                   |
| can_bus.[`rx_buffer_rx_buf_ram_clk_en`](#rx_buffer_rx_buf_ram_clk_en)                                         | 0xb40    |        4 | Auto-extracted signal rx_buf_ram_clk_en from rx_buffer.vhd                     |
| can_bus.[`rx_buffer_clk_ram`](#rx_buffer_clk_ram)                                                             | 0xb44    |        4 | Auto-extracted signal clk_ram from rx_buffer.vhd                               |
| can_bus.[`rx_buffer_fsm_rx_fsm_ce`](#rx_buffer_fsm_rx_fsm_ce)                                                 | 0xb48    |        4 | Auto-extracted signal rx_fsm_ce from rx_buffer_fsm.vhd                         |
| can_bus.[`rx_buffer_fsm_cmd_join`](#rx_buffer_fsm_cmd_join)                                                   | 0xb4c    |        4 | Auto-extracted signal cmd_join from rx_buffer_fsm.vhd                          |
| can_bus.[`rx_buffer_pointers_write_pointer_raw_ce`](#rx_buffer_pointers_write_pointer_raw_ce)                 | 0xb50    |        4 | Auto-extracted signal write_pointer_raw_ce from rx_buffer_pointers.vhd         |
| can_bus.[`rx_buffer_pointers_write_pointer_ts_ce`](#rx_buffer_pointers_write_pointer_ts_ce)                   | 0xb54    |        4 | Auto-extracted signal write_pointer_ts_ce from rx_buffer_pointers.vhd          |
| can_bus.[`rx_buffer_ram_port_a_address_i`](#rx_buffer_ram_port_a_address_i)                                   | 0xb58    |        4 | Auto-extracted signal port_a_address_i from rx_buffer_ram.vhd                  |
| can_bus.[`rx_buffer_ram_port_a_write_i`](#rx_buffer_ram_port_a_write_i)                                       | 0xb5c    |        4 | Auto-extracted signal port_a_write_i from rx_buffer_ram.vhd                    |
| can_bus.[`rx_buffer_ram_port_a_data_in_i`](#rx_buffer_ram_port_a_data_in_i)                                   | 0xb60    |        4 | Auto-extracted signal port_a_data_in_i from rx_buffer_ram.vhd                  |
| can_bus.[`rx_buffer_ram_port_b_address_i`](#rx_buffer_ram_port_b_address_i)                                   | 0xb64    |        4 | Auto-extracted signal port_b_address_i from rx_buffer_ram.vhd                  |
| can_bus.[`rx_buffer_ram_port_b_data_out_i`](#rx_buffer_ram_port_b_data_out_i)                                 | 0xb68    |        4 | Auto-extracted signal port_b_data_out_i from rx_buffer_ram.vhd                 |
| can_bus.[`rx_buffer_ram_tst_ena`](#rx_buffer_ram_tst_ena)                                                     | 0xb6c    |        4 | Auto-extracted signal tst_ena from rx_buffer_ram.vhd                           |
| can_bus.[`rx_buffer_ram_tst_addr`](#rx_buffer_ram_tst_addr)                                                   | 0xb70    |        4 | Auto-extracted signal tst_addr from rx_buffer_ram.vhd                          |
| can_bus.[`rx_shift_reg_res_n_i_d`](#rx_shift_reg_res_n_i_d)                                                   | 0xb74    |        4 | Auto-extracted signal res_n_i_d from rx_shift_reg.vhd                          |
| can_bus.[`rx_shift_reg_res_n_i_q`](#rx_shift_reg_res_n_i_q)                                                   | 0xb78    |        4 | Auto-extracted signal res_n_i_q from rx_shift_reg.vhd                          |
| can_bus.[`rx_shift_reg_res_n_i_q_scan`](#rx_shift_reg_res_n_i_q_scan)                                         | 0xb7c    |        4 | Auto-extracted signal res_n_i_q_scan from rx_shift_reg.vhd                     |
| can_bus.[`rx_shift_reg_rx_shift_reg_q`](#rx_shift_reg_rx_shift_reg_q)                                         | 0xb80    |        4 | Auto-extracted signal rx_shift_reg_q from rx_shift_reg.vhd                     |
| can_bus.[`rx_shift_reg_rx_shift_cmd`](#rx_shift_reg_rx_shift_cmd)                                             | 0xb84    |        4 | Auto-extracted signal rx_shift_cmd from rx_shift_reg.vhd                       |
| can_bus.[`rx_shift_reg_rx_shift_in_sel_demuxed`](#rx_shift_reg_rx_shift_in_sel_demuxed)                       | 0xb88    |        4 | Auto-extracted signal rx_shift_in_sel_demuxed from rx_shift_reg.vhd            |
| can_bus.[`rx_shift_reg_rec_is_rtr_i`](#rx_shift_reg_rec_is_rtr_i)                                             | 0xb8c    |        4 | Auto-extracted signal rec_is_rtr_i from rx_shift_reg.vhd                       |
| can_bus.[`rx_shift_reg_rec_frame_type_i`](#rx_shift_reg_rec_frame_type_i)                                     | 0xb90    |        4 | Auto-extracted signal rec_frame_type_i from rx_shift_reg.vhd                   |
| can_bus.[`sample_mux_sample`](#sample_mux_sample)                                                             | 0xb94    |        4 | Auto-extracted signal sample from sample_mux.vhd                               |
| can_bus.[`sample_mux_prev_sample_d`](#sample_mux_prev_sample_d)                                               | 0xb98    |        4 | Auto-extracted signal prev_sample_d from sample_mux.vhd                        |
| can_bus.[`sample_mux_prev_sample_q`](#sample_mux_prev_sample_q)                                               | 0xb9c    |        4 | Auto-extracted signal prev_sample_q from sample_mux.vhd                        |
| can_bus.[`segment_end_detector_req_input`](#segment_end_detector_req_input)                                   | 0xba0    |        4 | Auto-extracted signal req_input from segment_end_detector.vhd                  |
| can_bus.[`segment_end_detector_segm_end_req_capt_d`](#segment_end_detector_segm_end_req_capt_d)               | 0xba4    |        4 | Auto-extracted signal segm_end_req_capt_d from segment_end_detector.vhd        |
| can_bus.[`segment_end_detector_segm_end_req_capt_q`](#segment_end_detector_segm_end_req_capt_q)               | 0xba8    |        4 | Auto-extracted signal segm_end_req_capt_q from segment_end_detector.vhd        |
| can_bus.[`segment_end_detector_segm_end_req_capt_ce`](#segment_end_detector_segm_end_req_capt_ce)             | 0xbac    |        4 | Auto-extracted signal segm_end_req_capt_ce from segment_end_detector.vhd       |
| can_bus.[`segment_end_detector_segm_end_req_capt_clr`](#segment_end_detector_segm_end_req_capt_clr)           | 0xbb0    |        4 | Auto-extracted signal segm_end_req_capt_clr from segment_end_detector.vhd      |
| can_bus.[`segment_end_detector_segm_end_req_capt_dq`](#segment_end_detector_segm_end_req_capt_dq)             | 0xbb4    |        4 | Auto-extracted signal segm_end_req_capt_dq from segment_end_detector.vhd       |
| can_bus.[`segment_end_detector_segm_end_nbt_valid`](#segment_end_detector_segm_end_nbt_valid)                 | 0xbb8    |        4 | Auto-extracted signal segm_end_nbt_valid from segment_end_detector.vhd         |
| can_bus.[`segment_end_detector_segm_end_dbt_valid`](#segment_end_detector_segm_end_dbt_valid)                 | 0xbbc    |        4 | Auto-extracted signal segm_end_dbt_valid from segment_end_detector.vhd         |
| can_bus.[`segment_end_detector_segm_end_nbt_dbt_valid`](#segment_end_detector_segm_end_nbt_dbt_valid)         | 0xbc0    |        4 | Auto-extracted signal segm_end_nbt_dbt_valid from segment_end_detector.vhd     |
| can_bus.[`segment_end_detector_tseg1_end_req_valid`](#segment_end_detector_tseg1_end_req_valid)               | 0xbc4    |        4 | Auto-extracted signal tseg1_end_req_valid from segment_end_detector.vhd        |
| can_bus.[`segment_end_detector_tseg2_end_req_valid`](#segment_end_detector_tseg2_end_req_valid)               | 0xbc8    |        4 | Auto-extracted signal tseg2_end_req_valid from segment_end_detector.vhd        |
| can_bus.[`segment_end_detector_h_sync_valid_i`](#segment_end_detector_h_sync_valid_i)                         | 0xbcc    |        4 | Auto-extracted signal h_sync_valid_i from segment_end_detector.vhd             |
| can_bus.[`segment_end_detector_segment_end_i`](#segment_end_detector_segment_end_i)                           | 0xbd0    |        4 | Auto-extracted signal segment_end_i from segment_end_detector.vhd              |
| can_bus.[`segment_end_detector_nbt_tq_active`](#segment_end_detector_nbt_tq_active)                           | 0xbd4    |        4 | Auto-extracted signal nbt_tq_active from segment_end_detector.vhd              |
| can_bus.[`segment_end_detector_dbt_tq_active`](#segment_end_detector_dbt_tq_active)                           | 0xbd8    |        4 | Auto-extracted signal dbt_tq_active from segment_end_detector.vhd              |
| can_bus.[`segment_end_detector_bt_ctr_clear_i`](#segment_end_detector_bt_ctr_clear_i)                         | 0xbdc    |        4 | Auto-extracted signal bt_ctr_clear_i from segment_end_detector.vhd             |
| can_bus.[`shift_reg_shift_regs`](#shift_reg_shift_regs)                                                       | 0xbe0    |        4 | Auto-extracted signal shift_regs from shift_reg.vhd                            |
| can_bus.[`shift_reg_next_shift_reg_val`](#shift_reg_next_shift_reg_val)                                       | 0xbe4    |        4 | Auto-extracted signal next_shift_reg_val from shift_reg.vhd                    |
| can_bus.[`shift_reg_byte_shift_reg_in`](#shift_reg_byte_shift_reg_in)                                         | 0xbe8    |        4 | Auto-extracted signal shift_reg_in from shift_reg_byte.vhd                     |
| can_bus.[`shift_reg_preload_shift_regs`](#shift_reg_preload_shift_regs)                                       | 0xbec    |        4 | Auto-extracted signal shift_regs from shift_reg_preload.vhd                    |
| can_bus.[`shift_reg_preload_next_shift_reg_val`](#shift_reg_preload_next_shift_reg_val)                       | 0xbf0    |        4 | Auto-extracted signal next_shift_reg_val from shift_reg_preload.vhd            |
| can_bus.[`sig_sync_rff`](#sig_sync_rff)                                                                       | 0xbf4    |        4 | Auto-extracted signal rff from sig_sync.vhd                                    |
| can_bus.[`ssp_generator_btmc_d`](#ssp_generator_btmc_d)                                                       | 0xbf8    |        4 | Auto-extracted signal btmc_d from ssp_generator.vhd                            |
| can_bus.[`ssp_generator_btmc_q`](#ssp_generator_btmc_q)                                                       | 0xbfc    |        4 | Auto-extracted signal btmc_q from ssp_generator.vhd                            |
| can_bus.[`ssp_generator_btmc_add`](#ssp_generator_btmc_add)                                                   | 0xc00    |        4 | Auto-extracted signal btmc_add from ssp_generator.vhd                          |
| can_bus.[`ssp_generator_btmc_ce`](#ssp_generator_btmc_ce)                                                     | 0xc04    |        4 | Auto-extracted signal btmc_ce from ssp_generator.vhd                           |
| can_bus.[`ssp_generator_btmc_meas_running_d`](#ssp_generator_btmc_meas_running_d)                             | 0xc08    |        4 | Auto-extracted signal btmc_meas_running_d from ssp_generator.vhd               |
| can_bus.[`ssp_generator_btmc_meas_running_q`](#ssp_generator_btmc_meas_running_q)                             | 0xc0c    |        4 | Auto-extracted signal btmc_meas_running_q from ssp_generator.vhd               |
| can_bus.[`ssp_generator_sspc_d`](#ssp_generator_sspc_d)                                                       | 0xc10    |        4 | Auto-extracted signal sspc_d from ssp_generator.vhd                            |
| can_bus.[`ssp_generator_sspc_q`](#ssp_generator_sspc_q)                                                       | 0xc14    |        4 | Auto-extracted signal sspc_q from ssp_generator.vhd                            |
| can_bus.[`ssp_generator_sspc_ce`](#ssp_generator_sspc_ce)                                                     | 0xc18    |        4 | Auto-extracted signal sspc_ce from ssp_generator.vhd                           |
| can_bus.[`ssp_generator_sspc_expired`](#ssp_generator_sspc_expired)                                           | 0xc1c    |        4 | Auto-extracted signal sspc_expired from ssp_generator.vhd                      |
| can_bus.[`ssp_generator_sspc_threshold`](#ssp_generator_sspc_threshold)                                       | 0xc20    |        4 | Auto-extracted signal sspc_threshold from ssp_generator.vhd                    |
| can_bus.[`ssp_generator_sspc_add`](#ssp_generator_sspc_add)                                                   | 0xc24    |        4 | Auto-extracted signal sspc_add from ssp_generator.vhd                          |
| can_bus.[`ssp_generator_first_ssp_d`](#ssp_generator_first_ssp_d)                                             | 0xc28    |        4 | Auto-extracted signal first_ssp_d from ssp_generator.vhd                       |
| can_bus.[`ssp_generator_first_ssp_q`](#ssp_generator_first_ssp_q)                                             | 0xc2c    |        4 | Auto-extracted signal first_ssp_q from ssp_generator.vhd                       |
| can_bus.[`ssp_generator_sspc_ena_d`](#ssp_generator_sspc_ena_d)                                               | 0xc30    |        4 | Auto-extracted signal sspc_ena_d from ssp_generator.vhd                        |
| can_bus.[`ssp_generator_sspc_ena_q`](#ssp_generator_sspc_ena_q)                                               | 0xc34    |        4 | Auto-extracted signal sspc_ena_q from ssp_generator.vhd                        |
| can_bus.[`ssp_generator_ssp_delay_padded`](#ssp_generator_ssp_delay_padded)                                   | 0xc38    |        4 | Auto-extracted signal ssp_delay_padded from ssp_generator.vhd                  |
| can_bus.[`synchronisation_checker_resync_edge`](#synchronisation_checker_resync_edge)                         | 0xc3c    |        4 | Auto-extracted signal resync_edge from synchronisation_checker.vhd             |
| can_bus.[`synchronisation_checker_h_sync_edge`](#synchronisation_checker_h_sync_edge)                         | 0xc40    |        4 | Auto-extracted signal h_sync_edge from synchronisation_checker.vhd             |
| can_bus.[`synchronisation_checker_h_or_re_sync_edge`](#synchronisation_checker_h_or_re_sync_edge)             | 0xc44    |        4 | Auto-extracted signal h_or_re_sync_edge from synchronisation_checker.vhd       |
| can_bus.[`synchronisation_checker_sync_flag`](#synchronisation_checker_sync_flag)                             | 0xc48    |        4 | Auto-extracted signal sync_flag from synchronisation_checker.vhd               |
| can_bus.[`synchronisation_checker_sync_flag_ce`](#synchronisation_checker_sync_flag_ce)                       | 0xc4c    |        4 | Auto-extracted signal sync_flag_ce from synchronisation_checker.vhd            |
| can_bus.[`synchronisation_checker_sync_flag_nxt`](#synchronisation_checker_sync_flag_nxt)                     | 0xc50    |        4 | Auto-extracted signal sync_flag_nxt from synchronisation_checker.vhd           |
| can_bus.[`test_registers_reg_map_reg_sel`](#test_registers_reg_map_reg_sel)                                   | 0xc54    |        4 | Auto-extracted signal reg_sel from test_registers_reg_map.vhd                  |
| can_bus.[`test_registers_reg_map_read_data_mux_in`](#test_registers_reg_map_read_data_mux_in)                 | 0xc58    |        4 | Auto-extracted signal read_data_mux_in from test_registers_reg_map.vhd         |
| can_bus.[`test_registers_reg_map_read_data_mask_n`](#test_registers_reg_map_read_data_mask_n)                 | 0xc5c    |        4 | Auto-extracted signal read_data_mask_n from test_registers_reg_map.vhd         |
| can_bus.[`test_registers_reg_map_read_mux_ena`](#test_registers_reg_map_read_mux_ena)                         | 0xc60    |        4 | Auto-extracted signal read_mux_ena from test_registers_reg_map.vhd             |
| can_bus.[`trigger_generator_rx_trig_req_q`](#trigger_generator_rx_trig_req_q)                                 | 0xc64    |        4 | Auto-extracted signal rx_trig_req_q from trigger_generator.vhd                 |
| can_bus.[`trigger_generator_tx_trig_req_flag_d`](#trigger_generator_tx_trig_req_flag_d)                       | 0xc68    |        4 | Auto-extracted signal tx_trig_req_flag_d from trigger_generator.vhd            |
| can_bus.[`trigger_generator_tx_trig_req_flag_q`](#trigger_generator_tx_trig_req_flag_q)                       | 0xc6c    |        4 | Auto-extracted signal tx_trig_req_flag_q from trigger_generator.vhd            |
| can_bus.[`trigger_generator_tx_trig_req_flag_dq`](#trigger_generator_tx_trig_req_flag_dq)                     | 0xc70    |        4 | Auto-extracted signal tx_trig_req_flag_dq from trigger_generator.vhd           |
| can_bus.[`trigger_mux_tx_trigger_q`](#trigger_mux_tx_trigger_q)                                               | 0xc74    |        4 | Auto-extracted signal tx_trigger_q from trigger_mux.vhd                        |
| can_bus.[`trv_delay_meas_trv_meas_progress_d`](#trv_delay_meas_trv_meas_progress_d)                           | 0xc78    |        4 | Auto-extracted signal trv_meas_progress_d from trv_delay_meas.vhd              |
| can_bus.[`trv_delay_meas_trv_meas_progress_q`](#trv_delay_meas_trv_meas_progress_q)                           | 0xc7c    |        4 | Auto-extracted signal trv_meas_progress_q from trv_delay_meas.vhd              |
| can_bus.[`trv_delay_meas_trv_meas_progress_del`](#trv_delay_meas_trv_meas_progress_del)                       | 0xc80    |        4 | Auto-extracted signal trv_meas_progress_del from trv_delay_meas.vhd            |
| can_bus.[`trv_delay_meas_trv_delay_ctr_q`](#trv_delay_meas_trv_delay_ctr_q)                                   | 0xc84    |        4 | Auto-extracted signal trv_delay_ctr_q from trv_delay_meas.vhd                  |
| can_bus.[`trv_delay_meas_trv_delay_ctr_d`](#trv_delay_meas_trv_delay_ctr_d)                                   | 0xc88    |        4 | Auto-extracted signal trv_delay_ctr_d from trv_delay_meas.vhd                  |
| can_bus.[`trv_delay_meas_trv_delay_ctr_add`](#trv_delay_meas_trv_delay_ctr_add)                               | 0xc8c    |        4 | Auto-extracted signal trv_delay_ctr_add from trv_delay_meas.vhd                |
| can_bus.[`trv_delay_meas_trv_delay_ctr_q_padded`](#trv_delay_meas_trv_delay_ctr_q_padded)                     | 0xc90    |        4 | Auto-extracted signal trv_delay_ctr_q_padded from trv_delay_meas.vhd           |
| can_bus.[`trv_delay_meas_trv_delay_ctr_rst_d`](#trv_delay_meas_trv_delay_ctr_rst_d)                           | 0xc94    |        4 | Auto-extracted signal trv_delay_ctr_rst_d from trv_delay_meas.vhd              |
| can_bus.[`trv_delay_meas_trv_delay_ctr_rst_q`](#trv_delay_meas_trv_delay_ctr_rst_q)                           | 0xc98    |        4 | Auto-extracted signal trv_delay_ctr_rst_q from trv_delay_meas.vhd              |
| can_bus.[`trv_delay_meas_trv_delay_ctr_rst_q_scan`](#trv_delay_meas_trv_delay_ctr_rst_q_scan)                 | 0xc9c    |        4 | Auto-extracted signal trv_delay_ctr_rst_q_scan from trv_delay_meas.vhd         |
| can_bus.[`trv_delay_meas_ssp_shadow_ce`](#trv_delay_meas_ssp_shadow_ce)                                       | 0xca0    |        4 | Auto-extracted signal ssp_shadow_ce from trv_delay_meas.vhd                    |
| can_bus.[`trv_delay_meas_ssp_delay_raw`](#trv_delay_meas_ssp_delay_raw)                                       | 0xca4    |        4 | Auto-extracted signal ssp_delay_raw from trv_delay_meas.vhd                    |
| can_bus.[`trv_delay_meas_ssp_delay_saturated`](#trv_delay_meas_ssp_delay_saturated)                           | 0xca8    |        4 | Auto-extracted signal ssp_delay_saturated from trv_delay_meas.vhd              |
| can_bus.[`trv_delay_meas_trv_delay_sum`](#trv_delay_meas_trv_delay_sum)                                       | 0xcac    |        4 | Auto-extracted signal trv_delay_sum from trv_delay_meas.vhd                    |
| can_bus.[`tx_arbitrator_select_buf_avail`](#tx_arbitrator_select_buf_avail)                                   | 0xcb0    |        4 | Auto-extracted signal select_buf_avail from tx_arbitrator.vhd                  |
| can_bus.[`tx_arbitrator_txtb_selected_input`](#tx_arbitrator_txtb_selected_input)                             | 0xcb4    |        4 | Auto-extracted signal txtb_selected_input from tx_arbitrator.vhd               |
| can_bus.[`tx_arbitrator_txtb_timestamp`](#tx_arbitrator_txtb_timestamp)                                       | 0xcb8    |        4 | Auto-extracted signal txtb_timestamp from tx_arbitrator.vhd                    |
| can_bus.[`tx_arbitrator_timestamp_valid`](#tx_arbitrator_timestamp_valid)                                     | 0xcbc    |        4 | Auto-extracted signal timestamp_valid from tx_arbitrator.vhd                   |
| can_bus.[`tx_arbitrator_select_index_changed`](#tx_arbitrator_select_index_changed)                           | 0xcc0    |        4 | Auto-extracted signal select_index_changed from tx_arbitrator.vhd              |
| can_bus.[`tx_arbitrator_validated_buffer`](#tx_arbitrator_validated_buffer)                                   | 0xcc4    |        4 | Auto-extracted signal validated_buffer from tx_arbitrator.vhd                  |
| can_bus.[`tx_arbitrator_ts_low_internal`](#tx_arbitrator_ts_low_internal)                                     | 0xcc8    |        4 | Auto-extracted signal ts_low_internal from tx_arbitrator.vhd                   |
| can_bus.[`tx_arbitrator_tran_dlc_dbl_buf`](#tx_arbitrator_tran_dlc_dbl_buf)                                   | 0xccc    |        4 | Auto-extracted signal tran_dlc_dbl_buf from tx_arbitrator.vhd                  |
| can_bus.[`tx_arbitrator_tran_is_rtr_dbl_buf`](#tx_arbitrator_tran_is_rtr_dbl_buf)                             | 0xcd0    |        4 | Auto-extracted signal tran_is_rtr_dbl_buf from tx_arbitrator.vhd               |
| can_bus.[`tx_arbitrator_tran_ident_type_dbl_buf`](#tx_arbitrator_tran_ident_type_dbl_buf)                     | 0xcd4    |        4 | Auto-extracted signal tran_ident_type_dbl_buf from tx_arbitrator.vhd           |
| can_bus.[`tx_arbitrator_tran_frame_type_dbl_buf`](#tx_arbitrator_tran_frame_type_dbl_buf)                     | 0xcd8    |        4 | Auto-extracted signal tran_frame_type_dbl_buf from tx_arbitrator.vhd           |
| can_bus.[`tx_arbitrator_tran_brs_dbl_buf`](#tx_arbitrator_tran_brs_dbl_buf)                                   | 0xcdc    |        4 | Auto-extracted signal tran_brs_dbl_buf from tx_arbitrator.vhd                  |
| can_bus.[`tx_arbitrator_tran_dlc_com`](#tx_arbitrator_tran_dlc_com)                                           | 0xce0    |        4 | Auto-extracted signal tran_dlc_com from tx_arbitrator.vhd                      |
| can_bus.[`tx_arbitrator_tran_is_rtr_com`](#tx_arbitrator_tran_is_rtr_com)                                     | 0xce4    |        4 | Auto-extracted signal tran_is_rtr_com from tx_arbitrator.vhd                   |
| can_bus.[`tx_arbitrator_tran_ident_type_com`](#tx_arbitrator_tran_ident_type_com)                             | 0xce8    |        4 | Auto-extracted signal tran_ident_type_com from tx_arbitrator.vhd               |
| can_bus.[`tx_arbitrator_tran_frame_type_com`](#tx_arbitrator_tran_frame_type_com)                             | 0xcec    |        4 | Auto-extracted signal tran_frame_type_com from tx_arbitrator.vhd               |
| can_bus.[`tx_arbitrator_tran_brs_com`](#tx_arbitrator_tran_brs_com)                                           | 0xcf0    |        4 | Auto-extracted signal tran_brs_com from tx_arbitrator.vhd                      |
| can_bus.[`tx_arbitrator_tran_frame_valid_com`](#tx_arbitrator_tran_frame_valid_com)                           | 0xcf4    |        4 | Auto-extracted signal tran_frame_valid_com from tx_arbitrator.vhd              |
| can_bus.[`tx_arbitrator_tran_identifier_com`](#tx_arbitrator_tran_identifier_com)                             | 0xcf8    |        4 | Auto-extracted signal tran_identifier_com from tx_arbitrator.vhd               |
| can_bus.[`tx_arbitrator_load_ts_lw_addr`](#tx_arbitrator_load_ts_lw_addr)                                     | 0xcfc    |        4 | Auto-extracted signal load_ts_lw_addr from tx_arbitrator.vhd                   |
| can_bus.[`tx_arbitrator_load_ts_uw_addr`](#tx_arbitrator_load_ts_uw_addr)                                     | 0xd00    |        4 | Auto-extracted signal load_ts_uw_addr from tx_arbitrator.vhd                   |
| can_bus.[`tx_arbitrator_load_ffmt_w_addr`](#tx_arbitrator_load_ffmt_w_addr)                                   | 0xd04    |        4 | Auto-extracted signal load_ffmt_w_addr from tx_arbitrator.vhd                  |
| can_bus.[`tx_arbitrator_load_ident_w_addr`](#tx_arbitrator_load_ident_w_addr)                                 | 0xd08    |        4 | Auto-extracted signal load_ident_w_addr from tx_arbitrator.vhd                 |
| can_bus.[`tx_arbitrator_store_ts_l_w`](#tx_arbitrator_store_ts_l_w)                                           | 0xd0c    |        4 | Auto-extracted signal store_ts_l_w from tx_arbitrator.vhd                      |
| can_bus.[`tx_arbitrator_store_md_w`](#tx_arbitrator_store_md_w)                                               | 0xd10    |        4 | Auto-extracted signal store_md_w from tx_arbitrator.vhd                        |
| can_bus.[`tx_arbitrator_store_ident_w`](#tx_arbitrator_store_ident_w)                                         | 0xd14    |        4 | Auto-extracted signal store_ident_w from tx_arbitrator.vhd                     |
| can_bus.[`tx_arbitrator_buffer_md_w`](#tx_arbitrator_buffer_md_w)                                             | 0xd18    |        4 | Auto-extracted signal buffer_md_w from tx_arbitrator.vhd                       |
| can_bus.[`tx_arbitrator_store_last_txtb_index`](#tx_arbitrator_store_last_txtb_index)                         | 0xd1c    |        4 | Auto-extracted signal store_last_txtb_index from tx_arbitrator.vhd             |
| can_bus.[`tx_arbitrator_frame_valid_com_set`](#tx_arbitrator_frame_valid_com_set)                             | 0xd20    |        4 | Auto-extracted signal frame_valid_com_set from tx_arbitrator.vhd               |
| can_bus.[`tx_arbitrator_frame_valid_com_clear`](#tx_arbitrator_frame_valid_com_clear)                         | 0xd24    |        4 | Auto-extracted signal frame_valid_com_clear from tx_arbitrator.vhd             |
| can_bus.[`tx_arbitrator_tx_arb_locked`](#tx_arbitrator_tx_arb_locked)                                         | 0xd28    |        4 | Auto-extracted signal tx_arb_locked from tx_arbitrator.vhd                     |
| can_bus.[`tx_arbitrator_txtb_meta_clk_en`](#tx_arbitrator_txtb_meta_clk_en)                                   | 0xd2c    |        4 | Auto-extracted signal txtb_meta_clk_en from tx_arbitrator.vhd                  |
| can_bus.[`tx_arbitrator_drv_tttm_ena`](#tx_arbitrator_drv_tttm_ena)                                           | 0xd30    |        4 | Auto-extracted signal drv_tttm_ena from tx_arbitrator.vhd                      |
| can_bus.[`tx_arbitrator_fsm_tx_arb_fsm_ce`](#tx_arbitrator_fsm_tx_arb_fsm_ce)                                 | 0xd34    |        4 | Auto-extracted signal tx_arb_fsm_ce from tx_arbitrator_fsm.vhd                 |
| can_bus.[`tx_arbitrator_fsm_fsm_wait_state_d`](#tx_arbitrator_fsm_fsm_wait_state_d)                           | 0xd38    |        4 | Auto-extracted signal fsm_wait_state_d from tx_arbitrator_fsm.vhd              |
| can_bus.[`tx_arbitrator_fsm_fsm_wait_state_q`](#tx_arbitrator_fsm_fsm_wait_state_q)                           | 0xd3c    |        4 | Auto-extracted signal fsm_wait_state_q from tx_arbitrator_fsm.vhd              |
| can_bus.[`tx_data_cache_tx_cache_mem`](#tx_data_cache_tx_cache_mem)                                           | 0xd40    |        4 | Auto-extracted signal tx_cache_mem from tx_data_cache.vhd                      |
| can_bus.[`tx_shift_reg_tx_sr_output`](#tx_shift_reg_tx_sr_output)                                             | 0xd44    |        4 | Auto-extracted signal tx_sr_output from tx_shift_reg.vhd                       |
| can_bus.[`tx_shift_reg_tx_sr_ce`](#tx_shift_reg_tx_sr_ce)                                                     | 0xd48    |        4 | Auto-extracted signal tx_sr_ce from tx_shift_reg.vhd                           |
| can_bus.[`tx_shift_reg_tx_sr_pload`](#tx_shift_reg_tx_sr_pload)                                               | 0xd4c    |        4 | Auto-extracted signal tx_sr_pload from tx_shift_reg.vhd                        |
| can_bus.[`tx_shift_reg_tx_sr_pload_val`](#tx_shift_reg_tx_sr_pload_val)                                       | 0xd50    |        4 | Auto-extracted signal tx_sr_pload_val from tx_shift_reg.vhd                    |
| can_bus.[`tx_shift_reg_tx_base_id`](#tx_shift_reg_tx_base_id)                                                 | 0xd54    |        4 | Auto-extracted signal tx_base_id from tx_shift_reg.vhd                         |
| can_bus.[`tx_shift_reg_tx_ext_id`](#tx_shift_reg_tx_ext_id)                                                   | 0xd58    |        4 | Auto-extracted signal tx_ext_id from tx_shift_reg.vhd                          |
| can_bus.[`tx_shift_reg_tx_crc`](#tx_shift_reg_tx_crc)                                                         | 0xd5c    |        4 | Auto-extracted signal tx_crc from tx_shift_reg.vhd                             |
| can_bus.[`tx_shift_reg_bst_ctr_grey`](#tx_shift_reg_bst_ctr_grey)                                             | 0xd60    |        4 | Auto-extracted signal bst_ctr_grey from tx_shift_reg.vhd                       |
| can_bus.[`tx_shift_reg_bst_parity`](#tx_shift_reg_bst_parity)                                                 | 0xd64    |        4 | Auto-extracted signal bst_parity from tx_shift_reg.vhd                         |
| can_bus.[`tx_shift_reg_stuff_count`](#tx_shift_reg_stuff_count)                                               | 0xd68    |        4 | Auto-extracted signal stuff_count from tx_shift_reg.vhd                        |
| can_bus.[`txt_buffer_txtb_user_accessible`](#txt_buffer_txtb_user_accessible)                                 | 0xd6c    |        4 | Auto-extracted signal txtb_user_accessible from txt_buffer.vhd                 |
| can_bus.[`txt_buffer_hw_cbs`](#txt_buffer_hw_cbs)                                                             | 0xd70    |        4 | Auto-extracted signal hw_cbs from txt_buffer.vhd                               |
| can_bus.[`txt_buffer_sw_cbs`](#txt_buffer_sw_cbs)                                                             | 0xd74    |        4 | Auto-extracted signal sw_cbs from txt_buffer.vhd                               |
| can_bus.[`txt_buffer_txtb_unmask_data_ram`](#txt_buffer_txtb_unmask_data_ram)                                 | 0xd78    |        4 | Auto-extracted signal txtb_unmask_data_ram from txt_buffer.vhd                 |
| can_bus.[`txt_buffer_txtb_port_b_data_i`](#txt_buffer_txtb_port_b_data_i)                                     | 0xd7c    |        4 | Auto-extracted signal txtb_port_b_data_i from txt_buffer.vhd                   |
| can_bus.[`txt_buffer_ram_write`](#txt_buffer_ram_write)                                                       | 0xd80    |        4 | Auto-extracted signal ram_write from txt_buffer.vhd                            |
| can_bus.[`txt_buffer_ram_read_address`](#txt_buffer_ram_read_address)                                         | 0xd84    |        4 | Auto-extracted signal ram_read_address from txt_buffer.vhd                     |
| can_bus.[`txt_buffer_txtb_ram_clk_en`](#txt_buffer_txtb_ram_clk_en)                                           | 0xd88    |        4 | Auto-extracted signal txtb_ram_clk_en from txt_buffer.vhd                      |
| can_bus.[`txt_buffer_clk_ram`](#txt_buffer_clk_ram)                                                           | 0xd8c    |        4 | Auto-extracted signal clk_ram from txt_buffer.vhd                              |
| can_bus.[`txt_buffer_fsm_abort_applied`](#txt_buffer_fsm_abort_applied)                                       | 0xd90    |        4 | Auto-extracted signal abort_applied from txt_buffer_fsm.vhd                    |
| can_bus.[`txt_buffer_fsm_txt_fsm_ce`](#txt_buffer_fsm_txt_fsm_ce)                                             | 0xd94    |        4 | Auto-extracted signal txt_fsm_ce from txt_buffer_fsm.vhd                       |
| can_bus.[`txt_buffer_fsm_go_to_failed`](#txt_buffer_fsm_go_to_failed)                                         | 0xd98    |        4 | Auto-extracted signal go_to_failed from txt_buffer_fsm.vhd                     |
| can_bus.[`txt_buffer_fsm_transient_state`](#txt_buffer_fsm_transient_state)                                   | 0xd9c    |        4 | Auto-extracted signal transient_state from txt_buffer_fsm.vhd                  |
| can_bus.[`txt_buffer_ram_port_a_address_i`](#txt_buffer_ram_port_a_address_i)                                 | 0xda0    |        4 | Auto-extracted signal port_a_address_i from txt_buffer_ram.vhd                 |
| can_bus.[`txt_buffer_ram_port_a_write_i`](#txt_buffer_ram_port_a_write_i)                                     | 0xda4    |        4 | Auto-extracted signal port_a_write_i from txt_buffer_ram.vhd                   |
| can_bus.[`txt_buffer_ram_port_a_data_in_i`](#txt_buffer_ram_port_a_data_in_i)                                 | 0xda8    |        4 | Auto-extracted signal port_a_data_in_i from txt_buffer_ram.vhd                 |
| can_bus.[`txt_buffer_ram_port_b_address_i`](#txt_buffer_ram_port_b_address_i)                                 | 0xdac    |        4 | Auto-extracted signal port_b_address_i from txt_buffer_ram.vhd                 |
| can_bus.[`txt_buffer_ram_port_b_data_out_i`](#txt_buffer_ram_port_b_data_out_i)                               | 0xdb0    |        4 | Auto-extracted signal port_b_data_out_i from txt_buffer_ram.vhd                |
| can_bus.[`txt_buffer_ram_tst_ena`](#txt_buffer_ram_tst_ena)                                                   | 0xdb4    |        4 | Auto-extracted signal tst_ena from txt_buffer_ram.vhd                          |
| can_bus.[`txt_buffer_ram_tst_addr`](#txt_buffer_ram_tst_addr)                                                 | 0xdb8    |        4 | Auto-extracted signal tst_addr from txt_buffer_ram.vhd                         |
| can_bus.[`access_signaler_be_active`](#access_signaler_be_active)                                             | 0xdbc    |        4 | Auto-extracted signal be_active from access_signaler.vhd                       |
| can_bus.[`access_signaler_access_in`](#access_signaler_access_in)                                             | 0xdc0    |        4 | Auto-extracted signal access_in from access_signaler.vhd                       |
| can_bus.[`access_signaler_access_active`](#access_signaler_access_active)                                     | 0xdc4    |        4 | Auto-extracted signal access_active from access_signaler.vhd                   |
| can_bus.[`access_signaler_access_active_reg`](#access_signaler_access_active_reg)                             | 0xdc8    |        4 | Auto-extracted signal access_active_reg from access_signaler.vhd               |
| can_bus.[`address_decoder_addr_dec_i`](#address_decoder_addr_dec_i)                                           | 0xdcc    |        4 | Auto-extracted signal addr_dec_i from address_decoder.vhd                      |
| can_bus.[`address_decoder_addr_dec_enabled_i`](#address_decoder_addr_dec_enabled_i)                           | 0xdd0    |        4 | Auto-extracted signal addr_dec_enabled_i from address_decoder.vhd              |

## ahb_ifc_hsel_valid
Auto-extracted signal hsel_valid from ahb_ifc.vhd
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ahb_ifc_write_acc_d
Auto-extracted signal write_acc_d from ahb_ifc.vhd
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ahb_ifc_write_acc_q
Auto-extracted signal write_acc_q from ahb_ifc.vhd
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ahb_ifc_haddr_q
Auto-extracted signal haddr_q from ahb_ifc.vhd
- Offset: `0xc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ahb_ifc_h_ready_raw
Auto-extracted signal h_ready_raw from ahb_ifc.vhd
- Offset: `0x10`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ahb_ifc_sbe_d
Auto-extracted signal sbe_d from ahb_ifc.vhd
- Offset: `0x14`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ahb_ifc_sbe_q
Auto-extracted signal sbe_q from ahb_ifc.vhd
- Offset: `0x18`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ahb_ifc_swr_i
Auto-extracted signal swr_i from ahb_ifc.vhd
- Offset: `0x1c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ahb_ifc_srd_i
Auto-extracted signal srd_i from ahb_ifc.vhd
- Offset: `0x20`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_destuffing_discard_stuff_bit
Auto-extracted signal discard_stuff_bit from bit_destuffing.vhd
- Offset: `0x24`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_destuffing_non_fix_to_fix_chng
Auto-extracted signal non_fix_to_fix_chng from bit_destuffing.vhd
- Offset: `0x28`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_destuffing_stuff_lvl_reached
Auto-extracted signal stuff_lvl_reached from bit_destuffing.vhd
- Offset: `0x2c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_destuffing_stuff_rule_violate
Auto-extracted signal stuff_rule_violate from bit_destuffing.vhd
- Offset: `0x30`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_destuffing_enable_prev
Auto-extracted signal enable_prev from bit_destuffing.vhd
- Offset: `0x34`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_destuffing_fixed_prev_q
Auto-extracted signal fixed_prev_q from bit_destuffing.vhd
- Offset: `0x38`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_destuffing_fixed_prev_d
Auto-extracted signal fixed_prev_d from bit_destuffing.vhd
- Offset: `0x3c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_destuffing_same_bits_erase
Auto-extracted signal same_bits_erase from bit_destuffing.vhd
- Offset: `0x40`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_destuffing_destuffed_q
Auto-extracted signal destuffed_q from bit_destuffing.vhd
- Offset: `0x44`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_destuffing_destuffed_d
Auto-extracted signal destuffed_d from bit_destuffing.vhd
- Offset: `0x48`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_destuffing_stuff_err_q
Auto-extracted signal stuff_err_q from bit_destuffing.vhd
- Offset: `0x4c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_destuffing_stuff_err_d
Auto-extracted signal stuff_err_d from bit_destuffing.vhd
- Offset: `0x50`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_destuffing_prev_val_q
Auto-extracted signal prev_val_q from bit_destuffing.vhd
- Offset: `0x54`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_destuffing_prev_val_d
Auto-extracted signal prev_val_d from bit_destuffing.vhd
- Offset: `0x58`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_err_detector_bit_err_d
Auto-extracted signal bit_err_d from bit_err_detector.vhd
- Offset: `0x5c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_err_detector_bit_err_q
Auto-extracted signal bit_err_q from bit_err_detector.vhd
- Offset: `0x60`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_err_detector_bit_err_ssp_capt_d
Auto-extracted signal bit_err_ssp_capt_d from bit_err_detector.vhd
- Offset: `0x64`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_err_detector_bit_err_ssp_capt_q
Auto-extracted signal bit_err_ssp_capt_q from bit_err_detector.vhd
- Offset: `0x68`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_err_detector_bit_err_ssp_valid
Auto-extracted signal bit_err_ssp_valid from bit_err_detector.vhd
- Offset: `0x6c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_err_detector_bit_err_ssp_condition
Auto-extracted signal bit_err_ssp_condition from bit_err_detector.vhd
- Offset: `0x70`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_err_detector_bit_err_norm_valid
Auto-extracted signal bit_err_norm_valid from bit_err_detector.vhd
- Offset: `0x74`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_filter_masked_input
Auto-extracted signal masked_input from bit_filter.vhd
- Offset: `0x78`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_filter_masked_value
Auto-extracted signal masked_value from bit_filter.vhd
- Offset: `0x7c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_segment_meter_sel_tseg1
Auto-extracted signal sel_tseg1 from bit_segment_meter.vhd
- Offset: `0x80`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_segment_meter_exp_seg_length_ce
Auto-extracted signal exp_seg_length_ce from bit_segment_meter.vhd
- Offset: `0x84`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_segment_meter_phase_err_mt_sjw
Auto-extracted signal phase_err_mt_sjw from bit_segment_meter.vhd
- Offset: `0x88`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_segment_meter_phase_err_eq_sjw
Auto-extracted signal phase_err_eq_sjw from bit_segment_meter.vhd
- Offset: `0x8c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_segment_meter_exit_ph2_immediate
Auto-extracted signal exit_ph2_immediate from bit_segment_meter.vhd
- Offset: `0x90`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_segment_meter_exit_segm_regular
Auto-extracted signal exit_segm_regular from bit_segment_meter.vhd
- Offset: `0x94`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_segment_meter_exit_segm_regular_tseg1
Auto-extracted signal exit_segm_regular_tseg1 from bit_segment_meter.vhd
- Offset: `0x98`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_segment_meter_exit_segm_regular_tseg2
Auto-extracted signal exit_segm_regular_tseg2 from bit_segment_meter.vhd
- Offset: `0x9c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_segment_meter_sjw_mt_zero
Auto-extracted signal sjw_mt_zero from bit_segment_meter.vhd
- Offset: `0xa0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_segment_meter_use_basic_segm_length
Auto-extracted signal use_basic_segm_length from bit_segment_meter.vhd
- Offset: `0xa4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_segment_meter_phase_err_sjw_by_one
Auto-extracted signal phase_err_sjw_by_one from bit_segment_meter.vhd
- Offset: `0xa8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_segment_meter_shorten_tseg1_after_tseg2
Auto-extracted signal shorten_tseg1_after_tseg2 from bit_segment_meter.vhd
- Offset: `0xac`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_stuffing_data_out_i
Auto-extracted signal data_out_i from bit_stuffing.vhd
- Offset: `0xb0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_stuffing_data_halt_q
Auto-extracted signal data_halt_q from bit_stuffing.vhd
- Offset: `0xb4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_stuffing_data_halt_d
Auto-extracted signal data_halt_d from bit_stuffing.vhd
- Offset: `0xb8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_stuffing_fixed_reg_q
Auto-extracted signal fixed_reg_q from bit_stuffing.vhd
- Offset: `0xbc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_stuffing_fixed_reg_d
Auto-extracted signal fixed_reg_d from bit_stuffing.vhd
- Offset: `0xc0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_stuffing_enable_prev
Auto-extracted signal enable_prev from bit_stuffing.vhd
- Offset: `0xc4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_stuffing_non_fix_to_fix_chng
Auto-extracted signal non_fix_to_fix_chng from bit_stuffing.vhd
- Offset: `0xc8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_stuffing_stuff_lvl_reached
Auto-extracted signal stuff_lvl_reached from bit_stuffing.vhd
- Offset: `0xcc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_stuffing_same_bits_rst_trig
Auto-extracted signal same_bits_rst_trig from bit_stuffing.vhd
- Offset: `0xd0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_stuffing_same_bits_rst
Auto-extracted signal same_bits_rst from bit_stuffing.vhd
- Offset: `0xd4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_stuffing_insert_stuff_bit
Auto-extracted signal insert_stuff_bit from bit_stuffing.vhd
- Offset: `0xd8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_stuffing_data_out_d_ena
Auto-extracted signal data_out_d_ena from bit_stuffing.vhd
- Offset: `0xdc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_stuffing_data_out_d
Auto-extracted signal data_out_d from bit_stuffing.vhd
- Offset: `0xe0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_stuffing_data_out_ce
Auto-extracted signal data_out_ce from bit_stuffing.vhd
- Offset: `0xe4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_cfg_capture_drv_tq_nbt
Auto-extracted signal drv_tq_nbt from bit_time_cfg_capture.vhd
- Offset: `0xe8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_cfg_capture_drv_prs_nbt
Auto-extracted signal drv_prs_nbt from bit_time_cfg_capture.vhd
- Offset: `0xec`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_cfg_capture_drv_ph1_nbt
Auto-extracted signal drv_ph1_nbt from bit_time_cfg_capture.vhd
- Offset: `0xf0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_cfg_capture_drv_ph2_nbt
Auto-extracted signal drv_ph2_nbt from bit_time_cfg_capture.vhd
- Offset: `0xf4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_cfg_capture_drv_sjw_nbt
Auto-extracted signal drv_sjw_nbt from bit_time_cfg_capture.vhd
- Offset: `0xf8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_cfg_capture_drv_tq_dbt
Auto-extracted signal drv_tq_dbt from bit_time_cfg_capture.vhd
- Offset: `0xfc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_cfg_capture_drv_prs_dbt
Auto-extracted signal drv_prs_dbt from bit_time_cfg_capture.vhd
- Offset: `0x100`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_cfg_capture_drv_ph1_dbt
Auto-extracted signal drv_ph1_dbt from bit_time_cfg_capture.vhd
- Offset: `0x104`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_cfg_capture_drv_ph2_dbt
Auto-extracted signal drv_ph2_dbt from bit_time_cfg_capture.vhd
- Offset: `0x108`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_cfg_capture_drv_sjw_dbt
Auto-extracted signal drv_sjw_dbt from bit_time_cfg_capture.vhd
- Offset: `0x10c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_cfg_capture_tseg1_nbt_d
Auto-extracted signal tseg1_nbt_d from bit_time_cfg_capture.vhd
- Offset: `0x110`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_cfg_capture_tseg1_dbt_d
Auto-extracted signal tseg1_dbt_d from bit_time_cfg_capture.vhd
- Offset: `0x114`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_cfg_capture_drv_ena
Auto-extracted signal drv_ena from bit_time_cfg_capture.vhd
- Offset: `0x118`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_cfg_capture_drv_ena_reg
Auto-extracted signal drv_ena_reg from bit_time_cfg_capture.vhd
- Offset: `0x11c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_cfg_capture_drv_ena_reg_2
Auto-extracted signal drv_ena_reg_2 from bit_time_cfg_capture.vhd
- Offset: `0x120`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_cfg_capture_capture
Auto-extracted signal capture from bit_time_cfg_capture.vhd
- Offset: `0x124`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_counters_tq_counter_d
Auto-extracted signal tq_counter_d from bit_time_counters.vhd
- Offset: `0x128`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_counters_tq_counter_q
Auto-extracted signal tq_counter_q from bit_time_counters.vhd
- Offset: `0x12c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_counters_tq_counter_ce
Auto-extracted signal tq_counter_ce from bit_time_counters.vhd
- Offset: `0x130`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_counters_tq_counter_allow
Auto-extracted signal tq_counter_allow from bit_time_counters.vhd
- Offset: `0x134`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_counters_tq_edge_i
Auto-extracted signal tq_edge_i from bit_time_counters.vhd
- Offset: `0x138`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_counters_segm_counter_d
Auto-extracted signal segm_counter_d from bit_time_counters.vhd
- Offset: `0x13c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_counters_segm_counter_q
Auto-extracted signal segm_counter_q from bit_time_counters.vhd
- Offset: `0x140`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_counters_segm_counter_ce
Auto-extracted signal segm_counter_ce from bit_time_counters.vhd
- Offset: `0x144`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bit_time_fsm_bt_fsm_ce
Auto-extracted signal bt_fsm_ce from bit_time_fsm.vhd
- Offset: `0x148`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_sampling_drv_ena
Auto-extracted signal drv_ena from bus_sampling.vhd
- Offset: `0x14c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_sampling_drv_ssp_offset
Auto-extracted signal drv_ssp_offset from bus_sampling.vhd
- Offset: `0x150`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_sampling_drv_ssp_delay_select
Auto-extracted signal drv_ssp_delay_select from bus_sampling.vhd
- Offset: `0x154`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_sampling_data_rx_synced
Auto-extracted signal data_rx_synced from bus_sampling.vhd
- Offset: `0x158`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_sampling_prev_Sample
Auto-extracted signal prev_Sample from bus_sampling.vhd
- Offset: `0x15c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_sampling_sample_sec_i
Auto-extracted signal sample_sec_i from bus_sampling.vhd
- Offset: `0x160`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_sampling_data_tx_delayed
Auto-extracted signal data_tx_delayed from bus_sampling.vhd
- Offset: `0x164`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_sampling_edge_rx_valid
Auto-extracted signal edge_rx_valid from bus_sampling.vhd
- Offset: `0x168`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_sampling_edge_tx_valid
Auto-extracted signal edge_tx_valid from bus_sampling.vhd
- Offset: `0x16c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_sampling_ssp_delay
Auto-extracted signal ssp_delay from bus_sampling.vhd
- Offset: `0x170`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_sampling_tx_trigger_q
Auto-extracted signal tx_trigger_q from bus_sampling.vhd
- Offset: `0x174`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_sampling_tx_trigger_ssp
Auto-extracted signal tx_trigger_ssp from bus_sampling.vhd
- Offset: `0x178`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_sampling_shift_regs_res_d
Auto-extracted signal shift_regs_res_d from bus_sampling.vhd
- Offset: `0x17c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_sampling_shift_regs_res_q
Auto-extracted signal shift_regs_res_q from bus_sampling.vhd
- Offset: `0x180`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_sampling_shift_regs_res_q_scan
Auto-extracted signal shift_regs_res_q_scan from bus_sampling.vhd
- Offset: `0x184`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_sampling_ssp_enable
Auto-extracted signal ssp_enable from bus_sampling.vhd
- Offset: `0x188`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_traffic_counters_tx_ctr_i
Auto-extracted signal tx_ctr_i from bus_traffic_counters.vhd
- Offset: `0x18c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_traffic_counters_rx_ctr_i
Auto-extracted signal rx_ctr_i from bus_traffic_counters.vhd
- Offset: `0x190`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_traffic_counters_tx_ctr_rst_n_d
Auto-extracted signal tx_ctr_rst_n_d from bus_traffic_counters.vhd
- Offset: `0x194`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_traffic_counters_tx_ctr_rst_n_q
Auto-extracted signal tx_ctr_rst_n_q from bus_traffic_counters.vhd
- Offset: `0x198`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_traffic_counters_tx_ctr_rst_n_q_scan
Auto-extracted signal tx_ctr_rst_n_q_scan from bus_traffic_counters.vhd
- Offset: `0x19c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_traffic_counters_rx_ctr_rst_n_d
Auto-extracted signal rx_ctr_rst_n_d from bus_traffic_counters.vhd
- Offset: `0x1a0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_traffic_counters_rx_ctr_rst_n_q
Auto-extracted signal rx_ctr_rst_n_q from bus_traffic_counters.vhd
- Offset: `0x1a4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## bus_traffic_counters_rx_ctr_rst_n_q_scan
Auto-extracted signal rx_ctr_rst_n_q_scan from bus_traffic_counters.vhd
- Offset: `0x1a8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_apb_tb_s_apb_paddr
Auto-extracted signal s_apb_paddr from can_apb_tb.vhd
- Offset: `0x1ac`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_apb_tb_s_apb_penable
Auto-extracted signal s_apb_penable from can_apb_tb.vhd
- Offset: `0x1b0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_apb_tb_s_apb_pprot
Auto-extracted signal s_apb_pprot from can_apb_tb.vhd
- Offset: `0x1b4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_apb_tb_s_apb_prdata
Auto-extracted signal s_apb_prdata from can_apb_tb.vhd
- Offset: `0x1b8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_apb_tb_s_apb_pready
Auto-extracted signal s_apb_pready from can_apb_tb.vhd
- Offset: `0x1bc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_apb_tb_s_apb_psel
Auto-extracted signal s_apb_psel from can_apb_tb.vhd
- Offset: `0x1c0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_apb_tb_s_apb_pslverr
Auto-extracted signal s_apb_pslverr from can_apb_tb.vhd
- Offset: `0x1c4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_apb_tb_s_apb_pstrb
Auto-extracted signal s_apb_pstrb from can_apb_tb.vhd
- Offset: `0x1c8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_apb_tb_s_apb_pwdata
Auto-extracted signal s_apb_pwdata from can_apb_tb.vhd
- Offset: `0x1cc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_apb_tb_s_apb_pwrite
Auto-extracted signal s_apb_pwrite from can_apb_tb.vhd
- Offset: `0x1d0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_drv_clr_rx_ctr
Auto-extracted signal drv_clr_rx_ctr from can_core.vhd
- Offset: `0x1d4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_drv_clr_tx_ctr
Auto-extracted signal drv_clr_tx_ctr from can_core.vhd
- Offset: `0x1d8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_drv_bus_mon_ena
Auto-extracted signal drv_bus_mon_ena from can_core.vhd
- Offset: `0x1dc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_drv_ena
Auto-extracted signal drv_ena from can_core.vhd
- Offset: `0x1e0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_rec_ident_i
Auto-extracted signal rec_ident_i from can_core.vhd
- Offset: `0x1e4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_rec_dlc_i
Auto-extracted signal rec_dlc_i from can_core.vhd
- Offset: `0x1e8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_rec_ident_type_i
Auto-extracted signal rec_ident_type_i from can_core.vhd
- Offset: `0x1ec`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_rec_frame_type_i
Auto-extracted signal rec_frame_type_i from can_core.vhd
- Offset: `0x1f0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_rec_is_rtr_i
Auto-extracted signal rec_is_rtr_i from can_core.vhd
- Offset: `0x1f4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_rec_brs_i
Auto-extracted signal rec_brs_i from can_core.vhd
- Offset: `0x1f8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_rec_esi_i
Auto-extracted signal rec_esi_i from can_core.vhd
- Offset: `0x1fc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_alc
Auto-extracted signal alc from can_core.vhd
- Offset: `0x200`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_erc_capture
Auto-extracted signal erc_capture from can_core.vhd
- Offset: `0x204`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_transmitter
Auto-extracted signal is_transmitter from can_core.vhd
- Offset: `0x208`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_receiver
Auto-extracted signal is_receiver from can_core.vhd
- Offset: `0x20c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_idle
Auto-extracted signal is_idle from can_core.vhd
- Offset: `0x210`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_arbitration_lost_i
Auto-extracted signal arbitration_lost_i from can_core.vhd
- Offset: `0x214`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_set_transmitter
Auto-extracted signal set_transmitter from can_core.vhd
- Offset: `0x218`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_set_receiver
Auto-extracted signal set_receiver from can_core.vhd
- Offset: `0x21c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_set_idle
Auto-extracted signal set_idle from can_core.vhd
- Offset: `0x220`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_err_active
Auto-extracted signal is_err_active from can_core.vhd
- Offset: `0x224`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_err_passive
Auto-extracted signal is_err_passive from can_core.vhd
- Offset: `0x228`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_bus_off_i
Auto-extracted signal is_bus_off_i from can_core.vhd
- Offset: `0x22c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_err_detected_i
Auto-extracted signal err_detected_i from can_core.vhd
- Offset: `0x230`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_primary_err
Auto-extracted signal primary_err from can_core.vhd
- Offset: `0x234`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_act_err_ovr_flag
Auto-extracted signal act_err_ovr_flag from can_core.vhd
- Offset: `0x238`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_err_delim_late
Auto-extracted signal err_delim_late from can_core.vhd
- Offset: `0x23c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_set_err_active
Auto-extracted signal set_err_active from can_core.vhd
- Offset: `0x240`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_err_ctrs_unchanged
Auto-extracted signal err_ctrs_unchanged from can_core.vhd
- Offset: `0x244`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_stuff_enable
Auto-extracted signal stuff_enable from can_core.vhd
- Offset: `0x248`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_destuff_enable
Auto-extracted signal destuff_enable from can_core.vhd
- Offset: `0x24c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_fixed_stuff
Auto-extracted signal fixed_stuff from can_core.vhd
- Offset: `0x250`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_tx_frame_no_sof
Auto-extracted signal tx_frame_no_sof from can_core.vhd
- Offset: `0x254`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_stuff_length
Auto-extracted signal stuff_length from can_core.vhd
- Offset: `0x258`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_dst_ctr
Auto-extracted signal dst_ctr from can_core.vhd
- Offset: `0x25c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_bst_ctr
Auto-extracted signal bst_ctr from can_core.vhd
- Offset: `0x260`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_stuff_err
Auto-extracted signal stuff_err from can_core.vhd
- Offset: `0x264`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_crc_enable
Auto-extracted signal crc_enable from can_core.vhd
- Offset: `0x268`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_crc_spec_enable
Auto-extracted signal crc_spec_enable from can_core.vhd
- Offset: `0x26c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_crc_calc_from_rx
Auto-extracted signal crc_calc_from_rx from can_core.vhd
- Offset: `0x270`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_crc_15
Auto-extracted signal crc_15 from can_core.vhd
- Offset: `0x274`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_crc_17
Auto-extracted signal crc_17 from can_core.vhd
- Offset: `0x278`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_crc_21
Auto-extracted signal crc_21 from can_core.vhd
- Offset: `0x27c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_sp_control_i
Auto-extracted signal sp_control_i from can_core.vhd
- Offset: `0x280`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_sp_control_q
Auto-extracted signal sp_control_q from can_core.vhd
- Offset: `0x284`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_sync_control_i
Auto-extracted signal sync_control_i from can_core.vhd
- Offset: `0x288`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_ssp_reset_i
Auto-extracted signal ssp_reset_i from can_core.vhd
- Offset: `0x28c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_tran_delay_meas_i
Auto-extracted signal tran_delay_meas_i from can_core.vhd
- Offset: `0x290`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_tran_valid_i
Auto-extracted signal tran_valid_i from can_core.vhd
- Offset: `0x294`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_rec_valid_i
Auto-extracted signal rec_valid_i from can_core.vhd
- Offset: `0x298`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_br_shifted_i
Auto-extracted signal br_shifted_i from can_core.vhd
- Offset: `0x29c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_fcs_changed_i
Auto-extracted signal fcs_changed_i from can_core.vhd
- Offset: `0x2a0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_err_warning_limit_i
Auto-extracted signal err_warning_limit_i from can_core.vhd
- Offset: `0x2a4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_tx_err_ctr
Auto-extracted signal tx_err_ctr from can_core.vhd
- Offset: `0x2a8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_rx_err_ctr
Auto-extracted signal rx_err_ctr from can_core.vhd
- Offset: `0x2ac`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_norm_err_ctr
Auto-extracted signal norm_err_ctr from can_core.vhd
- Offset: `0x2b0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_data_err_ctr
Auto-extracted signal data_err_ctr from can_core.vhd
- Offset: `0x2b4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_pc_tx_trigger
Auto-extracted signal pc_tx_trigger from can_core.vhd
- Offset: `0x2b8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_pc_rx_trigger
Auto-extracted signal pc_rx_trigger from can_core.vhd
- Offset: `0x2bc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_pc_tx_data_nbs
Auto-extracted signal pc_tx_data_nbs from can_core.vhd
- Offset: `0x2c0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_pc_rx_data_nbs
Auto-extracted signal pc_rx_data_nbs from can_core.vhd
- Offset: `0x2c4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_crc_data_tx_wbs
Auto-extracted signal crc_data_tx_wbs from can_core.vhd
- Offset: `0x2c8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_crc_data_tx_nbs
Auto-extracted signal crc_data_tx_nbs from can_core.vhd
- Offset: `0x2cc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_crc_data_rx_wbs
Auto-extracted signal crc_data_rx_wbs from can_core.vhd
- Offset: `0x2d0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_crc_data_rx_nbs
Auto-extracted signal crc_data_rx_nbs from can_core.vhd
- Offset: `0x2d4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_crc_trig_tx_wbs
Auto-extracted signal crc_trig_tx_wbs from can_core.vhd
- Offset: `0x2d8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_crc_trig_tx_nbs
Auto-extracted signal crc_trig_tx_nbs from can_core.vhd
- Offset: `0x2dc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_crc_trig_rx_wbs
Auto-extracted signal crc_trig_rx_wbs from can_core.vhd
- Offset: `0x2e0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_crc_trig_rx_nbs
Auto-extracted signal crc_trig_rx_nbs from can_core.vhd
- Offset: `0x2e4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_bst_data_in
Auto-extracted signal bst_data_in from can_core.vhd
- Offset: `0x2e8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_bst_data_out
Auto-extracted signal bst_data_out from can_core.vhd
- Offset: `0x2ec`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_bst_trigger
Auto-extracted signal bst_trigger from can_core.vhd
- Offset: `0x2f0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_data_halt
Auto-extracted signal data_halt from can_core.vhd
- Offset: `0x2f4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_bds_data_in
Auto-extracted signal bds_data_in from can_core.vhd
- Offset: `0x2f8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_bds_data_out
Auto-extracted signal bds_data_out from can_core.vhd
- Offset: `0x2fc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_bds_trigger
Auto-extracted signal bds_trigger from can_core.vhd
- Offset: `0x300`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_destuffed
Auto-extracted signal destuffed from can_core.vhd
- Offset: `0x304`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_tx_ctr
Auto-extracted signal tx_ctr from can_core.vhd
- Offset: `0x308`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_rx_ctr
Auto-extracted signal rx_ctr from can_core.vhd
- Offset: `0x30c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_tx_data_wbs_i
Auto-extracted signal tx_data_wbs_i from can_core.vhd
- Offset: `0x310`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_lpb_dominant
Auto-extracted signal lpb_dominant from can_core.vhd
- Offset: `0x314`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_form_err
Auto-extracted signal form_err from can_core.vhd
- Offset: `0x318`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_ack_err
Auto-extracted signal ack_err from can_core.vhd
- Offset: `0x31c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_crc_err
Auto-extracted signal crc_err from can_core.vhd
- Offset: `0x320`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_arbitration
Auto-extracted signal is_arbitration from can_core.vhd
- Offset: `0x324`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_control
Auto-extracted signal is_control from can_core.vhd
- Offset: `0x328`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_data
Auto-extracted signal is_data from can_core.vhd
- Offset: `0x32c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_stuff_count
Auto-extracted signal is_stuff_count from can_core.vhd
- Offset: `0x330`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_crc
Auto-extracted signal is_crc from can_core.vhd
- Offset: `0x334`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_crc_delim
Auto-extracted signal is_crc_delim from can_core.vhd
- Offset: `0x338`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_ack_field
Auto-extracted signal is_ack_field from can_core.vhd
- Offset: `0x33c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_ack_delim
Auto-extracted signal is_ack_delim from can_core.vhd
- Offset: `0x340`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_eof
Auto-extracted signal is_eof from can_core.vhd
- Offset: `0x344`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_err_frm
Auto-extracted signal is_err_frm from can_core.vhd
- Offset: `0x348`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_intermission
Auto-extracted signal is_intermission from can_core.vhd
- Offset: `0x34c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_suspend
Auto-extracted signal is_suspend from can_core.vhd
- Offset: `0x350`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_overload_i
Auto-extracted signal is_overload_i from can_core.vhd
- Offset: `0x354`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_sof
Auto-extracted signal is_sof from can_core.vhd
- Offset: `0x358`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_sof_pulse_i
Auto-extracted signal sof_pulse_i from can_core.vhd
- Offset: `0x35c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_load_init_vect
Auto-extracted signal load_init_vect from can_core.vhd
- Offset: `0x360`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_retr_ctr_i
Auto-extracted signal retr_ctr_i from can_core.vhd
- Offset: `0x364`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_decrement_rec
Auto-extracted signal decrement_rec from can_core.vhd
- Offset: `0x368`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_bit_err_after_ack_err
Auto-extracted signal bit_err_after_ack_err from can_core.vhd
- Offset: `0x36c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_core_is_pexs
Auto-extracted signal is_pexs from can_core.vhd
- Offset: `0x370`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_crc_drv_fd_type
Auto-extracted signal drv_fd_type from can_crc.vhd
- Offset: `0x374`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_crc_init_vect_15
Auto-extracted signal init_vect_15 from can_crc.vhd
- Offset: `0x378`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_crc_init_vect_17
Auto-extracted signal init_vect_17 from can_crc.vhd
- Offset: `0x37c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_crc_init_vect_21
Auto-extracted signal init_vect_21 from can_crc.vhd
- Offset: `0x380`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_crc_crc_17_21_data_in
Auto-extracted signal crc_17_21_data_in from can_crc.vhd
- Offset: `0x384`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_crc_crc_17_21_trigger
Auto-extracted signal crc_17_21_trigger from can_crc.vhd
- Offset: `0x388`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_crc_crc_15_data_in
Auto-extracted signal crc_15_data_in from can_crc.vhd
- Offset: `0x38c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_crc_crc_15_trigger
Auto-extracted signal crc_15_trigger from can_crc.vhd
- Offset: `0x390`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_crc_crc_ena_15
Auto-extracted signal crc_ena_15 from can_crc.vhd
- Offset: `0x394`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_crc_crc_ena_17_21
Auto-extracted signal crc_ena_17_21 from can_crc.vhd
- Offset: `0x398`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_ahb_ctu_can_data_in
Auto-extracted signal ctu_can_data_in from can_top_ahb.vhd
- Offset: `0x39c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_ahb_ctu_can_data_out
Auto-extracted signal ctu_can_data_out from can_top_ahb.vhd
- Offset: `0x3a0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_ahb_ctu_can_adress
Auto-extracted signal ctu_can_adress from can_top_ahb.vhd
- Offset: `0x3a4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_ahb_ctu_can_scs
Auto-extracted signal ctu_can_scs from can_top_ahb.vhd
- Offset: `0x3a8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_ahb_ctu_can_srd
Auto-extracted signal ctu_can_srd from can_top_ahb.vhd
- Offset: `0x3ac`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_ahb_ctu_can_swr
Auto-extracted signal ctu_can_swr from can_top_ahb.vhd
- Offset: `0x3b0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_ahb_ctu_can_sbe
Auto-extracted signal ctu_can_sbe from can_top_ahb.vhd
- Offset: `0x3b4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_ahb_res_n_out_i
Auto-extracted signal res_n_out_i from can_top_ahb.vhd
- Offset: `0x3b8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_apb_reg_data_in
Auto-extracted signal reg_data_in from can_top_apb.vhd
- Offset: `0x3bc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_apb_reg_data_out
Auto-extracted signal reg_data_out from can_top_apb.vhd
- Offset: `0x3c0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_apb_reg_addr
Auto-extracted signal reg_addr from can_top_apb.vhd
- Offset: `0x3c4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_apb_reg_be
Auto-extracted signal reg_be from can_top_apb.vhd
- Offset: `0x3c8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_apb_reg_rden
Auto-extracted signal reg_rden from can_top_apb.vhd
- Offset: `0x3cc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_apb_reg_wren
Auto-extracted signal reg_wren from can_top_apb.vhd
- Offset: `0x3d0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_drv_bus
Auto-extracted signal drv_bus from can_top_level.vhd
- Offset: `0x3d4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_stat_bus
Auto-extracted signal stat_bus from can_top_level.vhd
- Offset: `0x3d8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_res_n_sync
Auto-extracted signal res_n_sync from can_top_level.vhd
- Offset: `0x3dc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_res_core_n
Auto-extracted signal res_core_n from can_top_level.vhd
- Offset: `0x3e0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_res_soft_n
Auto-extracted signal res_soft_n from can_top_level.vhd
- Offset: `0x3e4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_sp_control
Auto-extracted signal sp_control from can_top_level.vhd
- Offset: `0x3e8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rx_buf_size
Auto-extracted signal rx_buf_size from can_top_level.vhd
- Offset: `0x3ec`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rx_full
Auto-extracted signal rx_full from can_top_level.vhd
- Offset: `0x3f0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rx_empty
Auto-extracted signal rx_empty from can_top_level.vhd
- Offset: `0x3f4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rx_frame_count
Auto-extracted signal rx_frame_count from can_top_level.vhd
- Offset: `0x3f8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rx_mem_free
Auto-extracted signal rx_mem_free from can_top_level.vhd
- Offset: `0x3fc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rx_read_pointer
Auto-extracted signal rx_read_pointer from can_top_level.vhd
- Offset: `0x400`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rx_write_pointer
Auto-extracted signal rx_write_pointer from can_top_level.vhd
- Offset: `0x404`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rx_data_overrun
Auto-extracted signal rx_data_overrun from can_top_level.vhd
- Offset: `0x408`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rx_read_buff
Auto-extracted signal rx_read_buff from can_top_level.vhd
- Offset: `0x40c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rx_mof
Auto-extracted signal rx_mof from can_top_level.vhd
- Offset: `0x410`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_txtb_port_a_data
Auto-extracted signal txtb_port_a_data from can_top_level.vhd
- Offset: `0x414`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_txtb_port_a_address
Auto-extracted signal txtb_port_a_address from can_top_level.vhd
- Offset: `0x418`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_txtb_port_a_cs
Auto-extracted signal txtb_port_a_cs from can_top_level.vhd
- Offset: `0x41c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_txtb_port_a_be
Auto-extracted signal txtb_port_a_be from can_top_level.vhd
- Offset: `0x420`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_txtb_sw_cmd_index
Auto-extracted signal txtb_sw_cmd_index from can_top_level.vhd
- Offset: `0x424`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_txt_buf_failed_bof
Auto-extracted signal txt_buf_failed_bof from can_top_level.vhd
- Offset: `0x428`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_int_vector
Auto-extracted signal int_vector from can_top_level.vhd
- Offset: `0x42c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_int_ena
Auto-extracted signal int_ena from can_top_level.vhd
- Offset: `0x430`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_int_mask
Auto-extracted signal int_mask from can_top_level.vhd
- Offset: `0x434`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rec_ident
Auto-extracted signal rec_ident from can_top_level.vhd
- Offset: `0x438`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rec_dlc
Auto-extracted signal rec_dlc from can_top_level.vhd
- Offset: `0x43c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rec_ident_type
Auto-extracted signal rec_ident_type from can_top_level.vhd
- Offset: `0x440`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rec_frame_type
Auto-extracted signal rec_frame_type from can_top_level.vhd
- Offset: `0x444`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rec_is_rtr
Auto-extracted signal rec_is_rtr from can_top_level.vhd
- Offset: `0x448`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rec_brs
Auto-extracted signal rec_brs from can_top_level.vhd
- Offset: `0x44c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rec_esi
Auto-extracted signal rec_esi from can_top_level.vhd
- Offset: `0x450`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_store_data_word
Auto-extracted signal store_data_word from can_top_level.vhd
- Offset: `0x454`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_sof_pulse
Auto-extracted signal sof_pulse from can_top_level.vhd
- Offset: `0x458`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_store_metadata
Auto-extracted signal store_metadata from can_top_level.vhd
- Offset: `0x45c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_store_data
Auto-extracted signal store_data from can_top_level.vhd
- Offset: `0x460`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rec_valid
Auto-extracted signal rec_valid from can_top_level.vhd
- Offset: `0x464`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rec_abort
Auto-extracted signal rec_abort from can_top_level.vhd
- Offset: `0x468`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_store_metadata_f
Auto-extracted signal store_metadata_f from can_top_level.vhd
- Offset: `0x46c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_store_data_f
Auto-extracted signal store_data_f from can_top_level.vhd
- Offset: `0x470`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rec_valid_f
Auto-extracted signal rec_valid_f from can_top_level.vhd
- Offset: `0x474`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rec_abort_f
Auto-extracted signal rec_abort_f from can_top_level.vhd
- Offset: `0x478`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_txtb_hw_cmd_int
Auto-extracted signal txtb_hw_cmd_int from can_top_level.vhd
- Offset: `0x47c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_is_bus_off
Auto-extracted signal is_bus_off from can_top_level.vhd
- Offset: `0x480`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_txtb_available
Auto-extracted signal txtb_available from can_top_level.vhd
- Offset: `0x484`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_txtb_port_b_clk_en
Auto-extracted signal txtb_port_b_clk_en from can_top_level.vhd
- Offset: `0x488`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_tran_dlc
Auto-extracted signal tran_dlc from can_top_level.vhd
- Offset: `0x48c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_tran_is_rtr
Auto-extracted signal tran_is_rtr from can_top_level.vhd
- Offset: `0x490`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_tran_ident_type
Auto-extracted signal tran_ident_type from can_top_level.vhd
- Offset: `0x494`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_tran_frame_type
Auto-extracted signal tran_frame_type from can_top_level.vhd
- Offset: `0x498`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_tran_brs
Auto-extracted signal tran_brs from can_top_level.vhd
- Offset: `0x49c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_tran_identifier
Auto-extracted signal tran_identifier from can_top_level.vhd
- Offset: `0x4a0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_tran_word
Auto-extracted signal tran_word from can_top_level.vhd
- Offset: `0x4a4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_tran_frame_valid
Auto-extracted signal tran_frame_valid from can_top_level.vhd
- Offset: `0x4a8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_txtb_changed
Auto-extracted signal txtb_changed from can_top_level.vhd
- Offset: `0x4ac`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_txtb_clk_en
Auto-extracted signal txtb_clk_en from can_top_level.vhd
- Offset: `0x4b0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_err_detected
Auto-extracted signal err_detected from can_top_level.vhd
- Offset: `0x4b4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_fcs_changed
Auto-extracted signal fcs_changed from can_top_level.vhd
- Offset: `0x4b8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_err_warning_limit
Auto-extracted signal err_warning_limit from can_top_level.vhd
- Offset: `0x4bc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_arbitration_lost
Auto-extracted signal arbitration_lost from can_top_level.vhd
- Offset: `0x4c0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_tran_valid
Auto-extracted signal tran_valid from can_top_level.vhd
- Offset: `0x4c4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_br_shifted
Auto-extracted signal br_shifted from can_top_level.vhd
- Offset: `0x4c8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_is_overload
Auto-extracted signal is_overload from can_top_level.vhd
- Offset: `0x4cc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rx_triggers
Auto-extracted signal rx_triggers from can_top_level.vhd
- Offset: `0x4d0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_tx_trigger
Auto-extracted signal tx_trigger from can_top_level.vhd
- Offset: `0x4d4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_sync_control
Auto-extracted signal sync_control from can_top_level.vhd
- Offset: `0x4d8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_no_pos_resync
Auto-extracted signal no_pos_resync from can_top_level.vhd
- Offset: `0x4dc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_nbt_ctrs_en
Auto-extracted signal nbt_ctrs_en from can_top_level.vhd
- Offset: `0x4e0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_dbt_ctrs_en
Auto-extracted signal dbt_ctrs_en from can_top_level.vhd
- Offset: `0x4e4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_trv_delay
Auto-extracted signal trv_delay from can_top_level.vhd
- Offset: `0x4e8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_rx_data_wbs
Auto-extracted signal rx_data_wbs from can_top_level.vhd
- Offset: `0x4ec`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_tx_data_wbs
Auto-extracted signal tx_data_wbs from can_top_level.vhd
- Offset: `0x4f0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_ssp_reset
Auto-extracted signal ssp_reset from can_top_level.vhd
- Offset: `0x4f4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_tran_delay_meas
Auto-extracted signal tran_delay_meas from can_top_level.vhd
- Offset: `0x4f8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_bit_err
Auto-extracted signal bit_err from can_top_level.vhd
- Offset: `0x4fc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_sample_sec
Auto-extracted signal sample_sec from can_top_level.vhd
- Offset: `0x500`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_btmc_reset
Auto-extracted signal btmc_reset from can_top_level.vhd
- Offset: `0x504`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_dbt_measure_start
Auto-extracted signal dbt_measure_start from can_top_level.vhd
- Offset: `0x508`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_gen_first_ssp
Auto-extracted signal gen_first_ssp from can_top_level.vhd
- Offset: `0x50c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_sync_edge
Auto-extracted signal sync_edge from can_top_level.vhd
- Offset: `0x510`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_tq_edge
Auto-extracted signal tq_edge from can_top_level.vhd
- Offset: `0x514`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## can_top_level_tst_rdata_rx_buf
Auto-extracted signal tst_rdata_rx_buf from can_top_level.vhd
- Offset: `0x518`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## clk_gate_clk_en_q
Auto-extracted signal clk_en_q from clk_gate.vhd
- Offset: `0x51c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## control_counter_ctrl_ctr_ce
Auto-extracted signal ctrl_ctr_ce from control_counter.vhd
- Offset: `0x520`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## control_counter_compl_ctr_ce
Auto-extracted signal compl_ctr_ce from control_counter.vhd
- Offset: `0x524`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## control_registers_reg_map_reg_sel
Auto-extracted signal reg_sel from control_registers_reg_map.vhd
- Offset: `0x528`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## control_registers_reg_map_read_data_mux_in
Auto-extracted signal read_data_mux_in from control_registers_reg_map.vhd
- Offset: `0x52c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## control_registers_reg_map_read_data_mask_n
Auto-extracted signal read_data_mask_n from control_registers_reg_map.vhd
- Offset: `0x530`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## control_registers_reg_map_read_mux_ena
Auto-extracted signal read_mux_ena from control_registers_reg_map.vhd
- Offset: `0x534`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## crc_calc_crc_q
Auto-extracted signal crc_q from crc_calc.vhd
- Offset: `0x538`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## crc_calc_crc_nxt
Auto-extracted signal crc_nxt from crc_calc.vhd
- Offset: `0x53c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## crc_calc_crc_shift
Auto-extracted signal crc_shift from crc_calc.vhd
- Offset: `0x540`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## crc_calc_crc_shift_n_xor
Auto-extracted signal crc_shift_n_xor from crc_calc.vhd
- Offset: `0x544`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## crc_calc_crc_d
Auto-extracted signal crc_d from crc_calc.vhd
- Offset: `0x548`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## crc_calc_crc_ce
Auto-extracted signal crc_ce from crc_calc.vhd
- Offset: `0x54c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## data_edge_detector_rx_data_prev
Auto-extracted signal rx_data_prev from data_edge_detector.vhd
- Offset: `0x550`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## data_edge_detector_tx_data_prev
Auto-extracted signal tx_data_prev from data_edge_detector.vhd
- Offset: `0x554`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## data_edge_detector_rx_data_sync_prev
Auto-extracted signal rx_data_sync_prev from data_edge_detector.vhd
- Offset: `0x558`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## data_edge_detector_rx_edge_i
Auto-extracted signal rx_edge_i from data_edge_detector.vhd
- Offset: `0x55c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## data_edge_detector_tx_edge_i
Auto-extracted signal tx_edge_i from data_edge_detector.vhd
- Offset: `0x560`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## data_mux_sel_data
Auto-extracted signal sel_data from data_mux.vhd
- Offset: `0x564`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## data_mux_saturated_data
Auto-extracted signal saturated_data from data_mux.vhd
- Offset: `0x568`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## data_mux_masked_data
Auto-extracted signal masked_data from data_mux.vhd
- Offset: `0x56c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## dlc_decoder_data_len_8_to_64
Auto-extracted signal data_len_8_to_64 from dlc_decoder.vhd
- Offset: `0x570`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## dlc_decoder_data_len_can_2_0
Auto-extracted signal data_len_can_2_0 from dlc_decoder.vhd
- Offset: `0x574`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## dlc_decoder_data_len_can_fd
Auto-extracted signal data_len_can_fd from dlc_decoder.vhd
- Offset: `0x578`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## endian_swapper_swapped
Auto-extracted signal swapped from endian_swapper.vhd
- Offset: `0x57c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_counters_tx_err_ctr_ce
Auto-extracted signal tx_err_ctr_ce from err_counters.vhd
- Offset: `0x580`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_counters_rx_err_ctr_ce
Auto-extracted signal rx_err_ctr_ce from err_counters.vhd
- Offset: `0x584`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_counters_modif_tx_ctr
Auto-extracted signal modif_tx_ctr from err_counters.vhd
- Offset: `0x588`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_counters_modif_rx_ctr
Auto-extracted signal modif_rx_ctr from err_counters.vhd
- Offset: `0x58c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_counters_nom_err_ctr_ce
Auto-extracted signal nom_err_ctr_ce from err_counters.vhd
- Offset: `0x590`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_counters_data_err_ctr_ce
Auto-extracted signal data_err_ctr_ce from err_counters.vhd
- Offset: `0x594`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_counters_res_err_ctrs_d
Auto-extracted signal res_err_ctrs_d from err_counters.vhd
- Offset: `0x598`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_counters_res_err_ctrs_q
Auto-extracted signal res_err_ctrs_q from err_counters.vhd
- Offset: `0x59c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_counters_res_err_ctrs_q_scan
Auto-extracted signal res_err_ctrs_q_scan from err_counters.vhd
- Offset: `0x5a0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_err_frm_req_i
Auto-extracted signal err_frm_req_i from err_detector.vhd
- Offset: `0x5a4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_err_type_d
Auto-extracted signal err_type_d from err_detector.vhd
- Offset: `0x5a8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_err_type_q
Auto-extracted signal err_type_q from err_detector.vhd
- Offset: `0x5ac`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_err_pos_q
Auto-extracted signal err_pos_q from err_detector.vhd
- Offset: `0x5b0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_form_err_i
Auto-extracted signal form_err_i from err_detector.vhd
- Offset: `0x5b4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_crc_match_c
Auto-extracted signal crc_match_c from err_detector.vhd
- Offset: `0x5b8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_crc_match_d
Auto-extracted signal crc_match_d from err_detector.vhd
- Offset: `0x5bc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_crc_match_q
Auto-extracted signal crc_match_q from err_detector.vhd
- Offset: `0x5c0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_dst_ctr_grey
Auto-extracted signal dst_ctr_grey from err_detector.vhd
- Offset: `0x5c4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_dst_parity
Auto-extracted signal dst_parity from err_detector.vhd
- Offset: `0x5c8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_stuff_count_check
Auto-extracted signal stuff_count_check from err_detector.vhd
- Offset: `0x5cc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_crc_15_ok
Auto-extracted signal crc_15_ok from err_detector.vhd
- Offset: `0x5d0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_crc_17_ok
Auto-extracted signal crc_17_ok from err_detector.vhd
- Offset: `0x5d4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_crc_21_ok
Auto-extracted signal crc_21_ok from err_detector.vhd
- Offset: `0x5d8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_stuff_count_ok
Auto-extracted signal stuff_count_ok from err_detector.vhd
- Offset: `0x5dc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_rx_crc_15
Auto-extracted signal rx_crc_15 from err_detector.vhd
- Offset: `0x5e0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_rx_crc_17
Auto-extracted signal rx_crc_17 from err_detector.vhd
- Offset: `0x5e4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## err_detector_rx_crc_21
Auto-extracted signal rx_crc_21 from err_detector.vhd
- Offset: `0x5e8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_drv_ewl
Auto-extracted signal drv_ewl from fault_confinement.vhd
- Offset: `0x5ec`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_drv_erp
Auto-extracted signal drv_erp from fault_confinement.vhd
- Offset: `0x5f0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_drv_ctr_val
Auto-extracted signal drv_ctr_val from fault_confinement.vhd
- Offset: `0x5f4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_drv_ctr_sel
Auto-extracted signal drv_ctr_sel from fault_confinement.vhd
- Offset: `0x5f8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_drv_ena
Auto-extracted signal drv_ena from fault_confinement.vhd
- Offset: `0x5fc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_tx_err_ctr_i
Auto-extracted signal tx_err_ctr_i from fault_confinement.vhd
- Offset: `0x600`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_rx_err_ctr_i
Auto-extracted signal rx_err_ctr_i from fault_confinement.vhd
- Offset: `0x604`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_inc_one
Auto-extracted signal inc_one from fault_confinement.vhd
- Offset: `0x608`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_inc_eight
Auto-extracted signal inc_eight from fault_confinement.vhd
- Offset: `0x60c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_dec_one
Auto-extracted signal dec_one from fault_confinement.vhd
- Offset: `0x610`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_drv_rom_ena
Auto-extracted signal drv_rom_ena from fault_confinement.vhd
- Offset: `0x614`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_fsm_tx_err_ctr_mt_erp
Auto-extracted signal tx_err_ctr_mt_erp from fault_confinement_fsm.vhd
- Offset: `0x618`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_fsm_rx_err_ctr_mt_erp
Auto-extracted signal rx_err_ctr_mt_erp from fault_confinement_fsm.vhd
- Offset: `0x61c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_fsm_tx_err_ctr_mt_ewl
Auto-extracted signal tx_err_ctr_mt_ewl from fault_confinement_fsm.vhd
- Offset: `0x620`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_fsm_rx_err_ctr_mt_ewl
Auto-extracted signal rx_err_ctr_mt_ewl from fault_confinement_fsm.vhd
- Offset: `0x624`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_fsm_tx_err_ctr_mt_255
Auto-extracted signal tx_err_ctr_mt_255 from fault_confinement_fsm.vhd
- Offset: `0x628`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_fsm_err_warning_limit_d
Auto-extracted signal err_warning_limit_d from fault_confinement_fsm.vhd
- Offset: `0x62c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_fsm_err_warning_limit_q
Auto-extracted signal err_warning_limit_q from fault_confinement_fsm.vhd
- Offset: `0x630`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_fsm_fc_fsm_res_d
Auto-extracted signal fc_fsm_res_d from fault_confinement_fsm.vhd
- Offset: `0x634`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_fsm_fc_fsm_res_q
Auto-extracted signal fc_fsm_res_q from fault_confinement_fsm.vhd
- Offset: `0x638`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_rules_inc_one_i
Auto-extracted signal inc_one_i from fault_confinement_rules.vhd
- Offset: `0x63c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## fault_confinement_rules_inc_eight_i
Auto-extracted signal inc_eight_i from fault_confinement_rules.vhd
- Offset: `0x640`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_drv_filter_A_mask
Auto-extracted signal drv_filter_A_mask from frame_filters.vhd
- Offset: `0x644`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_drv_filter_A_ctrl
Auto-extracted signal drv_filter_A_ctrl from frame_filters.vhd
- Offset: `0x648`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_drv_filter_A_bits
Auto-extracted signal drv_filter_A_bits from frame_filters.vhd
- Offset: `0x64c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_int_filter_A_valid
Auto-extracted signal int_filter_A_valid from frame_filters.vhd
- Offset: `0x650`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_drv_filter_B_mask
Auto-extracted signal drv_filter_B_mask from frame_filters.vhd
- Offset: `0x654`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_drv_filter_B_ctrl
Auto-extracted signal drv_filter_B_ctrl from frame_filters.vhd
- Offset: `0x658`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_drv_filter_B_bits
Auto-extracted signal drv_filter_B_bits from frame_filters.vhd
- Offset: `0x65c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_int_filter_B_valid
Auto-extracted signal int_filter_B_valid from frame_filters.vhd
- Offset: `0x660`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_drv_filter_C_mask
Auto-extracted signal drv_filter_C_mask from frame_filters.vhd
- Offset: `0x664`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_drv_filter_C_ctrl
Auto-extracted signal drv_filter_C_ctrl from frame_filters.vhd
- Offset: `0x668`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_drv_filter_C_bits
Auto-extracted signal drv_filter_C_bits from frame_filters.vhd
- Offset: `0x66c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_int_filter_C_valid
Auto-extracted signal int_filter_C_valid from frame_filters.vhd
- Offset: `0x670`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_drv_filter_ran_ctrl
Auto-extracted signal drv_filter_ran_ctrl from frame_filters.vhd
- Offset: `0x674`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_drv_filter_ran_lo_th
Auto-extracted signal drv_filter_ran_lo_th from frame_filters.vhd
- Offset: `0x678`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_drv_filter_ran_hi_th
Auto-extracted signal drv_filter_ran_hi_th from frame_filters.vhd
- Offset: `0x67c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_int_filter_ran_valid
Auto-extracted signal int_filter_ran_valid from frame_filters.vhd
- Offset: `0x680`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_drv_filters_ena
Auto-extracted signal drv_filters_ena from frame_filters.vhd
- Offset: `0x684`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_int_data_type
Auto-extracted signal int_data_type from frame_filters.vhd
- Offset: `0x688`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_int_data_ctrl
Auto-extracted signal int_data_ctrl from frame_filters.vhd
- Offset: `0x68c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_filter_A_enable
Auto-extracted signal filter_A_enable from frame_filters.vhd
- Offset: `0x690`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_filter_B_enable
Auto-extracted signal filter_B_enable from frame_filters.vhd
- Offset: `0x694`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_filter_C_enable
Auto-extracted signal filter_C_enable from frame_filters.vhd
- Offset: `0x698`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_filter_range_enable
Auto-extracted signal filter_range_enable from frame_filters.vhd
- Offset: `0x69c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_filter_result
Auto-extracted signal filter_result from frame_filters.vhd
- Offset: `0x6a0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_ident_valid_d
Auto-extracted signal ident_valid_d from frame_filters.vhd
- Offset: `0x6a4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_ident_valid_q
Auto-extracted signal ident_valid_q from frame_filters.vhd
- Offset: `0x6a8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_drv_drop_remote_frames
Auto-extracted signal drv_drop_remote_frames from frame_filters.vhd
- Offset: `0x6ac`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## frame_filters_drop_rtr_frame
Auto-extracted signal drop_rtr_frame from frame_filters.vhd
- Offset: `0x6b0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## inf_ram_wrapper_int_read_data
Auto-extracted signal int_read_data from inf_ram_wrapper.vhd
- Offset: `0x6b4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## inf_ram_wrapper_byte_we
Auto-extracted signal byte_we from inf_ram_wrapper.vhd
- Offset: `0x6b8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## int_manager_drv_int_vect_clr
Auto-extracted signal drv_int_vect_clr from int_manager.vhd
- Offset: `0x6bc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## int_manager_drv_int_ena_set
Auto-extracted signal drv_int_ena_set from int_manager.vhd
- Offset: `0x6c0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## int_manager_drv_int_ena_clr
Auto-extracted signal drv_int_ena_clr from int_manager.vhd
- Offset: `0x6c4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## int_manager_drv_int_mask_set
Auto-extracted signal drv_int_mask_set from int_manager.vhd
- Offset: `0x6c8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## int_manager_drv_int_mask_clr
Auto-extracted signal drv_int_mask_clr from int_manager.vhd
- Offset: `0x6cc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## int_manager_int_ena_i
Auto-extracted signal int_ena_i from int_manager.vhd
- Offset: `0x6d0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## int_manager_int_mask_i
Auto-extracted signal int_mask_i from int_manager.vhd
- Offset: `0x6d4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## int_manager_int_vect_i
Auto-extracted signal int_vect_i from int_manager.vhd
- Offset: `0x6d8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## int_manager_int_input_active
Auto-extracted signal int_input_active from int_manager.vhd
- Offset: `0x6dc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## int_manager_int_i
Auto-extracted signal int_i from int_manager.vhd
- Offset: `0x6e0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## int_module_int_mask_i
Auto-extracted signal int_mask_i from int_module.vhd
- Offset: `0x6e4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## int_module_int_ena_i
Auto-extracted signal int_ena_i from int_module.vhd
- Offset: `0x6e8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## int_module_int_mask_load
Auto-extracted signal int_mask_load from int_module.vhd
- Offset: `0x6ec`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## int_module_int_mask_next
Auto-extracted signal int_mask_next from int_module.vhd
- Offset: `0x6f0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_reg_reg_value_r
Auto-extracted signal reg_value_r from memory_reg.vhd
- Offset: `0x6f4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_reg_wr_select
Auto-extracted signal wr_select from memory_reg.vhd
- Offset: `0x6f8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_reg_wr_select_expanded
Auto-extracted signal wr_select_expanded from memory_reg.vhd
- Offset: `0x6fc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_status_comb
Auto-extracted signal status_comb from memory_registers.vhd
- Offset: `0x700`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_can_core_cs
Auto-extracted signal can_core_cs from memory_registers.vhd
- Offset: `0x704`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_control_registers_cs
Auto-extracted signal control_registers_cs from memory_registers.vhd
- Offset: `0x708`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_control_registers_cs_reg
Auto-extracted signal control_registers_cs_reg from memory_registers.vhd
- Offset: `0x70c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_test_registers_cs
Auto-extracted signal test_registers_cs from memory_registers.vhd
- Offset: `0x710`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_test_registers_cs_reg
Auto-extracted signal test_registers_cs_reg from memory_registers.vhd
- Offset: `0x714`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_control_registers_rdata
Auto-extracted signal control_registers_rdata from memory_registers.vhd
- Offset: `0x718`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_test_registers_rdata
Auto-extracted signal test_registers_rdata from memory_registers.vhd
- Offset: `0x71c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_is_err_active
Auto-extracted signal is_err_active from memory_registers.vhd
- Offset: `0x720`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_is_err_passive
Auto-extracted signal is_err_passive from memory_registers.vhd
- Offset: `0x724`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_is_bus_off
Auto-extracted signal is_bus_off from memory_registers.vhd
- Offset: `0x728`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_is_transmitter
Auto-extracted signal is_transmitter from memory_registers.vhd
- Offset: `0x72c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_is_receiver
Auto-extracted signal is_receiver from memory_registers.vhd
- Offset: `0x730`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_is_idle
Auto-extracted signal is_idle from memory_registers.vhd
- Offset: `0x734`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_reg_lock_1_active
Auto-extracted signal reg_lock_1_active from memory_registers.vhd
- Offset: `0x738`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_reg_lock_2_active
Auto-extracted signal reg_lock_2_active from memory_registers.vhd
- Offset: `0x73c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_soft_res_q_n
Auto-extracted signal soft_res_q_n from memory_registers.vhd
- Offset: `0x740`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_ewl_padded
Auto-extracted signal ewl_padded from memory_registers.vhd
- Offset: `0x744`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_control_regs_clk_en
Auto-extracted signal control_regs_clk_en from memory_registers.vhd
- Offset: `0x748`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_test_regs_clk_en
Auto-extracted signal test_regs_clk_en from memory_registers.vhd
- Offset: `0x74c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_clk_control_regs
Auto-extracted signal clk_control_regs from memory_registers.vhd
- Offset: `0x750`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_clk_test_regs
Auto-extracted signal clk_test_regs from memory_registers.vhd
- Offset: `0x754`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_rx_buf_mode
Auto-extracted signal rx_buf_mode from memory_registers.vhd
- Offset: `0x758`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_rx_move_cmd
Auto-extracted signal rx_move_cmd from memory_registers.vhd
- Offset: `0x75c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## memory_registers_ctr_pres_sel_q
Auto-extracted signal ctr_pres_sel_q from memory_registers.vhd
- Offset: `0x760`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## operation_control_drv_ena
Auto-extracted signal drv_ena from operation_control.vhd
- Offset: `0x764`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## operation_control_go_to_off
Auto-extracted signal go_to_off from operation_control.vhd
- Offset: `0x768`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_drv_ena
Auto-extracted signal drv_ena from prescaler.vhd
- Offset: `0x76c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_tseg1_nbt
Auto-extracted signal tseg1_nbt from prescaler.vhd
- Offset: `0x770`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_tseg2_nbt
Auto-extracted signal tseg2_nbt from prescaler.vhd
- Offset: `0x774`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_brp_nbt
Auto-extracted signal brp_nbt from prescaler.vhd
- Offset: `0x778`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_sjw_nbt
Auto-extracted signal sjw_nbt from prescaler.vhd
- Offset: `0x77c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_tseg1_dbt
Auto-extracted signal tseg1_dbt from prescaler.vhd
- Offset: `0x780`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_tseg2_dbt
Auto-extracted signal tseg2_dbt from prescaler.vhd
- Offset: `0x784`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_brp_dbt
Auto-extracted signal brp_dbt from prescaler.vhd
- Offset: `0x788`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_sjw_dbt
Auto-extracted signal sjw_dbt from prescaler.vhd
- Offset: `0x78c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_segment_end
Auto-extracted signal segment_end from prescaler.vhd
- Offset: `0x790`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_h_sync_valid
Auto-extracted signal h_sync_valid from prescaler.vhd
- Offset: `0x794`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_is_tseg1
Auto-extracted signal is_tseg1 from prescaler.vhd
- Offset: `0x798`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_is_tseg2
Auto-extracted signal is_tseg2 from prescaler.vhd
- Offset: `0x79c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_resync_edge_valid
Auto-extracted signal resync_edge_valid from prescaler.vhd
- Offset: `0x7a0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_h_sync_edge_valid
Auto-extracted signal h_sync_edge_valid from prescaler.vhd
- Offset: `0x7a4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_segm_counter_nbt
Auto-extracted signal segm_counter_nbt from prescaler.vhd
- Offset: `0x7a8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_segm_counter_dbt
Auto-extracted signal segm_counter_dbt from prescaler.vhd
- Offset: `0x7ac`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_exit_segm_req_nbt
Auto-extracted signal exit_segm_req_nbt from prescaler.vhd
- Offset: `0x7b0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_exit_segm_req_dbt
Auto-extracted signal exit_segm_req_dbt from prescaler.vhd
- Offset: `0x7b4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_tq_edge_nbt
Auto-extracted signal tq_edge_nbt from prescaler.vhd
- Offset: `0x7b8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_tq_edge_dbt
Auto-extracted signal tq_edge_dbt from prescaler.vhd
- Offset: `0x7bc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_rx_trig_req
Auto-extracted signal rx_trig_req from prescaler.vhd
- Offset: `0x7c0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_tx_trig_req
Auto-extracted signal tx_trig_req from prescaler.vhd
- Offset: `0x7c4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_start_edge
Auto-extracted signal start_edge from prescaler.vhd
- Offset: `0x7c8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## prescaler_bt_ctr_clear
Auto-extracted signal bt_ctr_clear from prescaler.vhd
- Offset: `0x7cc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## priority_decoder_l0_valid
Auto-extracted signal l0_valid from priority_decoder.vhd
- Offset: `0x7d0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## priority_decoder_l1_valid
Auto-extracted signal l1_valid from priority_decoder.vhd
- Offset: `0x7d4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## priority_decoder_l1_winner
Auto-extracted signal l1_winner from priority_decoder.vhd
- Offset: `0x7d8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## priority_decoder_l2_valid
Auto-extracted signal l2_valid from priority_decoder.vhd
- Offset: `0x7dc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## priority_decoder_l2_winner
Auto-extracted signal l2_winner from priority_decoder.vhd
- Offset: `0x7e0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## priority_decoder_l3_valid
Auto-extracted signal l3_valid from priority_decoder.vhd
- Offset: `0x7e4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## priority_decoder_l3_winner
Auto-extracted signal l3_winner from priority_decoder.vhd
- Offset: `0x7e8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_drv_can_fd_ena
Auto-extracted signal drv_can_fd_ena from protocol_control.vhd
- Offset: `0x7ec`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_drv_bus_mon_ena
Auto-extracted signal drv_bus_mon_ena from protocol_control.vhd
- Offset: `0x7f0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_drv_retr_lim_ena
Auto-extracted signal drv_retr_lim_ena from protocol_control.vhd
- Offset: `0x7f4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_drv_retr_th
Auto-extracted signal drv_retr_th from protocol_control.vhd
- Offset: `0x7f8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_drv_self_test_ena
Auto-extracted signal drv_self_test_ena from protocol_control.vhd
- Offset: `0x7fc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_drv_ack_forb
Auto-extracted signal drv_ack_forb from protocol_control.vhd
- Offset: `0x800`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_drv_ena
Auto-extracted signal drv_ena from protocol_control.vhd
- Offset: `0x804`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_drv_fd_type
Auto-extracted signal drv_fd_type from protocol_control.vhd
- Offset: `0x808`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_drv_int_loopback_ena
Auto-extracted signal drv_int_loopback_ena from protocol_control.vhd
- Offset: `0x80c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_drv_bus_off_reset
Auto-extracted signal drv_bus_off_reset from protocol_control.vhd
- Offset: `0x810`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_drv_ssp_delay_select
Auto-extracted signal drv_ssp_delay_select from protocol_control.vhd
- Offset: `0x814`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_drv_pex
Auto-extracted signal drv_pex from protocol_control.vhd
- Offset: `0x818`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_drv_cpexs
Auto-extracted signal drv_cpexs from protocol_control.vhd
- Offset: `0x81c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_tran_word_swapped
Auto-extracted signal tran_word_swapped from protocol_control.vhd
- Offset: `0x820`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_err_frm_req
Auto-extracted signal err_frm_req from protocol_control.vhd
- Offset: `0x824`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_tx_load_base_id
Auto-extracted signal tx_load_base_id from protocol_control.vhd
- Offset: `0x828`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_tx_load_ext_id
Auto-extracted signal tx_load_ext_id from protocol_control.vhd
- Offset: `0x82c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_tx_load_dlc
Auto-extracted signal tx_load_dlc from protocol_control.vhd
- Offset: `0x830`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_tx_load_data_word
Auto-extracted signal tx_load_data_word from protocol_control.vhd
- Offset: `0x834`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_tx_load_stuff_count
Auto-extracted signal tx_load_stuff_count from protocol_control.vhd
- Offset: `0x838`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_tx_load_crc
Auto-extracted signal tx_load_crc from protocol_control.vhd
- Offset: `0x83c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_tx_shift_ena
Auto-extracted signal tx_shift_ena from protocol_control.vhd
- Offset: `0x840`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_tx_dominant
Auto-extracted signal tx_dominant from protocol_control.vhd
- Offset: `0x844`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rx_clear
Auto-extracted signal rx_clear from protocol_control.vhd
- Offset: `0x848`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rx_store_base_id
Auto-extracted signal rx_store_base_id from protocol_control.vhd
- Offset: `0x84c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rx_store_ext_id
Auto-extracted signal rx_store_ext_id from protocol_control.vhd
- Offset: `0x850`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rx_store_ide
Auto-extracted signal rx_store_ide from protocol_control.vhd
- Offset: `0x854`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rx_store_rtr
Auto-extracted signal rx_store_rtr from protocol_control.vhd
- Offset: `0x858`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rx_store_edl
Auto-extracted signal rx_store_edl from protocol_control.vhd
- Offset: `0x85c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rx_store_dlc
Auto-extracted signal rx_store_dlc from protocol_control.vhd
- Offset: `0x860`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rx_store_esi
Auto-extracted signal rx_store_esi from protocol_control.vhd
- Offset: `0x864`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rx_store_brs
Auto-extracted signal rx_store_brs from protocol_control.vhd
- Offset: `0x868`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rx_store_stuff_count
Auto-extracted signal rx_store_stuff_count from protocol_control.vhd
- Offset: `0x86c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rx_shift_ena
Auto-extracted signal rx_shift_ena from protocol_control.vhd
- Offset: `0x870`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rx_shift_in_sel
Auto-extracted signal rx_shift_in_sel from protocol_control.vhd
- Offset: `0x874`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rec_is_rtr_i
Auto-extracted signal rec_is_rtr_i from protocol_control.vhd
- Offset: `0x878`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rec_dlc_d
Auto-extracted signal rec_dlc_d from protocol_control.vhd
- Offset: `0x87c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rec_dlc_q
Auto-extracted signal rec_dlc_q from protocol_control.vhd
- Offset: `0x880`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rec_frame_type_i
Auto-extracted signal rec_frame_type_i from protocol_control.vhd
- Offset: `0x884`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_ctrl_ctr_pload
Auto-extracted signal ctrl_ctr_pload from protocol_control.vhd
- Offset: `0x888`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_ctrl_ctr_pload_val
Auto-extracted signal ctrl_ctr_pload_val from protocol_control.vhd
- Offset: `0x88c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_ctrl_ctr_ena
Auto-extracted signal ctrl_ctr_ena from protocol_control.vhd
- Offset: `0x890`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_ctrl_ctr_zero
Auto-extracted signal ctrl_ctr_zero from protocol_control.vhd
- Offset: `0x894`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_ctrl_ctr_one
Auto-extracted signal ctrl_ctr_one from protocol_control.vhd
- Offset: `0x898`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_ctrl_counted_byte
Auto-extracted signal ctrl_counted_byte from protocol_control.vhd
- Offset: `0x89c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_ctrl_counted_byte_index
Auto-extracted signal ctrl_counted_byte_index from protocol_control.vhd
- Offset: `0x8a0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_ctrl_ctr_mem_index
Auto-extracted signal ctrl_ctr_mem_index from protocol_control.vhd
- Offset: `0x8a4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_compl_ctr_ena
Auto-extracted signal compl_ctr_ena from protocol_control.vhd
- Offset: `0x8a8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_reinteg_ctr_clr
Auto-extracted signal reinteg_ctr_clr from protocol_control.vhd
- Offset: `0x8ac`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_reinteg_ctr_enable
Auto-extracted signal reinteg_ctr_enable from protocol_control.vhd
- Offset: `0x8b0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_reinteg_ctr_expired
Auto-extracted signal reinteg_ctr_expired from protocol_control.vhd
- Offset: `0x8b4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_retr_ctr_clear
Auto-extracted signal retr_ctr_clear from protocol_control.vhd
- Offset: `0x8b8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_retr_ctr_add
Auto-extracted signal retr_ctr_add from protocol_control.vhd
- Offset: `0x8bc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_retr_limit_reached
Auto-extracted signal retr_limit_reached from protocol_control.vhd
- Offset: `0x8c0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_form_err_i
Auto-extracted signal form_err_i from protocol_control.vhd
- Offset: `0x8c4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_ack_err_i
Auto-extracted signal ack_err_i from protocol_control.vhd
- Offset: `0x8c8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_crc_check
Auto-extracted signal crc_check from protocol_control.vhd
- Offset: `0x8cc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_bit_err_arb
Auto-extracted signal bit_err_arb from protocol_control.vhd
- Offset: `0x8d0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_crc_match
Auto-extracted signal crc_match from protocol_control.vhd
- Offset: `0x8d4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_crc_err_i
Auto-extracted signal crc_err_i from protocol_control.vhd
- Offset: `0x8d8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_crc_clear_match_flag
Auto-extracted signal crc_clear_match_flag from protocol_control.vhd
- Offset: `0x8dc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_crc_src
Auto-extracted signal crc_src from protocol_control.vhd
- Offset: `0x8e0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_err_pos
Auto-extracted signal err_pos from protocol_control.vhd
- Offset: `0x8e4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_is_arbitration_i
Auto-extracted signal is_arbitration_i from protocol_control.vhd
- Offset: `0x8e8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_bit_err_enable
Auto-extracted signal bit_err_enable from protocol_control.vhd
- Offset: `0x8ec`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_tx_data_nbs_i
Auto-extracted signal tx_data_nbs_i from protocol_control.vhd
- Offset: `0x8f0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rx_crc
Auto-extracted signal rx_crc from protocol_control.vhd
- Offset: `0x8f4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_rx_stuff_count
Auto-extracted signal rx_stuff_count from protocol_control.vhd
- Offset: `0x8f8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fixed_stuff_i
Auto-extracted signal fixed_stuff_i from protocol_control.vhd
- Offset: `0x8fc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_arbitration_lost_i
Auto-extracted signal arbitration_lost_i from protocol_control.vhd
- Offset: `0x900`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_alc_id_field
Auto-extracted signal alc_id_field from protocol_control.vhd
- Offset: `0x904`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_drv_rom_ena
Auto-extracted signal drv_rom_ena from protocol_control.vhd
- Offset: `0x908`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_state_reg_ce
Auto-extracted signal state_reg_ce from protocol_control_fsm.vhd
- Offset: `0x90c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_no_data_transmitter
Auto-extracted signal no_data_transmitter from protocol_control_fsm.vhd
- Offset: `0x910`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_no_data_receiver
Auto-extracted signal no_data_receiver from protocol_control_fsm.vhd
- Offset: `0x914`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_no_data_field
Auto-extracted signal no_data_field from protocol_control_fsm.vhd
- Offset: `0x918`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_ctrl_ctr_pload_i
Auto-extracted signal ctrl_ctr_pload_i from protocol_control_fsm.vhd
- Offset: `0x91c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_ctrl_ctr_pload_unaliged
Auto-extracted signal ctrl_ctr_pload_unaliged from protocol_control_fsm.vhd
- Offset: `0x920`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_crc_use_21
Auto-extracted signal crc_use_21 from protocol_control_fsm.vhd
- Offset: `0x924`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_crc_use_17
Auto-extracted signal crc_use_17 from protocol_control_fsm.vhd
- Offset: `0x928`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_crc_src_i
Auto-extracted signal crc_src_i from protocol_control_fsm.vhd
- Offset: `0x92c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_crc_length_i
Auto-extracted signal crc_length_i from protocol_control_fsm.vhd
- Offset: `0x930`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_tran_data_length
Auto-extracted signal tran_data_length from protocol_control_fsm.vhd
- Offset: `0x934`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_rec_data_length
Auto-extracted signal rec_data_length from protocol_control_fsm.vhd
- Offset: `0x938`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_rec_data_length_c
Auto-extracted signal rec_data_length_c from protocol_control_fsm.vhd
- Offset: `0x93c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_data_length_c
Auto-extracted signal data_length_c from protocol_control_fsm.vhd
- Offset: `0x940`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_data_length_shifted_c
Auto-extracted signal data_length_shifted_c from protocol_control_fsm.vhd
- Offset: `0x944`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_data_length_bits_c
Auto-extracted signal data_length_bits_c from protocol_control_fsm.vhd
- Offset: `0x948`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_is_fd_frame
Auto-extracted signal is_fd_frame from protocol_control_fsm.vhd
- Offset: `0x94c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_frame_start
Auto-extracted signal frame_start from protocol_control_fsm.vhd
- Offset: `0x950`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_tx_frame_ready
Auto-extracted signal tx_frame_ready from protocol_control_fsm.vhd
- Offset: `0x954`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_ide_is_arbitration
Auto-extracted signal ide_is_arbitration from protocol_control_fsm.vhd
- Offset: `0x958`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_arbitration_lost_condition
Auto-extracted signal arbitration_lost_condition from protocol_control_fsm.vhd
- Offset: `0x95c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_arbitration_lost_i
Auto-extracted signal arbitration_lost_i from protocol_control_fsm.vhd
- Offset: `0x960`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_tx_failed
Auto-extracted signal tx_failed from protocol_control_fsm.vhd
- Offset: `0x964`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_store_metadata_d
Auto-extracted signal store_metadata_d from protocol_control_fsm.vhd
- Offset: `0x968`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_store_data_d
Auto-extracted signal store_data_d from protocol_control_fsm.vhd
- Offset: `0x96c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_rec_valid_d
Auto-extracted signal rec_valid_d from protocol_control_fsm.vhd
- Offset: `0x970`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_rec_abort_d
Auto-extracted signal rec_abort_d from protocol_control_fsm.vhd
- Offset: `0x974`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_go_to_suspend
Auto-extracted signal go_to_suspend from protocol_control_fsm.vhd
- Offset: `0x978`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_go_to_stuff_count
Auto-extracted signal go_to_stuff_count from protocol_control_fsm.vhd
- Offset: `0x97c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_rx_store_base_id_i
Auto-extracted signal rx_store_base_id_i from protocol_control_fsm.vhd
- Offset: `0x980`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_rx_store_ext_id_i
Auto-extracted signal rx_store_ext_id_i from protocol_control_fsm.vhd
- Offset: `0x984`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_rx_store_ide_i
Auto-extracted signal rx_store_ide_i from protocol_control_fsm.vhd
- Offset: `0x988`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_rx_store_rtr_i
Auto-extracted signal rx_store_rtr_i from protocol_control_fsm.vhd
- Offset: `0x98c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_rx_store_edl_i
Auto-extracted signal rx_store_edl_i from protocol_control_fsm.vhd
- Offset: `0x990`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_rx_store_dlc_i
Auto-extracted signal rx_store_dlc_i from protocol_control_fsm.vhd
- Offset: `0x994`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_rx_store_esi_i
Auto-extracted signal rx_store_esi_i from protocol_control_fsm.vhd
- Offset: `0x998`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_rx_store_brs_i
Auto-extracted signal rx_store_brs_i from protocol_control_fsm.vhd
- Offset: `0x99c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_rx_store_stuff_count_i
Auto-extracted signal rx_store_stuff_count_i from protocol_control_fsm.vhd
- Offset: `0x9a0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_rx_clear_i
Auto-extracted signal rx_clear_i from protocol_control_fsm.vhd
- Offset: `0x9a4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_tx_load_base_id_i
Auto-extracted signal tx_load_base_id_i from protocol_control_fsm.vhd
- Offset: `0x9a8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_tx_load_ext_id_i
Auto-extracted signal tx_load_ext_id_i from protocol_control_fsm.vhd
- Offset: `0x9ac`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_tx_load_dlc_i
Auto-extracted signal tx_load_dlc_i from protocol_control_fsm.vhd
- Offset: `0x9b0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_tx_load_data_word_i
Auto-extracted signal tx_load_data_word_i from protocol_control_fsm.vhd
- Offset: `0x9b4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_tx_load_stuff_count_i
Auto-extracted signal tx_load_stuff_count_i from protocol_control_fsm.vhd
- Offset: `0x9b8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_tx_load_crc_i
Auto-extracted signal tx_load_crc_i from protocol_control_fsm.vhd
- Offset: `0x9bc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_tx_shift_ena_i
Auto-extracted signal tx_shift_ena_i from protocol_control_fsm.vhd
- Offset: `0x9c0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_form_err_i
Auto-extracted signal form_err_i from protocol_control_fsm.vhd
- Offset: `0x9c4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_ack_err_i
Auto-extracted signal ack_err_i from protocol_control_fsm.vhd
- Offset: `0x9c8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_ack_err_flag
Auto-extracted signal ack_err_flag from protocol_control_fsm.vhd
- Offset: `0x9cc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_ack_err_flag_clr
Auto-extracted signal ack_err_flag_clr from protocol_control_fsm.vhd
- Offset: `0x9d0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_crc_err_i
Auto-extracted signal crc_err_i from protocol_control_fsm.vhd
- Offset: `0x9d4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_bit_err_arb_i
Auto-extracted signal bit_err_arb_i from protocol_control_fsm.vhd
- Offset: `0x9d8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_sp_control_switch_data
Auto-extracted signal sp_control_switch_data from protocol_control_fsm.vhd
- Offset: `0x9dc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_sp_control_switch_nominal
Auto-extracted signal sp_control_switch_nominal from protocol_control_fsm.vhd
- Offset: `0x9e0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_switch_to_ssp
Auto-extracted signal switch_to_ssp from protocol_control_fsm.vhd
- Offset: `0x9e4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_sp_control_ce
Auto-extracted signal sp_control_ce from protocol_control_fsm.vhd
- Offset: `0x9e8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_sp_control_d
Auto-extracted signal sp_control_d from protocol_control_fsm.vhd
- Offset: `0x9ec`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_sp_control_q_i
Auto-extracted signal sp_control_q_i from protocol_control_fsm.vhd
- Offset: `0x9f0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_ssp_reset_i
Auto-extracted signal ssp_reset_i from protocol_control_fsm.vhd
- Offset: `0x9f4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_sync_control_d
Auto-extracted signal sync_control_d from protocol_control_fsm.vhd
- Offset: `0x9f8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_sync_control_q
Auto-extracted signal sync_control_q from protocol_control_fsm.vhd
- Offset: `0x9fc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_perform_hsync
Auto-extracted signal perform_hsync from protocol_control_fsm.vhd
- Offset: `0xa00`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_primary_err_i
Auto-extracted signal primary_err_i from protocol_control_fsm.vhd
- Offset: `0xa04`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_err_delim_late_i
Auto-extracted signal err_delim_late_i from protocol_control_fsm.vhd
- Offset: `0xa08`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_set_err_active_i
Auto-extracted signal set_err_active_i from protocol_control_fsm.vhd
- Offset: `0xa0c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_set_transmitter_i
Auto-extracted signal set_transmitter_i from protocol_control_fsm.vhd
- Offset: `0xa10`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_set_receiver_i
Auto-extracted signal set_receiver_i from protocol_control_fsm.vhd
- Offset: `0xa14`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_set_idle_i
Auto-extracted signal set_idle_i from protocol_control_fsm.vhd
- Offset: `0xa18`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_first_err_delim_d
Auto-extracted signal first_err_delim_d from protocol_control_fsm.vhd
- Offset: `0xa1c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_first_err_delim_q
Auto-extracted signal first_err_delim_q from protocol_control_fsm.vhd
- Offset: `0xa20`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_stuff_enable_set
Auto-extracted signal stuff_enable_set from protocol_control_fsm.vhd
- Offset: `0xa24`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_stuff_enable_clear
Auto-extracted signal stuff_enable_clear from protocol_control_fsm.vhd
- Offset: `0xa28`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_destuff_enable_set
Auto-extracted signal destuff_enable_set from protocol_control_fsm.vhd
- Offset: `0xa2c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_destuff_enable_clear
Auto-extracted signal destuff_enable_clear from protocol_control_fsm.vhd
- Offset: `0xa30`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_bit_err_disable
Auto-extracted signal bit_err_disable from protocol_control_fsm.vhd
- Offset: `0xa34`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_bit_err_disable_receiver
Auto-extracted signal bit_err_disable_receiver from protocol_control_fsm.vhd
- Offset: `0xa38`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_sof_pulse_i
Auto-extracted signal sof_pulse_i from protocol_control_fsm.vhd
- Offset: `0xa3c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_compl_ctr_ena_i
Auto-extracted signal compl_ctr_ena_i from protocol_control_fsm.vhd
- Offset: `0xa40`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_tick_state_reg
Auto-extracted signal tick_state_reg from protocol_control_fsm.vhd
- Offset: `0xa44`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_br_shifted_i
Auto-extracted signal br_shifted_i from protocol_control_fsm.vhd
- Offset: `0xa48`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_is_arbitration_i
Auto-extracted signal is_arbitration_i from protocol_control_fsm.vhd
- Offset: `0xa4c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_crc_spec_enable_i
Auto-extracted signal crc_spec_enable_i from protocol_control_fsm.vhd
- Offset: `0xa50`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_load_init_vect_i
Auto-extracted signal load_init_vect_i from protocol_control_fsm.vhd
- Offset: `0xa54`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_drv_bus_off_reset_q
Auto-extracted signal drv_bus_off_reset_q from protocol_control_fsm.vhd
- Offset: `0xa58`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_retr_ctr_clear_i
Auto-extracted signal retr_ctr_clear_i from protocol_control_fsm.vhd
- Offset: `0xa5c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_retr_ctr_add_i
Auto-extracted signal retr_ctr_add_i from protocol_control_fsm.vhd
- Offset: `0xa60`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_decrement_rec_i
Auto-extracted signal decrement_rec_i from protocol_control_fsm.vhd
- Offset: `0xa64`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_retr_ctr_add_block
Auto-extracted signal retr_ctr_add_block from protocol_control_fsm.vhd
- Offset: `0xa68`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_retr_ctr_add_block_clr
Auto-extracted signal retr_ctr_add_block_clr from protocol_control_fsm.vhd
- Offset: `0xa6c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_block_txtb_unlock
Auto-extracted signal block_txtb_unlock from protocol_control_fsm.vhd
- Offset: `0xa70`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_tx_frame_no_sof_d
Auto-extracted signal tx_frame_no_sof_d from protocol_control_fsm.vhd
- Offset: `0xa74`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_tx_frame_no_sof_q
Auto-extracted signal tx_frame_no_sof_q from protocol_control_fsm.vhd
- Offset: `0xa78`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_ctrl_signal_upd
Auto-extracted signal ctrl_signal_upd from protocol_control_fsm.vhd
- Offset: `0xa7c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_clr_bus_off_rst_flg
Auto-extracted signal clr_bus_off_rst_flg from protocol_control_fsm.vhd
- Offset: `0xa80`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_pex_on_fdf_enable
Auto-extracted signal pex_on_fdf_enable from protocol_control_fsm.vhd
- Offset: `0xa84`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_pex_on_res_enable
Auto-extracted signal pex_on_res_enable from protocol_control_fsm.vhd
- Offset: `0xa88`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_rx_data_nbs_prev
Auto-extracted signal rx_data_nbs_prev from protocol_control_fsm.vhd
- Offset: `0xa8c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_pexs_set
Auto-extracted signal pexs_set from protocol_control_fsm.vhd
- Offset: `0xa90`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_tran_frame_type_i
Auto-extracted signal tran_frame_type_i from protocol_control_fsm.vhd
- Offset: `0xa94`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_txtb_clk_en_d
Auto-extracted signal txtb_clk_en_d from protocol_control_fsm.vhd
- Offset: `0xa98`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## protocol_control_fsm_txtb_clk_en_q
Auto-extracted signal txtb_clk_en_q from protocol_control_fsm.vhd
- Offset: `0xa9c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## reintegration_counter_reinteg_ctr_ce
Auto-extracted signal reinteg_ctr_ce from reintegration_counter.vhd
- Offset: `0xaa0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## retransmitt_counter_retr_ctr_ce
Auto-extracted signal retr_ctr_ce from retransmitt_counter.vhd
- Offset: `0xaa4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rst_sync_rff
Auto-extracted signal rff from rst_sync.vhd
- Offset: `0xaa8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_drv_erase_rx
Auto-extracted signal drv_erase_rx from rx_buffer.vhd
- Offset: `0xaac`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_drv_read_start
Auto-extracted signal drv_read_start from rx_buffer.vhd
- Offset: `0xab0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_drv_clr_ovr
Auto-extracted signal drv_clr_ovr from rx_buffer.vhd
- Offset: `0xab4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_drv_rtsopt
Auto-extracted signal drv_rtsopt from rx_buffer.vhd
- Offset: `0xab8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_read_pointer
Auto-extracted signal read_pointer from rx_buffer.vhd
- Offset: `0xabc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_read_pointer_inc_1
Auto-extracted signal read_pointer_inc_1 from rx_buffer.vhd
- Offset: `0xac0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_write_pointer
Auto-extracted signal write_pointer from rx_buffer.vhd
- Offset: `0xac4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_write_pointer_raw
Auto-extracted signal write_pointer_raw from rx_buffer.vhd
- Offset: `0xac8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_write_pointer_ts
Auto-extracted signal write_pointer_ts from rx_buffer.vhd
- Offset: `0xacc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_rx_mem_free_i
Auto-extracted signal rx_mem_free_i from rx_buffer.vhd
- Offset: `0xad0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_memory_write_data
Auto-extracted signal memory_write_data from rx_buffer.vhd
- Offset: `0xad4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_data_overrun_flg
Auto-extracted signal data_overrun_flg from rx_buffer.vhd
- Offset: `0xad8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_data_overrun_i
Auto-extracted signal data_overrun_i from rx_buffer.vhd
- Offset: `0xadc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_overrun_condition
Auto-extracted signal overrun_condition from rx_buffer.vhd
- Offset: `0xae0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_rx_empty_i
Auto-extracted signal rx_empty_i from rx_buffer.vhd
- Offset: `0xae4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_is_free_word
Auto-extracted signal is_free_word from rx_buffer.vhd
- Offset: `0xae8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_commit_rx_frame
Auto-extracted signal commit_rx_frame from rx_buffer.vhd
- Offset: `0xaec`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_commit_overrun_abort
Auto-extracted signal commit_overrun_abort from rx_buffer.vhd
- Offset: `0xaf0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_read_increment
Auto-extracted signal read_increment from rx_buffer.vhd
- Offset: `0xaf4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_write_raw_OK
Auto-extracted signal write_raw_OK from rx_buffer.vhd
- Offset: `0xaf8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_write_raw_intent
Auto-extracted signal write_raw_intent from rx_buffer.vhd
- Offset: `0xafc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_write_ts
Auto-extracted signal write_ts from rx_buffer.vhd
- Offset: `0xb00`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_stored_ts
Auto-extracted signal stored_ts from rx_buffer.vhd
- Offset: `0xb04`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_data_selector
Auto-extracted signal data_selector from rx_buffer.vhd
- Offset: `0xb08`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_store_ts_wr_ptr
Auto-extracted signal store_ts_wr_ptr from rx_buffer.vhd
- Offset: `0xb0c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_inc_ts_wr_ptr
Auto-extracted signal inc_ts_wr_ptr from rx_buffer.vhd
- Offset: `0xb10`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_reset_overrun_flag
Auto-extracted signal reset_overrun_flag from rx_buffer.vhd
- Offset: `0xb14`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_frame_form_w
Auto-extracted signal frame_form_w from rx_buffer.vhd
- Offset: `0xb18`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_timestamp_capture
Auto-extracted signal timestamp_capture from rx_buffer.vhd
- Offset: `0xb1c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_timestamp_capture_ce
Auto-extracted signal timestamp_capture_ce from rx_buffer.vhd
- Offset: `0xb20`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_RAM_write
Auto-extracted signal RAM_write from rx_buffer.vhd
- Offset: `0xb24`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_RAM_data_out
Auto-extracted signal RAM_data_out from rx_buffer.vhd
- Offset: `0xb28`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_RAM_write_address
Auto-extracted signal RAM_write_address from rx_buffer.vhd
- Offset: `0xb2c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_RAM_read_address
Auto-extracted signal RAM_read_address from rx_buffer.vhd
- Offset: `0xb30`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_rx_buf_res_n_d
Auto-extracted signal rx_buf_res_n_d from rx_buffer.vhd
- Offset: `0xb34`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_rx_buf_res_n_q
Auto-extracted signal rx_buf_res_n_q from rx_buffer.vhd
- Offset: `0xb38`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_rx_buf_res_n_q_scan
Auto-extracted signal rx_buf_res_n_q_scan from rx_buffer.vhd
- Offset: `0xb3c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_rx_buf_ram_clk_en
Auto-extracted signal rx_buf_ram_clk_en from rx_buffer.vhd
- Offset: `0xb40`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_clk_ram
Auto-extracted signal clk_ram from rx_buffer.vhd
- Offset: `0xb44`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_fsm_rx_fsm_ce
Auto-extracted signal rx_fsm_ce from rx_buffer_fsm.vhd
- Offset: `0xb48`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_fsm_cmd_join
Auto-extracted signal cmd_join from rx_buffer_fsm.vhd
- Offset: `0xb4c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_pointers_write_pointer_raw_ce
Auto-extracted signal write_pointer_raw_ce from rx_buffer_pointers.vhd
- Offset: `0xb50`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_pointers_write_pointer_ts_ce
Auto-extracted signal write_pointer_ts_ce from rx_buffer_pointers.vhd
- Offset: `0xb54`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_ram_port_a_address_i
Auto-extracted signal port_a_address_i from rx_buffer_ram.vhd
- Offset: `0xb58`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_ram_port_a_write_i
Auto-extracted signal port_a_write_i from rx_buffer_ram.vhd
- Offset: `0xb5c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_ram_port_a_data_in_i
Auto-extracted signal port_a_data_in_i from rx_buffer_ram.vhd
- Offset: `0xb60`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_ram_port_b_address_i
Auto-extracted signal port_b_address_i from rx_buffer_ram.vhd
- Offset: `0xb64`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_ram_port_b_data_out_i
Auto-extracted signal port_b_data_out_i from rx_buffer_ram.vhd
- Offset: `0xb68`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_ram_tst_ena
Auto-extracted signal tst_ena from rx_buffer_ram.vhd
- Offset: `0xb6c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_buffer_ram_tst_addr
Auto-extracted signal tst_addr from rx_buffer_ram.vhd
- Offset: `0xb70`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_shift_reg_res_n_i_d
Auto-extracted signal res_n_i_d from rx_shift_reg.vhd
- Offset: `0xb74`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_shift_reg_res_n_i_q
Auto-extracted signal res_n_i_q from rx_shift_reg.vhd
- Offset: `0xb78`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_shift_reg_res_n_i_q_scan
Auto-extracted signal res_n_i_q_scan from rx_shift_reg.vhd
- Offset: `0xb7c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_shift_reg_rx_shift_reg_q
Auto-extracted signal rx_shift_reg_q from rx_shift_reg.vhd
- Offset: `0xb80`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_shift_reg_rx_shift_cmd
Auto-extracted signal rx_shift_cmd from rx_shift_reg.vhd
- Offset: `0xb84`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_shift_reg_rx_shift_in_sel_demuxed
Auto-extracted signal rx_shift_in_sel_demuxed from rx_shift_reg.vhd
- Offset: `0xb88`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_shift_reg_rec_is_rtr_i
Auto-extracted signal rec_is_rtr_i from rx_shift_reg.vhd
- Offset: `0xb8c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## rx_shift_reg_rec_frame_type_i
Auto-extracted signal rec_frame_type_i from rx_shift_reg.vhd
- Offset: `0xb90`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## sample_mux_sample
Auto-extracted signal sample from sample_mux.vhd
- Offset: `0xb94`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## sample_mux_prev_sample_d
Auto-extracted signal prev_sample_d from sample_mux.vhd
- Offset: `0xb98`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## sample_mux_prev_sample_q
Auto-extracted signal prev_sample_q from sample_mux.vhd
- Offset: `0xb9c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## segment_end_detector_req_input
Auto-extracted signal req_input from segment_end_detector.vhd
- Offset: `0xba0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## segment_end_detector_segm_end_req_capt_d
Auto-extracted signal segm_end_req_capt_d from segment_end_detector.vhd
- Offset: `0xba4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## segment_end_detector_segm_end_req_capt_q
Auto-extracted signal segm_end_req_capt_q from segment_end_detector.vhd
- Offset: `0xba8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## segment_end_detector_segm_end_req_capt_ce
Auto-extracted signal segm_end_req_capt_ce from segment_end_detector.vhd
- Offset: `0xbac`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## segment_end_detector_segm_end_req_capt_clr
Auto-extracted signal segm_end_req_capt_clr from segment_end_detector.vhd
- Offset: `0xbb0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## segment_end_detector_segm_end_req_capt_dq
Auto-extracted signal segm_end_req_capt_dq from segment_end_detector.vhd
- Offset: `0xbb4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## segment_end_detector_segm_end_nbt_valid
Auto-extracted signal segm_end_nbt_valid from segment_end_detector.vhd
- Offset: `0xbb8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## segment_end_detector_segm_end_dbt_valid
Auto-extracted signal segm_end_dbt_valid from segment_end_detector.vhd
- Offset: `0xbbc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## segment_end_detector_segm_end_nbt_dbt_valid
Auto-extracted signal segm_end_nbt_dbt_valid from segment_end_detector.vhd
- Offset: `0xbc0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## segment_end_detector_tseg1_end_req_valid
Auto-extracted signal tseg1_end_req_valid from segment_end_detector.vhd
- Offset: `0xbc4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## segment_end_detector_tseg2_end_req_valid
Auto-extracted signal tseg2_end_req_valid from segment_end_detector.vhd
- Offset: `0xbc8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## segment_end_detector_h_sync_valid_i
Auto-extracted signal h_sync_valid_i from segment_end_detector.vhd
- Offset: `0xbcc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## segment_end_detector_segment_end_i
Auto-extracted signal segment_end_i from segment_end_detector.vhd
- Offset: `0xbd0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## segment_end_detector_nbt_tq_active
Auto-extracted signal nbt_tq_active from segment_end_detector.vhd
- Offset: `0xbd4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## segment_end_detector_dbt_tq_active
Auto-extracted signal dbt_tq_active from segment_end_detector.vhd
- Offset: `0xbd8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## segment_end_detector_bt_ctr_clear_i
Auto-extracted signal bt_ctr_clear_i from segment_end_detector.vhd
- Offset: `0xbdc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## shift_reg_shift_regs
Auto-extracted signal shift_regs from shift_reg.vhd
- Offset: `0xbe0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## shift_reg_next_shift_reg_val
Auto-extracted signal next_shift_reg_val from shift_reg.vhd
- Offset: `0xbe4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## shift_reg_byte_shift_reg_in
Auto-extracted signal shift_reg_in from shift_reg_byte.vhd
- Offset: `0xbe8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## shift_reg_preload_shift_regs
Auto-extracted signal shift_regs from shift_reg_preload.vhd
- Offset: `0xbec`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## shift_reg_preload_next_shift_reg_val
Auto-extracted signal next_shift_reg_val from shift_reg_preload.vhd
- Offset: `0xbf0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## sig_sync_rff
Auto-extracted signal rff from sig_sync.vhd
- Offset: `0xbf4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_btmc_d
Auto-extracted signal btmc_d from ssp_generator.vhd
- Offset: `0xbf8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_btmc_q
Auto-extracted signal btmc_q from ssp_generator.vhd
- Offset: `0xbfc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_btmc_add
Auto-extracted signal btmc_add from ssp_generator.vhd
- Offset: `0xc00`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_btmc_ce
Auto-extracted signal btmc_ce from ssp_generator.vhd
- Offset: `0xc04`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_btmc_meas_running_d
Auto-extracted signal btmc_meas_running_d from ssp_generator.vhd
- Offset: `0xc08`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_btmc_meas_running_q
Auto-extracted signal btmc_meas_running_q from ssp_generator.vhd
- Offset: `0xc0c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_sspc_d
Auto-extracted signal sspc_d from ssp_generator.vhd
- Offset: `0xc10`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_sspc_q
Auto-extracted signal sspc_q from ssp_generator.vhd
- Offset: `0xc14`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_sspc_ce
Auto-extracted signal sspc_ce from ssp_generator.vhd
- Offset: `0xc18`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_sspc_expired
Auto-extracted signal sspc_expired from ssp_generator.vhd
- Offset: `0xc1c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_sspc_threshold
Auto-extracted signal sspc_threshold from ssp_generator.vhd
- Offset: `0xc20`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_sspc_add
Auto-extracted signal sspc_add from ssp_generator.vhd
- Offset: `0xc24`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_first_ssp_d
Auto-extracted signal first_ssp_d from ssp_generator.vhd
- Offset: `0xc28`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_first_ssp_q
Auto-extracted signal first_ssp_q from ssp_generator.vhd
- Offset: `0xc2c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_sspc_ena_d
Auto-extracted signal sspc_ena_d from ssp_generator.vhd
- Offset: `0xc30`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_sspc_ena_q
Auto-extracted signal sspc_ena_q from ssp_generator.vhd
- Offset: `0xc34`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## ssp_generator_ssp_delay_padded
Auto-extracted signal ssp_delay_padded from ssp_generator.vhd
- Offset: `0xc38`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## synchronisation_checker_resync_edge
Auto-extracted signal resync_edge from synchronisation_checker.vhd
- Offset: `0xc3c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## synchronisation_checker_h_sync_edge
Auto-extracted signal h_sync_edge from synchronisation_checker.vhd
- Offset: `0xc40`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## synchronisation_checker_h_or_re_sync_edge
Auto-extracted signal h_or_re_sync_edge from synchronisation_checker.vhd
- Offset: `0xc44`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## synchronisation_checker_sync_flag
Auto-extracted signal sync_flag from synchronisation_checker.vhd
- Offset: `0xc48`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## synchronisation_checker_sync_flag_ce
Auto-extracted signal sync_flag_ce from synchronisation_checker.vhd
- Offset: `0xc4c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## synchronisation_checker_sync_flag_nxt
Auto-extracted signal sync_flag_nxt from synchronisation_checker.vhd
- Offset: `0xc50`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## test_registers_reg_map_reg_sel
Auto-extracted signal reg_sel from test_registers_reg_map.vhd
- Offset: `0xc54`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## test_registers_reg_map_read_data_mux_in
Auto-extracted signal read_data_mux_in from test_registers_reg_map.vhd
- Offset: `0xc58`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## test_registers_reg_map_read_data_mask_n
Auto-extracted signal read_data_mask_n from test_registers_reg_map.vhd
- Offset: `0xc5c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## test_registers_reg_map_read_mux_ena
Auto-extracted signal read_mux_ena from test_registers_reg_map.vhd
- Offset: `0xc60`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trigger_generator_rx_trig_req_q
Auto-extracted signal rx_trig_req_q from trigger_generator.vhd
- Offset: `0xc64`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trigger_generator_tx_trig_req_flag_d
Auto-extracted signal tx_trig_req_flag_d from trigger_generator.vhd
- Offset: `0xc68`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trigger_generator_tx_trig_req_flag_q
Auto-extracted signal tx_trig_req_flag_q from trigger_generator.vhd
- Offset: `0xc6c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trigger_generator_tx_trig_req_flag_dq
Auto-extracted signal tx_trig_req_flag_dq from trigger_generator.vhd
- Offset: `0xc70`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trigger_mux_tx_trigger_q
Auto-extracted signal tx_trigger_q from trigger_mux.vhd
- Offset: `0xc74`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trv_delay_meas_trv_meas_progress_d
Auto-extracted signal trv_meas_progress_d from trv_delay_meas.vhd
- Offset: `0xc78`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trv_delay_meas_trv_meas_progress_q
Auto-extracted signal trv_meas_progress_q from trv_delay_meas.vhd
- Offset: `0xc7c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trv_delay_meas_trv_meas_progress_del
Auto-extracted signal trv_meas_progress_del from trv_delay_meas.vhd
- Offset: `0xc80`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trv_delay_meas_trv_delay_ctr_q
Auto-extracted signal trv_delay_ctr_q from trv_delay_meas.vhd
- Offset: `0xc84`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trv_delay_meas_trv_delay_ctr_d
Auto-extracted signal trv_delay_ctr_d from trv_delay_meas.vhd
- Offset: `0xc88`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trv_delay_meas_trv_delay_ctr_add
Auto-extracted signal trv_delay_ctr_add from trv_delay_meas.vhd
- Offset: `0xc8c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trv_delay_meas_trv_delay_ctr_q_padded
Auto-extracted signal trv_delay_ctr_q_padded from trv_delay_meas.vhd
- Offset: `0xc90`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trv_delay_meas_trv_delay_ctr_rst_d
Auto-extracted signal trv_delay_ctr_rst_d from trv_delay_meas.vhd
- Offset: `0xc94`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trv_delay_meas_trv_delay_ctr_rst_q
Auto-extracted signal trv_delay_ctr_rst_q from trv_delay_meas.vhd
- Offset: `0xc98`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trv_delay_meas_trv_delay_ctr_rst_q_scan
Auto-extracted signal trv_delay_ctr_rst_q_scan from trv_delay_meas.vhd
- Offset: `0xc9c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trv_delay_meas_ssp_shadow_ce
Auto-extracted signal ssp_shadow_ce from trv_delay_meas.vhd
- Offset: `0xca0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trv_delay_meas_ssp_delay_raw
Auto-extracted signal ssp_delay_raw from trv_delay_meas.vhd
- Offset: `0xca4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trv_delay_meas_ssp_delay_saturated
Auto-extracted signal ssp_delay_saturated from trv_delay_meas.vhd
- Offset: `0xca8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## trv_delay_meas_trv_delay_sum
Auto-extracted signal trv_delay_sum from trv_delay_meas.vhd
- Offset: `0xcac`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_select_buf_avail
Auto-extracted signal select_buf_avail from tx_arbitrator.vhd
- Offset: `0xcb0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_txtb_selected_input
Auto-extracted signal txtb_selected_input from tx_arbitrator.vhd
- Offset: `0xcb4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_txtb_timestamp
Auto-extracted signal txtb_timestamp from tx_arbitrator.vhd
- Offset: `0xcb8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_timestamp_valid
Auto-extracted signal timestamp_valid from tx_arbitrator.vhd
- Offset: `0xcbc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_select_index_changed
Auto-extracted signal select_index_changed from tx_arbitrator.vhd
- Offset: `0xcc0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_validated_buffer
Auto-extracted signal validated_buffer from tx_arbitrator.vhd
- Offset: `0xcc4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_ts_low_internal
Auto-extracted signal ts_low_internal from tx_arbitrator.vhd
- Offset: `0xcc8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_tran_dlc_dbl_buf
Auto-extracted signal tran_dlc_dbl_buf from tx_arbitrator.vhd
- Offset: `0xccc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_tran_is_rtr_dbl_buf
Auto-extracted signal tran_is_rtr_dbl_buf from tx_arbitrator.vhd
- Offset: `0xcd0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_tran_ident_type_dbl_buf
Auto-extracted signal tran_ident_type_dbl_buf from tx_arbitrator.vhd
- Offset: `0xcd4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_tran_frame_type_dbl_buf
Auto-extracted signal tran_frame_type_dbl_buf from tx_arbitrator.vhd
- Offset: `0xcd8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_tran_brs_dbl_buf
Auto-extracted signal tran_brs_dbl_buf from tx_arbitrator.vhd
- Offset: `0xcdc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_tran_dlc_com
Auto-extracted signal tran_dlc_com from tx_arbitrator.vhd
- Offset: `0xce0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_tran_is_rtr_com
Auto-extracted signal tran_is_rtr_com from tx_arbitrator.vhd
- Offset: `0xce4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_tran_ident_type_com
Auto-extracted signal tran_ident_type_com from tx_arbitrator.vhd
- Offset: `0xce8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_tran_frame_type_com
Auto-extracted signal tran_frame_type_com from tx_arbitrator.vhd
- Offset: `0xcec`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_tran_brs_com
Auto-extracted signal tran_brs_com from tx_arbitrator.vhd
- Offset: `0xcf0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_tran_frame_valid_com
Auto-extracted signal tran_frame_valid_com from tx_arbitrator.vhd
- Offset: `0xcf4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_tran_identifier_com
Auto-extracted signal tran_identifier_com from tx_arbitrator.vhd
- Offset: `0xcf8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_load_ts_lw_addr
Auto-extracted signal load_ts_lw_addr from tx_arbitrator.vhd
- Offset: `0xcfc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_load_ts_uw_addr
Auto-extracted signal load_ts_uw_addr from tx_arbitrator.vhd
- Offset: `0xd00`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_load_ffmt_w_addr
Auto-extracted signal load_ffmt_w_addr from tx_arbitrator.vhd
- Offset: `0xd04`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_load_ident_w_addr
Auto-extracted signal load_ident_w_addr from tx_arbitrator.vhd
- Offset: `0xd08`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_store_ts_l_w
Auto-extracted signal store_ts_l_w from tx_arbitrator.vhd
- Offset: `0xd0c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_store_md_w
Auto-extracted signal store_md_w from tx_arbitrator.vhd
- Offset: `0xd10`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_store_ident_w
Auto-extracted signal store_ident_w from tx_arbitrator.vhd
- Offset: `0xd14`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_buffer_md_w
Auto-extracted signal buffer_md_w from tx_arbitrator.vhd
- Offset: `0xd18`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_store_last_txtb_index
Auto-extracted signal store_last_txtb_index from tx_arbitrator.vhd
- Offset: `0xd1c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_frame_valid_com_set
Auto-extracted signal frame_valid_com_set from tx_arbitrator.vhd
- Offset: `0xd20`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_frame_valid_com_clear
Auto-extracted signal frame_valid_com_clear from tx_arbitrator.vhd
- Offset: `0xd24`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_tx_arb_locked
Auto-extracted signal tx_arb_locked from tx_arbitrator.vhd
- Offset: `0xd28`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_txtb_meta_clk_en
Auto-extracted signal txtb_meta_clk_en from tx_arbitrator.vhd
- Offset: `0xd2c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_drv_tttm_ena
Auto-extracted signal drv_tttm_ena from tx_arbitrator.vhd
- Offset: `0xd30`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_fsm_tx_arb_fsm_ce
Auto-extracted signal tx_arb_fsm_ce from tx_arbitrator_fsm.vhd
- Offset: `0xd34`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_fsm_fsm_wait_state_d
Auto-extracted signal fsm_wait_state_d from tx_arbitrator_fsm.vhd
- Offset: `0xd38`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_arbitrator_fsm_fsm_wait_state_q
Auto-extracted signal fsm_wait_state_q from tx_arbitrator_fsm.vhd
- Offset: `0xd3c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_data_cache_tx_cache_mem
Auto-extracted signal tx_cache_mem from tx_data_cache.vhd
- Offset: `0xd40`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_shift_reg_tx_sr_output
Auto-extracted signal tx_sr_output from tx_shift_reg.vhd
- Offset: `0xd44`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_shift_reg_tx_sr_ce
Auto-extracted signal tx_sr_ce from tx_shift_reg.vhd
- Offset: `0xd48`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_shift_reg_tx_sr_pload
Auto-extracted signal tx_sr_pload from tx_shift_reg.vhd
- Offset: `0xd4c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_shift_reg_tx_sr_pload_val
Auto-extracted signal tx_sr_pload_val from tx_shift_reg.vhd
- Offset: `0xd50`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_shift_reg_tx_base_id
Auto-extracted signal tx_base_id from tx_shift_reg.vhd
- Offset: `0xd54`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_shift_reg_tx_ext_id
Auto-extracted signal tx_ext_id from tx_shift_reg.vhd
- Offset: `0xd58`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_shift_reg_tx_crc
Auto-extracted signal tx_crc from tx_shift_reg.vhd
- Offset: `0xd5c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_shift_reg_bst_ctr_grey
Auto-extracted signal bst_ctr_grey from tx_shift_reg.vhd
- Offset: `0xd60`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_shift_reg_bst_parity
Auto-extracted signal bst_parity from tx_shift_reg.vhd
- Offset: `0xd64`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## tx_shift_reg_stuff_count
Auto-extracted signal stuff_count from tx_shift_reg.vhd
- Offset: `0xd68`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_txtb_user_accessible
Auto-extracted signal txtb_user_accessible from txt_buffer.vhd
- Offset: `0xd6c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_hw_cbs
Auto-extracted signal hw_cbs from txt_buffer.vhd
- Offset: `0xd70`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_sw_cbs
Auto-extracted signal sw_cbs from txt_buffer.vhd
- Offset: `0xd74`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_txtb_unmask_data_ram
Auto-extracted signal txtb_unmask_data_ram from txt_buffer.vhd
- Offset: `0xd78`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_txtb_port_b_data_i
Auto-extracted signal txtb_port_b_data_i from txt_buffer.vhd
- Offset: `0xd7c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_ram_write
Auto-extracted signal ram_write from txt_buffer.vhd
- Offset: `0xd80`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_ram_read_address
Auto-extracted signal ram_read_address from txt_buffer.vhd
- Offset: `0xd84`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_txtb_ram_clk_en
Auto-extracted signal txtb_ram_clk_en from txt_buffer.vhd
- Offset: `0xd88`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_clk_ram
Auto-extracted signal clk_ram from txt_buffer.vhd
- Offset: `0xd8c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_fsm_abort_applied
Auto-extracted signal abort_applied from txt_buffer_fsm.vhd
- Offset: `0xd90`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_fsm_txt_fsm_ce
Auto-extracted signal txt_fsm_ce from txt_buffer_fsm.vhd
- Offset: `0xd94`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_fsm_go_to_failed
Auto-extracted signal go_to_failed from txt_buffer_fsm.vhd
- Offset: `0xd98`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_fsm_transient_state
Auto-extracted signal transient_state from txt_buffer_fsm.vhd
- Offset: `0xd9c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_ram_port_a_address_i
Auto-extracted signal port_a_address_i from txt_buffer_ram.vhd
- Offset: `0xda0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_ram_port_a_write_i
Auto-extracted signal port_a_write_i from txt_buffer_ram.vhd
- Offset: `0xda4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_ram_port_a_data_in_i
Auto-extracted signal port_a_data_in_i from txt_buffer_ram.vhd
- Offset: `0xda8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_ram_port_b_address_i
Auto-extracted signal port_b_address_i from txt_buffer_ram.vhd
- Offset: `0xdac`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_ram_port_b_data_out_i
Auto-extracted signal port_b_data_out_i from txt_buffer_ram.vhd
- Offset: `0xdb0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_ram_tst_ena
Auto-extracted signal tst_ena from txt_buffer_ram.vhd
- Offset: `0xdb4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## txt_buffer_ram_tst_addr
Auto-extracted signal tst_addr from txt_buffer_ram.vhd
- Offset: `0xdb8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## access_signaler_be_active
Auto-extracted signal be_active from access_signaler.vhd
- Offset: `0xdbc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## access_signaler_access_in
Auto-extracted signal access_in from access_signaler.vhd
- Offset: `0xdc0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## access_signaler_access_active
Auto-extracted signal access_active from access_signaler.vhd
- Offset: `0xdc4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## access_signaler_access_active_reg
Auto-extracted signal access_active_reg from access_signaler.vhd
- Offset: `0xdc8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## address_decoder_addr_dec_i
Auto-extracted signal addr_dec_i from address_decoder.vhd
- Offset: `0xdcc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

## address_decoder_addr_dec_enabled_i
Auto-extracted signal addr_dec_enabled_i from address_decoder.vhd
- Offset: `0xdd0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "value", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:0  |   rw   |   0x0   | value  | Placeholder 32-bit field for extracted signal |

