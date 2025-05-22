## Summary

| Name                                                                      | Offset   |   Length | Description                                                                   |
|:--------------------------------------------------------------------------|:---------|---------:|:------------------------------------------------------------------------------|
| serial_link.[`CTRL`](#ctrl)                                               | 0x0      |        4 | Global clock, isolation and reset control configuration                       |
| serial_link.[`ISOLATED`](#isolated)                                       | 0x4      |        4 | Isolation status of AXI ports                                                 |
| serial_link.[`TX_PHY_CLK_DIV_0`](#tx_phy_clk_div)                         | 0x8      |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_1`](#tx_phy_clk_div)                         | 0xc      |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_2`](#tx_phy_clk_div)                         | 0x10     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_3`](#tx_phy_clk_div)                         | 0x14     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_4`](#tx_phy_clk_div)                         | 0x18     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_5`](#tx_phy_clk_div)                         | 0x1c     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_6`](#tx_phy_clk_div)                         | 0x20     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_7`](#tx_phy_clk_div)                         | 0x24     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_8`](#tx_phy_clk_div)                         | 0x28     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_9`](#tx_phy_clk_div)                         | 0x2c     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_10`](#tx_phy_clk_div)                        | 0x30     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_11`](#tx_phy_clk_div)                        | 0x34     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_12`](#tx_phy_clk_div)                        | 0x38     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_13`](#tx_phy_clk_div)                        | 0x3c     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_14`](#tx_phy_clk_div)                        | 0x40     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_15`](#tx_phy_clk_div)                        | 0x44     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_16`](#tx_phy_clk_div)                        | 0x48     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_17`](#tx_phy_clk_div)                        | 0x4c     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_18`](#tx_phy_clk_div)                        | 0x50     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_19`](#tx_phy_clk_div)                        | 0x54     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_20`](#tx_phy_clk_div)                        | 0x58     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_21`](#tx_phy_clk_div)                        | 0x5c     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_22`](#tx_phy_clk_div)                        | 0x60     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_23`](#tx_phy_clk_div)                        | 0x64     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_24`](#tx_phy_clk_div)                        | 0x68     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_25`](#tx_phy_clk_div)                        | 0x6c     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_26`](#tx_phy_clk_div)                        | 0x70     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_27`](#tx_phy_clk_div)                        | 0x74     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_28`](#tx_phy_clk_div)                        | 0x78     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_29`](#tx_phy_clk_div)                        | 0x7c     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_30`](#tx_phy_clk_div)                        | 0x80     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_31`](#tx_phy_clk_div)                        | 0x84     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_32`](#tx_phy_clk_div)                        | 0x88     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_33`](#tx_phy_clk_div)                        | 0x8c     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_34`](#tx_phy_clk_div)                        | 0x90     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_35`](#tx_phy_clk_div)                        | 0x94     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_36`](#tx_phy_clk_div)                        | 0x98     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_DIV_37`](#tx_phy_clk_div)                        | 0x9c     |        4 | Holds clock divider factor for forwarded clock of the TX Phys                 |
| serial_link.[`TX_PHY_CLK_START_0`](#tx_phy_clk_start)                     | 0xa0     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_1`](#tx_phy_clk_start)                     | 0xa4     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_2`](#tx_phy_clk_start)                     | 0xa8     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_3`](#tx_phy_clk_start)                     | 0xac     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_4`](#tx_phy_clk_start)                     | 0xb0     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_5`](#tx_phy_clk_start)                     | 0xb4     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_6`](#tx_phy_clk_start)                     | 0xb8     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_7`](#tx_phy_clk_start)                     | 0xbc     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_8`](#tx_phy_clk_start)                     | 0xc0     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_9`](#tx_phy_clk_start)                     | 0xc4     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_10`](#tx_phy_clk_start)                    | 0xc8     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_11`](#tx_phy_clk_start)                    | 0xcc     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_12`](#tx_phy_clk_start)                    | 0xd0     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_13`](#tx_phy_clk_start)                    | 0xd4     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_14`](#tx_phy_clk_start)                    | 0xd8     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_15`](#tx_phy_clk_start)                    | 0xdc     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_16`](#tx_phy_clk_start)                    | 0xe0     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_17`](#tx_phy_clk_start)                    | 0xe4     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_18`](#tx_phy_clk_start)                    | 0xe8     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_19`](#tx_phy_clk_start)                    | 0xec     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_20`](#tx_phy_clk_start)                    | 0xf0     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_21`](#tx_phy_clk_start)                    | 0xf4     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_22`](#tx_phy_clk_start)                    | 0xf8     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_23`](#tx_phy_clk_start)                    | 0xfc     |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_24`](#tx_phy_clk_start)                    | 0x100    |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_25`](#tx_phy_clk_start)                    | 0x104    |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_26`](#tx_phy_clk_start)                    | 0x108    |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_27`](#tx_phy_clk_start)                    | 0x10c    |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_28`](#tx_phy_clk_start)                    | 0x110    |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_29`](#tx_phy_clk_start)                    | 0x114    |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_30`](#tx_phy_clk_start)                    | 0x118    |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_31`](#tx_phy_clk_start)                    | 0x11c    |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_32`](#tx_phy_clk_start)                    | 0x120    |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_33`](#tx_phy_clk_start)                    | 0x124    |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_34`](#tx_phy_clk_start)                    | 0x128    |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_35`](#tx_phy_clk_start)                    | 0x12c    |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_36`](#tx_phy_clk_start)                    | 0x130    |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_START_37`](#tx_phy_clk_start)                    | 0x134    |        4 | Controls duty cycle and phase of rising edge in TX Phys                       |
| serial_link.[`TX_PHY_CLK_END_0`](#tx_phy_clk_end)                         | 0x138    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_1`](#tx_phy_clk_end)                         | 0x13c    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_2`](#tx_phy_clk_end)                         | 0x140    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_3`](#tx_phy_clk_end)                         | 0x144    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_4`](#tx_phy_clk_end)                         | 0x148    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_5`](#tx_phy_clk_end)                         | 0x14c    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_6`](#tx_phy_clk_end)                         | 0x150    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_7`](#tx_phy_clk_end)                         | 0x154    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_8`](#tx_phy_clk_end)                         | 0x158    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_9`](#tx_phy_clk_end)                         | 0x15c    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_10`](#tx_phy_clk_end)                        | 0x160    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_11`](#tx_phy_clk_end)                        | 0x164    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_12`](#tx_phy_clk_end)                        | 0x168    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_13`](#tx_phy_clk_end)                        | 0x16c    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_14`](#tx_phy_clk_end)                        | 0x170    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_15`](#tx_phy_clk_end)                        | 0x174    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_16`](#tx_phy_clk_end)                        | 0x178    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_17`](#tx_phy_clk_end)                        | 0x17c    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_18`](#tx_phy_clk_end)                        | 0x180    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_19`](#tx_phy_clk_end)                        | 0x184    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_20`](#tx_phy_clk_end)                        | 0x188    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_21`](#tx_phy_clk_end)                        | 0x18c    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_22`](#tx_phy_clk_end)                        | 0x190    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_23`](#tx_phy_clk_end)                        | 0x194    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_24`](#tx_phy_clk_end)                        | 0x198    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_25`](#tx_phy_clk_end)                        | 0x19c    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_26`](#tx_phy_clk_end)                        | 0x1a0    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_27`](#tx_phy_clk_end)                        | 0x1a4    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_28`](#tx_phy_clk_end)                        | 0x1a8    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_29`](#tx_phy_clk_end)                        | 0x1ac    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_30`](#tx_phy_clk_end)                        | 0x1b0    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_31`](#tx_phy_clk_end)                        | 0x1b4    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_32`](#tx_phy_clk_end)                        | 0x1b8    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_33`](#tx_phy_clk_end)                        | 0x1bc    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_34`](#tx_phy_clk_end)                        | 0x1c0    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_35`](#tx_phy_clk_end)                        | 0x1c4    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_36`](#tx_phy_clk_end)                        | 0x1c8    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`TX_PHY_CLK_END_37`](#tx_phy_clk_end)                        | 0x1cc    |        4 | Controls duty cycle and phase of falling edge in TX Phys                      |
| serial_link.[`RAW_MODE_EN`](#raw_mode_en)                                 | 0x1d0    |        4 | Enables Raw mode                                                              |
| serial_link.[`RAW_MODE_IN_CH_SEL`](#raw_mode_in_ch_sel)                   | 0x1d4    |        4 | Receive channel select in RAW mode                                            |
| serial_link.[`RAW_MODE_IN_DATA_VALID_0`](#RAW_MODE_IN_DATA_VALID_0)       | 0x1d8    |        4 | Mask for valid data in RX FIFOs during RAW mode.                              |
| serial_link.[`RAW_MODE_IN_DATA_VALID_1`](#RAW_MODE_IN_DATA_VALID_1)       | 0x1dc    |        4 | Mask for valid data in RX FIFOs during RAW mode.                              |
| serial_link.[`RAW_MODE_IN_DATA`](#raw_mode_in_data)                       | 0x1e0    |        4 | Data received by the selected channel in RAW mode                             |
| serial_link.[`RAW_MODE_OUT_CH_MASK_0`](#RAW_MODE_OUT_CH_MASK_0)           | 0x1e4    |        4 | Selects channels to send out data in RAW mode, '1 corresponds to broadcasting |
| serial_link.[`RAW_MODE_OUT_CH_MASK_1`](#RAW_MODE_OUT_CH_MASK_1)           | 0x1e8    |        4 | Selects channels to send out data in RAW mode, '1 corresponds to broadcasting |
| serial_link.[`RAW_MODE_OUT_DATA_FIFO`](#raw_mode_out_data_fifo)           | 0x1ec    |        4 | Data that will be pushed to the RAW mode output FIFO                          |
| serial_link.[`RAW_MODE_OUT_DATA_FIFO_CTRL`](#raw_mode_out_data_fifo_ctrl) | 0x1f0    |        4 | Status and control register for the RAW mode data out FIFO                    |
| serial_link.[`RAW_MODE_OUT_EN`](#raw_mode_out_en)                         | 0x1f4    |        4 | Enable transmission of data currently hold in the output FIFO                 |
| serial_link.[`FLOW_CONTROL_FIFO_CLEAR`](#flow_control_fifo_clear)         | 0x1f8    |        4 | Clears the flow control Fifo                                                  |
| serial_link.[`CHANNEL_ALLOC_TX_CFG`](#channel_alloc_tx_cfg)               | 0x1fc    |        4 | Configuration settings for the TX side in the channel allocator               |
| serial_link.[`CHANNEL_ALLOC_TX_CH_EN_0`](#CHANNEL_ALLOC_TX_CH_EN_0)       | 0x200    |        4 | Channel enable mask for the TX side.                                          |
| serial_link.[`CHANNEL_ALLOC_TX_CH_EN_1`](#CHANNEL_ALLOC_TX_CH_EN_1)       | 0x204    |        4 | Channel enable mask for the TX side.                                          |
| serial_link.[`CHANNEL_ALLOC_TX_CTRL`](#channel_alloc_tx_ctrl)             | 0x208    |        4 | Soft clear or force flush the TX side of the channel allocator                |
| serial_link.[`CHANNEL_ALLOC_RX_CFG`](#channel_alloc_rx_cfg)               | 0x20c    |        4 | Configuration settings for the RX side in the channel allocator               |
| serial_link.[`CHANNEL_ALLOC_RX_CTRL`](#channel_alloc_rx_ctrl)             | 0x210    |        4 | Soft clear the RX side of the channel allocator                               |
| serial_link.[`CHANNEL_ALLOC_RX_CH_EN_0`](#CHANNEL_ALLOC_RX_CH_EN_0)       | 0x214    |        4 | Channel enable mask for the RX side.                                          |
| serial_link.[`CHANNEL_ALLOC_RX_CH_EN_1`](#CHANNEL_ALLOC_RX_CH_EN_1)       | 0x218    |        4 | Channel enable mask for the RX side.                                          |

## CTRL
Global clock, isolation and reset control configuration
- Offset: `0x0`
- Reset default: `0x302`
- Reset mask: `0x303`

### Fields

```wavejson
{"reg": [{"name": "clk_ena", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "reset_n", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 6}, {"name": "axi_in_isolate", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "axi_out_isolate", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 22}], "config": {"lanes": 1, "fontsize": 10, "vspace": 170}}
```

|  Bits  |  Type  |  Reset  | Name            | Description                                                        |
|:------:|:------:|:-------:|:----------------|:-------------------------------------------------------------------|
| 31:10  |        |         |                 | Reserved                                                           |
|   9    |   rw   |   0x1   | axi_out_isolate | Isolate AXI master out port. (active-high)                         |
|   8    |   rw   |   0x1   | axi_in_isolate  | Isolate AXI slave in port. (active-high)                           |
|  7:2   |        |         |                 | Reserved                                                           |
|   1    |   rw   |   0x1   | reset_n         | SW controlled synchronous reset. (active-low)                      |
|   0    |   rw   |   0x0   | clk_ena         | Clock gate enable for network, link, physical layer. (active-high) |

## ISOLATED
Isolation status of AXI ports
- Offset: `0x4`
- Reset default: `0x3`
- Reset mask: `0x3`

### Fields

```wavejson
{"reg": [{"name": "axi_in", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "axi_out", "bits": 1, "attr": ["ro"], "rotate": -90}, {"bits": 30}], "config": {"lanes": 1, "fontsize": 10, "vspace": 90}}
```

|  Bits  |  Type  |  Reset  | Name    | Description                 |
|:------:|:------:|:-------:|:--------|:----------------------------|
|  31:2  |        |         |         | Reserved                    |
|   1    |   ro   |   0x1   | axi_out | master out isolation status |
|   0    |   ro   |   0x1   | axi_in  | slave in isolation status   |

## TX_PHY_CLK_DIV
Holds clock divider factor for forwarded clock of the TX Phys
- Reset default: `0x8`
- Reset mask: `0x7ff`

### Instances

| Name              | Offset   |
|:------------------|:---------|
| TX_PHY_CLK_DIV_0  | 0x8      |
| TX_PHY_CLK_DIV_1  | 0xc      |
| TX_PHY_CLK_DIV_2  | 0x10     |
| TX_PHY_CLK_DIV_3  | 0x14     |
| TX_PHY_CLK_DIV_4  | 0x18     |
| TX_PHY_CLK_DIV_5  | 0x1c     |
| TX_PHY_CLK_DIV_6  | 0x20     |
| TX_PHY_CLK_DIV_7  | 0x24     |
| TX_PHY_CLK_DIV_8  | 0x28     |
| TX_PHY_CLK_DIV_9  | 0x2c     |
| TX_PHY_CLK_DIV_10 | 0x30     |
| TX_PHY_CLK_DIV_11 | 0x34     |
| TX_PHY_CLK_DIV_12 | 0x38     |
| TX_PHY_CLK_DIV_13 | 0x3c     |
| TX_PHY_CLK_DIV_14 | 0x40     |
| TX_PHY_CLK_DIV_15 | 0x44     |
| TX_PHY_CLK_DIV_16 | 0x48     |
| TX_PHY_CLK_DIV_17 | 0x4c     |
| TX_PHY_CLK_DIV_18 | 0x50     |
| TX_PHY_CLK_DIV_19 | 0x54     |
| TX_PHY_CLK_DIV_20 | 0x58     |
| TX_PHY_CLK_DIV_21 | 0x5c     |
| TX_PHY_CLK_DIV_22 | 0x60     |
| TX_PHY_CLK_DIV_23 | 0x64     |
| TX_PHY_CLK_DIV_24 | 0x68     |
| TX_PHY_CLK_DIV_25 | 0x6c     |
| TX_PHY_CLK_DIV_26 | 0x70     |
| TX_PHY_CLK_DIV_27 | 0x74     |
| TX_PHY_CLK_DIV_28 | 0x78     |
| TX_PHY_CLK_DIV_29 | 0x7c     |
| TX_PHY_CLK_DIV_30 | 0x80     |
| TX_PHY_CLK_DIV_31 | 0x84     |
| TX_PHY_CLK_DIV_32 | 0x88     |
| TX_PHY_CLK_DIV_33 | 0x8c     |
| TX_PHY_CLK_DIV_34 | 0x90     |
| TX_PHY_CLK_DIV_35 | 0x94     |
| TX_PHY_CLK_DIV_36 | 0x98     |
| TX_PHY_CLK_DIV_37 | 0x9c     |


### Fields

```wavejson
{"reg": [{"name": "clk_divs", "bits": 11, "attr": ["rw"], "rotate": 0}, {"bits": 21}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                       |
|:------:|:------:|:-------:|:---------|:----------------------------------|
| 31:11  |        |         |          | Reserved                          |
|  10:0  |   rw   |   0x8   | clk_divs | Clock division factor of TX clock |

## TX_PHY_CLK_START
Controls duty cycle and phase of rising edge in TX Phys
- Reset default: `0x2`
- Reset mask: `0x7ff`

### Instances

| Name                | Offset   |
|:--------------------|:---------|
| TX_PHY_CLK_START_0  | 0xa0     |
| TX_PHY_CLK_START_1  | 0xa4     |
| TX_PHY_CLK_START_2  | 0xa8     |
| TX_PHY_CLK_START_3  | 0xac     |
| TX_PHY_CLK_START_4  | 0xb0     |
| TX_PHY_CLK_START_5  | 0xb4     |
| TX_PHY_CLK_START_6  | 0xb8     |
| TX_PHY_CLK_START_7  | 0xbc     |
| TX_PHY_CLK_START_8  | 0xc0     |
| TX_PHY_CLK_START_9  | 0xc4     |
| TX_PHY_CLK_START_10 | 0xc8     |
| TX_PHY_CLK_START_11 | 0xcc     |
| TX_PHY_CLK_START_12 | 0xd0     |
| TX_PHY_CLK_START_13 | 0xd4     |
| TX_PHY_CLK_START_14 | 0xd8     |
| TX_PHY_CLK_START_15 | 0xdc     |
| TX_PHY_CLK_START_16 | 0xe0     |
| TX_PHY_CLK_START_17 | 0xe4     |
| TX_PHY_CLK_START_18 | 0xe8     |
| TX_PHY_CLK_START_19 | 0xec     |
| TX_PHY_CLK_START_20 | 0xf0     |
| TX_PHY_CLK_START_21 | 0xf4     |
| TX_PHY_CLK_START_22 | 0xf8     |
| TX_PHY_CLK_START_23 | 0xfc     |
| TX_PHY_CLK_START_24 | 0x100    |
| TX_PHY_CLK_START_25 | 0x104    |
| TX_PHY_CLK_START_26 | 0x108    |
| TX_PHY_CLK_START_27 | 0x10c    |
| TX_PHY_CLK_START_28 | 0x110    |
| TX_PHY_CLK_START_29 | 0x114    |
| TX_PHY_CLK_START_30 | 0x118    |
| TX_PHY_CLK_START_31 | 0x11c    |
| TX_PHY_CLK_START_32 | 0x120    |
| TX_PHY_CLK_START_33 | 0x124    |
| TX_PHY_CLK_START_34 | 0x128    |
| TX_PHY_CLK_START_35 | 0x12c    |
| TX_PHY_CLK_START_36 | 0x130    |
| TX_PHY_CLK_START_37 | 0x134    |


### Fields

```wavejson
{"reg": [{"name": "clk_shift_start", "bits": 11, "attr": ["rw"], "rotate": 0}, {"bits": 21}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name            | Description                             |
|:------:|:------:|:-------:|:----------------|:----------------------------------------|
| 31:11  |        |         |                 | Reserved                                |
|  10:0  |   rw   |   0x2   | clk_shift_start | Positive Edge of divided, shifted clock |

## TX_PHY_CLK_END
Controls duty cycle and phase of falling edge in TX Phys
- Reset default: `0x6`
- Reset mask: `0x7ff`

### Instances

| Name              | Offset   |
|:------------------|:---------|
| TX_PHY_CLK_END_0  | 0x138    |
| TX_PHY_CLK_END_1  | 0x13c    |
| TX_PHY_CLK_END_2  | 0x140    |
| TX_PHY_CLK_END_3  | 0x144    |
| TX_PHY_CLK_END_4  | 0x148    |
| TX_PHY_CLK_END_5  | 0x14c    |
| TX_PHY_CLK_END_6  | 0x150    |
| TX_PHY_CLK_END_7  | 0x154    |
| TX_PHY_CLK_END_8  | 0x158    |
| TX_PHY_CLK_END_9  | 0x15c    |
| TX_PHY_CLK_END_10 | 0x160    |
| TX_PHY_CLK_END_11 | 0x164    |
| TX_PHY_CLK_END_12 | 0x168    |
| TX_PHY_CLK_END_13 | 0x16c    |
| TX_PHY_CLK_END_14 | 0x170    |
| TX_PHY_CLK_END_15 | 0x174    |
| TX_PHY_CLK_END_16 | 0x178    |
| TX_PHY_CLK_END_17 | 0x17c    |
| TX_PHY_CLK_END_18 | 0x180    |
| TX_PHY_CLK_END_19 | 0x184    |
| TX_PHY_CLK_END_20 | 0x188    |
| TX_PHY_CLK_END_21 | 0x18c    |
| TX_PHY_CLK_END_22 | 0x190    |
| TX_PHY_CLK_END_23 | 0x194    |
| TX_PHY_CLK_END_24 | 0x198    |
| TX_PHY_CLK_END_25 | 0x19c    |
| TX_PHY_CLK_END_26 | 0x1a0    |
| TX_PHY_CLK_END_27 | 0x1a4    |
| TX_PHY_CLK_END_28 | 0x1a8    |
| TX_PHY_CLK_END_29 | 0x1ac    |
| TX_PHY_CLK_END_30 | 0x1b0    |
| TX_PHY_CLK_END_31 | 0x1b4    |
| TX_PHY_CLK_END_32 | 0x1b8    |
| TX_PHY_CLK_END_33 | 0x1bc    |
| TX_PHY_CLK_END_34 | 0x1c0    |
| TX_PHY_CLK_END_35 | 0x1c4    |
| TX_PHY_CLK_END_36 | 0x1c8    |
| TX_PHY_CLK_END_37 | 0x1cc    |


### Fields

```wavejson
{"reg": [{"name": "clk_shift_end", "bits": 11, "attr": ["rw"], "rotate": 0}, {"bits": 21}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name          | Description                             |
|:------:|:------:|:-------:|:--------------|:----------------------------------------|
| 31:11  |        |         |               | Reserved                                |
|  10:0  |   rw   |   0x6   | clk_shift_end | Negative Edge of divided, shifted clock |

## RAW_MODE_EN
Enables Raw mode
- Offset: `0x1d0`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "RAW_MODE_EN", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 130}}
```

|  Bits  |  Type  |  Reset  | Name        | Description   |
|:------:|:------:|:-------:|:------------|:--------------|
|  31:1  |        |         |             | Reserved      |
|   0    |   wo   |   0x0   | RAW_MODE_EN |               |

## RAW_MODE_IN_CH_SEL
Receive channel select in RAW mode
- Offset: `0x1d4`
- Reset default: `0x0`
- Reset mask: `0x3f`

### Fields

```wavejson
{"reg": [{"name": "RAW_MODE_IN_CH_SEL", "bits": 6, "attr": ["wo"], "rotate": -90}, {"bits": 26}], "config": {"lanes": 1, "fontsize": 10, "vspace": 200}}
```

|  Bits  |  Type  |  Reset  | Name               | Description   |
|:------:|:------:|:-------:|:-------------------|:--------------|
|  31:6  |        |         |                    | Reserved      |
|  5:0   |   wo   |   0x0   | RAW_MODE_IN_CH_SEL |               |

## RAW_MODE_IN_DATA_VALID_0
Mask for valid data in RX FIFOs during RAW mode.
- Offset: `0x1d8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "RAW_MODE_IN_DATA_VALID_0", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_1", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_2", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_3", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_4", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_5", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_6", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_7", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_8", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_9", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_10", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_11", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_12", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_13", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_14", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_15", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_16", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_17", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_18", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_19", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_20", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_21", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_22", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_23", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_24", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_25", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_26", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_27", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_28", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_29", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_30", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_31", "bits": 1, "attr": ["ro"], "rotate": -90}], "config": {"lanes": 1, "fontsize": 10, "vspace": 270}}
```

|  Bits  |  Type  |  Reset  | Name                      | Description   |
|:------:|:------:|:-------:|:--------------------------|:--------------|
|   31   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_31 |               |
|   30   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_30 |               |
|   29   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_29 |               |
|   28   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_28 |               |
|   27   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_27 |               |
|   26   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_26 |               |
|   25   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_25 |               |
|   24   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_24 |               |
|   23   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_23 |               |
|   22   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_22 |               |
|   21   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_21 |               |
|   20   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_20 |               |
|   19   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_19 |               |
|   18   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_18 |               |
|   17   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_17 |               |
|   16   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_16 |               |
|   15   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_15 |               |
|   14   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_14 |               |
|   13   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_13 |               |
|   12   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_12 |               |
|   11   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_11 |               |
|   10   |   ro   |    x    | RAW_MODE_IN_DATA_VALID_10 |               |
|   9    |   ro   |    x    | RAW_MODE_IN_DATA_VALID_9  |               |
|   8    |   ro   |    x    | RAW_MODE_IN_DATA_VALID_8  |               |
|   7    |   ro   |    x    | RAW_MODE_IN_DATA_VALID_7  |               |
|   6    |   ro   |    x    | RAW_MODE_IN_DATA_VALID_6  |               |
|   5    |   ro   |    x    | RAW_MODE_IN_DATA_VALID_5  |               |
|   4    |   ro   |    x    | RAW_MODE_IN_DATA_VALID_4  |               |
|   3    |   ro   |    x    | RAW_MODE_IN_DATA_VALID_3  |               |
|   2    |   ro   |    x    | RAW_MODE_IN_DATA_VALID_2  |               |
|   1    |   ro   |    x    | RAW_MODE_IN_DATA_VALID_1  |               |
|   0    |   ro   |    x    | RAW_MODE_IN_DATA_VALID_0  |               |

## RAW_MODE_IN_DATA_VALID_1
Mask for valid data in RX FIFOs during RAW mode.
- Offset: `0x1dc`
- Reset default: `0x0`
- Reset mask: `0x3f`

### Fields

```wavejson
{"reg": [{"name": "RAW_MODE_IN_DATA_VALID_32", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_33", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_34", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_35", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_36", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "RAW_MODE_IN_DATA_VALID_37", "bits": 1, "attr": ["ro"], "rotate": -90}, {"bits": 26}], "config": {"lanes": 1, "fontsize": 10, "vspace": 270}}
```

|  Bits  |  Type  |  Reset  | Name                      | Description                 |
|:------:|:------:|:-------:|:--------------------------|:----------------------------|
|  31:6  |        |         |                           | Reserved                    |
|   5    |   ro   |    x    | RAW_MODE_IN_DATA_VALID_37 | For RAW_MODE_IN_DATA_VALID1 |
|   4    |   ro   |    x    | RAW_MODE_IN_DATA_VALID_36 | For RAW_MODE_IN_DATA_VALID1 |
|   3    |   ro   |    x    | RAW_MODE_IN_DATA_VALID_35 | For RAW_MODE_IN_DATA_VALID1 |
|   2    |   ro   |    x    | RAW_MODE_IN_DATA_VALID_34 | For RAW_MODE_IN_DATA_VALID1 |
|   1    |   ro   |    x    | RAW_MODE_IN_DATA_VALID_33 | For RAW_MODE_IN_DATA_VALID1 |
|   0    |   ro   |    x    | RAW_MODE_IN_DATA_VALID_32 | For RAW_MODE_IN_DATA_VALID1 |

## RAW_MODE_IN_DATA
Data received by the selected channel in RAW mode
- Offset: `0x1e0`
- Reset default: `0x0`
- Reset mask: `0xffff`

### Fields

```wavejson
{"reg": [{"name": "RAW_MODE_IN_DATA", "bits": 16, "attr": ["ro"], "rotate": 0}, {"bits": 16}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name             | Description   |
|:------:|:------:|:-------:|:-----------------|:--------------|
| 31:16  |        |         |                  | Reserved      |
|  15:0  |   ro   |    x    | RAW_MODE_IN_DATA |               |

## RAW_MODE_OUT_CH_MASK_0
Selects channels to send out data in RAW mode, '1 corresponds to broadcasting
- Offset: `0x1e4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "RAW_MODE_OUT_CH_MASK_0", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_1", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_2", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_3", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_4", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_5", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_6", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_7", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_8", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_9", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_10", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_11", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_12", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_13", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_14", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_15", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_16", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_17", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_18", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_19", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_20", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_21", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_22", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_23", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_24", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_25", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_26", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_27", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_28", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_29", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_30", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_31", "bits": 1, "attr": ["wo"], "rotate": -90}], "config": {"lanes": 1, "fontsize": 10, "vspace": 250}}
```

|  Bits  |  Type  |  Reset  | Name                    | Description   |
|:------:|:------:|:-------:|:------------------------|:--------------|
|   31   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_31 |               |
|   30   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_30 |               |
|   29   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_29 |               |
|   28   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_28 |               |
|   27   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_27 |               |
|   26   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_26 |               |
|   25   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_25 |               |
|   24   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_24 |               |
|   23   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_23 |               |
|   22   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_22 |               |
|   21   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_21 |               |
|   20   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_20 |               |
|   19   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_19 |               |
|   18   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_18 |               |
|   17   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_17 |               |
|   16   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_16 |               |
|   15   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_15 |               |
|   14   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_14 |               |
|   13   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_13 |               |
|   12   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_12 |               |
|   11   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_11 |               |
|   10   |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_10 |               |
|   9    |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_9  |               |
|   8    |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_8  |               |
|   7    |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_7  |               |
|   6    |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_6  |               |
|   5    |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_5  |               |
|   4    |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_4  |               |
|   3    |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_3  |               |
|   2    |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_2  |               |
|   1    |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_1  |               |
|   0    |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_0  |               |

## RAW_MODE_OUT_CH_MASK_1
Selects channels to send out data in RAW mode, '1 corresponds to broadcasting
- Offset: `0x1e8`
- Reset default: `0x0`
- Reset mask: `0x3f`

### Fields

```wavejson
{"reg": [{"name": "RAW_MODE_OUT_CH_MASK_32", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_33", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_34", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_35", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_36", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RAW_MODE_OUT_CH_MASK_37", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 26}], "config": {"lanes": 1, "fontsize": 10, "vspace": 250}}
```

|  Bits  |  Type  |  Reset  | Name                    | Description               |
|:------:|:------:|:-------:|:------------------------|:--------------------------|
|  31:6  |        |         |                         | Reserved                  |
|   5    |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_37 | For RAW_MODE_OUT_CH_MASK1 |
|   4    |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_36 | For RAW_MODE_OUT_CH_MASK1 |
|   3    |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_35 | For RAW_MODE_OUT_CH_MASK1 |
|   2    |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_34 | For RAW_MODE_OUT_CH_MASK1 |
|   1    |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_33 | For RAW_MODE_OUT_CH_MASK1 |
|   0    |   wo   |   0x0   | RAW_MODE_OUT_CH_MASK_32 | For RAW_MODE_OUT_CH_MASK1 |

## RAW_MODE_OUT_DATA_FIFO
Data that will be pushed to the RAW mode output FIFO
- Offset: `0x1ec`
- Reset default: `0x0`
- Reset mask: `0xffff`

### Fields

```wavejson
{"reg": [{"name": "RAW_MODE_OUT_DATA_FIFO", "bits": 16, "attr": ["wo"], "rotate": 0}, {"bits": 16}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                   | Description   |
|:------:|:------:|:-------:|:-----------------------|:--------------|
| 31:16  |        |         |                        | Reserved      |
|  15:0  |   wo   |   0x0   | RAW_MODE_OUT_DATA_FIFO |               |

## RAW_MODE_OUT_DATA_FIFO_CTRL
Status and control register for the RAW mode data out FIFO
- Offset: `0x1f0`
- Reset default: `0x0`
- Reset mask: `0x80000701`

### Fields

```wavejson
{"reg": [{"name": "clear", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 7}, {"name": "fill_state", "bits": 3, "attr": ["ro"], "rotate": -90}, {"bits": 20}, {"name": "is_full", "bits": 1, "attr": ["ro"], "rotate": -90}], "config": {"lanes": 1, "fontsize": 10, "vspace": 120}}
```

|  Bits  |  Type  |  Reset  | Name       | Description                                                                                                                                                       |
|:------:|:------:|:-------:|:-----------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|   31   |   ro   |   0x0   | is_full    | If '1' the FIFO is full and does not accept any more items. Any additional write to the data fill register will be ignored until there is sufficient space again. |
| 30:11  |        |         |            | Reserved                                                                                                                                                          |
|  10:8  |   ro   |   0x0   | fill_state | The number of elements currently stored in the RAW mode TX FIFO that are ready to be sent.                                                                        |
|  7:1   |        |         |            | Reserved                                                                                                                                                          |
|   0    |   wo   |    x    | clear      | Clears the raw mode TX FIFO.                                                                                                                                      |

## RAW_MODE_OUT_EN
Enable transmission of data currently hold in the output FIFO
- Offset: `0x1f4`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "RAW_MODE_OUT_EN", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 170}}
```

|  Bits  |  Type  |  Reset  | Name            | Description   |
|:------:|:------:|:-------:|:----------------|:--------------|
|  31:1  |        |         |                 | Reserved      |
|   0    |   rw   |   0x0   | RAW_MODE_OUT_EN |               |

## FLOW_CONTROL_FIFO_CLEAR
Clears the flow control Fifo
- Offset: `0x1f8`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "FLOW_CONTROL_FIFO_CLEAR", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 250}}
```

|  Bits  |  Type  |  Reset  | Name                    | Description   |
|:------:|:------:|:-------:|:------------------------|:--------------|
|  31:1  |        |         |                         | Reserved      |
|   0    |   wo   |   0x0   | FLOW_CONTROL_FIFO_CLEAR |               |

## CHANNEL_ALLOC_TX_CFG
Configuration settings for the TX side in the channel allocator
- Offset: `0x1fc`
- Reset default: `0x203`
- Reset mask: `0xff03`

### Fields

```wavejson
{"reg": [{"name": "bypass_en", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "auto_flush_en", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 6}, {"name": "auto_flush_count", "bits": 8, "attr": ["rw"], "rotate": -90}, {"bits": 16}], "config": {"lanes": 1, "fontsize": 10, "vspace": 180}}
```

|  Bits  |  Type  |  Reset  | Name             | Description                                                                                  |
|:------:|:------:|:-------:|:-----------------|:---------------------------------------------------------------------------------------------|
| 31:16  |        |         |                  | Reserved                                                                                     |
|  15:8  |   rw   |   0x2   | auto_flush_count | The number of cycles to wait before auto flushing (sending) packets in the channel allocator |
|  7:2   |        |         |                  | Reserved                                                                                     |
|   1    |   rw   |   0x1   | auto_flush_en    | Enable the auto-flush feature of the TX side in the channel allocator                        |
|   0    |   rw   |   0x1   | bypass_en        | Enable bypassing the TX channel allocator                                                    |

## CHANNEL_ALLOC_TX_CH_EN_0
Channel enable mask for the TX side.
- Offset: `0x200`
- Reset default: `0xffffffff`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "CHANNEL_ALLOC_TX_CH_EN_0", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_1", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_2", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_3", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_4", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_5", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_6", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_7", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_8", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_9", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_10", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_11", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_12", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_13", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_14", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_15", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_16", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_17", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_18", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_19", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_20", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_21", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_22", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_23", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_24", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_25", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_26", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_27", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_28", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_29", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_30", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_31", "bits": 1, "attr": ["rw"], "rotate": -90}], "config": {"lanes": 1, "fontsize": 10, "vspace": 270}}
```

|  Bits  |  Type  |  Reset  | Name                      | Description   |
|:------:|:------:|:-------:|:--------------------------|:--------------|
|   31   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_31 |               |
|   30   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_30 |               |
|   29   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_29 |               |
|   28   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_28 |               |
|   27   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_27 |               |
|   26   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_26 |               |
|   25   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_25 |               |
|   24   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_24 |               |
|   23   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_23 |               |
|   22   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_22 |               |
|   21   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_21 |               |
|   20   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_20 |               |
|   19   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_19 |               |
|   18   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_18 |               |
|   17   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_17 |               |
|   16   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_16 |               |
|   15   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_15 |               |
|   14   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_14 |               |
|   13   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_13 |               |
|   12   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_12 |               |
|   11   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_11 |               |
|   10   |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_10 |               |
|   9    |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_9  |               |
|   8    |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_8  |               |
|   7    |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_7  |               |
|   6    |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_6  |               |
|   5    |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_5  |               |
|   4    |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_4  |               |
|   3    |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_3  |               |
|   2    |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_2  |               |
|   1    |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_1  |               |
|   0    |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_0  |               |

## CHANNEL_ALLOC_TX_CH_EN_1
Channel enable mask for the TX side.
- Offset: `0x204`
- Reset default: `0x3f`
- Reset mask: `0x3f`

### Fields

```wavejson
{"reg": [{"name": "CHANNEL_ALLOC_TX_CH_EN_32", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_33", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_34", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_35", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_36", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_TX_CH_EN_37", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 26}], "config": {"lanes": 1, "fontsize": 10, "vspace": 270}}
```

|  Bits  |  Type  |  Reset  | Name                      | Description                 |
|:------:|:------:|:-------:|:--------------------------|:----------------------------|
|  31:6  |        |         |                           | Reserved                    |
|   5    |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_37 | For CHANNEL_ALLOC_TX_CH_EN1 |
|   4    |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_36 | For CHANNEL_ALLOC_TX_CH_EN1 |
|   3    |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_35 | For CHANNEL_ALLOC_TX_CH_EN1 |
|   2    |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_34 | For CHANNEL_ALLOC_TX_CH_EN1 |
|   1    |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_33 | For CHANNEL_ALLOC_TX_CH_EN1 |
|   0    |   rw   |   0x1   | CHANNEL_ALLOC_TX_CH_EN_32 | For CHANNEL_ALLOC_TX_CH_EN1 |

## CHANNEL_ALLOC_TX_CTRL
Soft clear or force flush the TX side of the channel allocator
- Offset: `0x208`
- Reset default: `0x0`
- Reset mask: `0x3`

### Fields

```wavejson
{"reg": [{"name": "clear", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "flush", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 30}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                              |
|:------:|:------:|:-------:|:-------|:-------------------------------------------------------------------------|
|  31:2  |        |         |        | Reserved                                                                 |
|   1    |   wo   |    x    | flush  | Flush (transmit remaining data) in the TX side of the channel allocator. |
|   0    |   wo   |    x    | clear  | Software clear the TX side of the channel allocator                      |

## CHANNEL_ALLOC_RX_CFG
Configuration settings for the RX side in the channel allocator
- Offset: `0x20c`
- Reset default: `0x10203`
- Reset mask: `0x1ff03`

### Fields

```wavejson
{"reg": [{"name": "bypass_en", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "auto_flush_en", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 6}, {"name": "auto_flush_count", "bits": 8, "attr": ["rw"], "rotate": -90}, {"name": "sync_en", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 15}], "config": {"lanes": 1, "fontsize": 10, "vspace": 180}}
```

|  Bits  |  Type  |  Reset  | Name             | Description                                                                                                    |
|:------:|:------:|:-------:|:-----------------|:---------------------------------------------------------------------------------------------------------------|
| 31:17  |        |         |                  | Reserved                                                                                                       |
|   16   |   rw   |   0x1   | sync_en          | Enable (1) or disable (0) the synchronization barrier between the channels (needs to be disabled in raw mode). |
|  15:8  |   rw   |   0x2   | auto_flush_count | The number of cycles to wait before synchronizing on partial packets on the RX side                            |
|  7:2   |        |         |                  | Reserved                                                                                                       |
|   1    |   rw   |   0x1   | auto_flush_en    | Enable the auto-flush feature of the RX side in the channel allocator                                          |
|   0    |   rw   |   0x1   | bypass_en        | Enable bypassing the RX channel allocator                                                                      |

## CHANNEL_ALLOC_RX_CTRL
Soft clear the RX side of the channel allocator
- Offset: `0x210`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "clear", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                         |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------|
|  31:1  |        |         |        | Reserved                                            |
|   0    |   wo   |    x    | clear  | Software clear the TX side of the channel allocator |

## CHANNEL_ALLOC_RX_CH_EN_0
Channel enable mask for the RX side.
- Offset: `0x214`
- Reset default: `0xffffffff`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "CHANNEL_ALLOC_RX_CH_EN_0", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_1", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_2", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_3", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_4", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_5", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_6", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_7", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_8", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_9", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_10", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_11", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_12", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_13", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_14", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_15", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_16", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_17", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_18", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_19", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_20", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_21", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_22", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_23", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_24", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_25", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_26", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_27", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_28", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_29", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_30", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_31", "bits": 1, "attr": ["rw"], "rotate": -90}], "config": {"lanes": 1, "fontsize": 10, "vspace": 270}}
```

|  Bits  |  Type  |  Reset  | Name                      | Description   |
|:------:|:------:|:-------:|:--------------------------|:--------------|
|   31   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_31 |               |
|   30   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_30 |               |
|   29   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_29 |               |
|   28   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_28 |               |
|   27   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_27 |               |
|   26   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_26 |               |
|   25   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_25 |               |
|   24   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_24 |               |
|   23   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_23 |               |
|   22   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_22 |               |
|   21   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_21 |               |
|   20   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_20 |               |
|   19   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_19 |               |
|   18   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_18 |               |
|   17   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_17 |               |
|   16   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_16 |               |
|   15   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_15 |               |
|   14   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_14 |               |
|   13   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_13 |               |
|   12   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_12 |               |
|   11   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_11 |               |
|   10   |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_10 |               |
|   9    |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_9  |               |
|   8    |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_8  |               |
|   7    |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_7  |               |
|   6    |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_6  |               |
|   5    |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_5  |               |
|   4    |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_4  |               |
|   3    |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_3  |               |
|   2    |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_2  |               |
|   1    |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_1  |               |
|   0    |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_0  |               |

## CHANNEL_ALLOC_RX_CH_EN_1
Channel enable mask for the RX side.
- Offset: `0x218`
- Reset default: `0x3f`
- Reset mask: `0x3f`

### Fields

```wavejson
{"reg": [{"name": "CHANNEL_ALLOC_RX_CH_EN_32", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_33", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_34", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_35", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_36", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CHANNEL_ALLOC_RX_CH_EN_37", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 26}], "config": {"lanes": 1, "fontsize": 10, "vspace": 270}}
```

|  Bits  |  Type  |  Reset  | Name                      | Description                 |
|:------:|:------:|:-------:|:--------------------------|:----------------------------|
|  31:6  |        |         |                           | Reserved                    |
|   5    |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_37 | For CHANNEL_ALLOC_RX_CH_EN1 |
|   4    |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_36 | For CHANNEL_ALLOC_RX_CH_EN1 |
|   3    |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_35 | For CHANNEL_ALLOC_RX_CH_EN1 |
|   2    |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_34 | For CHANNEL_ALLOC_RX_CH_EN1 |
|   1    |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_33 | For CHANNEL_ALLOC_RX_CH_EN1 |
|   0    |   rw   |   0x1   | CHANNEL_ALLOC_RX_CH_EN_32 | For CHANNEL_ALLOC_RX_CH_EN1 |

