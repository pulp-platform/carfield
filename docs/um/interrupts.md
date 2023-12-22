|                           | Interrupt Sink    | Bitwidth                          | Connection                                               |
| ------------------------- | ----------------- | --------------------------------- | -------------------------------------------------------- |
| Peripherals Carfield      |
| intr_wkup_timer_expired_o | 1                 | car_wdt_intrs[0]                  |
| intr_wdog_timer_bark_o    | 1                 | car_wdt_intrs[1]                  |
| nmi_wdog_timer_bark_o     | 1                 | car_wdt_intrs[2]                  |
| wkup_req_o                |                   | 1                                 | car_wdt_intrs[3]                                         |
| aon_timer_rst_req_o       | 1                 | car_wdt_intrs[4]                  |
| irq                       |                   | 1                                 | car_can_intr                                             |
| ch_0_o[0]                 |                   | 1                                 | car_adv_timer_ch0                                        |
| ch_0_o[1]                 |                   | 1                                 | car_adv_timer_ch1                                        |
| ch_0_o[2]                 |                   | 1                                 | car_adv_timer_ch2                                        |
| ch_0_o[3]                 |                   | 1                                 | car_adv_timer_ch3                                        |
| events_o[0]               |                   | 1                                 | car_adv_timer_events[0]                                  |
| events_o[1]               |                   | 1                                 | car_adv_timer_events[1]                                  |
| events_o[2]               |                   | 1                                 | car_adv_timer_events[2]                                  |
| events_o[3]               |                   | 1                                 | car_adv_timer_events[3]                                  |
| irq_lo_o                  |                   | 1                                 | car_sys_timer_lo                                         |
| irq_hi_o                  |                   | 1                                 | car_sys_timer_hi                                         |
| Peripherals Cheshire      |
| zero                      |                   | 1                                 | zero                                                     |
| uart                      |                   | 1                                 | uart                                                     |
| i2c_fmt_threshold         | 1                 | i2c_fmt_threshold                 |
| i2c_rx_threshold          | 1                 | i2c_rx_threshold                  |
| i2c_fmt_overflow          | 1                 | i2c_fmt_overflow                  |
| i2c_rx_overflow           | 1                 | i2c_rx_overflow                   |
| i2c_nak                   |                   | 1                                 | i2c_nak                                                  |
| i2c_scl_interference      | 1                 | i2c_scl_interference              |
| i2c_sda_interference      | 1                 | i2c_sda_interference              |
| i2c_stretch_timeout       | 1                 | i2c_stretch_timeout               |
| i2c_sda_unstable          | 1                 | i2c_sda_unstable                  |
| i2c_cmd_complete          | 1                 | i2c_cmd_complete                  |
| i2c_tx_stretch            | 1                 | i2c_tx_stretch                    |
| i2c_tx_overflow           | 1                 | i2c_tx_overflow                   |
| i2c_acq_full              |                   | 1                                 | i2c_acq_full                                             |
| i2c_unexp_stop            | 1                 | i2c_unexp_stop                    |
| i2c_host_timeout          | 1                 | i2c_host_timeout                  |
| spih_error                |                   | 1                                 | spih_error                                               |
| spih_spi_event            | 1                 | spih_spi_event                    |
| gpio                      |                   | 32                                | gpio                                                     |
| Spatz cluster             |
|                           | msip_i            | 2                                 | hostd_spatzcl_mb_intr_ored | safed_spatzcl_intr_mb       |
|                           | msip_i[0]         | 1                                 | hostd_spatzcl_mb_intr_ored[0] | safed_spatzcl_intr_mb[0] |
|                           | msip_i[1]         | 1                                 | hostd_spatzcl_mb_intr_ored[1] | safed_spatzcl_intr_mb[1] |
|                           | mtip_i            | 2                                 | chs_mti[1:0]                                             |
|                           | mtip_i[0]         | 1                                 | chs_mti[0]                                               |
|                           | mtip_i[1]         | 1                                 | chs_mti[1]                                               |
|                           | meip_i            | 2                                 | \-                                                       |
|                           | seip_i            | 2                                 | \-                                                       |
| HRM Integer Cluster       |
| eoc_o                     |                   | 1                                 | pulpcl_eoc                                               |
|                           | mbox_irq_i        | 1                                 | hostd_pulpcl_mb_intr_ored | safed_pulpcl_intr_mb         |
| Security Island           |
|                           | irq_ibex_i        | 1                                 | hostd_secd_mb_intr_ored | safed_secd_intr_mb             |
| Safety Island             |
|                           | irqs_i            | 128                               | safed_intrs                                              |
| Mailboxes                 | irqs_i[0]         | 1                                 | hostd_safed_mbox_intr[0]                                 |
| irqs_i[1]                 | 1                 | hostd_safed_mbox_intr[1]          | from host domain CVA6#1                                  |
| irqs_i[2]                 | 1                 | secd_safed_mbox_intr              | from sec domain                                          |
| irqs_i[3]                 | 1                 | pulpcl_safed_mbox_intr            | from pulpcl                                              |
| irqs_i[4]                 | 1                 | spatzcl_safed_mbox_intr           | from spatzcl                                             |
| Cheshire peripherals      | irqs[5]           | 1                                 | irqs_distributed_249                                     |
| irqs[6]                   | 1                 | irqs_distributed_250              | uart                                                     |
| irqs[7]                   | 1                 | irqs_distributed_251              | i2c_fmt_threshold                                        |
| irqs[8]                   | 1                 | irqs_distributed_252              | i2c_rx_threshold                                         |
| irqs[9]                   | 1                 | irqs_distributed_253              | i2c_fmt_overflow                                         |
| irqs[10]                  | 1                 | irqs_distributed_254              | i2c_rx_overflow                                          |
| irqs[11]                  | 1                 | irqs_distributed_255              | i2c_nak                                                  |
| irqs[12]                  | 1                 | irqs_distributed_256              | i2c_scl_interference                                     |
| irqs[13]                  | 1                 | irqs_distributed_257              | i2c_sda_interference                                     |
| irqs[14]                  | 1                 | irqs_distributed_258              | i2c_stretch_timeout                                      |
| irqs[15]                  | 1                 | irqs_distributed_259              | i2c_sda_unstable                                         |
| irqs[16]                  | 1                 | irqs_distributed_260              | i2c_cmd_complete                                         |
| irqs[17]                  | 1                 | irqs_distributed_261              | i2c_tx_stretch                                           |
| irqs[18]                  | 1                 | irqs_distributed_262              | i2c_tx_overflow                                          |
| irqs[19]                  | 1                 | irqs_distributed_263              | i2c_acq_full                                             |
| irqs[20]                  | 1                 | irqs_distributed_264              | i2c_unexp_stop                                           |
| irqs[21]                  | 1                 | irqs_distributed_265              | i2c_host_timeout                                         |
| irqs[22]                  | 1                 | irqs_distributed_266              | spih_error                                               |
| irqs[23]                  | 1                 | irqs_distributed_267              | spih_spi_event                                           |
| irqs[55:24]               | 32                | irqs_distributed_299:268          | gpio                                                     |
| PULP cluster EOC          | irqs_i[56]        | 1                                 | irqs_distributed_300                                     |
| Carfield peripherals      | irqs_i[57]        | 1                                 | irqs_distributed_309                                     |
| irqs_i[58]                | 1                 | irqs_distributed_310              | car_wdt_intrs[1]                                         |
| irqs_i[59]                | 1                 | irqs_distributed_311              | car_wdt_intrs[2]                                         |
| irqs_i[60]                | 1                 | irqs_distributed_312              | car_wdt_intrs[3]                                         |
| irqs_i[61]                | 1                 | irqs_distributed_313              | car_wdt_intrs[4]                                         |
| irqs_i[62]                | 1                 | irqs_distributed_314              | car_can_intr                                             |
| irqs_i[63]                | 1                 | irqs_distributed_315              | car_adv_timer_ch0                                        |
| irqs_i[64]                | 1                 | irqs_distributed_316              | car_adv_timer_ch1                                        |
| irqs_i[65]                | 1                 | irqs_distributed_317              | car_adv_timer_ch2                                        |
| irqs_i[66]                | 1                 | irqs_distributed_318              | car_adv_timer_ch3                                        |
| irqs_i[67]                | 1                 | irqs_distributed_319              | car_adv_timer_events[0]                                  |
| irqs_i[68]                | 1                 | irqs_distributed_320              | car_adv_timer_events[1]                                  |
| irqs_i[69]                | 1                 | irqs_distributed_321              | car_adv_timer_events[2]                                  |
| irqs_i[70]                | 1                 | irqs_distributed_322              | car_adv_timer_events[3]                                  |
| irqs_i[71]                | 1                 | irqs_distributed_323              | car_sys_timer_lo                                         |
| irqs_i[72]                | 1                 | irqs_distributed_324              | car_sys_timer_hi                                         |
| Padding to 0s             | irqs_i[127:73]    | 54                                | irqs_distributed_331:325                                 |
| Cheshire                  |
|                           | intr_ext_i        | 32                                | chs_ext_intrs                                            |
|                           | intr_ext_i[0]     | 1                                 | pulpcl_eoc                                               |
|                           | intr_ext_i[2:1]   | 2                                 | pulpcl_hostd_mbox_intr                                   |
|                           | intr_ext_i[4:3]   | 2                                 | spatzcl_hostd_mbox_intr                                  |
|                           | intr_ext_i[6:5]   | 2                                 | safed_hostd_mbox_intr                                    |
|                           | intr_ext_i[8:7]   | 2                                 | secd_hostd_mbox_intr                                     |
|                           | intr_ext_i[9]     | 1                                 | car_wdt_intrs[0]                                         |
|                           | intr_ext_i[10]    | 1                                 | car_wdt_intrs[1]                                         |
|                           | intr_ext_i[11]    | 1                                 | car_wdt_intrs[2]                                         |
|                           | intr_ext_i[12]    | 1                                 | car_wdt_intrs[3]                                         |
|                           | intr_ext_i[13]    | 1                                 | car_wdt_intrs[4]                                         |
|                           | intr_ext_i[14]    | 1                                 | car_can_intr                                             |
|                           | intr_ext_i[15]    | 1                                 | car_adv_timer_ch0                                        |
|                           | intr_ext_i[16]    | 1                                 | car_adv_timer_ch1                                        |
|                           | intr_ext_i[17]    | 1                                 | car_adv_timer_ch2                                        |
|                           | intr_ext_i[18]    | 1                                 | car_adv_timer_ch3                                        |
|                           | intr_ext_i[19]    | 1                                 | car_adv_timer_events[0]                                  |
|                           | intr_ext_i[20]    | 1                                 | car_adv_timer_events[1]                                  |
|                           | intr_ext_i[21]    | 1                                 | car_adv_timer_events[2]                                  |
|                           | intr_ext_i[22]    | 1                                 | car_adv_timer_events[3]                                  |
|                           | intr_ext_i[23]    | 1                                 | car_sys_timer_lo                                         |
|                           | intr_ext_i[24]    | 1                                 | car_sys_timer_hi                                         |
|                           | intr_ext_i[31:25] | 7                                 | 0                                                        |
| meip_ext_o                |                   | 3 (CarfieldNumInterruptibleHarts) | \-                                                       |
| meip_ext_o[0]             |                   | \-                                |
| meip_ext_o[1]             |                   | \-                                |
| meip_ext_o[2]             |                   | \-                                |
| seip_ext_o                |                   | 3 (CarfieldNumInterruptibleHarts) | \-                                                       |
| seip_ext_o[0]             |                   | \-                                |
| seip_ext_o[1]             |                   | \-                                |
| seip_ext_o[2]             |                   | \-                                |
| msip_ext_o                |                   | 3 (CarfieldNumInterruptibleHarts) | \-                                                       |
| msip_ext_o[0]             |                   | \-                                |
| msip_ext_o[1]             |                   | \-                                |
| msip_ext_o[2]             |                   | \-                                |
| mtip_ext_o                |                   | 3 (CarfieldNumInterruptibleHarts) | \-                                                       |
| mtip_ext_o[0]             |                   | \-                                |
| mtip_ext_o[1]             |                   | \-                                |
| mtip_ext_o[2]             |                   | \-                                |