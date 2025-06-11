## Summary

| Name                                              | Offset   |   Length | Description                                              |
|:--------------------------------------------------|:---------|---------:|:---------------------------------------------------------|
| apb_adv_timer.[`T0_CMD`](#t0_cmd)                 | 0x0      |        4 | ADV_TIMER0 command register.                             |
| apb_adv_timer.[`T0_CONFIG`](#t0_config)           | 0x4      |        4 | ADV_TIMER0 configuration register.                       |
| apb_adv_timer.[`T0_THRESHOLD`](#t0_threshold)     | 0x8      |        4 | ADV_TIMER0 threshold configuration register.             |
| apb_adv_timer.[`T0_TH_CHANNEL0`](#t0_th_channel0) | 0xc      |        4 | ADV_TIMER0 channel 0 threshold configuration register.   |
| apb_adv_timer.[`T0_TH_CHANNEL1`](#t0_th_channel1) | 0x10     |        4 | ADV_TIMER0 channel 1 threshold configuration register.   |
| apb_adv_timer.[`T0_TH_CHANNEL2`](#t0_th_channel2) | 0x14     |        4 | ADV_TIMER0 channel 2 threshold configuration register.   |
| apb_adv_timer.[`T0_TH_CHANNEL3`](#t0_th_channel3) | 0x18     |        4 | ADV_TIMER0 channel 3 threshold configuration register.   |
| apb_adv_timer.[`T0_COUNTER`](#t0_counter)         | 0x1c     |        4 | ADV_TIMER0 counter register.                             |
| apb_adv_timer.[`T1_CMD`](#t1_cmd)                 | 0x20     |        4 | ADV_TIMER1 command register.                             |
| apb_adv_timer.[`T1_CONFIG`](#t1_config)           | 0x24     |        4 | ADV_TIMER1 configuration register.                       |
| apb_adv_timer.[`T1_THRESHOLD`](#t1_threshold)     | 0x28     |        4 | ADV_TIMER1 threshold configuration register.             |
| apb_adv_timer.[`T1_TH_CHANNEL0`](#t1_th_channel0) | 0x2c     |        4 | ADV_TIMER1 channel 0 threshold configuration register.   |
| apb_adv_timer.[`T1_TH_CHANNEL1`](#t1_th_channel1) | 0x30     |        4 | ADV_TIMER1 channel 1 threshold configuration register.   |
| apb_adv_timer.[`T1_TH_CHANNEL2`](#t1_th_channel2) | 0x34     |        4 | ADV_TIMER1 channel 2 threshold configuration register.   |
| apb_adv_timer.[`T1_TH_CHANNEL3`](#t1_th_channel3) | 0x38     |        4 | ADV_TIMER1 channel 3 threshold configuration register.   |
| apb_adv_timer.[`T1_COUNTER`](#t1_counter)         | 0x3c     |        4 | ADV_TIMER1 counter register.                             |
| apb_adv_timer.[`T2_CMD`](#t2_cmd)                 | 0x40     |        4 | ADV_TIMER2 command register.                             |
| apb_adv_timer.[`T2_CONFIG`](#t2_config)           | 0x44     |        4 | ADV_TIMER2 configuration register.                       |
| apb_adv_timer.[`T2_THRESHOLD`](#t2_threshold)     | 0x48     |        4 | ADV_TIMER2 threshold configuration register.             |
| apb_adv_timer.[`T2_TH_CHANNEL0`](#t2_th_channel0) | 0x4c     |        4 | ADV_TIMER2 channel 0 threshold configuration register.   |
| apb_adv_timer.[`T2_TH_CHANNEL1`](#t2_th_channel1) | 0x50     |        4 | ADV_TIMER2 channel 1 threshold configuration register.   |
| apb_adv_timer.[`T2_TH_CHANNEL2`](#t2_th_channel2) | 0x54     |        4 | ADV_TIMER2 channel 2 threshold configuration register.   |
| apb_adv_timer.[`T2_TH_CHANNEL3`](#t2_th_channel3) | 0x58     |        4 | ADV_TIMER2 channel 3 threshold configuration register.   |
| apb_adv_timer.[`T2_COUNTER`](#t2_counter)         | 0x5c     |        4 | ADV_TIMER2 counter register.                             |
| apb_adv_timer.[`T3_CMD`](#t3_cmd)                 | 0x60     |        4 | ADV_TIMER3 command register.                             |
| apb_adv_timer.[`T3_CONFIG`](#t3_config)           | 0x64     |        4 | ADV_TIMER3 configuration register.                       |
| apb_adv_timer.[`T3_THRESHOLD`](#t3_threshold)     | 0x68     |        4 | ADV_TIMER3 threshold configuration register.             |
| apb_adv_timer.[`T3_TH_CHANNEL0`](#t3_th_channel0) | 0x6c     |        4 | ADV_TIMER3 channel 0 threshold configuration register.   |
| apb_adv_timer.[`T3_TH_CHANNEL1`](#t3_th_channel1) | 0x70     |        4 | ADV_TIMER3 channel 1 threshold configuration register.   |
| apb_adv_timer.[`T3_TH_CHANNEL2`](#t3_th_channel2) | 0x74     |        4 | ADV_TIMER3 channel 2 threshold configuration register.   |
| apb_adv_timer.[`T3_TH_CHANNEL3`](#t3_th_channel3) | 0x78     |        4 | ADV_TIMER3 channel 3 threshold configuration register.   |
| apb_adv_timer.[`T3_COUNTER`](#t3_counter)         | 0x7c     |        4 | ADV_TIMER3 counter register.                             |
| apb_adv_timer.[`EVENT_CFG`](#event_cfg)           | 0x80     |        4 | ADV_TIMERS events configuration register.                |
| apb_adv_timer.[`CG`](#cg)                         | 0x84     |        4 | ADV_TIMERS channels clock gating configuration register. |

## T0_CMD
ADV_TIMER0 command register.
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "START", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "STOP", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "UPDATE", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RESET", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "ARM", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RFU", "bits": 27, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                         |
|:------:|:------:|:-------:|:-------|:------------------------------------|
|  31:5  |   wo   |   0x0   | RFU    | ?                                   |
|   4    |   wo   |   0x0   | ARM    | ADV_TIMER0 arm command bitfield.    |
|   3    |   wo   |   0x0   | RESET  | ADV_TIMER0 reset command bitfield.  |
|   2    |   wo   |   0x0   | UPDATE | ADV_TIMER0 update command bitfield. |
|   1    |   wo   |   0x0   | STOP   | ADV_TIMER0 stop command bitfield.   |
|   0    |   wo   |   0x0   | START  | ADV_TIMER0 start command bitfield.  |

## T0_CONFIG
ADV_TIMER0 configuration register.
- Offset: `0x4`
- Reset default: `0x1000`
- Reset mask: `0xff1fff`

### Fields

```wavejson
{"reg": [{"name": "INSEL", "bits": 8, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"name": "CLKSEL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "UPDOWNSEL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 3}, {"name": "PRESC", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 8}], "config": {"lanes": 1, "fontsize": 10, "vspace": 110}}
```

|  Bits  |  Type  |  Reset  | Name                               |
|:------:|:------:|:-------:|:-----------------------------------|
| 31:24  |        |         | Reserved                           |
| 23:16  |   rw   |   0x0   | [PRESC](#t0_config--presc)         |
| 15:13  |        |         | Reserved                           |
|   12   |   rw   |   0x1   | [UPDOWNSEL](#t0_config--updownsel) |
|   11   |   rw   |   0x0   | [CLKSEL](#t0_config--clksel)       |
|  10:8  |   rw   |   0x0   | [MODE](#t0_config--mode)           |
|  7:0   |   rw   |   0x0   | [INSEL](#t0_config--insel)         |

### T0_CONFIG . PRESC
ADV_TIMER0 prescaler value configuration bitfield.

### T0_CONFIG . UPDOWNSEL
ADV_TIMER0 center-aligned mode configuration bitfield:
- 1'b0: The counter counts up and down alternatively.
- 1'b1: The counter counts up and resets to 0 when reach threshold.	

### T0_CONFIG . CLKSEL
ADV_TIMER0 clock source configuration bitfield:
- 1'b0: FLL
- 1'b1: reference clock at 32kHz

### T0_CONFIG . MODE
ADV_TIMER0 trigger mode configuration bitfield:
- 3'h0: trigger event at each clock cycle.
- 3'h1: trigger event if input source is 0
- 3'h2: trigger event if input source is 1
- 3'h3: trigger event on input source rising edge
- 3'h4: trigger event on input source falling edge
- 3'h5: trigger event on input source falling or rising edge
- 3'h6: trigger event on input source rising edge when armed
- 3'h7: trigger event on input source falling edge when armed

### T0_CONFIG . INSEL
ADV_TIMER0 input source configuration bitfield:
- 0-31: GPIO[0] to GPIO[31]
- 32-35: Channel 0 to 3 of ADV_TIMER0
- 36-39: Channel 0 to 3 of ADV_TIMER1
- 40-43: Channel 0 to 3 of ADV_TIMER2
- 44-47: Channel 0 to 3 of ADV_TIMER3

## T0_THRESHOLD
ADV_TIMER0 threshold configuration register.
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "TH_LO", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "TH_HI", "bits": 16, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                           |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------------------|
| 31:16  |   rw   |   0x0   | TH_HI  | ADV_TIMER0 threshold high part configuration bitfield. It defines end counter value.  |
|  15:0  |   rw   |   0x0   | TH_LO  | ADV_TIMER0 threshold low part configuration bitfield. It defines start counter value. |

## T0_TH_CHANNEL0
ADV_TIMER0 channel 0 threshold configuration register.
- Offset: `0xc`
- Reset default: `0x0`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "TH", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          |
|:------:|:------:|:-------:|:------------------------------|
| 31:19  |        |         | Reserved                      |
| 18:16  |   rw   |   0x0   | [MODE](#t0_th_channel0--mode) |
|  15:0  |   rw   |   0x0   | [TH](#t0_th_channel0--th)     |

### T0_TH_CHANNEL0 . MODE
ADV_TIMER0 channel 0 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.

### T0_TH_CHANNEL0 . TH
ADV_TIMER0 channel 0 threshold configuration bitfield.

## T0_TH_CHANNEL1
ADV_TIMER0 channel 1 threshold configuration register.
- Offset: `0x10`
- Reset default: `0x0`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "TH", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          |
|:------:|:------:|:-------:|:------------------------------|
| 31:19  |        |         | Reserved                      |
| 18:16  |   rw   |   0x0   | [MODE](#t0_th_channel1--mode) |
|  15:0  |   rw   |   0x0   | [TH](#t0_th_channel1--th)     |

### T0_TH_CHANNEL1 . MODE
ADV_TIMER0 channel 1 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.

### T0_TH_CHANNEL1 . TH
ADV_TIMER0 channel 1 threshold configuration bitfield.

## T0_TH_CHANNEL2
ADV_TIMER0 channel 2 threshold configuration register.
- Offset: `0x14`
- Reset default: `0x0`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "TH", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          |
|:------:|:------:|:-------:|:------------------------------|
| 31:19  |        |         | Reserved                      |
| 18:16  |   rw   |   0x0   | [MODE](#t0_th_channel2--mode) |
|  15:0  |   rw   |   0x0   | [TH](#t0_th_channel2--th)     |

### T0_TH_CHANNEL2 . MODE
ADV_TIMER0 channel 2 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.

### T0_TH_CHANNEL2 . TH
ADV_TIMER0 channel 2 threshold configuration bitfield.

## T0_TH_CHANNEL3
ADV_TIMER0 channel 3 threshold configuration register.
- Offset: `0x18`
- Reset default: `0x0`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "TH", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          |
|:------:|:------:|:-------:|:------------------------------|
| 31:19  |        |         | Reserved                      |
| 18:16  |   rw   |   0x0   | [MODE](#t0_th_channel3--mode) |
|  15:0  |   rw   |   0x0   | [TH](#t0_th_channel3--th)     |

### T0_TH_CHANNEL3 . MODE
ADV_TIMER0 channel 3 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.

### T0_TH_CHANNEL3 . TH
ADV_TIMER0 channel 3 threshold configuration bitfield.

## T0_COUNTER
ADV_TIMER0 counter register.
- Offset: `0x1c`
- Reset default: `0x0`
- Reset mask: `0xffff`

### Fields

```wavejson
{"reg": [{"name": "COUNTER", "bits": 16, "attr": ["ro"], "rotate": 0}, {"bits": 16}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name    | Description               |
|:------:|:------:|:-------:|:--------|:--------------------------|
| 31:16  |        |         |         | Reserved                  |
|  15:0  |   ro   |   0x0   | COUNTER | ADV_TIMER0 counter value. |

## T1_CMD
ADV_TIMER1 command register.
- Offset: `0x20`
- Reset default: `0x0`
- Reset mask: `0x1f`

### Fields

```wavejson
{"reg": [{"name": "START", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "STOP", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "UPDATE", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RESET", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "ARM", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 27}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                         |
|:------:|:------:|:-------:|:-------|:------------------------------------|
|  31:5  |        |         |        | Reserved                            |
|   4    |   wo   |   0x0   | ARM    | ADV_TIMER1 arm command bitfield.    |
|   3    |   wo   |   0x0   | RESET  | ADV_TIMER1 reset command bitfield.  |
|   2    |   wo   |   0x0   | UPDATE | ADV_TIMER1 update command bitfield. |
|   1    |   wo   |   0x0   | STOP   | ADV_TIMER1 stop command bitfield.   |
|   0    |   wo   |   0x0   | START  | ADV_TIMER1 start command bitfield.  |

## T1_CONFIG
ADV_TIMER1 configuration register.
- Offset: `0x24`
- Reset default: `0x1000`
- Reset mask: `0xff1fff`

### Fields

```wavejson
{"reg": [{"name": "INSEL", "bits": 8, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"name": "CLKSEL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "UPDOWNSEL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 3}, {"name": "PRESC", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 8}], "config": {"lanes": 1, "fontsize": 10, "vspace": 110}}
```

|  Bits  |  Type  |  Reset  | Name                               |
|:------:|:------:|:-------:|:-----------------------------------|
| 31:24  |        |         | Reserved                           |
| 23:16  |   rw   |   0x0   | [PRESC](#t1_config--presc)         |
| 15:13  |        |         | Reserved                           |
|   12   |   rw   |   0x1   | [UPDOWNSEL](#t1_config--updownsel) |
|   11   |   rw   |   0x0   | [CLKSEL](#t1_config--clksel)       |
|  10:8  |   rw   |   0x0   | [MODE](#t1_config--mode)           |
|  7:0   |   rw   |   0x0   | [INSEL](#t1_config--insel)         |

### T1_CONFIG . PRESC
ADV_TIMER1 prescaler value configuration bitfield.

### T1_CONFIG . UPDOWNSEL
ADV_TIMER1 center-aligned mode configuration bitfield:
- 1'b0: The counter counts up and down alternatively.
- 1'b1: The counter counts up and resets to 0 when reach threshold.

### T1_CONFIG . CLKSEL
ADV_TIMER1 clock source configuration bitfield:
- 1'b0: FLL
- 1'b1: reference clock at 32kHz

### T1_CONFIG . MODE
ADV_TIMER1 trigger mode configuration bitfield:
- 3'h0: trigger event at each clock cycle.
- 3'h1: trigger event if input source is 0
- 3'h2: trigger event if input source is 1
- 3'h3: trigger event on input source rising edge
- 3'h4: trigger event on input source falling edge
- 3'h5: trigger event on input source falling or rising edge
- 3'h6: trigger event on input source rising edge when armed
- 3'h7: trigger event on input source falling edge when armed

### T1_CONFIG . INSEL
ADV_TIMER1 input source configuration bitfield:
- 0-31: GPIO[0] to GPIO[31]
- 32-35: Channel 0 to 3 of ADV_TIMER0
- 36-39: Channel 0 to 3 of ADV_TIMER1
- 40-43: Channel 0 to 3 of ADV_TIMER2
- 44-47: Channel 0 to 3 of ADV_TIMER3

## T1_THRESHOLD
ADV_TIMER1 threshold configuration register.
- Offset: `0x28`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "TH_LO", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "TH_HI", "bits": 16, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                           |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------------------|
| 31:16  |   rw   |   0x0   | TH_HI  | ADV_TIMER1 threshold high part configuration bitfield. It defines end counter value.  |
|  15:0  |   rw   |   0x0   | TH_LO  | ADV_TIMER1 threshold low part configuration bitfield. It defines start counter value. |

## T1_TH_CHANNEL0
ADV_TIMER1 channel 0 threshold configuration register.
- Offset: `0x2c`
- Reset default: `0x0`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "TH", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          |
|:------:|:------:|:-------:|:------------------------------|
| 31:19  |        |         | Reserved                      |
| 18:16  |   rw   |   0x0   | [MODE](#t1_th_channel0--mode) |
|  15:0  |   rw   |   0x0   | [TH](#t1_th_channel0--th)     |

### T1_TH_CHANNEL0 . MODE
ADV_TIMER1 channel 0 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.

### T1_TH_CHANNEL0 . TH
ADV_TIMER1 channel 0 threshold configuration bitfield.

## T1_TH_CHANNEL1
ADV_TIMER1 channel 1 threshold configuration register.
- Offset: `0x30`
- Reset default: `0x0`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "TH", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          |
|:------:|:------:|:-------:|:------------------------------|
| 31:19  |        |         | Reserved                      |
| 18:16  |   rw   |   0x0   | [MODE](#t1_th_channel1--mode) |
|  15:0  |   rw   |   0x0   | [TH](#t1_th_channel1--th)     |

### T1_TH_CHANNEL1 . MODE
ADV_TIMER1 channel 1 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.

### T1_TH_CHANNEL1 . TH
ADV_TIMER1 channel 1 threshold configuration bitfield.

## T1_TH_CHANNEL2
ADV_TIMER1 channel 2 threshold configuration register.
- Offset: `0x34`
- Reset default: `0x0`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "TH", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          |
|:------:|:------:|:-------:|:------------------------------|
| 31:19  |        |         | Reserved                      |
| 18:16  |   rw   |   0x0   | [MODE](#t1_th_channel2--mode) |
|  15:0  |   rw   |   0x0   | [TH](#t1_th_channel2--th)     |

### T1_TH_CHANNEL2 . MODE
ADV_TIMER1 channel 2 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.

### T1_TH_CHANNEL2 . TH
ADV_TIMER1 channel 2 threshold configuration bitfield.

## T1_TH_CHANNEL3
ADV_TIMER1 channel 3 threshold configuration register.
- Offset: `0x38`
- Reset default: `0x0`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "TH", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          |
|:------:|:------:|:-------:|:------------------------------|
| 31:19  |        |         | Reserved                      |
| 18:16  |   rw   |   0x0   | [MODE](#t1_th_channel3--mode) |
|  15:0  |   rw   |   0x0   | [TH](#t1_th_channel3--th)     |

### T1_TH_CHANNEL3 . MODE
ADV_TIMER1 channel 3 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.

### T1_TH_CHANNEL3 . TH
ADV_TIMER1 channel 3 threshold configuration bitfield.

## T1_COUNTER
ADV_TIMER1 counter register.
- Offset: `0x3c`
- Reset default: `0x0`
- Reset mask: `0xffff`

### Fields

```wavejson
{"reg": [{"name": "COUNTER", "bits": 16, "attr": ["ro"], "rotate": 0}, {"bits": 16}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name    | Description               |
|:------:|:------:|:-------:|:--------|:--------------------------|
| 31:16  |        |         |         | Reserved                  |
|  15:0  |   ro   |   0x0   | COUNTER | ADV_TIMER1 counter value. |

## T2_CMD
ADV_TIMER2 command register.
- Offset: `0x40`
- Reset default: `0x0`
- Reset mask: `0x1f`

### Fields

```wavejson
{"reg": [{"name": "START", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "STOP", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "UPDATE", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RESET", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "ARM", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 27}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                         |
|:------:|:------:|:-------:|:-------|:------------------------------------|
|  31:5  |        |         |        | Reserved                            |
|   4    |   wo   |   0x0   | ARM    | ADV_TIMER2 arm command bitfield.    |
|   3    |   wo   |   0x0   | RESET  | ADV_TIMER2 reset command bitfield.  |
|   2    |   wo   |   0x0   | UPDATE | ADV_TIMER2 update command bitfield. |
|   1    |   wo   |   0x0   | STOP   | ADV_TIMER2 stop command bitfield.   |
|   0    |   wo   |   0x0   | START  | ADV_TIMER2 start command bitfield.  |

## T2_CONFIG
ADV_TIMER2 configuration register.
- Offset: `0x44`
- Reset default: `0x1000`
- Reset mask: `0xff1fff`

### Fields

```wavejson
{"reg": [{"name": "INSEL", "bits": 8, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"name": "CLKSEL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "UPDOWNSEL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 3}, {"name": "PRESC", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 8}], "config": {"lanes": 1, "fontsize": 10, "vspace": 110}}
```

|  Bits  |  Type  |  Reset  | Name                               |
|:------:|:------:|:-------:|:-----------------------------------|
| 31:24  |        |         | Reserved                           |
| 23:16  |   rw   |   0x0   | [PRESC](#t2_config--presc)         |
| 15:13  |        |         | Reserved                           |
|   12   |   rw   |   0x1   | [UPDOWNSEL](#t2_config--updownsel) |
|   11   |   rw   |   0x0   | [CLKSEL](#t2_config--clksel)       |
|  10:8  |   rw   |   0x0   | [MODE](#t2_config--mode)           |
|  7:0   |   rw   |   0x0   | [INSEL](#t2_config--insel)         |

### T2_CONFIG . PRESC
ADV_TIMER2 prescaler value configuration bitfield.

### T2_CONFIG . UPDOWNSEL
ADV_TIMER2 center-aligned mode configuration bitfield:
- 1'b0: The counter counts up and down alternatively.
- 1'b1: The counter counts up and resets to 0 when reach threshold.

### T2_CONFIG . CLKSEL
ADV_TIMER2 clock source configuration bitfield:
- 1'b0: FLL
- 1'b1: reference clock at 32kHz

### T2_CONFIG . MODE
ADV_TIMER2 trigger mode configuration bitfield:
- 3'h0: trigger event at each clock cycle.
- 3'h1: trigger event if input source is 0
- 3'h2: trigger event if input source is 1
- 3'h3: trigger event on input source rising edge
- 3'h4: trigger event on input source falling edge
- 3'h5: trigger event on input source falling or rising edge
- 3'h6: trigger event on input source rising edge when armed
- 3'h7: trigger event on input source falling edge when armed

### T2_CONFIG . INSEL
ADV_TIMER2 input source configuration bitfield:
- 0-31: GPIO[0] to GPIO[31]
- 32-35: Channel 0 to 3 of ADV_TIMER0
- 36-39: Channel 0 to 3 of ADV_TIMER1
- 40-43: Channel 0 to 3 of ADV_TIMER2
- 44-47: Channel 0 to 3 of ADV_TIMER3

## T2_THRESHOLD
ADV_TIMER2 threshold configuration register.
- Offset: `0x48`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "TH_LO", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "TH_HI", "bits": 16, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                           |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------------------|
| 31:16  |   rw   |   0x0   | TH_HI  | ADV_TIMER2 threshold high part configuration bitfield. It defines end counter value.  |
|  15:0  |   rw   |   0x0   | TH_LO  | ADV_TIMER2 threshold low part configuration bitfield. It defines start counter value. |

## T2_TH_CHANNEL0
ADV_TIMER2 channel 0 threshold configuration register.
- Offset: `0x4c`
- Reset default: `0x0`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "TH", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          |
|:------:|:------:|:-------:|:------------------------------|
| 31:19  |        |         | Reserved                      |
| 18:16  |   rw   |   0x0   | [MODE](#t2_th_channel0--mode) |
|  15:0  |   rw   |   0x0   | [TH](#t2_th_channel0--th)     |

### T2_TH_CHANNEL0 . MODE
ADV_TIMER2 channel 0 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.

### T2_TH_CHANNEL0 . TH
ADV_TIMER2 channel 0 threshold configuration bitfield.

## T2_TH_CHANNEL1
ADV_TIMER2 channel 1 threshold configuration register.
- Offset: `0x50`
- Reset default: `0x0`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "TH", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          |
|:------:|:------:|:-------:|:------------------------------|
| 31:19  |        |         | Reserved                      |
| 18:16  |   rw   |   0x0   | [MODE](#t2_th_channel1--mode) |
|  15:0  |   rw   |   0x0   | [TH](#t2_th_channel1--th)     |

### T2_TH_CHANNEL1 . MODE
ADV_TIMER2 channel 1 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.

### T2_TH_CHANNEL1 . TH
ADV_TIMER2 channel 1 threshold configuration bitfield.

## T2_TH_CHANNEL2
ADV_TIMER2 channel 2 threshold configuration register.
- Offset: `0x54`
- Reset default: `0x0`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "TH", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          |
|:------:|:------:|:-------:|:------------------------------|
| 31:19  |        |         | Reserved                      |
| 18:16  |   rw   |   0x0   | [MODE](#t2_th_channel2--mode) |
|  15:0  |   rw   |   0x0   | [TH](#t2_th_channel2--th)     |

### T2_TH_CHANNEL2 . MODE
ADV_TIMER2 channel 2 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.

### T2_TH_CHANNEL2 . TH
ADV_TIMER2 channel 2 threshold configuration bitfield.

## T2_TH_CHANNEL3
ADV_TIMER2 channel 3 threshold configuration register.
- Offset: `0x58`
- Reset default: `0x0`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "TH", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          |
|:------:|:------:|:-------:|:------------------------------|
| 31:19  |        |         | Reserved                      |
| 18:16  |   rw   |   0x0   | [MODE](#t2_th_channel3--mode) |
|  15:0  |   rw   |   0x0   | [TH](#t2_th_channel3--th)     |

### T2_TH_CHANNEL3 . MODE
ADV_TIMER2 channel 3 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.

### T2_TH_CHANNEL3 . TH
ADV_TIMER2 channel 3 threshold configuration bitfield.

## T2_COUNTER
ADV_TIMER2 counter register.
- Offset: `0x5c`
- Reset default: `0x0`
- Reset mask: `0xffff`

### Fields

```wavejson
{"reg": [{"name": "COUNTER", "bits": 16, "attr": ["ro"], "rotate": 0}, {"bits": 16}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name    | Description               |
|:------:|:------:|:-------:|:--------|:--------------------------|
| 31:16  |        |         |         | Reserved                  |
|  15:0  |   ro   |   0x0   | COUNTER | ADV_TIMER2 counter value. |

## T3_CMD
ADV_TIMER3 command register.
- Offset: `0x60`
- Reset default: `0x0`
- Reset mask: `0x1f`

### Fields

```wavejson
{"reg": [{"name": "START", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "STOP", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "UPDATE", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "RESET", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "ARM", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 27}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                         |
|:------:|:------:|:-------:|:-------|:------------------------------------|
|  31:5  |        |         |        | Reserved                            |
|   4    |   wo   |   0x0   | ARM    | ADV_TIMER3 arm command bitfield.    |
|   3    |   wo   |   0x0   | RESET  | ADV_TIMER3 reset command bitfield.  |
|   2    |   wo   |   0x0   | UPDATE | ADV_TIMER3 update command bitfield. |
|   1    |   wo   |   0x0   | STOP   | ADV_TIMER3 stop command bitfield.   |
|   0    |   wo   |   0x0   | START  | ADV_TIMER3 start command bitfield.  |

## T3_CONFIG
ADV_TIMER3 configuration register.
- Offset: `0x64`
- Reset default: `0x1000`
- Reset mask: `0xff1fff`

### Fields

```wavejson
{"reg": [{"name": "INSEL", "bits": 8, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"name": "CLKSEL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "UPDOWNSEL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 3}, {"name": "PRESC", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 8}], "config": {"lanes": 1, "fontsize": 10, "vspace": 110}}
```

|  Bits  |  Type  |  Reset  | Name                               |
|:------:|:------:|:-------:|:-----------------------------------|
| 31:24  |        |         | Reserved                           |
| 23:16  |   rw   |   0x0   | [PRESC](#t3_config--presc)         |
| 15:13  |        |         | Reserved                           |
|   12   |   rw   |   0x1   | [UPDOWNSEL](#t3_config--updownsel) |
|   11   |   rw   |   0x0   | [CLKSEL](#t3_config--clksel)       |
|  10:8  |   rw   |   0x0   | [MODE](#t3_config--mode)           |
|  7:0   |   rw   |   0x0   | [INSEL](#t3_config--insel)         |

### T3_CONFIG . PRESC
ADV_TIMER3 prescaler value configuration bitfield.

### T3_CONFIG . UPDOWNSEL
ADV_TIMER3 center-aligned mode configuration bitfield:
- 1'b0: The counter counts up and down alternatively.
- 1'b1: The counter counts up and resets to 0 when reach threshold.

### T3_CONFIG . CLKSEL
ADV_TIMER3 clock source configuration bitfield:
- 1'b0: FLL
- 1'b1: reference clock at 32kHz

### T3_CONFIG . MODE
ADV_TIMER3 trigger mode configuration bitfield:
- 3'h0: trigger event at each clock cycle.
- 3'h1: trigger event if input source is 0
- 3'h2: trigger event if input source is 1
- 3'h3: trigger event on input source rising edge
- 3'h4: trigger event on input source falling edge
- 3'h5: trigger event on input source falling or rising edge
- 3'h6: trigger event on input source rising edge when armed
- 3'h7: trigger event on input source falling edge when armed

### T3_CONFIG . INSEL
ADV_TIMER3 input source configuration bitfield:
- 0-31: GPIO[0] to GPIO[31]
- 32-35: Channel 0 to 3 of ADV_TIMER0
- 36-39: Channel 0 to 3 of ADV_TIMER1
- 40-43: Channel 0 to 3 of ADV_TIMER2
- 44-47: Channel 0 to 3 of ADV_TIMER3

## T3_THRESHOLD
ADV_TIMER3 threshold configuration register.
- Offset: `0x68`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "TH_LO", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "TH_HI", "bits": 16, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                           |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------------------|
| 31:16  |   rw   |   0x0   | TH_HI  | ADV_TIMER3 threshold high part configuration bitfield. It defines end counter value.  |
|  15:0  |   rw   |   0x0   | TH_LO  | ADV_TIMER3 threshold low part configuration bitfield. It defines start counter value. |

## T3_TH_CHANNEL0
ADV_TIMER3 channel 0 threshold configuration register.
- Offset: `0x6c`
- Reset default: `0x0`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "TH", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          |
|:------:|:------:|:-------:|:------------------------------|
| 31:19  |        |         | Reserved                      |
| 18:16  |   rw   |   0x0   | [MODE](#t3_th_channel0--mode) |
|  15:0  |   rw   |   0x0   | [TH](#t3_th_channel0--th)     |

### T3_TH_CHANNEL0 . MODE
ADV_TIMER3 channel 0 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.

### T3_TH_CHANNEL0 . TH
ADV_TIMER3 channel 0 threshold configuration bitfield.

## T3_TH_CHANNEL1
ADV_TIMER3 channel 1 threshold configuration register.
- Offset: `0x70`
- Reset default: `0x0`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "TH", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          |
|:------:|:------:|:-------:|:------------------------------|
| 31:19  |        |         | Reserved                      |
| 18:16  |   rw   |   0x0   | [MODE](#t3_th_channel1--mode) |
|  15:0  |   rw   |   0x0   | [TH](#t3_th_channel1--th)     |

### T3_TH_CHANNEL1 . MODE
ADV_TIMER3 channel 1 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.

### T3_TH_CHANNEL1 . TH
ADV_TIMER3 channel 1 threshold configuration bitfield.

## T3_TH_CHANNEL2
ADV_TIMER3 channel 2 threshold configuration register.
- Offset: `0x74`
- Reset default: `0x0`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "TH", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          |
|:------:|:------:|:-------:|:------------------------------|
| 31:19  |        |         | Reserved                      |
| 18:16  |   rw   |   0x0   | [MODE](#t3_th_channel2--mode) |
|  15:0  |   rw   |   0x0   | [TH](#t3_th_channel2--th)     |

### T3_TH_CHANNEL2 . MODE
ADV_TIMER3 channel 2 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.

### T3_TH_CHANNEL2 . TH
ADV_TIMER3 channel 2 threshold configuration bitfield.

## T3_TH_CHANNEL3
ADV_TIMER3 channel 3 threshold configuration register.
- Offset: `0x78`
- Reset default: `0x0`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "TH", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "MODE", "bits": 3, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          |
|:------:|:------:|:-------:|:------------------------------|
| 31:19  |        |         | Reserved                      |
| 18:16  |   rw   |   0x0   | [MODE](#t3_th_channel3--mode) |
|  15:0  |   rw   |   0x0   | [TH](#t3_th_channel3--th)     |

### T3_TH_CHANNEL3 . MODE
ADV_TIMER3 channel 3 threshold match action on channel output signal configuration bitfield:
- 3'h0: set.
- 3'h1: toggle then next threshold match action is clear.
- 3'h2: set then next threshold match action is clear.
- 3'h3: toggle.
- 3'h4: clear.
- 3'h5: toggle then next threshold match action is set.
- 3'h6: clear then next threshold match action is set.

### T3_TH_CHANNEL3 . TH
ADV_TIMER3 channel 3 threshold configuration bitfield.

## T3_COUNTER
ADV_TIMER3 counter register.
- Offset: `0x7c`
- Reset default: `0x0`
- Reset mask: `0xffff`

### Fields

```wavejson
{"reg": [{"name": "COUNTER", "bits": 16, "attr": ["ro"], "rotate": 0}, {"bits": 16}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name    | Description               |
|:------:|:------:|:-------:|:--------|:--------------------------|
| 31:16  |        |         |         | Reserved                  |
|  15:0  |   ro   |   0x0   | COUNTER | ADV_TIMER3 counter value. |

## EVENT_CFG
ADV_TIMERS events configuration register.
- Offset: `0x80`
- Reset default: `0x0`
- Reset mask: `0xfffff`

### Fields

```wavejson
{"reg": [{"name": "SEL0", "bits": 4, "attr": ["rw"], "rotate": 0}, {"name": "SEL1", "bits": 4, "attr": ["rw"], "rotate": 0}, {"name": "SEL2", "bits": 4, "attr": ["rw"], "rotate": 0}, {"name": "SEL3", "bits": 4, "attr": ["rw"], "rotate": 0}, {"name": "ENA", "bits": 4, "attr": ["rw"], "rotate": 0}, {"bits": 12}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                     |
|:------:|:------:|:-------:|:-------------------------|
| 31:20  |        |         | Reserved                 |
| 19:16  |   rw   |   0x0   | [ENA](#event_cfg--ena)   |
| 15:12  |   rw   |   0x0   | [SEL3](#event_cfg--sel3) |
|  11:8  |   rw   |   0x0   | [SEL2](#event_cfg--sel2) |
|  7:4   |   rw   |   0x0   | [SEL1](#event_cfg--sel1) |
|  3:0   |   rw   |   0x0   | [SEL0](#event_cfg--sel0) |

### EVENT_CFG . ENA
ADV_TIMER output event enable configuration bitfield. ENA[i]=1 enables output event i generation.

### EVENT_CFG . SEL3
ADV_TIMER output event 3 source configuration bitfiled:
- 4'h0: ADV_TIMER0 channel 0.
- 4'h1: ADV_TIMER0 channel 1.
- 4'h2: ADV_TIMER0 channel 2.
- 4'h3: ADV_TIMER0 channel 3.
- 4'h4: ADV_TIMER1 channel 0.
- 4'h5: ADV_TIMER1 channel 1.
- 4'h6: ADV_TIMER1 channel 2.
- 4'h7: ADV_TIMER1 channel 3.
- 4'h8: ADV_TIMER2 channel 0.
- 4'h9: ADV_TIMER2 channel 1.
- 4'hA: ADV_TIMER2 channel 2.
- 4'hB: ADV_TIMER2 channel 3.
- 4'hC: ADV_TIMER3 channel 0.
- 4'hD: ADV_TIMER3 channel 1.
- 4'hE: ADV_TIMER3 channel 2.
- 4'hF: ADV_TIMER3 channel 3.

### EVENT_CFG . SEL2
ADV_TIMER output event 2 source configuration bitfiled:
- 4'h0: ADV_TIMER0 channel 0.
- 4'h1: ADV_TIMER0 channel 1.
- 4'h2: ADV_TIMER0 channel 2.
- 4'h3: ADV_TIMER0 channel 3.
- 4'h4: ADV_TIMER1 channel 0.
- 4'h5: ADV_TIMER1 channel 1.
- 4'h6: ADV_TIMER1 channel 2.
- 4'h7: ADV_TIMER1 channel 3.
- 4'h8: ADV_TIMER2 channel 0.
- 4'h9: ADV_TIMER2 channel 1.
- 4'hA: ADV_TIMER2 channel 2.
- 4'hB: ADV_TIMER2 channel 3.
- 4'hC: ADV_TIMER3 channel 0.
- 4'hD: ADV_TIMER3 channel 1.
- 4'hE: ADV_TIMER3 channel 2.
- 4'hF: ADV_TIMER3 channel 3.

### EVENT_CFG . SEL1
ADV_TIMER output event 1 source configuration bitfiled:
- 4'h0: ADV_TIMER0 channel 0.
- 4'h1: ADV_TIMER0 channel 1.
- 4'h2: ADV_TIMER0 channel 2.
- 4'h3: ADV_TIMER0 channel 3.
- 4'h4: ADV_TIMER1 channel 0.
- 4'h5: ADV_TIMER1 channel 1.
- 4'h6: ADV_TIMER1 channel 2.
- 4'h7: ADV_TIMER1 channel 3.
- 4'h8: ADV_TIMER2 channel 0.
- 4'h9: ADV_TIMER2 channel 1.
- 4'hA: ADV_TIMER2 channel 2.
- 4'hB: ADV_TIMER2 channel 3.
- 4'hC: ADV_TIMER3 channel 0.
- 4'hD: ADV_TIMER3 channel 1.
- 4'hE: ADV_TIMER3 channel 2.
- 4'hF: ADV_TIMER3 channel 3.

### EVENT_CFG . SEL0
ADV_TIMER output event 0 source configuration bitfiled:
- 4'h0: ADV_TIMER0 channel 0.
- 4'h1: ADV_TIMER0 channel 1.
- 4'h2: ADV_TIMER0 channel 2.
- 4'h3: ADV_TIMER0 channel 3.
- 4'h4: ADV_TIMER1 channel 0.
- 4'h5: ADV_TIMER1 channel 1.
- 4'h6: ADV_TIMER1 channel 2.
- 4'h7: ADV_TIMER1 channel 3.
- 4'h8: ADV_TIMER2 channel 0.
- 4'h9: ADV_TIMER2 channel 1.
- 4'hA: ADV_TIMER2 channel 2.
- 4'hB: ADV_TIMER2 channel 3.
- 4'hC: ADV_TIMER3 channel 0.
- 4'hD: ADV_TIMER3 channel 1.
- 4'hE: ADV_TIMER3 channel 2.
- 4'hF: ADV_TIMER3 channel 3.

## CG
ADV_TIMERS channels clock gating configuration register.
- Offset: `0x84`
- Reset default: `0x0`
- Reset mask: `0xf`

### Fields

```wavejson
{"reg": [{"name": "ENA", "bits": 4, "attr": ["rw"], "rotate": 0}, {"bits": 28}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                      |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------------------------------------------------|
|  31:4  |        |         |        | Reserved                                                                                                         |
|  3:0   |   rw   |   0x0   | ENA    | ADV_TIMER clock gating configuration bitfield. - ENA[i]=0: clock gate ADV_TIMERi. - ENA[i]=1: enable ADV_TIMERi. |

