## Summary

| Name                                                                               | Offset   |   Length | Description                                                                                        |
|:-----------------------------------------------------------------------------------|:---------|---------:|:---------------------------------------------------------------------------------------------------|
| cluster_event_unit.[`EVT_MASK`](#evt_mask)                                         | 0x0      |        4 | Input event mask configuration register.                                                           |
| cluster_event_unit.[`EVT_MASK_AND`](#evt_mask_and)                                 | 0x4      |        4 | Input event mask update command register with bitwise AND operation.                               |
| cluster_event_unit.[`EVT_MASK_OR`](#evt_mask_or)                                   | 0x8      |        4 | Input event mask update command register with bitwise OR operation.                                |
| cluster_event_unit.[`IRQ_MASK`](#irq_mask)                                         | 0xc      |        4 | Interrupt request mask configuration register.                                                     |
| cluster_event_unit.[`IRQ_MASK_AND`](#irq_mask_and)                                 | 0x10     |        4 | Interrupt request mask update command register with bitwise AND operation.                         |
| cluster_event_unit.[`IRQ_MASK_OR`](#irq_mask_or)                                   | 0x14     |        4 | Interrupt request mask update command register with bitwise OR operation.                          |
| cluster_event_unit.[`CLOCK_STATUS`](#clock_status)                                 | 0x18     |        4 | Cluster cores clock status register.                                                               |
| cluster_event_unit.[`EVENT_BUFFER`](#event_buffer)                                 | 0x1c     |        4 | Pending input events status register.                                                              |
| cluster_event_unit.[`EVENT_BUFFER_MASKED`](#event_buffer_masked)                   | 0x20     |        4 | Pending input events status register with EVT_MASK applied.                                        |
| cluster_event_unit.[`EVENT_BUFFER_IRQ_MASKED`](#event_buffer_irq_masked)           | 0x24     |        4 | Pending input events status register with IRQ_MASK applied.                                        |
| cluster_event_unit.[`EVENT_BUFFER_CLEAR`](#event_buffer_clear)                     | 0x28     |        4 | Pending input events status clear command register.                                                |
| cluster_event_unit.[`SW_EVENT_MASK`](#sw_event_mask)                               | 0x2c     |        4 | Software events cluster cores destination mask configuration register.                             |
| cluster_event_unit.[`SW_EVENT_MASK_AND`](#sw_event_mask_and)                       | 0x30     |        4 | Software events cluster cores destination mask update command register with bitwise AND operation. |
| cluster_event_unit.[`SW_EVENT_MASK_OR`](#sw_event_mask_or)                         | 0x34     |        4 | Software events cluster cores destination mask update command register with bitwise OR operation.  |
| cluster_event_unit.[`EVENT_WAIT`](#event_wait)                                     | 0x38     |        4 | Input event wait command register.                                                                 |
| cluster_event_unit.[`EVENT_WAIT_CLEAR`](#event_wait_clear)                         | 0x3c     |        4 | Input event wait and clear command register.                                                       |
| cluster_event_unit.[`HW_DISPATCH_PUSH_TASK`](#hw_dispatch_push_task)               | 0x40     |        4 | Hardware task dispatcher push command register.                                                    |
| cluster_event_unit.[`HW_DISPATCH_POP_TASK`](#hw_dispatch_pop_task)                 | 0x44     |        4 | Hardware task dispatcher pop command register.                                                     |
| cluster_event_unit.[`HW_DISPATCH_PUSH_TEAM_CONFIG`](#hw_dispatch_push_team_config) | 0x48     |        4 | Hardware task dispatcher cluster core team configuration register.                                 |
| cluster_event_unit.[`HW_MUTEX_0_MSG_PUT`](#hw_mutex_0_msg_put)                     | 0x4c     |        4 | Hardware mutex 0 non-blocking put command register.                                                |
| cluster_event_unit.[`HW_MUTEX_0_MSG_GET`](#hw_mutex_0_msg_get)                     | 0x50     |        4 | Hardware mutex 0 blocking get command register.                                                    |
| cluster_event_unit.[`HW_MUTEX_1_MSG_PUT`](#hw_mutex_1_msg_put)                     | 0x54     |        4 | Hardware mutex 1 non-blocking put command register.                                                |
| cluster_event_unit.[`HW_MUTEX_1_MSG_GET`](#hw_mutex_1_msg_get)                     | 0x58     |        4 | Hardware mutex 1 blocking get command register.                                                    |
| cluster_event_unit.[`SW_EVENT_0_TRIG`](#sw_event_0_trig)                           | 0x5c     |        4 | Cluster Software event 0 trigger command register.                                                 |
| cluster_event_unit.[`SW_EVENT_1_TRIG`](#sw_event_1_trig)                           | 0x60     |        4 | Cluster Software event 1 trigger command register.                                                 |
| cluster_event_unit.[`SW_EVENT_2_TRIG`](#sw_event_2_trig)                           | 0x64     |        4 | Cluster Software event 2 trigger command register.                                                 |
| cluster_event_unit.[`SW_EVENT_3_TRIG`](#sw_event_3_trig)                           | 0x68     |        4 | Cluster Software event 3 trigger command register.                                                 |
| cluster_event_unit.[`SW_EVENT_4_TRIG`](#sw_event_4_trig)                           | 0x6c     |        4 | Cluster Software event 4 trigger command register.                                                 |
| cluster_event_unit.[`SW_EVENT_5_TRIG`](#sw_event_5_trig)                           | 0x70     |        4 | Cluster Software event 5 trigger command register.                                                 |
| cluster_event_unit.[`SW_EVENT_6_TRIG`](#sw_event_6_trig)                           | 0x74     |        4 | Cluster Software event 6 trigger command register.                                                 |
| cluster_event_unit.[`SW_EVENT_7_TRIG`](#sw_event_7_trig)                           | 0x78     |        4 | Cluster Software event 7 trigger command register.                                                 |
| cluster_event_unit.[`SW_EVENT_0_TRIG_WAIT`](#sw_event_0_trig_wait)                 | 0x7c     |        4 | Cluster Software event 0 trigger and wait command register.                                        |
| cluster_event_unit.[`SW_EVENT_1_TRIG_WAIT`](#sw_event_1_trig_wait)                 | 0x80     |        4 | Cluster Software event 1 trigger and wait command register.                                        |
| cluster_event_unit.[`SW_EVENT_2_TRIG_WAIT`](#sw_event_2_trig_wait)                 | 0x84     |        4 | Cluster Software event 2 trigger and wait command register.                                        |
| cluster_event_unit.[`SW_EVENT_3_TRIG_WAIT`](#sw_event_3_trig_wait)                 | 0x88     |        4 | Cluster Software event 3 trigger and wait command register.                                        |
| cluster_event_unit.[`SW_EVENT_4_TRIG_WAIT`](#sw_event_4_trig_wait)                 | 0x8c     |        4 | Cluster Software event 4 trigger and wait command register.                                        |
| cluster_event_unit.[`SW_EVENT_5_TRIG_WAIT`](#sw_event_5_trig_wait)                 | 0x90     |        4 | Cluster Software event 5 trigger and wait command register.                                        |
| cluster_event_unit.[`SW_EVENT_6_TRIG_WAIT`](#sw_event_6_trig_wait)                 | 0x94     |        4 | Cluster Software event 6 trigger and wait command register.                                        |
| cluster_event_unit.[`SW_EVENT_7_TRIG_WAIT`](#sw_event_7_trig_wait)                 | 0x98     |        4 | Cluster Software event 7 trigger and wait command register.                                        |
| cluster_event_unit.[`SW_EVENT_0_TRIG_WAIT_CLEAR`](#sw_event_0_trig_wait_clear)     | 0x9c     |        4 | Cluster Software event 0 trigger, wait and clear command register.                                 |
| cluster_event_unit.[`SW_EVENT_1_TRIG_WAIT_CLEAR`](#sw_event_1_trig_wait_clear)     | 0xa0     |        4 | Cluster Software event 1 trigger, wait and clear command register.                                 |
| cluster_event_unit.[`SW_EVENT_2_TRIG_WAIT_CLEAR`](#sw_event_2_trig_wait_clear)     | 0xa4     |        4 | Cluster Software event 2 trigger, wait and clear command register.                                 |
| cluster_event_unit.[`SW_EVENT_3_TRIG_WAIT_CLEAR`](#sw_event_3_trig_wait_clear)     | 0xa8     |        4 | Cluster Software event 3 trigger, wait and clear command register.                                 |
| cluster_event_unit.[`SW_EVENT_4_TRIG_WAIT_CLEAR`](#sw_event_4_trig_wait_clear)     | 0xac     |        4 | Cluster Software event 4 trigger, wait and clear command register.                                 |
| cluster_event_unit.[`SW_EVENT_5_TRIG_WAIT_CLEAR`](#sw_event_5_trig_wait_clear)     | 0xb0     |        4 | Cluster Software event 5 trigger, wait and clear command register.                                 |
| cluster_event_unit.[`SW_EVENT_6_TRIG_WAIT_CLEAR`](#sw_event_6_trig_wait_clear)     | 0xb4     |        4 | Cluster Software event 6 trigger, wait and clear command register.                                 |
| cluster_event_unit.[`SW_EVENT_7_TRIG_WAIT_CLEAR`](#sw_event_7_trig_wait_clear)     | 0xb8     |        4 | Cluster Software event 7 trigger, wait and clear command register.                                 |
| cluster_event_unit.[`SOC_PERIPH_EVENT_ID`](#soc_periph_event_id)                   | 0xbc     |        4 | Cluster SoC peripheral event ID status register.                                                   |
| cluster_event_unit.[`HW_BARRIER_0_TRIG_MASK`](#hw_barrier_0_trig_mask)             | 0xc0     |        4 | Cluster hardware barrier 0 trigger mask configuration register.                                    |
| cluster_event_unit.[`HW_BARRIER_1_TRIG_MASK`](#hw_barrier_1_trig_mask)             | 0xc4     |        4 | Cluster hardware barrier 1 trigger mask configuration register.                                    |
| cluster_event_unit.[`HW_BARRIER_2_TRIG_MASK`](#hw_barrier_2_trig_mask)             | 0xc8     |        4 | Cluster hardware barrier 2 trigger mask configuration register.                                    |
| cluster_event_unit.[`HW_BARRIER_3_TRIG_MASK`](#hw_barrier_3_trig_mask)             | 0xcc     |        4 | Cluster hardware barrier 3 trigger mask configuration register.                                    |
| cluster_event_unit.[`HW_BARRIER_4_TRIG_MASK`](#hw_barrier_4_trig_mask)             | 0xd0     |        4 | Cluster hardware barrier 4 trigger mask configuration register.                                    |
| cluster_event_unit.[`HW_BARRIER_5_TRIG_MASK`](#hw_barrier_5_trig_mask)             | 0xd4     |        4 | Cluster hardware barrier 5 trigger mask configuration register.                                    |
| cluster_event_unit.[`HW_BARRIER_6_TRIG_MASK`](#hw_barrier_6_trig_mask)             | 0xd8     |        4 | Cluster hardware barrier 6 trigger mask configuration register.                                    |
| cluster_event_unit.[`HW_BARRIER_7_TRIG_MASK`](#hw_barrier_7_trig_mask)             | 0xdc     |        4 | Cluster hardware barrier 7 trigger mask configuration register.                                    |
| cluster_event_unit.[`HW_BARRIER_0_STATUS`](#hw_barrier_0_status)                   | 0xe0     |        4 | Cluster hardware barrier 0 status register.                                                        |
| cluster_event_unit.[`HW_BARRIER_1_STATUS`](#hw_barrier_1_status)                   | 0xe4     |        4 | Cluster hardware barrier 1 status register.                                                        |
| cluster_event_unit.[`HW_BARRIER_2_STATUS`](#hw_barrier_2_status)                   | 0xe8     |        4 | Cluster hardware barrier 2 status register.                                                        |
| cluster_event_unit.[`HW_BARRIER_3_STATUS`](#hw_barrier_3_status)                   | 0xec     |        4 | Cluster hardware barrier 3 status register.                                                        |
| cluster_event_unit.[`HW_BARRIER_4_STATUS`](#hw_barrier_4_status)                   | 0xf0     |        4 | Cluster hardware barrier 4 status register.                                                        |
| cluster_event_unit.[`HW_BARRIER_5_STATUS`](#hw_barrier_5_status)                   | 0xf4     |        4 | Cluster hardware barrier 5 status register.                                                        |
| cluster_event_unit.[`HW_BARRIER_6_STATUS`](#hw_barrier_6_status)                   | 0xf8     |        4 | Cluster hardware barrier 6 status register.                                                        |
| cluster_event_unit.[`HW_BARRIER_7_STATUS`](#hw_barrier_7_status)                   | 0xfc     |        4 | Cluster hardware barrier 7 status register.                                                        |
| cluster_event_unit.[`HW_BARRIER_0_STATUS_SUM`](#hw_barrier_0_status_sum)           | 0x100    |        4 | Cluster hardware barrier summary status register.                                                  |
| cluster_event_unit.[`HW_BARRIER_1_STATUS_SUM`](#hw_barrier_1_status_sum)           | 0x104    |        4 | Cluster hardware barrier summary status register.                                                  |
| cluster_event_unit.[`HW_BARRIER_2_STATUS_SUM`](#hw_barrier_2_status_sum)           | 0x108    |        4 | Cluster hardware barrier summary status register.                                                  |
| cluster_event_unit.[`HW_BARRIER_3_STATUS_SUM`](#hw_barrier_3_status_sum)           | 0x10c    |        4 | Cluster hardware barrier summary status register.                                                  |
| cluster_event_unit.[`HW_BARRIER_4_STATUS_SUM`](#hw_barrier_4_status_sum)           | 0x110    |        4 | Cluster hardware barrier summary status register.                                                  |
| cluster_event_unit.[`HW_BARRIER_5_STATUS_SUM`](#hw_barrier_5_status_sum)           | 0x114    |        4 | Cluster hardware barrier summary status register.                                                  |
| cluster_event_unit.[`HW_BARRIER_6_STATUS_SUM`](#hw_barrier_6_status_sum)           | 0x118    |        4 | Cluster hardware barrier summary status register.                                                  |
| cluster_event_unit.[`HW_BARRIER_7_STATUS_SUM`](#hw_barrier_7_status_sum)           | 0x11c    |        4 | Cluster hardware barrier summary status register.                                                  |
| cluster_event_unit.[`HW_BARRIER_0_TARGET_MASK`](#hw_barrier_0_target_mask)         | 0x120    |        4 | Cluster hardware barrier 0 target mask configuration register.                                     |
| cluster_event_unit.[`HW_BARRIER_1_TARGET_MASK`](#hw_barrier_1_target_mask)         | 0x124    |        4 | Cluster hardware barrier 1 target mask configuration register.                                     |
| cluster_event_unit.[`HW_BARRIER_2_TARGET_MASK`](#hw_barrier_2_target_mask)         | 0x128    |        4 | Cluster hardware barrier 2 target mask configuration register.                                     |
| cluster_event_unit.[`HW_BARRIER_3_TARGET_MASK`](#hw_barrier_3_target_mask)         | 0x12c    |        4 | Cluster hardware barrier 3 target mask configuration register.                                     |
| cluster_event_unit.[`HW_BARRIER_4_TARGET_MASK`](#hw_barrier_4_target_mask)         | 0x130    |        4 | Cluster hardware barrier 4 target mask configuration register.                                     |
| cluster_event_unit.[`HW_BARRIER_5_TARGET_MASK`](#hw_barrier_5_target_mask)         | 0x134    |        4 | Cluster hardware barrier 5 target mask configuration register.                                     |
| cluster_event_unit.[`HW_BARRIER_6_TARGET_MASK`](#hw_barrier_6_target_mask)         | 0x138    |        4 | Cluster hardware barrier 6 target mask configuration register.                                     |
| cluster_event_unit.[`HW_BARRIER_7_TARGET_MASK`](#hw_barrier_7_target_mask)         | 0x13c    |        4 | Cluster hardware barrier 7 target mask configuration register.                                     |
| cluster_event_unit.[`HW_BARRIER_0_TRIG`](#hw_barrier_0_trig)                       | 0x140    |        4 | Cluster hardware barrier 0 trigger command register.                                               |
| cluster_event_unit.[`HW_BARRIER_1_TRIG`](#hw_barrier_1_trig)                       | 0x144    |        4 | Cluster hardware barrier 1 trigger command register.                                               |
| cluster_event_unit.[`HW_BARRIER_2_TRIG`](#hw_barrier_2_trig)                       | 0x148    |        4 | Cluster hardware barrier 2 trigger command register.                                               |
| cluster_event_unit.[`HW_BARRIER_3_TRIG`](#hw_barrier_3_trig)                       | 0x14c    |        4 | Cluster hardware barrier 3 trigger command register.                                               |
| cluster_event_unit.[`HW_BARRIER_4_TRIG`](#hw_barrier_4_trig)                       | 0x150    |        4 | Cluster hardware barrier 4 trigger command register.                                               |
| cluster_event_unit.[`HW_BARRIER_5_TRIG`](#hw_barrier_5_trig)                       | 0x154    |        4 | Cluster hardware barrier 5 trigger command register.                                               |
| cluster_event_unit.[`HW_BARRIER_6_TRIG`](#hw_barrier_6_trig)                       | 0x158    |        4 | Cluster hardware barrier 6 trigger command register.                                               |
| cluster_event_unit.[`HW_BARRIER_7_TRIG`](#hw_barrier_7_trig)                       | 0x15c    |        4 | Cluster hardware barrier 7 trigger command register.                                               |
| cluster_event_unit.[`HW_BARRIER_0_SELF_TRIG`](#hw_barrier_0_self_trig)             | 0x160    |        4 | Cluster hardware barrier 0 self trigger command register.                                          |
| cluster_event_unit.[`HW_BARRIER_1_SELF_TRIG`](#hw_barrier_1_self_trig)             | 0x164    |        4 | Cluster hardware barrier 1 self trigger command register.                                          |
| cluster_event_unit.[`HW_BARRIER_2_SELF_TRIG`](#hw_barrier_2_self_trig)             | 0x168    |        4 | Cluster hardware barrier 2 self trigger command register.                                          |
| cluster_event_unit.[`HW_BARRIER_3_SELF_TRIG`](#hw_barrier_3_self_trig)             | 0x16c    |        4 | Cluster hardware barrier 3 self trigger command register.                                          |
| cluster_event_unit.[`HW_BARRIER_4_SELF_TRIG`](#hw_barrier_4_self_trig)             | 0x170    |        4 | Cluster hardware barrier 4 self trigger command register.                                          |
| cluster_event_unit.[`HW_BARRIER_5_SELF_TRIG`](#hw_barrier_5_self_trig)             | 0x174    |        4 | Cluster hardware barrier 5 self trigger command register.                                          |
| cluster_event_unit.[`HW_BARRIER_6_SELF_TRIG`](#hw_barrier_6_self_trig)             | 0x178    |        4 | Cluster hardware barrier 6 self trigger command register.                                          |
| cluster_event_unit.[`HW_BARRIER_7_SELF_TRIG`](#hw_barrier_7_self_trig)             | 0x17c    |        4 | Cluster hardware barrier 7 self trigger command register.                                          |
| cluster_event_unit.[`HW_BARRIER_0_TRIG_WAIT`](#hw_barrier_0_trig_wait)             | 0x180    |        4 | Cluster hardware barrier 0 trigger and wait command register.                                      |
| cluster_event_unit.[`HW_BARRIER_1_TRIG_WAIT`](#hw_barrier_1_trig_wait)             | 0x184    |        4 | Cluster hardware barrier 1 trigger and wait command register.                                      |
| cluster_event_unit.[`HW_BARRIER_2_TRIG_WAIT`](#hw_barrier_2_trig_wait)             | 0x188    |        4 | Cluster hardware barrier 2 trigger and wait command register.                                      |
| cluster_event_unit.[`HW_BARRIER_3_TRIG_WAIT`](#hw_barrier_3_trig_wait)             | 0x18c    |        4 | Cluster hardware barrier 3 trigger and wait command register.                                      |
| cluster_event_unit.[`HW_BARRIER_4_TRIG_WAIT`](#hw_barrier_4_trig_wait)             | 0x190    |        4 | Cluster hardware barrier 4 trigger and wait command register.                                      |
| cluster_event_unit.[`HW_BARRIER_5_TRIG_WAIT`](#hw_barrier_5_trig_wait)             | 0x194    |        4 | Cluster hardware barrier 5 trigger and wait command register.                                      |
| cluster_event_unit.[`HW_BARRIER_6_TRIG_WAIT`](#hw_barrier_6_trig_wait)             | 0x198    |        4 | Cluster hardware barrier 6 trigger and wait command register.                                      |
| cluster_event_unit.[`HW_BARRIER_7_TRIG_WAIT`](#hw_barrier_7_trig_wait)             | 0x19c    |        4 | Cluster hardware barrier 7 trigger and wait command register.                                      |
| cluster_event_unit.[`HW_BARRIER_0_TRIG_WAIT_CLEAR`](#hw_barrier_0_trig_wait_clear) | 0x1a0    |        4 | Cluster hardware barrier 0 trigger, wait and clear command register.                               |
| cluster_event_unit.[`HW_BARRIER_1_TRIG_WAIT_CLEAR`](#hw_barrier_1_trig_wait_clear) | 0x1a4    |        4 | Cluster hardware barrier 1 trigger, wait and clear command register.                               |
| cluster_event_unit.[`HW_BARRIER_2_TRIG_WAIT_CLEAR`](#hw_barrier_2_trig_wait_clear) | 0x1a8    |        4 | Cluster hardware barrier 2 trigger, wait and clear command register.                               |
| cluster_event_unit.[`HW_BARRIER_3_TRIG_WAIT_CLEAR`](#hw_barrier_3_trig_wait_clear) | 0x1ac    |        4 | Cluster hardware barrier 3 trigger, wait and clear command register.                               |
| cluster_event_unit.[`HW_BARRIER_4_TRIG_WAIT_CLEAR`](#hw_barrier_4_trig_wait_clear) | 0x1b0    |        4 | Cluster hardware barrier 4 trigger, wait and clear command register.                               |
| cluster_event_unit.[`HW_BARRIER_5_TRIG_WAIT_CLEAR`](#hw_barrier_5_trig_wait_clear) | 0x1b4    |        4 | Cluster hardware barrier 5 trigger, wait and clear command register.                               |
| cluster_event_unit.[`HW_BARRIER_6_TRIG_WAIT_CLEAR`](#hw_barrier_6_trig_wait_clear) | 0x1b8    |        4 | Cluster hardware barrier 6 trigger, wait and clear command register.                               |
| cluster_event_unit.[`HW_BARRIER_7_TRIG_WAIT_CLEAR`](#hw_barrier_7_trig_wait_clear) | 0x1bc    |        4 | Cluster hardware barrier 7 trigger, wait and clear command register.                               |

## EVT_MASK
Input event mask configuration register.
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EMCL", "bits": 30, "attr": ["rw"], "rotate": 0}, {"name": "EMINTCL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "EMSOC", "bits": 1, "attr": ["rw"], "rotate": -90}], "config": {"lanes": 1, "fontsize": 10, "vspace": 90}}
```

|  Bits  |  Type  |  Reset  | Name    | Description                                                                                                                                                      |
|:------:|:------:|:-------:|:--------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
|   31   |   rw   |   0x0   | EMSOC   | Soc peripheral input event mask configuration bitfield: - EMSOC[i]=1'b0: Input event request i is masked - EMSOC[i]=1'b1: Input event request i is not masked    |
|   30   |   rw   |   0x0   | EMINTCL | Inter-cluster input event mask configuration bitfield: - EMINTCL[i]=1'b0: Input event request i is masked - EMINTCL[i]=1'b1: Input event request i is not masked |
|  29:0  |   rw   |   0x0   | EMCL    | Cluster internal input event mask configuration bitfield: - EMCL[i]=1'b0: Input event request i is masked - EMCL[i]=1'b1: Input event request i is not masked    |

## EVT_MASK_AND
Input event mask update command register with bitwise AND operation.
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EMA", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   wo   |   0x0   | EMA    | Input event mask configuration bitfield update with bitwise AND operation. It allows clearing EMCL[i], EMINTCL[i] or EMSOC[i] if EMA[i]=1'b1. |

## EVT_MASK_OR
Input event mask update command register with bitwise OR operation.
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EMO", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                 |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   wo   |   0x0   | EMO    | Input event mask configuration bitfield update with bitwise OR operation. It allows setting EMCL[i], EMINTCL[i] or EMSOC[i] if EMO[i]=1'b1. |

## IRQ_MASK
Interrupt request mask configuration register.
- Offset: `0xc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "IMCL", "bits": 30, "attr": ["rw"], "rotate": 0}, {"name": "IMINTCL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "IMSOC", "bits": 1, "attr": ["rw"], "rotate": -90}], "config": {"lanes": 1, "fontsize": 10, "vspace": 90}}
```

|  Bits  |  Type  |  Reset  | Name    | Description                                                                                                                                                   |
|:------:|:------:|:-------:|:--------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------|
|   31   |   rw   |   0x0   | IMSOC   | Soc peripheral interrupt request mask configuration bitfield: - bit[i]=1'b0: Interrupt request i is masked - bit[i]=1'b1: Interrupt request i is not masked   |
|   30   |   rw   |   0x0   | IMINTCL | Inter-cluster interrupt request mask configuration bitfield: - bit[i]=1'b0: Interrupt request i is masked - bit[i]=1'b1: Interrupt request i is not masked    |
|  29:0  |   rw   |   0x0   | IMCL    | Cluster internal interrupt request mask configuration bitfield: - bit[i]=1'b0: Interrupt request i is masked - bit[i]=1'b1: Interrupt request i is not masked |

## IRQ_MASK_AND
Interrupt request mask update command register with bitwise AND operation.
- Offset: `0x10`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "IMA", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                         |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   wo   |   0x0   | IMA    | Interrupt request mask configuration bitfield update with bitwise AND operation. It allows clearing IMCL[i], IMINTCL[i] or IMSOC[i] if IMA[i]=1'b1. |

## IRQ_MASK_OR
Interrupt request mask update command register with bitwise OR operation.
- Offset: `0x14`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "IMO", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                       |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   wo   |   0x0   | IMO    | Interrupt request mask configuration bitfield update with bitwise OR operation. It allows setting IMCL[i], IMINTCL[i] or IMSOC[i] if IMO[i]=1'b1. |

## CLOCK_STATUS
Cluster cores clock status register.
- Offset: `0x18`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "CS", "bits": 1, "attr": ["ro"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                       |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------------------------------------|
|  31:1  |        |         |        | Reserved                                                                                                          |
|   0    |   ro   |   0x0   | CS     | Cluster core clock status bitfield: - 1'b0: Cluster core clocked is gated - 1'b1: Cluster core clocked is running |

## EVENT_BUFFER
Pending input events status register.
- Offset: `0x1c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EB", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                      |
|:------:|:------:|:-------:|:-------|:-------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EB     | Pending input events status bitfield. EB[i]=1'b1: one or more input event i request are pending. |

## EVENT_BUFFER_MASKED
Pending input events status register with EVT_MASK applied.
- Offset: `0x20`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                             |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Pending input events status bitfield with EVT_MASK applied. EBM[i]=1'b1: one or more input event i request are pending. |

## EVENT_BUFFER_IRQ_MASKED
Pending input events status register with IRQ_MASK applied.
- Offset: `0x24`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "IBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                       |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | IBM    | Pending input events status bitfield with IRQ_MASK applied. IBM[i]=1'b1:  one or more input events i are pending. |

## EVENT_BUFFER_CLEAR
Pending input events status clear command register.
- Offset: `0x28`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBC", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                  |
|:------:|:------:|:-------:|:-------|:---------------------------------------------------------------------------------------------|
|  31:0  |   wo   |   0x0   | EBC    | Pending input events status clear command bitfield. It allows clearing EB[i] if EBC[i]=1'b1. |

## SW_EVENT_MASK
Software events cluster cores destination mask configuration register.
- Offset: `0x2c`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "SWEM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                        |
|:------:|:------:|:-------:|:-------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                           |
|  7:0   |   rw   |   0x0   | SWEM   | Software events mask configuration bitfield: - bit[i]=1'b0: software events are masked for CL_CORE[i] - bit[i]=1'b1: software events are not masked for CL_CORE[i] |

## SW_EVENT_MASK_AND
Software events cluster cores destination mask update command register with bitwise AND operation.
- Offset: `0x30`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "SWEMA", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                |
|:------:|:------:|:-------:|:-------|:---------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                   |
|  7:0   |   wo   |   0x0   | SWEMA  | Software event mask configuration bitfield update with bitwise AND operation. It allows clearing SWEM[i] if SWEMA[i]=1'b1. |

## SW_EVENT_MASK_OR
Software events cluster cores destination mask update command register with bitwise OR operation.
- Offset: `0x34`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "SWEMO", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                              |
|:------:|:------:|:-------:|:-------|:-------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                 |
|  7:0   |   wo   |   0x0   | SWEMO  | Software event mask configuration bitfield update with bitwise OR operation. It allows setting SWEM[i] if SWEMO[i]=1'b1. |

## EVENT_WAIT
Input event wait command register.
- Offset: `0x38`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                 |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Reading this register will gate the Cluster core clock until at least one unmasked event occurs. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## EVENT_WAIT_CLEAR
Input event wait and clear command register.
- Offset: `0x3c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                                           |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Reading this register has the same effect as reading EVENT_WAIT.EBM. In addition, EVENT_BUFFER.EB[i] bits are cleared if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## HW_DISPATCH_PUSH_TASK
Hardware task dispatcher push command register.
- Offset: `0x40`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "MSG", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                  |
|:------:|:------:|:-------:|:-------|:-------------------------------------------------------------------------------------------------------------|
|  31:0  |   wo   |   0x0   | MSG    | Message to dispatch to all cluster cores selected in HW_DISPATCH_PUSH_TEAM_CONFIG.CT configuration bitfield. |

## HW_DISPATCH_POP_TASK
Hardware task dispatcher pop command register.
- Offset: `0x44`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "MSG", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                |
|:------:|:------:|:-------:|:-------|:---------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | MSG    | Message dispatched using HW_DISPATCH_PUSH_TASK command and popped by cluster core who issued HW_DISPATCH_POP_TASK command. |

## HW_DISPATCH_PUSH_TEAM_CONFIG
Hardware task dispatcher cluster core team configuration register.
- Offset: `0x48`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "CT", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                           |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                              |
|  7:0   |   rw   |   0x0   | CT     | Cluster cores team selection configuration bitfield. It allows to transmit HW_DISPATCH_PUSH_TASK.MSG to cluster core i if CT[i]=1'b1. |

## HW_MUTEX_0_MSG_PUT
Hardware mutex 0 non-blocking put command register.
- Offset: `0x4c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "MSG", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                         |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------|
|  31:0  |   wo   |   0x0   | MSG    | Message pushed when releasing hardware mutex 0 configuration bitfiled. It is a non-blocking access. |

## HW_MUTEX_0_MSG_GET
Hardware mutex 0 blocking get command register.
- Offset: `0x50`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "MSG", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                         |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | MSG    | Message popped when taking hardware mutex 0 data bitfiled. It is a blocking access. |

## HW_MUTEX_1_MSG_PUT
Hardware mutex 1 non-blocking put command register.
- Offset: `0x54`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "MSG", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                         |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------|
|  31:0  |   wo   |   0x0   | MSG    | Message pushed when releasing hardware mutex 1 configuration bitfiled. It is a non-blocking access. |

## HW_MUTEX_1_MSG_GET
Hardware mutex 1 blocking get command register.
- Offset: `0x58`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "MSG", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                         |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | MSG    | Message popped when taking hardware mutex 1 data bitfiled. It is a blocking access. |

## SW_EVENT_0_TRIG
Cluster Software event 0 trigger command register.
- Offset: `0x5c`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "SW0T", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                   |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                      |
|  7:0   |   wo   |   0x0   | SW0T   | Triggers software event 0 for cluster core i if SW0T[i]=1'b1. |

## SW_EVENT_1_TRIG
Cluster Software event 1 trigger command register.
- Offset: `0x60`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "SW1T", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                   |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                      |
|  7:0   |   wo   |   0x0   | SW1T   | Triggers software event 1 for cluster core i if SW1T[i]=1'b1. |

## SW_EVENT_2_TRIG
Cluster Software event 2 trigger command register.
- Offset: `0x64`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "SW2T", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                   |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                      |
|  7:0   |   wo   |   0x0   | SW2T   | Triggers software event 2 for cluster core i if SW2T[i]=1'b1. |

## SW_EVENT_3_TRIG
Cluster Software event 3 trigger command register.
- Offset: `0x68`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "SW3T", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                   |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                      |
|  7:0   |   wo   |   0x0   | SW3T   | Triggers software event 3 for cluster core i if SW3T[i]=1'b1. |

## SW_EVENT_4_TRIG
Cluster Software event 4 trigger command register.
- Offset: `0x6c`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "SW4T", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                   |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                      |
|  7:0   |   wo   |   0x0   | SW4T   | Triggers software event 4 for cluster core i if SW4T[i]=1'b1. |

## SW_EVENT_5_TRIG
Cluster Software event 5 trigger command register.
- Offset: `0x70`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "SW5T", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                   |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                      |
|  7:0   |   wo   |   0x0   | SW5T   | Triggers software event 5 for cluster core i if SW5T[i]=1'b1. |

## SW_EVENT_6_TRIG
Cluster Software event 6 trigger command register.
- Offset: `0x74`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "SW6T", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                   |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                      |
|  7:0   |   wo   |   0x0   | SW6T   | Triggers software event 6 for cluster core i if SW6T[i]=1'b1. |

## SW_EVENT_7_TRIG
Cluster Software event 7 trigger command register.
- Offset: `0x78`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "SW7T", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                   |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                      |
|  7:0   |   wo   |   0x0   | SW7T   | Triggers software event 7 for cluster core i if SW7T[i]=1'b1. |

## SW_EVENT_0_TRIG_WAIT
Cluster Software event 0 trigger and wait command register.
- Offset: `0x7c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                                                           |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Triggers software event 0 to all cluster cores targeted in SW_EVENT_MASK and gate the issuing cluster core clock until at least one unmasked event occurs. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## SW_EVENT_1_TRIG_WAIT
Cluster Software event 1 trigger and wait command register.
- Offset: `0x80`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                                                           |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Triggers software event 1 to all cluster cores targeted in SW_EVENT_MASK and gate the issuing cluster core clock until at least one unmasked event occurs. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## SW_EVENT_2_TRIG_WAIT
Cluster Software event 2 trigger and wait command register.
- Offset: `0x84`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                                                           |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Triggers software event 2 to all cluster cores targeted in SW_EVENT_MASK and gate the issuing cluster core clock until at least one unmasked event occurs. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## SW_EVENT_3_TRIG_WAIT
Cluster Software event 3 trigger and wait command register.
- Offset: `0x88`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                                                           |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Triggers software event 3 to all cluster cores targeted in SW_EVENT_MASK and gate the issuing cluster core clock until at least one unmasked event occurs. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## SW_EVENT_4_TRIG_WAIT
Cluster Software event 4 trigger and wait command register.
- Offset: `0x8c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                                                           |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Triggers software event 4 to all cluster cores targeted in SW_EVENT_MASK and gate the issuing cluster core clock until at least one unmasked event occurs. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## SW_EVENT_5_TRIG_WAIT
Cluster Software event 5 trigger and wait command register.
- Offset: `0x90`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                                                           |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Triggers software event 5 to all cluster cores targeted in SW_EVENT_MASK and gate the issuing cluster core clock until at least one unmasked event occurs. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## SW_EVENT_6_TRIG_WAIT
Cluster Software event 6 trigger and wait command register.
- Offset: `0x94`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                                                           |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Triggers software event 6 to all cluster cores targeted in SW_EVENT_MASK and gate the issuing cluster core clock until at least one unmasked event occurs. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## SW_EVENT_7_TRIG_WAIT
Cluster Software event 7 trigger and wait command register.
- Offset: `0x98`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                                                           |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Triggers software event 7 to all cluster cores targeted in SW_EVENT_MASK and gate the issuing cluster core clock until at least one unmasked event occurs. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## SW_EVENT_0_TRIG_WAIT_CLEAR
Cluster Software event 0 trigger, wait and clear command register.
- Offset: `0x9c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                                    |
|:------:|:------:|:-------:|:----------------------------------------|
|  31:0  |   ro   |   0x0   | [EBM](#sw_event_0_trig_wait_clear--ebm) |

### SW_EVENT_0_TRIG_WAIT_CLEAR . EBM
Triggers software event 0 to all cluster cores targeted in SW_EVENT_MASK and gate the issuing cluster core clock until at least one unmasked event occurs.
In addition, EVENT_BUFFER.EB[i] bits are cleared after the read if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM

## SW_EVENT_1_TRIG_WAIT_CLEAR
Cluster Software event 1 trigger, wait and clear command register.
- Offset: `0xa0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                                    |
|:------:|:------:|:-------:|:----------------------------------------|
|  31:0  |   ro   |   0x0   | [EBM](#sw_event_1_trig_wait_clear--ebm) |

### SW_EVENT_1_TRIG_WAIT_CLEAR . EBM
Triggers software event 1 to all cluster cores targeted in SW_EVENT_MASK and gate the issuing cluster core clock until at least one unmasked event occurs.
In addition, EVENT_BUFFER.EB[i] bits are cleared after the read if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM

## SW_EVENT_2_TRIG_WAIT_CLEAR
Cluster Software event 2 trigger, wait and clear command register.
- Offset: `0xa4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                                    |
|:------:|:------:|:-------:|:----------------------------------------|
|  31:0  |   ro   |   0x0   | [EBM](#sw_event_2_trig_wait_clear--ebm) |

### SW_EVENT_2_TRIG_WAIT_CLEAR . EBM
Triggers software event 2 to all cluster cores targeted in SW_EVENT_MASK and gate the issuing cluster core clock until at least one unmasked event occurs.
In addition, EVENT_BUFFER.EB[i] bits are cleared after the read if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM

## SW_EVENT_3_TRIG_WAIT_CLEAR
Cluster Software event 3 trigger, wait and clear command register.
- Offset: `0xa8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                                    |
|:------:|:------:|:-------:|:----------------------------------------|
|  31:0  |   ro   |   0x0   | [EBM](#sw_event_3_trig_wait_clear--ebm) |

### SW_EVENT_3_TRIG_WAIT_CLEAR . EBM
Triggers software event 3 to all cluster cores targeted in SW_EVENT_MASK and gate the issuing cluster core clock until at least one unmasked event occurs.
In addition, EVENT_BUFFER.EB[i] bits are cleared after the read if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM

## SW_EVENT_4_TRIG_WAIT_CLEAR
Cluster Software event 4 trigger, wait and clear command register.
- Offset: `0xac`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                                    |
|:------:|:------:|:-------:|:----------------------------------------|
|  31:0  |   ro   |   0x0   | [EBM](#sw_event_4_trig_wait_clear--ebm) |

### SW_EVENT_4_TRIG_WAIT_CLEAR . EBM
Triggers software event 4 to all cluster cores targeted in SW_EVENT_MASK and gate the issuing cluster core clock until at least one unmasked event occurs.
In addition, EVENT_BUFFER.EB[i] bits are cleared after the read if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM

## SW_EVENT_5_TRIG_WAIT_CLEAR
Cluster Software event 5 trigger, wait and clear command register.
- Offset: `0xb0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                                    |
|:------:|:------:|:-------:|:----------------------------------------|
|  31:0  |   ro   |   0x0   | [EBM](#sw_event_5_trig_wait_clear--ebm) |

### SW_EVENT_5_TRIG_WAIT_CLEAR . EBM
Triggers software event 5 to all cluster cores targeted in SW_EVENT_MASK and gate the issuing cluster core clock until at least one unmasked event occurs.
In addition, EVENT_BUFFER.EB[i] bits are cleared after the read if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM

## SW_EVENT_6_TRIG_WAIT_CLEAR
Cluster Software event 6 trigger, wait and clear command register.
- Offset: `0xb4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                                    |
|:------:|:------:|:-------:|:----------------------------------------|
|  31:0  |   ro   |   0x0   | [EBM](#sw_event_6_trig_wait_clear--ebm) |

### SW_EVENT_6_TRIG_WAIT_CLEAR . EBM
Triggers software event 6 to all cluster cores targeted in SW_EVENT_MASK and gate the issuing cluster core clock until at least one unmasked event occurs.
In addition, EVENT_BUFFER.EB[i] bits are cleared after the read if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM

## SW_EVENT_7_TRIG_WAIT_CLEAR
Cluster Software event 7 trigger, wait and clear command register.
- Offset: `0xb8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                                    |
|:------:|:------:|:-------:|:----------------------------------------|
|  31:0  |   ro   |   0x0   | [EBM](#sw_event_7_trig_wait_clear--ebm) |

### SW_EVENT_7_TRIG_WAIT_CLEAR . EBM
Triggers software event 7 to all cluster cores targeted in SW_EVENT_MASK and gate the issuing cluster core clock until at least one unmasked event occurs.
In addition, EVENT_BUFFER.EB[i] bits are cleared after the read if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM

## SOC_PERIPH_EVENT_ID
Cluster SoC peripheral event ID status register.
- Offset: `0xbc`
- Reset default: `0x0`
- Reset mask: `0x800000ff`

### Fields

```wavejson
{"reg": [{"name": "ID", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 23}, {"name": "VALID", "bits": 1, "attr": ["ro"], "rotate": -90}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                      |
|:------:|:------:|:-------:|:-------|:-------------------------------------------------|
|   31   |   ro   |   0x0   | VALID  | Validity bit of SOC_PERIPH_EVENT_ID.ID bitfield. |
|  30:8  |        |         |        | Reserved                                         |
|  7:0   |   ro   |   0x0   | ID     | Oldest SoC peripheral event ID status bitfield.  |

## HW_BARRIER_0_TRIG_MASK
Cluster hardware barrier 0 trigger mask configuration register.
- Offset: `0xc0`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HB0TM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                               |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                  |
|  7:0   |   rw   |   0x0   | HB0TM  | Trigger mask for hardware barrier 0 bitfield. Hardware barrier 0 will be triggered only if for all HB0TM[i] = 1'b1,  HW_BARRIER_0_STATUS.HB0S[i]=1'b1. HB0TM=0 means that hardware barrier 0 is disabled. |

## HW_BARRIER_1_TRIG_MASK
Cluster hardware barrier 1 trigger mask configuration register.
- Offset: `0xc4`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HB1TM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                               |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                  |
|  7:0   |   rw   |   0x0   | HB1TM  | Trigger mask for hardware barrier 1 bitfield. Hardware barrier 1 will be triggered only if for all HB1TM[i] = 1'b1,  HW_BARRIER_1_STATUS.HB1S[i]=1'b1. HB1TM=0 means that hardware barrier 1 is disabled. |

## HW_BARRIER_2_TRIG_MASK
Cluster hardware barrier 2 trigger mask configuration register.
- Offset: `0xc8`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HB2TM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                               |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                  |
|  7:0   |   rw   |   0x0   | HB2TM  | Trigger mask for hardware barrier 2 bitfield. Hardware barrier 2 will be triggered only if for all HB2TM[i] = 1'b1,  HW_BARRIER_2_STATUS.HB2S[i]=1'b1. HB2TM=0 means that hardware barrier 2 is disabled. |

## HW_BARRIER_3_TRIG_MASK
Cluster hardware barrier 3 trigger mask configuration register.
- Offset: `0xcc`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HB3TM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                               |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                  |
|  7:0   |   rw   |   0x0   | HB3TM  | Trigger mask for hardware barrier 3 bitfield. Hardware barrier 3 will be triggered only if for all HB3TM[i] = 1'b1,  HW_BARRIER_3_STATUS.HB3S[i]=1'b1. HB3TM=0 means that hardware barrier 3 is disabled. |

## HW_BARRIER_4_TRIG_MASK
Cluster hardware barrier 4 trigger mask configuration register.
- Offset: `0xd0`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HB4TM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                               |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                  |
|  7:0   |   rw   |   0x0   | HB4TM  | Trigger mask for hardware barrier 4 bitfield. Hardware barrier 4 will be triggered only if for all HB4TM[i] = 1'b1,  HW_BARRIER_4_STATUS.HB4S[i]=1'b1. HB4TM=0 means that hardware barrier 4 is disabled. |

## HW_BARRIER_5_TRIG_MASK
Cluster hardware barrier 5 trigger mask configuration register.
- Offset: `0xd4`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HB5TM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                               |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                  |
|  7:0   |   rw   |   0x0   | HB5TM  | Trigger mask for hardware barrier 5 bitfield. Hardware barrier 5 will be triggered only if for all HB5TM[i] = 1'b1,  HW_BARRIER_5_STATUS.HB5S[i]=1'b1. HB5TM=0 means that hardware barrier 5 is disabled. |

## HW_BARRIER_6_TRIG_MASK
Cluster hardware barrier 6 trigger mask configuration register.
- Offset: `0xd8`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HB6TM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                               |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                  |
|  7:0   |   rw   |   0x0   | HB6TM  | Trigger mask for hardware barrier 6 bitfield. Hardware barrier 6 will be triggered only if for all HB6TM[i] = 1'b1,  HW_BARRIER_6_STATUS.HB6S[i]=1'b1. HB6TM=0 means that hardware barrier 6 is disabled. |

## HW_BARRIER_7_TRIG_MASK
Cluster hardware barrier 7 trigger mask configuration register.
- Offset: `0xdc`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HB7TM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                               |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                  |
|  7:0   |   rw   |   0x0   | HB7TM  | Trigger mask for hardware barrier 7 bitfield. Hardware barrier 7 will be triggered only if for all HB7TM[i] = 1'b1,  HW_BARRIER_7_STATUS.HB7S[i]=1'b1. HB7TM=0 means that hardware barrier 7 is disabled. |

## HW_BARRIER_0_STATUS
Cluster hardware barrier 0 status register.
- Offset: `0xe0`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBS", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                         |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                            |
|  7:0   |   ro   |   0x0   | HBS    | Current status of hardware barrier 0 bitfield. HBS[i]=1'b1 means that cluster core i has triggered hardware barrier 0. It is cleared when HBS matches HW_BARRIER_0_TRIG_MASK.HB0TM. |

## HW_BARRIER_1_STATUS
Cluster hardware barrier 1 status register.
- Offset: `0xe4`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBS", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                         |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                            |
|  7:0   |   ro   |   0x0   | HBS    | Current status of hardware barrier 1 bitfield. HBS[i]=1'b1 means that cluster core i has triggered hardware barrier 1. It is cleared when HBS matches HW_BARRIER_1_TRIG_MASK.HB1TM. |

## HW_BARRIER_2_STATUS
Cluster hardware barrier 2 status register.
- Offset: `0xe8`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBS", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                         |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                            |
|  7:0   |   ro   |   0x0   | HBS    | Current status of hardware barrier 2 bitfield. HBS[i]=1'b1 means that cluster core i has triggered hardware barrier 2. It is cleared when HBS matches HW_BARRIER_2_TRIG_MASK.HB2TM. |

## HW_BARRIER_3_STATUS
Cluster hardware barrier 3 status register.
- Offset: `0xec`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBS", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                         |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                            |
|  7:0   |   ro   |   0x0   | HBS    | Current status of hardware barrier 3 bitfield. HBS[i]=1'b1 means that cluster core i has triggered hardware barrier 3. It is cleared when HBS matches HW_BARRIER_3_TRIG_MASK.HB3TM. |

## HW_BARRIER_4_STATUS
Cluster hardware barrier 4 status register.
- Offset: `0xf0`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBS", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                         |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                            |
|  7:0   |   ro   |   0x0   | HBS    | Current status of hardware barrier 4 bitfield. HBS[i]=1'b1 means that cluster core i has triggered hardware barrier 4. It is cleared when HBS matches HW_BARRIER_4_TRIG_MASK.HB4TM. |

## HW_BARRIER_5_STATUS
Cluster hardware barrier 5 status register.
- Offset: `0xf4`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBS", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                         |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                            |
|  7:0   |   ro   |   0x0   | HBS    | Current status of hardware barrier 5 bitfield. HBS[i]=1'b1 means that cluster core i has triggered hardware barrier 5. It is cleared when HBS matches HW_BARRIER_5_TRIG_MASK.HB5TM. |

## HW_BARRIER_6_STATUS
Cluster hardware barrier 6 status register.
- Offset: `0xf8`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBS", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                         |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                            |
|  7:0   |   ro   |   0x0   | HBS    | Current status of hardware barrier 6 bitfield. HBS[i]=1'b1 means that cluster core i has triggered hardware barrier 6. It is cleared when HBS matches HW_BARRIER_6_TRIG_MASK.HB6TM. |

## HW_BARRIER_7_STATUS
Cluster hardware barrier 7 status register.
- Offset: `0xfc`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBS", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                         |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                            |
|  7:0   |   ro   |   0x0   | HBS    | Current status of hardware barrier 7 bitfield. HBS[i]=1'b1 means that cluster core i has triggered hardware barrier 7. It is cleared when HBS matches HW_BARRIER_7_TRIG_MASK.HB7TM. |

## HW_BARRIER_0_STATUS_SUM
Cluster hardware barrier summary status register.
- Offset: `0x100`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBSS", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                          |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                             |
|  7:0   |   ro   |   0x0   | HBSS   | Current status of hardware barrier 0. HBSS[i] represents a summary of the barrier status for core i. |

## HW_BARRIER_1_STATUS_SUM
Cluster hardware barrier summary status register.
- Offset: `0x104`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBSS", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                          |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                             |
|  7:0   |   ro   |   0x0   | HBSS   | Current status of hardware barrier 1. HBSS[i] represents a summary of the barrier status for core i. |

## HW_BARRIER_2_STATUS_SUM
Cluster hardware barrier summary status register.
- Offset: `0x108`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBSS", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                          |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                             |
|  7:0   |   ro   |   0x0   | HBSS   | Current status of hardware barrier 2. HBSS[i] represents a summary of the barrier status for core i. |

## HW_BARRIER_3_STATUS_SUM
Cluster hardware barrier summary status register.
- Offset: `0x10c`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBSS", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                          |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                             |
|  7:0   |   ro   |   0x0   | HBSS   | Current status of hardware barrier 3. HBSS[i] represents a summary of the barrier status for core i. |

## HW_BARRIER_4_STATUS_SUM
Cluster hardware barrier summary status register.
- Offset: `0x110`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBSS", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                          |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                             |
|  7:0   |   ro   |   0x0   | HBSS   | Current status of hardware barrier 4. HBSS[i] represents a summary of the barrier status for core i. |

## HW_BARRIER_5_STATUS_SUM
Cluster hardware barrier summary status register.
- Offset: `0x114`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBSS", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                          |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                             |
|  7:0   |   ro   |   0x0   | HBSS   | Current status of hardware barrier 5. HBSS[i] represents a summary of the barrier status for core i. |

## HW_BARRIER_6_STATUS_SUM
Cluster hardware barrier summary status register.
- Offset: `0x118`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBSS", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                          |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                             |
|  7:0   |   ro   |   0x0   | HBSS   | Current status of hardware barrier 6. HBSS[i] represents a summary of the barrier status for core i. |

## HW_BARRIER_7_STATUS_SUM
Cluster hardware barrier summary status register.
- Offset: `0x11c`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBSS", "bits": 8, "attr": ["ro"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                          |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                             |
|  7:0   |   ro   |   0x0   | HBSS   | Current status of hardware barrier 7. HBSS[i] represents a summary of the barrier status for core i. |

## HW_BARRIER_0_TARGET_MASK
Cluster hardware barrier 0 target mask configuration register.
- Offset: `0x120`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBTAM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                              |
|:------:|:------:|:-------:|:-------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                 |
|  7:0   |   rw   |   0x0   | HBTAM  | Cluster hardware barrier 0 target mask configuration bitfield. HBATM[i]=1'b1 means that cluster core i will receive hardware barrier 0 event when HW_BARRIER_0_STATUS will match HW_BARRIER_0_TRIG_MASK. |

## HW_BARRIER_1_TARGET_MASK
Cluster hardware barrier 1 target mask configuration register.
- Offset: `0x124`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBTAM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                              |
|:------:|:------:|:-------:|:-------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                 |
|  7:0   |   rw   |   0x0   | HBTAM  | Cluster hardware barrier 1 target mask configuration bitfield. HBATM[i]=1'b1 means that cluster core i will receive hardware barrier 1 event when HW_BARRIER_1_STATUS will match HW_BARRIER_1_TRIG_MASK. |

## HW_BARRIER_2_TARGET_MASK
Cluster hardware barrier 2 target mask configuration register.
- Offset: `0x128`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBTAM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                              |
|:------:|:------:|:-------:|:-------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                 |
|  7:0   |   rw   |   0x0   | HBTAM  | Cluster hardware barrier 2 target mask configuration bitfield. HBATM[i]=1'b1 means that cluster core i will receive hardware barrier 2 event when HW_BARRIER_2_STATUS will match HW_BARRIER_2_TRIG_MASK. |

## HW_BARRIER_3_TARGET_MASK
Cluster hardware barrier 3 target mask configuration register.
- Offset: `0x12c`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBTAM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                              |
|:------:|:------:|:-------:|:-------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                 |
|  7:0   |   rw   |   0x0   | HBTAM  | Cluster hardware barrier 3 target mask configuration bitfield. HBATM[i]=1'b1 means that cluster core i will receive hardware barrier 3 event when HW_BARRIER_3_STATUS will match HW_BARRIER_3_TRIG_MASK. |

## HW_BARRIER_4_TARGET_MASK
Cluster hardware barrier 4 target mask configuration register.
- Offset: `0x130`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBTAM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                              |
|:------:|:------:|:-------:|:-------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                 |
|  7:0   |   rw   |   0x0   | HBTAM  | Cluster hardware barrier 4 target mask configuration bitfield. HBATM[i]=1'b1 means that cluster core i will receive hardware barrier 4 event when HW_BARRIER_4_STATUS will match HW_BARRIER_4_TRIG_MASK. |

## HW_BARRIER_5_TARGET_MASK
Cluster hardware barrier 5 target mask configuration register.
- Offset: `0x134`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBTAM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                              |
|:------:|:------:|:-------:|:-------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                 |
|  7:0   |   rw   |   0x0   | HBTAM  | Cluster hardware barrier 5 target mask configuration bitfield. HBATM[i]=1'b1 means that cluster core i will receive hardware barrier 5 event when HW_BARRIER_5_STATUS will match HW_BARRIER_5_TRIG_MASK. |

## HW_BARRIER_6_TARGET_MASK
Cluster hardware barrier 6 target mask configuration register.
- Offset: `0x138`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBTAM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                              |
|:------:|:------:|:-------:|:-------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                 |
|  7:0   |   rw   |   0x0   | HBTAM  | Cluster hardware barrier 6 target mask configuration bitfield. HBATM[i]=1'b1 means that cluster core i will receive hardware barrier 6 event when HW_BARRIER_6_STATUS will match HW_BARRIER_6_TRIG_MASK. |

## HW_BARRIER_7_TARGET_MASK
Cluster hardware barrier 7 target mask configuration register.
- Offset: `0x13c`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "HBTAM", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                              |
|:------:|:------:|:-------:|:-------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                 |
|  7:0   |   rw   |   0x0   | HBTAM  | Cluster hardware barrier 7 target mask configuration bitfield. HBATM[i]=1'b1 means that cluster core i will receive hardware barrier 7 event when HW_BARRIER_7_STATUS will match HW_BARRIER_7_TRIG_MASK. |

## HW_BARRIER_0_TRIG
Cluster hardware barrier 0 trigger command register.
- Offset: `0x140`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "T", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                             |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                |
|  7:0   |   wo   |   0x0   | T      | Sets HW_BARRIER_0_STATUS.HBS[i] to 1'b1 when T[i]=1'b1. |

## HW_BARRIER_1_TRIG
Cluster hardware barrier 1 trigger command register.
- Offset: `0x144`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "T", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                             |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                |
|  7:0   |   wo   |   0x0   | T      | Sets HW_BARRIER_1_STATUS.HBS[i] to 1'b1 when T[i]=1'b1. |

## HW_BARRIER_2_TRIG
Cluster hardware barrier 2 trigger command register.
- Offset: `0x148`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "T", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                             |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                |
|  7:0   |   wo   |   0x0   | T      | Sets HW_BARRIER_2_STATUS.HBS[i] to 1'b1 when T[i]=1'b1. |

## HW_BARRIER_3_TRIG
Cluster hardware barrier 3 trigger command register.
- Offset: `0x14c`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "T", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                             |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                |
|  7:0   |   wo   |   0x0   | T      | Sets HW_BARRIER_3_STATUS.HBS[i] to 1'b1 when T[i]=1'b1. |

## HW_BARRIER_4_TRIG
Cluster hardware barrier 4 trigger command register.
- Offset: `0x150`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "T", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                             |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                |
|  7:0   |   wo   |   0x0   | T      | Sets HW_BARRIER_4_STATUS.HBS[i] to 1'b1 when T[i]=1'b1. |

## HW_BARRIER_5_TRIG
Cluster hardware barrier 5 trigger command register.
- Offset: `0x154`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "T", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                             |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                |
|  7:0   |   wo   |   0x0   | T      | Sets HW_BARRIER_5_STATUS.HBS[i] to 1'b1 when T[i]=1'b1. |

## HW_BARRIER_6_TRIG
Cluster hardware barrier 6 trigger command register.
- Offset: `0x158`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "T", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                             |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                |
|  7:0   |   wo   |   0x0   | T      | Sets HW_BARRIER_6_STATUS.HBS[i] to 1'b1 when T[i]=1'b1. |

## HW_BARRIER_7_TRIG
Cluster hardware barrier 7 trigger command register.
- Offset: `0x15c`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "T", "bits": 8, "attr": ["wo"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                             |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                |
|  7:0   |   wo   |   0x0   | T      | Sets HW_BARRIER_7_STATUS.HBS[i] to 1'b1 when T[i]=1'b1. |

## HW_BARRIER_0_SELF_TRIG
Cluster hardware barrier 0 self trigger command register.
- Offset: `0x160`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "T", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                            |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | T      | Sets HW_BARRIER_0_STATUS.HBS[i] to 1'b1 when issued by cluster core i. |

## HW_BARRIER_1_SELF_TRIG
Cluster hardware barrier 1 self trigger command register.
- Offset: `0x164`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "T", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                            |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | T      | Sets HW_BARRIER_1_STATUS.HBS[i] to 1'b1 when issued by cluster core i. |

## HW_BARRIER_2_SELF_TRIG
Cluster hardware barrier 2 self trigger command register.
- Offset: `0x168`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "T", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                            |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | T      | Sets HW_BARRIER_2_STATUS.HBS[i] to 1'b1 when issued by cluster core i. |

## HW_BARRIER_3_SELF_TRIG
Cluster hardware barrier 3 self trigger command register.
- Offset: `0x16c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "T", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                            |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | T      | Sets HW_BARRIER_3_STATUS.HBS[i] to 1'b1 when issued by cluster core i. |

## HW_BARRIER_4_SELF_TRIG
Cluster hardware barrier 4 self trigger command register.
- Offset: `0x170`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "T", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                            |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | T      | Sets HW_BARRIER_4_STATUS.HBS[i] to 1'b1 when issued by cluster core i. |

## HW_BARRIER_5_SELF_TRIG
Cluster hardware barrier 5 self trigger command register.
- Offset: `0x174`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "T", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                            |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | T      | Sets HW_BARRIER_5_STATUS.HBS[i] to 1'b1 when issued by cluster core i. |

## HW_BARRIER_6_SELF_TRIG
Cluster hardware barrier 6 self trigger command register.
- Offset: `0x178`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "T", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                            |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | T      | Sets HW_BARRIER_6_STATUS.HBS[i] to 1'b1 when issued by cluster core i. |

## HW_BARRIER_7_SELF_TRIG
Cluster hardware barrier 7 self trigger command register.
- Offset: `0x17c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "T", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                            |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | T      | Sets HW_BARRIER_7_STATUS.HBS[i] to 1'b1 when issued by cluster core i. |

## HW_BARRIER_0_TRIG_WAIT
Cluster hardware barrier 0 trigger and wait command register.
- Offset: `0x180`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                            |
|:------:|:------:|:-------:|:-------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Set HW_BARRIER_0[i] when issued by cluster core i and gate the issuing cluster core i clock until HW_BARRIER_0 is released. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## HW_BARRIER_1_TRIG_WAIT
Cluster hardware barrier 1 trigger and wait command register.
- Offset: `0x184`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                            |
|:------:|:------:|:-------:|:-------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Set HW_BARRIER_1[i] when issued by cluster core i and gate the issuing cluster core i clock until HW_BARRIER_1 is released. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## HW_BARRIER_2_TRIG_WAIT
Cluster hardware barrier 2 trigger and wait command register.
- Offset: `0x188`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                            |
|:------:|:------:|:-------:|:-------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Set HW_BARRIER_2[i] when issued by cluster core i and gate the issuing cluster core i clock until HW_BARRIER_2 is released. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## HW_BARRIER_3_TRIG_WAIT
Cluster hardware barrier 3 trigger and wait command register.
- Offset: `0x18c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                            |
|:------:|:------:|:-------:|:-------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Set HW_BARRIER_3[i] when issued by cluster core i and gate the issuing cluster core i clock until HW_BARRIER_3 is released. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## HW_BARRIER_4_TRIG_WAIT
Cluster hardware barrier 4 trigger and wait command register.
- Offset: `0x190`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                            |
|:------:|:------:|:-------:|:-------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Set HW_BARRIER_4[i] when issued by cluster core i and gate the issuing cluster core i clock until HW_BARRIER_4 is released. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## HW_BARRIER_5_TRIG_WAIT
Cluster hardware barrier 5 trigger and wait command register.
- Offset: `0x194`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                            |
|:------:|:------:|:-------:|:-------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Set HW_BARRIER_5[i] when issued by cluster core i and gate the issuing cluster core i clock until HW_BARRIER_5 is released. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## HW_BARRIER_6_TRIG_WAIT
Cluster hardware barrier 6 trigger and wait command register.
- Offset: `0x198`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                            |
|:------:|:------:|:-------:|:-------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Set HW_BARRIER_6[i] when issued by cluster core i and gate the issuing cluster core i clock until HW_BARRIER_6 is released. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## HW_BARRIER_7_TRIG_WAIT
Cluster hardware barrier 7 trigger and wait command register.
- Offset: `0x19c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                            |
|:------:|:------:|:-------:|:-------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:0  |   ro   |   0x0   | EBM    | Set HW_BARRIER_7[i] when issued by cluster core i and gate the issuing cluster core i clock until HW_BARRIER_7 is released. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM |

## HW_BARRIER_0_TRIG_WAIT_CLEAR
Cluster hardware barrier 0 trigger, wait and clear command register.
- Offset: `0x1a0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                                      |
|:------:|:------:|:-------:|:------------------------------------------|
|  31:0  |   ro   |   0x0   | [EBM](#hw_barrier_0_trig_wait_clear--ebm) |

### HW_BARRIER_0_TRIG_WAIT_CLEAR . EBM
Set HW_BARRIER_0[i] when issued by cluster core i and gate the issuing cluster core i clock until HW_BARRIER_0 is released.
In addition, EVENT_BUFFER.EB[i] bits are cleared after the read if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM

## HW_BARRIER_1_TRIG_WAIT_CLEAR
Cluster hardware barrier 1 trigger, wait and clear command register.
- Offset: `0x1a4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                                      |
|:------:|:------:|:-------:|:------------------------------------------|
|  31:0  |   ro   |   0x0   | [EBM](#hw_barrier_1_trig_wait_clear--ebm) |

### HW_BARRIER_1_TRIG_WAIT_CLEAR . EBM
Set HW_BARRIER_1[i] when issued by cluster core i and gate the issuing cluster core i clock until HW_BARRIER_1 is released.
In addition, EVENT_BUFFER.EB[i] bits are cleared after the read if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM

## HW_BARRIER_2_TRIG_WAIT_CLEAR
Cluster hardware barrier 2 trigger, wait and clear command register.
- Offset: `0x1a8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                                      |
|:------:|:------:|:-------:|:------------------------------------------|
|  31:0  |   ro   |   0x0   | [EBM](#hw_barrier_2_trig_wait_clear--ebm) |

### HW_BARRIER_2_TRIG_WAIT_CLEAR . EBM
Set HW_BARRIER_2[i] when issued by cluster core i and gate the issuing cluster core i clock until HW_BARRIER_2 is released.
In addition, EVENT_BUFFER.EB[i] bits are cleared after the read if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM

## HW_BARRIER_3_TRIG_WAIT_CLEAR
Cluster hardware barrier 3 trigger, wait and clear command register.
- Offset: `0x1ac`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                                      |
|:------:|:------:|:-------:|:------------------------------------------|
|  31:0  |   ro   |   0x0   | [EBM](#hw_barrier_3_trig_wait_clear--ebm) |

### HW_BARRIER_3_TRIG_WAIT_CLEAR . EBM
Set HW_BARRIER_3[i] when issued by cluster core i and gate the issuing cluster core i clock until HW_BARRIER_3 is released.
In addition, EVENT_BUFFER.EB[i] bits are cleared after the read if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM

## HW_BARRIER_4_TRIG_WAIT_CLEAR
Cluster hardware barrier 4 trigger, wait and clear command register.
- Offset: `0x1b0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                                      |
|:------:|:------:|:-------:|:------------------------------------------|
|  31:0  |   ro   |   0x0   | [EBM](#hw_barrier_4_trig_wait_clear--ebm) |

### HW_BARRIER_4_TRIG_WAIT_CLEAR . EBM
Set HW_BARRIER_4[i] when issued by cluster core i and gate the issuing cluster core i clock until HW_BARRIER_4 is released.
In addition, EVENT_BUFFER.EB[i] bits are cleared after the read if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM

## HW_BARRIER_5_TRIG_WAIT_CLEAR
Cluster hardware barrier 5 trigger, wait and clear command register.
- Offset: `0x1b4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                                      |
|:------:|:------:|:-------:|:------------------------------------------|
|  31:0  |   ro   |   0x0   | [EBM](#hw_barrier_5_trig_wait_clear--ebm) |

### HW_BARRIER_5_TRIG_WAIT_CLEAR . EBM
Set HW_BARRIER_5[i] when issued by cluster core i and gate the issuing cluster core i clock until HW_BARRIER_5 is released.
In addition, EVENT_BUFFER.EB[i] bits are cleared after the read if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM

## HW_BARRIER_6_TRIG_WAIT_CLEAR
Cluster hardware barrier 6 trigger, wait and clear command register.
- Offset: `0x1b8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                                      |
|:------:|:------:|:-------:|:------------------------------------------|
|  31:0  |   ro   |   0x0   | [EBM](#hw_barrier_6_trig_wait_clear--ebm) |

### HW_BARRIER_6_TRIG_WAIT_CLEAR . EBM
Set HW_BARRIER_6[i] when issued by cluster core i and gate the issuing cluster core i clock until HW_BARRIER_6 is released.
In addition, EVENT_BUFFER.EB[i] bits are cleared after the read if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM

## HW_BARRIER_7_TRIG_WAIT_CLEAR
Cluster hardware barrier 7 trigger, wait and clear command register.
- Offset: `0x1bc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "EBM", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                                      |
|:------:|:------:|:-------:|:------------------------------------------|
|  31:0  |   ro   |   0x0   | [EBM](#hw_barrier_7_trig_wait_clear--ebm) |

### HW_BARRIER_7_TRIG_WAIT_CLEAR . EBM
Set HW_BARRIER_7[i] when issued by cluster core i and gate the issuing cluster core i clock until HW_BARRIER_7 is released.
In addition, EVENT_BUFFER.EB[i] bits are cleared after the read if EVT_MASK[i]=1'b1. The read content of this bitfield is equivalent to EVENT_BUFFER_MASKED.EBM

