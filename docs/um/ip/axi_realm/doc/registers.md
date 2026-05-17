## Summary

| Name                                                    | Offset   |   Length | Description                                |
|:--------------------------------------------------------|:---------|---------:|:-------------------------------------------|
| axi_rt.[`major_version`](#major_version)                | 0x0      |        4 | Value of the major_version.                |
| axi_rt.[`minor_version`](#minor_version)                | 0x4      |        4 | Value of the minor_version.                |
| axi_rt.[`patch_version`](#patch_version)                | 0x8      |        4 | Value of the patch_version.                |
| axi_rt.[`rt_enable`](#rt_enable)                        | 0xc      |        4 | Enable RT feature on master                |
| axi_rt.[`rt_bypassed`](#rt_bypassed)                    | 0x10     |        4 | Is the RT inactive?                        |
| axi_rt.[`len_limit_0`](#len_limit_0)                    | 0x14     |        4 | Fragmentation of the bursts in beats.      |
| axi_rt.[`len_limit_1`](#len_limit_1)                    | 0x18     |        4 | Fragmentation of the bursts in beats.      |
| axi_rt.[`imtu_enable`](#imtu_enable)                    | 0x1c     |        4 | Enables the IMTU.                          |
| axi_rt.[`imtu_abort`](#imtu_abort)                      | 0x20     |        4 | Resets both the period and the budget.     |
| axi_rt.[`start_addr_sub_low_0`](#start_addr_sub_low)    | 0x24     |        4 | The lower 32bit of the start address.      |
| axi_rt.[`start_addr_sub_low_1`](#start_addr_sub_low)    | 0x28     |        4 | The lower 32bit of the start address.      |
| axi_rt.[`start_addr_sub_low_2`](#start_addr_sub_low)    | 0x2c     |        4 | The lower 32bit of the start address.      |
| axi_rt.[`start_addr_sub_low_3`](#start_addr_sub_low)    | 0x30     |        4 | The lower 32bit of the start address.      |
| axi_rt.[`start_addr_sub_low_4`](#start_addr_sub_low)    | 0x34     |        4 | The lower 32bit of the start address.      |
| axi_rt.[`start_addr_sub_low_5`](#start_addr_sub_low)    | 0x38     |        4 | The lower 32bit of the start address.      |
| axi_rt.[`start_addr_sub_low_6`](#start_addr_sub_low)    | 0x3c     |        4 | The lower 32bit of the start address.      |
| axi_rt.[`start_addr_sub_low_7`](#start_addr_sub_low)    | 0x40     |        4 | The lower 32bit of the start address.      |
| axi_rt.[`start_addr_sub_low_8`](#start_addr_sub_low)    | 0x44     |        4 | The lower 32bit of the start address.      |
| axi_rt.[`start_addr_sub_low_9`](#start_addr_sub_low)    | 0x48     |        4 | The lower 32bit of the start address.      |
| axi_rt.[`start_addr_sub_low_10`](#start_addr_sub_low)   | 0x4c     |        4 | The lower 32bit of the start address.      |
| axi_rt.[`start_addr_sub_low_11`](#start_addr_sub_low)   | 0x50     |        4 | The lower 32bit of the start address.      |
| axi_rt.[`start_addr_sub_low_12`](#start_addr_sub_low)   | 0x54     |        4 | The lower 32bit of the start address.      |
| axi_rt.[`start_addr_sub_low_13`](#start_addr_sub_low)   | 0x58     |        4 | The lower 32bit of the start address.      |
| axi_rt.[`start_addr_sub_low_14`](#start_addr_sub_low)   | 0x5c     |        4 | The lower 32bit of the start address.      |
| axi_rt.[`start_addr_sub_low_15`](#start_addr_sub_low)   | 0x60     |        4 | The lower 32bit of the start address.      |
| axi_rt.[`start_addr_sub_high_0`](#start_addr_sub_high)  | 0x64     |        4 | The higher 32bit of the start address.     |
| axi_rt.[`start_addr_sub_high_1`](#start_addr_sub_high)  | 0x68     |        4 | The higher 32bit of the start address.     |
| axi_rt.[`start_addr_sub_high_2`](#start_addr_sub_high)  | 0x6c     |        4 | The higher 32bit of the start address.     |
| axi_rt.[`start_addr_sub_high_3`](#start_addr_sub_high)  | 0x70     |        4 | The higher 32bit of the start address.     |
| axi_rt.[`start_addr_sub_high_4`](#start_addr_sub_high)  | 0x74     |        4 | The higher 32bit of the start address.     |
| axi_rt.[`start_addr_sub_high_5`](#start_addr_sub_high)  | 0x78     |        4 | The higher 32bit of the start address.     |
| axi_rt.[`start_addr_sub_high_6`](#start_addr_sub_high)  | 0x7c     |        4 | The higher 32bit of the start address.     |
| axi_rt.[`start_addr_sub_high_7`](#start_addr_sub_high)  | 0x80     |        4 | The higher 32bit of the start address.     |
| axi_rt.[`start_addr_sub_high_8`](#start_addr_sub_high)  | 0x84     |        4 | The higher 32bit of the start address.     |
| axi_rt.[`start_addr_sub_high_9`](#start_addr_sub_high)  | 0x88     |        4 | The higher 32bit of the start address.     |
| axi_rt.[`start_addr_sub_high_10`](#start_addr_sub_high) | 0x8c     |        4 | The higher 32bit of the start address.     |
| axi_rt.[`start_addr_sub_high_11`](#start_addr_sub_high) | 0x90     |        4 | The higher 32bit of the start address.     |
| axi_rt.[`start_addr_sub_high_12`](#start_addr_sub_high) | 0x94     |        4 | The higher 32bit of the start address.     |
| axi_rt.[`start_addr_sub_high_13`](#start_addr_sub_high) | 0x98     |        4 | The higher 32bit of the start address.     |
| axi_rt.[`start_addr_sub_high_14`](#start_addr_sub_high) | 0x9c     |        4 | The higher 32bit of the start address.     |
| axi_rt.[`start_addr_sub_high_15`](#start_addr_sub_high) | 0xa0     |        4 | The higher 32bit of the start address.     |
| axi_rt.[`end_addr_sub_low_0`](#end_addr_sub_low)        | 0xa4     |        4 | The lower 32bit of the end address.        |
| axi_rt.[`end_addr_sub_low_1`](#end_addr_sub_low)        | 0xa8     |        4 | The lower 32bit of the end address.        |
| axi_rt.[`end_addr_sub_low_2`](#end_addr_sub_low)        | 0xac     |        4 | The lower 32bit of the end address.        |
| axi_rt.[`end_addr_sub_low_3`](#end_addr_sub_low)        | 0xb0     |        4 | The lower 32bit of the end address.        |
| axi_rt.[`end_addr_sub_low_4`](#end_addr_sub_low)        | 0xb4     |        4 | The lower 32bit of the end address.        |
| axi_rt.[`end_addr_sub_low_5`](#end_addr_sub_low)        | 0xb8     |        4 | The lower 32bit of the end address.        |
| axi_rt.[`end_addr_sub_low_6`](#end_addr_sub_low)        | 0xbc     |        4 | The lower 32bit of the end address.        |
| axi_rt.[`end_addr_sub_low_7`](#end_addr_sub_low)        | 0xc0     |        4 | The lower 32bit of the end address.        |
| axi_rt.[`end_addr_sub_low_8`](#end_addr_sub_low)        | 0xc4     |        4 | The lower 32bit of the end address.        |
| axi_rt.[`end_addr_sub_low_9`](#end_addr_sub_low)        | 0xc8     |        4 | The lower 32bit of the end address.        |
| axi_rt.[`end_addr_sub_low_10`](#end_addr_sub_low)       | 0xcc     |        4 | The lower 32bit of the end address.        |
| axi_rt.[`end_addr_sub_low_11`](#end_addr_sub_low)       | 0xd0     |        4 | The lower 32bit of the end address.        |
| axi_rt.[`end_addr_sub_low_12`](#end_addr_sub_low)       | 0xd4     |        4 | The lower 32bit of the end address.        |
| axi_rt.[`end_addr_sub_low_13`](#end_addr_sub_low)       | 0xd8     |        4 | The lower 32bit of the end address.        |
| axi_rt.[`end_addr_sub_low_14`](#end_addr_sub_low)       | 0xdc     |        4 | The lower 32bit of the end address.        |
| axi_rt.[`end_addr_sub_low_15`](#end_addr_sub_low)       | 0xe0     |        4 | The lower 32bit of the end address.        |
| axi_rt.[`end_addr_sub_high_0`](#end_addr_sub_high)      | 0xe4     |        4 | The higher 32bit of the end address.       |
| axi_rt.[`end_addr_sub_high_1`](#end_addr_sub_high)      | 0xe8     |        4 | The higher 32bit of the end address.       |
| axi_rt.[`end_addr_sub_high_2`](#end_addr_sub_high)      | 0xec     |        4 | The higher 32bit of the end address.       |
| axi_rt.[`end_addr_sub_high_3`](#end_addr_sub_high)      | 0xf0     |        4 | The higher 32bit of the end address.       |
| axi_rt.[`end_addr_sub_high_4`](#end_addr_sub_high)      | 0xf4     |        4 | The higher 32bit of the end address.       |
| axi_rt.[`end_addr_sub_high_5`](#end_addr_sub_high)      | 0xf8     |        4 | The higher 32bit of the end address.       |
| axi_rt.[`end_addr_sub_high_6`](#end_addr_sub_high)      | 0xfc     |        4 | The higher 32bit of the end address.       |
| axi_rt.[`end_addr_sub_high_7`](#end_addr_sub_high)      | 0x100    |        4 | The higher 32bit of the end address.       |
| axi_rt.[`end_addr_sub_high_8`](#end_addr_sub_high)      | 0x104    |        4 | The higher 32bit of the end address.       |
| axi_rt.[`end_addr_sub_high_9`](#end_addr_sub_high)      | 0x108    |        4 | The higher 32bit of the end address.       |
| axi_rt.[`end_addr_sub_high_10`](#end_addr_sub_high)     | 0x10c    |        4 | The higher 32bit of the end address.       |
| axi_rt.[`end_addr_sub_high_11`](#end_addr_sub_high)     | 0x110    |        4 | The higher 32bit of the end address.       |
| axi_rt.[`end_addr_sub_high_12`](#end_addr_sub_high)     | 0x114    |        4 | The higher 32bit of the end address.       |
| axi_rt.[`end_addr_sub_high_13`](#end_addr_sub_high)     | 0x118    |        4 | The higher 32bit of the end address.       |
| axi_rt.[`end_addr_sub_high_14`](#end_addr_sub_high)     | 0x11c    |        4 | The higher 32bit of the end address.       |
| axi_rt.[`end_addr_sub_high_15`](#end_addr_sub_high)     | 0x120    |        4 | The higher 32bit of the end address.       |
| axi_rt.[`write_budget_0`](#write_budget)                | 0x124    |        4 | The budget for writes.                     |
| axi_rt.[`write_budget_1`](#write_budget)                | 0x128    |        4 | The budget for writes.                     |
| axi_rt.[`write_budget_2`](#write_budget)                | 0x12c    |        4 | The budget for writes.                     |
| axi_rt.[`write_budget_3`](#write_budget)                | 0x130    |        4 | The budget for writes.                     |
| axi_rt.[`write_budget_4`](#write_budget)                | 0x134    |        4 | The budget for writes.                     |
| axi_rt.[`write_budget_5`](#write_budget)                | 0x138    |        4 | The budget for writes.                     |
| axi_rt.[`write_budget_6`](#write_budget)                | 0x13c    |        4 | The budget for writes.                     |
| axi_rt.[`write_budget_7`](#write_budget)                | 0x140    |        4 | The budget for writes.                     |
| axi_rt.[`write_budget_8`](#write_budget)                | 0x144    |        4 | The budget for writes.                     |
| axi_rt.[`write_budget_9`](#write_budget)                | 0x148    |        4 | The budget for writes.                     |
| axi_rt.[`write_budget_10`](#write_budget)               | 0x14c    |        4 | The budget for writes.                     |
| axi_rt.[`write_budget_11`](#write_budget)               | 0x150    |        4 | The budget for writes.                     |
| axi_rt.[`write_budget_12`](#write_budget)               | 0x154    |        4 | The budget for writes.                     |
| axi_rt.[`write_budget_13`](#write_budget)               | 0x158    |        4 | The budget for writes.                     |
| axi_rt.[`write_budget_14`](#write_budget)               | 0x15c    |        4 | The budget for writes.                     |
| axi_rt.[`write_budget_15`](#write_budget)               | 0x160    |        4 | The budget for writes.                     |
| axi_rt.[`read_budget_0`](#read_budget)                  | 0x164    |        4 | The budget for reads.                      |
| axi_rt.[`read_budget_1`](#read_budget)                  | 0x168    |        4 | The budget for reads.                      |
| axi_rt.[`read_budget_2`](#read_budget)                  | 0x16c    |        4 | The budget for reads.                      |
| axi_rt.[`read_budget_3`](#read_budget)                  | 0x170    |        4 | The budget for reads.                      |
| axi_rt.[`read_budget_4`](#read_budget)                  | 0x174    |        4 | The budget for reads.                      |
| axi_rt.[`read_budget_5`](#read_budget)                  | 0x178    |        4 | The budget for reads.                      |
| axi_rt.[`read_budget_6`](#read_budget)                  | 0x17c    |        4 | The budget for reads.                      |
| axi_rt.[`read_budget_7`](#read_budget)                  | 0x180    |        4 | The budget for reads.                      |
| axi_rt.[`read_budget_8`](#read_budget)                  | 0x184    |        4 | The budget for reads.                      |
| axi_rt.[`read_budget_9`](#read_budget)                  | 0x188    |        4 | The budget for reads.                      |
| axi_rt.[`read_budget_10`](#read_budget)                 | 0x18c    |        4 | The budget for reads.                      |
| axi_rt.[`read_budget_11`](#read_budget)                 | 0x190    |        4 | The budget for reads.                      |
| axi_rt.[`read_budget_12`](#read_budget)                 | 0x194    |        4 | The budget for reads.                      |
| axi_rt.[`read_budget_13`](#read_budget)                 | 0x198    |        4 | The budget for reads.                      |
| axi_rt.[`read_budget_14`](#read_budget)                 | 0x19c    |        4 | The budget for reads.                      |
| axi_rt.[`read_budget_15`](#read_budget)                 | 0x1a0    |        4 | The budget for reads.                      |
| axi_rt.[`write_period_0`](#write_period)                | 0x1a4    |        4 | The period for writes.                     |
| axi_rt.[`write_period_1`](#write_period)                | 0x1a8    |        4 | The period for writes.                     |
| axi_rt.[`write_period_2`](#write_period)                | 0x1ac    |        4 | The period for writes.                     |
| axi_rt.[`write_period_3`](#write_period)                | 0x1b0    |        4 | The period for writes.                     |
| axi_rt.[`write_period_4`](#write_period)                | 0x1b4    |        4 | The period for writes.                     |
| axi_rt.[`write_period_5`](#write_period)                | 0x1b8    |        4 | The period for writes.                     |
| axi_rt.[`write_period_6`](#write_period)                | 0x1bc    |        4 | The period for writes.                     |
| axi_rt.[`write_period_7`](#write_period)                | 0x1c0    |        4 | The period for writes.                     |
| axi_rt.[`write_period_8`](#write_period)                | 0x1c4    |        4 | The period for writes.                     |
| axi_rt.[`write_period_9`](#write_period)                | 0x1c8    |        4 | The period for writes.                     |
| axi_rt.[`write_period_10`](#write_period)               | 0x1cc    |        4 | The period for writes.                     |
| axi_rt.[`write_period_11`](#write_period)               | 0x1d0    |        4 | The period for writes.                     |
| axi_rt.[`write_period_12`](#write_period)               | 0x1d4    |        4 | The period for writes.                     |
| axi_rt.[`write_period_13`](#write_period)               | 0x1d8    |        4 | The period for writes.                     |
| axi_rt.[`write_period_14`](#write_period)               | 0x1dc    |        4 | The period for writes.                     |
| axi_rt.[`write_period_15`](#write_period)               | 0x1e0    |        4 | The period for writes.                     |
| axi_rt.[`read_period_0`](#read_period)                  | 0x1e4    |        4 | The period for reads.                      |
| axi_rt.[`read_period_1`](#read_period)                  | 0x1e8    |        4 | The period for reads.                      |
| axi_rt.[`read_period_2`](#read_period)                  | 0x1ec    |        4 | The period for reads.                      |
| axi_rt.[`read_period_3`](#read_period)                  | 0x1f0    |        4 | The period for reads.                      |
| axi_rt.[`read_period_4`](#read_period)                  | 0x1f4    |        4 | The period for reads.                      |
| axi_rt.[`read_period_5`](#read_period)                  | 0x1f8    |        4 | The period for reads.                      |
| axi_rt.[`read_period_6`](#read_period)                  | 0x1fc    |        4 | The period for reads.                      |
| axi_rt.[`read_period_7`](#read_period)                  | 0x200    |        4 | The period for reads.                      |
| axi_rt.[`read_period_8`](#read_period)                  | 0x204    |        4 | The period for reads.                      |
| axi_rt.[`read_period_9`](#read_period)                  | 0x208    |        4 | The period for reads.                      |
| axi_rt.[`read_period_10`](#read_period)                 | 0x20c    |        4 | The period for reads.                      |
| axi_rt.[`read_period_11`](#read_period)                 | 0x210    |        4 | The period for reads.                      |
| axi_rt.[`read_period_12`](#read_period)                 | 0x214    |        4 | The period for reads.                      |
| axi_rt.[`read_period_13`](#read_period)                 | 0x218    |        4 | The period for reads.                      |
| axi_rt.[`read_period_14`](#read_period)                 | 0x21c    |        4 | The period for reads.                      |
| axi_rt.[`read_period_15`](#read_period)                 | 0x220    |        4 | The period for reads.                      |
| axi_rt.[`write_budget_left_0`](#write_budget_left)      | 0x224    |        4 | The budget left for writes.                |
| axi_rt.[`write_budget_left_1`](#write_budget_left)      | 0x228    |        4 | The budget left for writes.                |
| axi_rt.[`write_budget_left_2`](#write_budget_left)      | 0x22c    |        4 | The budget left for writes.                |
| axi_rt.[`write_budget_left_3`](#write_budget_left)      | 0x230    |        4 | The budget left for writes.                |
| axi_rt.[`write_budget_left_4`](#write_budget_left)      | 0x234    |        4 | The budget left for writes.                |
| axi_rt.[`write_budget_left_5`](#write_budget_left)      | 0x238    |        4 | The budget left for writes.                |
| axi_rt.[`write_budget_left_6`](#write_budget_left)      | 0x23c    |        4 | The budget left for writes.                |
| axi_rt.[`write_budget_left_7`](#write_budget_left)      | 0x240    |        4 | The budget left for writes.                |
| axi_rt.[`write_budget_left_8`](#write_budget_left)      | 0x244    |        4 | The budget left for writes.                |
| axi_rt.[`write_budget_left_9`](#write_budget_left)      | 0x248    |        4 | The budget left for writes.                |
| axi_rt.[`write_budget_left_10`](#write_budget_left)     | 0x24c    |        4 | The budget left for writes.                |
| axi_rt.[`write_budget_left_11`](#write_budget_left)     | 0x250    |        4 | The budget left for writes.                |
| axi_rt.[`write_budget_left_12`](#write_budget_left)     | 0x254    |        4 | The budget left for writes.                |
| axi_rt.[`write_budget_left_13`](#write_budget_left)     | 0x258    |        4 | The budget left for writes.                |
| axi_rt.[`write_budget_left_14`](#write_budget_left)     | 0x25c    |        4 | The budget left for writes.                |
| axi_rt.[`write_budget_left_15`](#write_budget_left)     | 0x260    |        4 | The budget left for writes.                |
| axi_rt.[`read_budget_left_0`](#read_budget_left)        | 0x264    |        4 | The budget left for reads.                 |
| axi_rt.[`read_budget_left_1`](#read_budget_left)        | 0x268    |        4 | The budget left for reads.                 |
| axi_rt.[`read_budget_left_2`](#read_budget_left)        | 0x26c    |        4 | The budget left for reads.                 |
| axi_rt.[`read_budget_left_3`](#read_budget_left)        | 0x270    |        4 | The budget left for reads.                 |
| axi_rt.[`read_budget_left_4`](#read_budget_left)        | 0x274    |        4 | The budget left for reads.                 |
| axi_rt.[`read_budget_left_5`](#read_budget_left)        | 0x278    |        4 | The budget left for reads.                 |
| axi_rt.[`read_budget_left_6`](#read_budget_left)        | 0x27c    |        4 | The budget left for reads.                 |
| axi_rt.[`read_budget_left_7`](#read_budget_left)        | 0x280    |        4 | The budget left for reads.                 |
| axi_rt.[`read_budget_left_8`](#read_budget_left)        | 0x284    |        4 | The budget left for reads.                 |
| axi_rt.[`read_budget_left_9`](#read_budget_left)        | 0x288    |        4 | The budget left for reads.                 |
| axi_rt.[`read_budget_left_10`](#read_budget_left)       | 0x28c    |        4 | The budget left for reads.                 |
| axi_rt.[`read_budget_left_11`](#read_budget_left)       | 0x290    |        4 | The budget left for reads.                 |
| axi_rt.[`read_budget_left_12`](#read_budget_left)       | 0x294    |        4 | The budget left for reads.                 |
| axi_rt.[`read_budget_left_13`](#read_budget_left)       | 0x298    |        4 | The budget left for reads.                 |
| axi_rt.[`read_budget_left_14`](#read_budget_left)       | 0x29c    |        4 | The budget left for reads.                 |
| axi_rt.[`read_budget_left_15`](#read_budget_left)       | 0x2a0    |        4 | The budget left for reads.                 |
| axi_rt.[`write_period_left_0`](#write_period_left)      | 0x2a4    |        4 | The period left for writes.                |
| axi_rt.[`write_period_left_1`](#write_period_left)      | 0x2a8    |        4 | The period left for writes.                |
| axi_rt.[`write_period_left_2`](#write_period_left)      | 0x2ac    |        4 | The period left for writes.                |
| axi_rt.[`write_period_left_3`](#write_period_left)      | 0x2b0    |        4 | The period left for writes.                |
| axi_rt.[`write_period_left_4`](#write_period_left)      | 0x2b4    |        4 | The period left for writes.                |
| axi_rt.[`write_period_left_5`](#write_period_left)      | 0x2b8    |        4 | The period left for writes.                |
| axi_rt.[`write_period_left_6`](#write_period_left)      | 0x2bc    |        4 | The period left for writes.                |
| axi_rt.[`write_period_left_7`](#write_period_left)      | 0x2c0    |        4 | The period left for writes.                |
| axi_rt.[`write_period_left_8`](#write_period_left)      | 0x2c4    |        4 | The period left for writes.                |
| axi_rt.[`write_period_left_9`](#write_period_left)      | 0x2c8    |        4 | The period left for writes.                |
| axi_rt.[`write_period_left_10`](#write_period_left)     | 0x2cc    |        4 | The period left for writes.                |
| axi_rt.[`write_period_left_11`](#write_period_left)     | 0x2d0    |        4 | The period left for writes.                |
| axi_rt.[`write_period_left_12`](#write_period_left)     | 0x2d4    |        4 | The period left for writes.                |
| axi_rt.[`write_period_left_13`](#write_period_left)     | 0x2d8    |        4 | The period left for writes.                |
| axi_rt.[`write_period_left_14`](#write_period_left)     | 0x2dc    |        4 | The period left for writes.                |
| axi_rt.[`write_period_left_15`](#write_period_left)     | 0x2e0    |        4 | The period left for writes.                |
| axi_rt.[`read_period_left_0`](#read_period_left)        | 0x2e4    |        4 | The period left for reads.                 |
| axi_rt.[`read_period_left_1`](#read_period_left)        | 0x2e8    |        4 | The period left for reads.                 |
| axi_rt.[`read_period_left_2`](#read_period_left)        | 0x2ec    |        4 | The period left for reads.                 |
| axi_rt.[`read_period_left_3`](#read_period_left)        | 0x2f0    |        4 | The period left for reads.                 |
| axi_rt.[`read_period_left_4`](#read_period_left)        | 0x2f4    |        4 | The period left for reads.                 |
| axi_rt.[`read_period_left_5`](#read_period_left)        | 0x2f8    |        4 | The period left for reads.                 |
| axi_rt.[`read_period_left_6`](#read_period_left)        | 0x2fc    |        4 | The period left for reads.                 |
| axi_rt.[`read_period_left_7`](#read_period_left)        | 0x300    |        4 | The period left for reads.                 |
| axi_rt.[`read_period_left_8`](#read_period_left)        | 0x304    |        4 | The period left for reads.                 |
| axi_rt.[`read_period_left_9`](#read_period_left)        | 0x308    |        4 | The period left for reads.                 |
| axi_rt.[`read_period_left_10`](#read_period_left)       | 0x30c    |        4 | The period left for reads.                 |
| axi_rt.[`read_period_left_11`](#read_period_left)       | 0x310    |        4 | The period left for reads.                 |
| axi_rt.[`read_period_left_12`](#read_period_left)       | 0x314    |        4 | The period left for reads.                 |
| axi_rt.[`read_period_left_13`](#read_period_left)       | 0x318    |        4 | The period left for reads.                 |
| axi_rt.[`read_period_left_14`](#read_period_left)       | 0x31c    |        4 | The period left for reads.                 |
| axi_rt.[`read_period_left_15`](#read_period_left)       | 0x320    |        4 | The period left for reads.                 |
| axi_rt.[`isolate`](#isolate)                            | 0x324    |        4 | Is the interface requested to be isolated? |
| axi_rt.[`isolated`](#isolated)                          | 0x328    |        4 | Is the interface isolated?                 |
| axi_rt.[`num_managers`](#num_managers)                  | 0x32c    |        4 | Value of the num_managers parameter.       |
| axi_rt.[`addr_width`](#addr_width)                      | 0x330    |        4 | Value of the addr_width parameter.         |
| axi_rt.[`data_width`](#data_width)                      | 0x334    |        4 | Value of the data_width parameter.         |
| axi_rt.[`id_width`](#id_width)                          | 0x338    |        4 | Value of the id_width parameter.           |
| axi_rt.[`user_width`](#user_width)                      | 0x33c    |        4 | Value of the user_width parameter.         |
| axi_rt.[`num_pending`](#num_pending)                    | 0x340    |        4 | Value of the num_pending parameter.        |
| axi_rt.[`w_buffer_depth`](#w_buffer_depth)              | 0x344    |        4 | Value of the w_buffer_depth parameter.     |
| axi_rt.[`num_addr_regions`](#num_addr_regions)          | 0x348    |        4 | Value of the num_addr_regions parameter.   |
| axi_rt.[`period_width`](#period_width)                  | 0x34c    |        4 | Value of the period_width parameter.       |
| axi_rt.[`budget_width`](#budget_width)                  | 0x350    |        4 | Value of the budget_width parameter.       |
| axi_rt.[`max_num_managers`](#max_num_managers)          | 0x354    |        4 | Value of the max_num_managers parameter.   |

## major_version
Value of the major_version.
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "major_version", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name          | Description                 |
|:------:|:------:|:-------:|:--------------|:----------------------------|
|  31:0  |   ro   |   0x0   | major_version | Value of the major_version. |

## minor_version
Value of the minor_version.
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "minor_version", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name          | Description                 |
|:------:|:------:|:-------:|:--------------|:----------------------------|
|  31:0  |   ro   |   0x0   | minor_version | Value of the minor_version. |

## patch_version
Value of the patch_version.
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "patch_version", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name          | Description                 |
|:------:|:------:|:-------:|:--------------|:----------------------------|
|  31:0  |   ro   |   0x0   | patch_version | Value of the patch_version. |

## rt_enable
Enable RT feature on master
- Offset: `0xc`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "enable_0", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "enable_1", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "enable_2", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "enable_3", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "enable_4", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "enable_5", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "enable_6", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "enable_7", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 100}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                 |
|:------:|:------:|:-------:|:---------|:----------------------------|
|  31:8  |        |         |          | Reserved                    |
|   7    |   wo   |   0x0   | enable_7 | Enable RT feature on master |
|   6    |   wo   |   0x0   | enable_6 | Enable RT feature on master |
|   5    |   wo   |   0x0   | enable_5 | Enable RT feature on master |
|   4    |   wo   |   0x0   | enable_4 | Enable RT feature on master |
|   3    |   wo   |   0x0   | enable_3 | Enable RT feature on master |
|   2    |   wo   |   0x0   | enable_2 | Enable RT feature on master |
|   1    |   wo   |   0x0   | enable_1 | Enable RT feature on master |
|   0    |   wo   |   0x0   | enable_0 | Enable RT feature on master |

## rt_bypassed
Is the RT inactive?
- Offset: `0x10`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "bypassed_0", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "bypassed_1", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "bypassed_2", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "bypassed_3", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "bypassed_4", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "bypassed_5", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "bypassed_6", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "bypassed_7", "bits": 1, "attr": ["ro"], "rotate": -90}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 120}}
```

|  Bits  |  Type  |  Reset  | Name       | Description         |
|:------:|:------:|:-------:|:-----------|:--------------------|
|  31:8  |        |         |            | Reserved            |
|   7    |   ro   |    x    | bypassed_7 | Is the RT inactive? |
|   6    |   ro   |    x    | bypassed_6 | Is the RT inactive? |
|   5    |   ro   |    x    | bypassed_5 | Is the RT inactive? |
|   4    |   ro   |    x    | bypassed_4 | Is the RT inactive? |
|   3    |   ro   |    x    | bypassed_3 | Is the RT inactive? |
|   2    |   ro   |    x    | bypassed_2 | Is the RT inactive? |
|   1    |   ro   |    x    | bypassed_1 | Is the RT inactive? |
|   0    |   ro   |    x    | bypassed_0 | Is the RT inactive? |

## len_limit_0
Fragmentation of the bursts in beats.
- Offset: `0x14`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "len_0", "bits": 8, "attr": ["wo"], "rotate": 0}, {"name": "len_1", "bits": 8, "attr": ["wo"], "rotate": 0}, {"name": "len_2", "bits": 8, "attr": ["wo"], "rotate": 0}, {"name": "len_3", "bits": 8, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                           |
|:------:|:------:|:-------:|:-------|:--------------------------------------|
| 31:24  |   wo   |   0x0   | len_3  | Fragmentation of the bursts in beats. |
| 23:16  |   wo   |   0x0   | len_2  | Fragmentation of the bursts in beats. |
|  15:8  |   wo   |   0x0   | len_1  | Fragmentation of the bursts in beats. |
|  7:0   |   wo   |   0x0   | len_0  | Fragmentation of the bursts in beats. |

## len_limit_1
Fragmentation of the bursts in beats.
- Offset: `0x18`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "len_4", "bits": 8, "attr": ["wo"], "rotate": 0}, {"name": "len_5", "bits": 8, "attr": ["wo"], "rotate": 0}, {"name": "len_6", "bits": 8, "attr": ["wo"], "rotate": 0}, {"name": "len_7", "bits": 8, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description    |
|:------:|:------:|:-------:|:-------|:---------------|
| 31:24  |   wo   |   0x0   | len_7  | For len_limit1 |
| 23:16  |   wo   |   0x0   | len_6  | For len_limit1 |
|  15:8  |   wo   |   0x0   | len_5  | For len_limit1 |
|  7:0   |   wo   |   0x0   | len_4  | For len_limit1 |

## imtu_enable
Enables the IMTU.
- Offset: `0x1c`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "enable_0", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "enable_1", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "enable_2", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "enable_3", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "enable_4", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "enable_5", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "enable_6", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "enable_7", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 100}}
```

|  Bits  |  Type  |  Reset  | Name     | Description       |
|:------:|:------:|:-------:|:---------|:------------------|
|  31:8  |        |         |          | Reserved          |
|   7    |   wo   |   0x0   | enable_7 | Enables the IMTU. |
|   6    |   wo   |   0x0   | enable_6 | Enables the IMTU. |
|   5    |   wo   |   0x0   | enable_5 | Enables the IMTU. |
|   4    |   wo   |   0x0   | enable_4 | Enables the IMTU. |
|   3    |   wo   |   0x0   | enable_3 | Enables the IMTU. |
|   2    |   wo   |   0x0   | enable_2 | Enables the IMTU. |
|   1    |   wo   |   0x0   | enable_1 | Enables the IMTU. |
|   0    |   wo   |   0x0   | enable_0 | Enables the IMTU. |

## imtu_abort
Resets both the period and the budget.
- Offset: `0x20`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "abort_0", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "abort_1", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "abort_2", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "abort_3", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "abort_4", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "abort_5", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "abort_6", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "abort_7", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 90}}
```

|  Bits  |  Type  |  Reset  | Name    | Description                            |
|:------:|:------:|:-------:|:--------|:---------------------------------------|
|  31:8  |        |         |         | Reserved                               |
|   7    |   wo   |   0x0   | abort_7 | Resets both the period and the budget. |
|   6    |   wo   |   0x0   | abort_6 | Resets both the period and the budget. |
|   5    |   wo   |   0x0   | abort_5 | Resets both the period and the budget. |
|   4    |   wo   |   0x0   | abort_4 | Resets both the period and the budget. |
|   3    |   wo   |   0x0   | abort_3 | Resets both the period and the budget. |
|   2    |   wo   |   0x0   | abort_2 | Resets both the period and the budget. |
|   1    |   wo   |   0x0   | abort_1 | Resets both the period and the budget. |
|   0    |   wo   |   0x0   | abort_0 | Resets both the period and the budget. |

## start_addr_sub_low
The lower 32bit of the start address.
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name                  | Offset   |
|:----------------------|:---------|
| start_addr_sub_low_0  | 0x24     |
| start_addr_sub_low_1  | 0x28     |
| start_addr_sub_low_2  | 0x2c     |
| start_addr_sub_low_3  | 0x30     |
| start_addr_sub_low_4  | 0x34     |
| start_addr_sub_low_5  | 0x38     |
| start_addr_sub_low_6  | 0x3c     |
| start_addr_sub_low_7  | 0x40     |
| start_addr_sub_low_8  | 0x44     |
| start_addr_sub_low_9  | 0x48     |
| start_addr_sub_low_10 | 0x4c     |
| start_addr_sub_low_11 | 0x50     |
| start_addr_sub_low_12 | 0x54     |
| start_addr_sub_low_13 | 0x58     |
| start_addr_sub_low_14 | 0x5c     |
| start_addr_sub_low_15 | 0x60     |


### Fields

```wavejson
{"reg": [{"name": "write_budget", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name         | Description                           |
|:------:|:------:|:-------:|:-------------|:--------------------------------------|
|  31:0  |   wo   |   0x0   | write_budget | The lower 32bit of the start address. |

## start_addr_sub_high
The higher 32bit of the start address.
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name                   | Offset   |
|:-----------------------|:---------|
| start_addr_sub_high_0  | 0x64     |
| start_addr_sub_high_1  | 0x68     |
| start_addr_sub_high_2  | 0x6c     |
| start_addr_sub_high_3  | 0x70     |
| start_addr_sub_high_4  | 0x74     |
| start_addr_sub_high_5  | 0x78     |
| start_addr_sub_high_6  | 0x7c     |
| start_addr_sub_high_7  | 0x80     |
| start_addr_sub_high_8  | 0x84     |
| start_addr_sub_high_9  | 0x88     |
| start_addr_sub_high_10 | 0x8c     |
| start_addr_sub_high_11 | 0x90     |
| start_addr_sub_high_12 | 0x94     |
| start_addr_sub_high_13 | 0x98     |
| start_addr_sub_high_14 | 0x9c     |
| start_addr_sub_high_15 | 0xa0     |


### Fields

```wavejson
{"reg": [{"name": "write_budget", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name         | Description                            |
|:------:|:------:|:-------:|:-------------|:---------------------------------------|
|  31:0  |   wo   |   0x0   | write_budget | The higher 32bit of the start address. |

## end_addr_sub_low
The lower 32bit of the end address.
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name                | Offset   |
|:--------------------|:---------|
| end_addr_sub_low_0  | 0xa4     |
| end_addr_sub_low_1  | 0xa8     |
| end_addr_sub_low_2  | 0xac     |
| end_addr_sub_low_3  | 0xb0     |
| end_addr_sub_low_4  | 0xb4     |
| end_addr_sub_low_5  | 0xb8     |
| end_addr_sub_low_6  | 0xbc     |
| end_addr_sub_low_7  | 0xc0     |
| end_addr_sub_low_8  | 0xc4     |
| end_addr_sub_low_9  | 0xc8     |
| end_addr_sub_low_10 | 0xcc     |
| end_addr_sub_low_11 | 0xd0     |
| end_addr_sub_low_12 | 0xd4     |
| end_addr_sub_low_13 | 0xd8     |
| end_addr_sub_low_14 | 0xdc     |
| end_addr_sub_low_15 | 0xe0     |


### Fields

```wavejson
{"reg": [{"name": "write_budget", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name         | Description                         |
|:------:|:------:|:-------:|:-------------|:------------------------------------|
|  31:0  |   wo   |   0x0   | write_budget | The lower 32bit of the end address. |

## end_addr_sub_high
The higher 32bit of the end address.
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name                 | Offset   |
|:---------------------|:---------|
| end_addr_sub_high_0  | 0xe4     |
| end_addr_sub_high_1  | 0xe8     |
| end_addr_sub_high_2  | 0xec     |
| end_addr_sub_high_3  | 0xf0     |
| end_addr_sub_high_4  | 0xf4     |
| end_addr_sub_high_5  | 0xf8     |
| end_addr_sub_high_6  | 0xfc     |
| end_addr_sub_high_7  | 0x100    |
| end_addr_sub_high_8  | 0x104    |
| end_addr_sub_high_9  | 0x108    |
| end_addr_sub_high_10 | 0x10c    |
| end_addr_sub_high_11 | 0x110    |
| end_addr_sub_high_12 | 0x114    |
| end_addr_sub_high_13 | 0x118    |
| end_addr_sub_high_14 | 0x11c    |
| end_addr_sub_high_15 | 0x120    |


### Fields

```wavejson
{"reg": [{"name": "write_budget", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name         | Description                          |
|:------:|:------:|:-------:|:-------------|:-------------------------------------|
|  31:0  |   wo   |   0x0   | write_budget | The higher 32bit of the end address. |

## write_budget
The budget for writes.
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name            | Offset   |
|:----------------|:---------|
| write_budget_0  | 0x124    |
| write_budget_1  | 0x128    |
| write_budget_2  | 0x12c    |
| write_budget_3  | 0x130    |
| write_budget_4  | 0x134    |
| write_budget_5  | 0x138    |
| write_budget_6  | 0x13c    |
| write_budget_7  | 0x140    |
| write_budget_8  | 0x144    |
| write_budget_9  | 0x148    |
| write_budget_10 | 0x14c    |
| write_budget_11 | 0x150    |
| write_budget_12 | 0x154    |
| write_budget_13 | 0x158    |
| write_budget_14 | 0x15c    |
| write_budget_15 | 0x160    |


### Fields

```wavejson
{"reg": [{"name": "write_budget", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name         | Description            |
|:------:|:------:|:-------:|:-------------|:-----------------------|
|  31:0  |   wo   |   0x0   | write_budget | The budget for writes. |

## read_budget
The budget for reads.
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name           | Offset   |
|:---------------|:---------|
| read_budget_0  | 0x164    |
| read_budget_1  | 0x168    |
| read_budget_2  | 0x16c    |
| read_budget_3  | 0x170    |
| read_budget_4  | 0x174    |
| read_budget_5  | 0x178    |
| read_budget_6  | 0x17c    |
| read_budget_7  | 0x180    |
| read_budget_8  | 0x184    |
| read_budget_9  | 0x188    |
| read_budget_10 | 0x18c    |
| read_budget_11 | 0x190    |
| read_budget_12 | 0x194    |
| read_budget_13 | 0x198    |
| read_budget_14 | 0x19c    |
| read_budget_15 | 0x1a0    |


### Fields

```wavejson
{"reg": [{"name": "read_budget", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name        | Description           |
|:------:|:------:|:-------:|:------------|:----------------------|
|  31:0  |   wo   |   0x0   | read_budget | The budget for reads. |

## write_period
The period for writes.
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name            | Offset   |
|:----------------|:---------|
| write_period_0  | 0x1a4    |
| write_period_1  | 0x1a8    |
| write_period_2  | 0x1ac    |
| write_period_3  | 0x1b0    |
| write_period_4  | 0x1b4    |
| write_period_5  | 0x1b8    |
| write_period_6  | 0x1bc    |
| write_period_7  | 0x1c0    |
| write_period_8  | 0x1c4    |
| write_period_9  | 0x1c8    |
| write_period_10 | 0x1cc    |
| write_period_11 | 0x1d0    |
| write_period_12 | 0x1d4    |
| write_period_13 | 0x1d8    |
| write_period_14 | 0x1dc    |
| write_period_15 | 0x1e0    |


### Fields

```wavejson
{"reg": [{"name": "write_period", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name         | Description            |
|:------:|:------:|:-------:|:-------------|:-----------------------|
|  31:0  |   wo   |   0x0   | write_period | The period for writes. |

## read_period
The period for reads.
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name           | Offset   |
|:---------------|:---------|
| read_period_0  | 0x1e4    |
| read_period_1  | 0x1e8    |
| read_period_2  | 0x1ec    |
| read_period_3  | 0x1f0    |
| read_period_4  | 0x1f4    |
| read_period_5  | 0x1f8    |
| read_period_6  | 0x1fc    |
| read_period_7  | 0x200    |
| read_period_8  | 0x204    |
| read_period_9  | 0x208    |
| read_period_10 | 0x20c    |
| read_period_11 | 0x210    |
| read_period_12 | 0x214    |
| read_period_13 | 0x218    |
| read_period_14 | 0x21c    |
| read_period_15 | 0x220    |


### Fields

```wavejson
{"reg": [{"name": "read_period", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name        | Description           |
|:------:|:------:|:-------:|:------------|:----------------------|
|  31:0  |   wo   |   0x0   | read_period | The period for reads. |

## write_budget_left
The budget left for writes.
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name                 | Offset   |
|:---------------------|:---------|
| write_budget_left_0  | 0x224    |
| write_budget_left_1  | 0x228    |
| write_budget_left_2  | 0x22c    |
| write_budget_left_3  | 0x230    |
| write_budget_left_4  | 0x234    |
| write_budget_left_5  | 0x238    |
| write_budget_left_6  | 0x23c    |
| write_budget_left_7  | 0x240    |
| write_budget_left_8  | 0x244    |
| write_budget_left_9  | 0x248    |
| write_budget_left_10 | 0x24c    |
| write_budget_left_11 | 0x250    |
| write_budget_left_12 | 0x254    |
| write_budget_left_13 | 0x258    |
| write_budget_left_14 | 0x25c    |
| write_budget_left_15 | 0x260    |


### Fields

```wavejson
{"reg": [{"name": "write_budget_left", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name              | Description                 |
|:------:|:------:|:-------:|:------------------|:----------------------------|
|  31:0  |   ro   |   0x0   | write_budget_left | The budget left for writes. |

## read_budget_left
The budget left for reads.
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name                | Offset   |
|:--------------------|:---------|
| read_budget_left_0  | 0x264    |
| read_budget_left_1  | 0x268    |
| read_budget_left_2  | 0x26c    |
| read_budget_left_3  | 0x270    |
| read_budget_left_4  | 0x274    |
| read_budget_left_5  | 0x278    |
| read_budget_left_6  | 0x27c    |
| read_budget_left_7  | 0x280    |
| read_budget_left_8  | 0x284    |
| read_budget_left_9  | 0x288    |
| read_budget_left_10 | 0x28c    |
| read_budget_left_11 | 0x290    |
| read_budget_left_12 | 0x294    |
| read_budget_left_13 | 0x298    |
| read_budget_left_14 | 0x29c    |
| read_budget_left_15 | 0x2a0    |


### Fields

```wavejson
{"reg": [{"name": "read_budget_left", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name             | Description                |
|:------:|:------:|:-------:|:-----------------|:---------------------------|
|  31:0  |   ro   |   0x0   | read_budget_left | The budget left for reads. |

## write_period_left
The period left for writes.
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name                 | Offset   |
|:---------------------|:---------|
| write_period_left_0  | 0x2a4    |
| write_period_left_1  | 0x2a8    |
| write_period_left_2  | 0x2ac    |
| write_period_left_3  | 0x2b0    |
| write_period_left_4  | 0x2b4    |
| write_period_left_5  | 0x2b8    |
| write_period_left_6  | 0x2bc    |
| write_period_left_7  | 0x2c0    |
| write_period_left_8  | 0x2c4    |
| write_period_left_9  | 0x2c8    |
| write_period_left_10 | 0x2cc    |
| write_period_left_11 | 0x2d0    |
| write_period_left_12 | 0x2d4    |
| write_period_left_13 | 0x2d8    |
| write_period_left_14 | 0x2dc    |
| write_period_left_15 | 0x2e0    |


### Fields

```wavejson
{"reg": [{"name": "write_period_left", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name              | Description                 |
|:------:|:------:|:-------:|:------------------|:----------------------------|
|  31:0  |   ro   |   0x0   | write_period_left | The period left for writes. |

## read_period_left
The period left for reads.
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name                | Offset   |
|:--------------------|:---------|
| read_period_left_0  | 0x2e4    |
| read_period_left_1  | 0x2e8    |
| read_period_left_2  | 0x2ec    |
| read_period_left_3  | 0x2f0    |
| read_period_left_4  | 0x2f4    |
| read_period_left_5  | 0x2f8    |
| read_period_left_6  | 0x2fc    |
| read_period_left_7  | 0x300    |
| read_period_left_8  | 0x304    |
| read_period_left_9  | 0x308    |
| read_period_left_10 | 0x30c    |
| read_period_left_11 | 0x310    |
| read_period_left_12 | 0x314    |
| read_period_left_13 | 0x318    |
| read_period_left_14 | 0x31c    |
| read_period_left_15 | 0x320    |


### Fields

```wavejson
{"reg": [{"name": "read_period_left", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name             | Description                |
|:------:|:------:|:-------:|:-----------------|:---------------------------|
|  31:0  |   ro   |   0x0   | read_period_left | The period left for reads. |

## isolate
Is the interface requested to be isolated?
- Offset: `0x324`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "isolate_0", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "isolate_1", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "isolate_2", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "isolate_3", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "isolate_4", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "isolate_5", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "isolate_6", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "isolate_7", "bits": 1, "attr": ["ro"], "rotate": -90}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 110}}
```

|  Bits  |  Type  |  Reset  | Name      | Description                                |
|:------:|:------:|:-------:|:----------|:-------------------------------------------|
|  31:8  |        |         |           | Reserved                                   |
|   7    |   ro   |    x    | isolate_7 | Is the interface requested to be isolated? |
|   6    |   ro   |    x    | isolate_6 | Is the interface requested to be isolated? |
|   5    |   ro   |    x    | isolate_5 | Is the interface requested to be isolated? |
|   4    |   ro   |    x    | isolate_4 | Is the interface requested to be isolated? |
|   3    |   ro   |    x    | isolate_3 | Is the interface requested to be isolated? |
|   2    |   ro   |    x    | isolate_2 | Is the interface requested to be isolated? |
|   1    |   ro   |    x    | isolate_1 | Is the interface requested to be isolated? |
|   0    |   ro   |    x    | isolate_0 | Is the interface requested to be isolated? |

## isolated
Is the interface isolated?
- Offset: `0x328`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "isolated_0", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "isolated_1", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "isolated_2", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "isolated_3", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "isolated_4", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "isolated_5", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "isolated_6", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "isolated_7", "bits": 1, "attr": ["ro"], "rotate": -90}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 120}}
```

|  Bits  |  Type  |  Reset  | Name       | Description                |
|:------:|:------:|:-------:|:-----------|:---------------------------|
|  31:8  |        |         |            | Reserved                   |
|   7    |   ro   |    x    | isolated_7 | Is the interface isolated? |
|   6    |   ro   |    x    | isolated_6 | Is the interface isolated? |
|   5    |   ro   |    x    | isolated_5 | Is the interface isolated? |
|   4    |   ro   |    x    | isolated_4 | Is the interface isolated? |
|   3    |   ro   |    x    | isolated_3 | Is the interface isolated? |
|   2    |   ro   |    x    | isolated_2 | Is the interface isolated? |
|   1    |   ro   |    x    | isolated_1 | Is the interface isolated? |
|   0    |   ro   |    x    | isolated_0 | Is the interface isolated? |

## num_managers
Value of the num_managers parameter.
- Offset: `0x32c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "num_managers", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name         | Description                          |
|:------:|:------:|:-------:|:-------------|:-------------------------------------|
|  31:0  |   ro   |    x    | num_managers | Value of the num_managers parameter. |

## addr_width
Value of the addr_width parameter.
- Offset: `0x330`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "addr_width", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name       | Description                        |
|:------:|:------:|:-------:|:-----------|:-----------------------------------|
|  31:0  |   ro   |    x    | addr_width | Value of the addr_width parameter. |

## data_width
Value of the data_width parameter.
- Offset: `0x334`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "data_width", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name       | Description                        |
|:------:|:------:|:-------:|:-----------|:-----------------------------------|
|  31:0  |   ro   |    x    | data_width | Value of the data_width parameter. |

## id_width
Value of the id_width parameter.
- Offset: `0x338`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "id_width", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                      |
|:------:|:------:|:-------:|:---------|:---------------------------------|
|  31:0  |   ro   |    x    | id_width | Value of the id_width parameter. |

## user_width
Value of the user_width parameter.
- Offset: `0x33c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "user_width", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name       | Description                        |
|:------:|:------:|:-------:|:-----------|:-----------------------------------|
|  31:0  |   ro   |    x    | user_width | Value of the user_width parameter. |

## num_pending
Value of the num_pending parameter.
- Offset: `0x340`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "num_pending", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name        | Description                         |
|:------:|:------:|:-------:|:------------|:------------------------------------|
|  31:0  |   ro   |    x    | num_pending | Value of the num_pending parameter. |

## w_buffer_depth
Value of the w_buffer_depth parameter.
- Offset: `0x344`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "w_buffer_depth", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name           | Description                            |
|:------:|:------:|:-------:|:---------------|:---------------------------------------|
|  31:0  |   ro   |    x    | w_buffer_depth | Value of the w_buffer_depth parameter. |

## num_addr_regions
Value of the num_addr_regions parameter.
- Offset: `0x348`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "num_addr_regions", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name             | Description                              |
|:------:|:------:|:-------:|:-----------------|:-----------------------------------------|
|  31:0  |   ro   |    x    | num_addr_regions | Value of the num_addr_regions parameter. |

## period_width
Value of the period_width parameter.
- Offset: `0x34c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "period_width", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name         | Description                          |
|:------:|:------:|:-------:|:-------------|:-------------------------------------|
|  31:0  |   ro   |    x    | period_width | Value of the period_width parameter. |

## budget_width
Value of the budget_width parameter.
- Offset: `0x350`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "budget_width", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name         | Description                          |
|:------:|:------:|:-------:|:-------------|:-------------------------------------|
|  31:0  |   ro   |    x    | budget_width | Value of the budget_width parameter. |

## max_num_managers
Value of the max_num_managers parameter.
- Offset: `0x354`
- Reset default: `0x8`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "max_num_managers", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name             | Description                              |
|:------:|:------:|:-------:|:-----------------|:-----------------------------------------|
|  31:0  |   ro   |   0x8   | max_num_managers | Value of the max_num_managers parameter. |

