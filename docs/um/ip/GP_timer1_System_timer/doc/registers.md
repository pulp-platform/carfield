## Summary

| Name                               | Offset   |   Length | Description                           |
|:-----------------------------------|:---------|---------:|:--------------------------------------|
| timer_unit.[`CFG_LO`](#cfg_lo)     | 0x0      |        4 | Timer Low Configuration register.     |
| timer_unit.[`CFG_HI`](#cfg_hi)     | 0x4      |        4 | Timer HIGH Configuration register.    |
| timer_unit.[`CNT_LO`](#cnt_lo)     | 0x8      |        4 | Timer Low counter value register.     |
| timer_unit.[`CNT_HI`](#cnt_hi)     | 0xc      |        4 | Timer High counter value register.    |
| timer_unit.[`CMP_LO`](#cmp_lo)     | 0x10     |        4 | Timer Low comparator value register.  |
| timer_unit.[`CMP_HI`](#cmp_hi)     | 0x14     |        4 | Timer High comparator value register. |
| timer_unit.[`START_LO`](#start_lo) | 0x18     |        4 | Start Timer Low counting register.    |
| timer_unit.[`START_HI`](#start_hi) | 0x1c     |        4 | Start Timer High counting register.   |
| timer_unit.[`RESET_LO`](#reset_lo) | 0x20     |        4 | Reset Timer Low counter register.     |
| timer_unit.[`RESET_HI`](#reset_hi) | 0x24     |        4 | Reset Timer High counter register.    |

## CFG_LO
Timer Low Configuration register.
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0x8000ffff`

### Fields

```wavejson
{"reg": [{"name": "ENABLE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "RESET", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "IRQEN", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "IEM", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "MODE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "ONE_S", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "PEN", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CCFG", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "PVAL", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 15}, {"name": "CASC", "bits": 1, "attr": ["rw"], "rotate": -90}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                                                                  |
|:------:|:------:|:-------:|:-------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|   31   |   rw   |   0x0   | CASC   | Timer low  + Timer high 64bit cascaded mode configuration bitfield.                                                                                                                                                                          |
| 30:16  |        |         |        | Reserved                                                                                                                                                                                                                                     |
|  15:8  |   rw   |   0x0   | PVAL   | Timer low prescaler value bitfield. Ftimer = Fclk / (1 + PRESC_VAL)                                                                                                                                                                          |
|   7    |   rw   |   0x0   | CCFG   | Timer low clock source configuration bitfield: - 1'b0: FLL or FLL+Prescaler - 1'b1: Reference clock at 32kHz                                                                                                                                 |
|   6    |   rw   |   0x0   | PEN    | Timer low prescaler enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled                                                                                                                                                          |
|   5    |   rw   |   0x0   | ONE_S  | Timer low one shot configuration bitfield: - 1'b0: let Timer low enabled counting when compare match with CMP_LO occurs. - 1'b1: disable Timer low when compare match with CMP_LO occurs.                                                    |
|   4    |   rw   |   0x0   | MODE   | Timer low continuous mode configuration bitfield: - 1'b0: Continue mode - continue incrementing Timer low counter when compare match with CMP_LO occurs. - 1'b1: Cycle mode - reset Timer low counter when compare match with CMP_LO occurs. |
|   3    |   rw   |   0x0   | IEM    | Timer low input event mask configuration bitfield: - 1'b0: disabled - 1'b1: enabled                                                                                                                                                          |
|   2    |   rw   |   0x0   | IRQEN  | Timer low compare match interrupt enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled                                                                                                                                            |
|   1    |   rw   |   0x0   | RESET  | Timer low counter reset command bitfield. Cleared after Timer Low reset execution.                                                                                                                                                           |
|   0    |   rw   |   0x0   | ENABLE | Timer low enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled                                                                                                                                                                    |

## CFG_HI
Timer HIGH Configuration register.
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "ENABLE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "RESET", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "IRQEN", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "IEM", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "MODE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "ONE_S", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "PEN", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CLKCFG", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                                                                                                                                     |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                                                                                                                        |
|   7    |   rw   |   0x0   | CLKCFG | Timer high clock source configuration bitfield: - 1'b0: FLL or FLL+Prescaler - 1'b1: Reference clock at 32kHz                                                                                                                                   |
|   6    |   rw   |   0x0   | PEN    | Timer high prescaler enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled                                                                                                                                                            |
|   5    |   rw   |   0x0   | ONE_S  | Timer high one shot configuration bitfield: - 1'b0: let Timer high enabled counting when compare match with CMP_HI occurs. - 1'b1: disable Timer high when compare match with CMP_HI occurs.                                                    |
|   4    |   rw   |   0x0   | MODE   | Timer high continuous mode configuration bitfield: - 1'b0: Continue mode - continue incrementing Timer high counter when compare match with CMP_HI occurs. - 1'b1: Cycle mode - reset Timer high counter when compare match with CMP_HI occurs. |
|   3    |   rw   |   0x0   | IEM    | Timer high input event mask configuration bitfield: - 1'b0: disabled - 1'b1: enabled                                                                                                                                                            |
|   2    |   rw   |   0x0   | IRQEN  | Timer high compare match interrupt enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled                                                                                                                                              |
|   1    |   wo   |   0x0   | RESET  | Timer high counter reset command bitfield. Cleared after Timer high reset execution.                                                                                                                                                            |
|   0    |   rw   |   0x0   | ENABLE | Timer high enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled                                                                                                                                                                      |

## CNT_LO
Timer Low counter value register.
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "cnt_lo", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                       |
|:------:|:------:|:-------:|:-------|:----------------------------------|
|  31:0  |   rw   |   0x0   | cnt_lo | Timer Low counter value bitfield. |

## CNT_HI
Timer High counter value register.
- Offset: `0xc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "cnt_hi", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                        |
|:------:|:------:|:-------:|:-------|:-----------------------------------|
|  31:0  |   rw   |   0x0   | cnt_hi | Timer High counter value bitfield. |

## CMP_LO
Timer Low comparator value register.
- Offset: `0x10`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "cmp_lo", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                          |
|:------:|:------:|:-------:|:-------|:-------------------------------------|
|  31:0  |   rw   |   0x0   | cmp_lo | Timer Low comparator value bitfield. |

## CMP_HI
Timer High comparator value register.
- Offset: `0x14`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "cmp_hi", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                           |
|:------:|:------:|:-------:|:-------|:--------------------------------------|
|  31:0  |   rw   |   0x0   | cmp_hi | Timer High comparator value bitfield. |

## START_LO
Start Timer Low counting register.
- Offset: `0x18`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "strt_lo", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 90}}
```

|  Bits  |  Type  |  Reset  | Name    | Description                                                            |
|:------:|:------:|:-------:|:--------|:-----------------------------------------------------------------------|
|  31:1  |        |         |         | Reserved                                                               |
|   0    |   wo   |   0x0   | strt_lo | Timer Low start command bitfield. When executed, CFG_LO.ENABLE is set. |

## START_HI
Start Timer High counting register.
- Offset: `0x1c`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "strt_hi", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 90}}
```

|  Bits  |  Type  |  Reset  | Name    | Description                                                             |
|:------:|:------:|:-------:|:--------|:------------------------------------------------------------------------|
|  31:1  |        |         |         | Reserved                                                                |
|   0    |   wo   |   0x0   | strt_hi | Timer High start command bitfield. When executed, CFG_HI.ENABLE is set. |

## RESET_LO
Reset Timer Low counter register.
- Offset: `0x20`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "rst_lo", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                   |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------|
|  31:1  |        |         |        | Reserved                                                                      |
|   0    |   wo   |   0x0   | rst_lo | Timer Low counter reset command bitfield. When executed, CFG_LO.RESET is set. |

## RESET_HI
Reset Timer High counter register.
- Offset: `0x24`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "rst_hi", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                    |
|:------:|:------:|:-------:|:-------|:-------------------------------------------------------------------------------|
|  31:1  |        |         |        | Reserved                                                                       |
|   0    |   wo   |   0x0   | rst_hi | Timer High counter reset command bitfield. When executed, CFG_HI.RESET is set. |

