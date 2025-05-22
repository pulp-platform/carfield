## Summary

| Name                                | Offset    |   Length | Description                                                        |
|:------------------------------------|:----------|---------:|:-------------------------------------------------------------------|
| rv_plic.[`PRIO0`](#prio0)           | 0x0       |        4 | Interrupt Source 0 Priority                                        |
| rv_plic.[`PRIO1`](#prio1)           | 0x4       |        4 | Interrupt Source 1 Priority                                        |
| rv_plic.[`PRIO2`](#prio2)           | 0x8       |        4 | Interrupt Source 2 Priority                                        |
| rv_plic.[`PRIO3`](#prio3)           | 0xc       |        4 | Interrupt Source 3 Priority                                        |
| rv_plic.[`PRIO4`](#prio4)           | 0x10      |        4 | Interrupt Source 4 Priority                                        |
| rv_plic.[`PRIO5`](#prio5)           | 0x14      |        4 | Interrupt Source 5 Priority                                        |
| rv_plic.[`PRIO6`](#prio6)           | 0x18      |        4 | Interrupt Source 6 Priority                                        |
| rv_plic.[`PRIO7`](#prio7)           | 0x1c      |        4 | Interrupt Source 7 Priority                                        |
| rv_plic.[`PRIO8`](#prio8)           | 0x20      |        4 | Interrupt Source 8 Priority                                        |
| rv_plic.[`PRIO9`](#prio9)           | 0x24      |        4 | Interrupt Source 9 Priority                                        |
| rv_plic.[`PRIO10`](#prio10)         | 0x28      |        4 | Interrupt Source 10 Priority                                       |
| rv_plic.[`PRIO11`](#prio11)         | 0x2c      |        4 | Interrupt Source 11 Priority                                       |
| rv_plic.[`PRIO12`](#prio12)         | 0x30      |        4 | Interrupt Source 12 Priority                                       |
| rv_plic.[`PRIO13`](#prio13)         | 0x34      |        4 | Interrupt Source 13 Priority                                       |
| rv_plic.[`PRIO14`](#prio14)         | 0x38      |        4 | Interrupt Source 14 Priority                                       |
| rv_plic.[`PRIO15`](#prio15)         | 0x3c      |        4 | Interrupt Source 15 Priority                                       |
| rv_plic.[`PRIO16`](#prio16)         | 0x40      |        4 | Interrupt Source 16 Priority                                       |
| rv_plic.[`PRIO17`](#prio17)         | 0x44      |        4 | Interrupt Source 17 Priority                                       |
| rv_plic.[`PRIO18`](#prio18)         | 0x48      |        4 | Interrupt Source 18 Priority                                       |
| rv_plic.[`PRIO19`](#prio19)         | 0x4c      |        4 | Interrupt Source 19 Priority                                       |
| rv_plic.[`PRIO20`](#prio20)         | 0x50      |        4 | Interrupt Source 20 Priority                                       |
| rv_plic.[`PRIO21`](#prio21)         | 0x54      |        4 | Interrupt Source 21 Priority                                       |
| rv_plic.[`PRIO22`](#prio22)         | 0x58      |        4 | Interrupt Source 22 Priority                                       |
| rv_plic.[`PRIO23`](#prio23)         | 0x5c      |        4 | Interrupt Source 23 Priority                                       |
| rv_plic.[`PRIO24`](#prio24)         | 0x60      |        4 | Interrupt Source 24 Priority                                       |
| rv_plic.[`PRIO25`](#prio25)         | 0x64      |        4 | Interrupt Source 25 Priority                                       |
| rv_plic.[`PRIO26`](#prio26)         | 0x68      |        4 | Interrupt Source 26 Priority                                       |
| rv_plic.[`PRIO27`](#prio27)         | 0x6c      |        4 | Interrupt Source 27 Priority                                       |
| rv_plic.[`PRIO28`](#prio28)         | 0x70      |        4 | Interrupt Source 28 Priority                                       |
| rv_plic.[`PRIO29`](#prio29)         | 0x74      |        4 | Interrupt Source 29 Priority                                       |
| rv_plic.[`PRIO30`](#prio30)         | 0x78      |        4 | Interrupt Source 30 Priority                                       |
| rv_plic.[`PRIO31`](#prio31)         | 0x7c      |        4 | Interrupt Source 31 Priority                                       |
| rv_plic.[`IP`](#IP)                 | 0x1000    |        4 | Interrupt Pending                                                  |
| rv_plic.[`IE0`](#IE0)               | 0x2000    |        4 | Interrupt Enable for Target 0                                      |
| rv_plic.[`THRESHOLD0`](#threshold0) | 0x200000  |        4 | Threshold of priority for Target 0                                 |
| rv_plic.[`CC0`](#cc0)               | 0x200004  |        4 | Claim interrupt by read, complete interrupt by write for Target 0. |
| rv_plic.[`MSIP0`](#msip0)           | 0x4000000 |        4 | msip for Hart 0.                                                   |
| rv_plic.[`ALERT_TEST`](#alert_test) | 0x4004000 |        4 | Alert Test Register.                                               |

## PRIO0
Interrupt Source 0 Priority
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO0", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO0  |               |

## PRIO1
Interrupt Source 1 Priority
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO1", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO1  |               |

## PRIO2
Interrupt Source 2 Priority
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO2", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO2  |               |

## PRIO3
Interrupt Source 3 Priority
- Offset: `0xc`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO3", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO3  |               |

## PRIO4
Interrupt Source 4 Priority
- Offset: `0x10`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO4", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO4  |               |

## PRIO5
Interrupt Source 5 Priority
- Offset: `0x14`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO5", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO5  |               |

## PRIO6
Interrupt Source 6 Priority
- Offset: `0x18`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO6", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO6  |               |

## PRIO7
Interrupt Source 7 Priority
- Offset: `0x1c`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO7", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO7  |               |

## PRIO8
Interrupt Source 8 Priority
- Offset: `0x20`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO8", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO8  |               |

## PRIO9
Interrupt Source 9 Priority
- Offset: `0x24`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO9", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO9  |               |

## PRIO10
Interrupt Source 10 Priority
- Offset: `0x28`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO10", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO10 |               |

## PRIO11
Interrupt Source 11 Priority
- Offset: `0x2c`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO11", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO11 |               |

## PRIO12
Interrupt Source 12 Priority
- Offset: `0x30`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO12", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO12 |               |

## PRIO13
Interrupt Source 13 Priority
- Offset: `0x34`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO13", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO13 |               |

## PRIO14
Interrupt Source 14 Priority
- Offset: `0x38`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO14", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO14 |               |

## PRIO15
Interrupt Source 15 Priority
- Offset: `0x3c`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO15", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO15 |               |

## PRIO16
Interrupt Source 16 Priority
- Offset: `0x40`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO16", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO16 |               |

## PRIO17
Interrupt Source 17 Priority
- Offset: `0x44`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO17", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO17 |               |

## PRIO18
Interrupt Source 18 Priority
- Offset: `0x48`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO18", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO18 |               |

## PRIO19
Interrupt Source 19 Priority
- Offset: `0x4c`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO19", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO19 |               |

## PRIO20
Interrupt Source 20 Priority
- Offset: `0x50`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO20", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO20 |               |

## PRIO21
Interrupt Source 21 Priority
- Offset: `0x54`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO21", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO21 |               |

## PRIO22
Interrupt Source 22 Priority
- Offset: `0x58`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO22", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO22 |               |

## PRIO23
Interrupt Source 23 Priority
- Offset: `0x5c`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO23", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO23 |               |

## PRIO24
Interrupt Source 24 Priority
- Offset: `0x60`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO24", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO24 |               |

## PRIO25
Interrupt Source 25 Priority
- Offset: `0x64`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO25", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO25 |               |

## PRIO26
Interrupt Source 26 Priority
- Offset: `0x68`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO26", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO26 |               |

## PRIO27
Interrupt Source 27 Priority
- Offset: `0x6c`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO27", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO27 |               |

## PRIO28
Interrupt Source 28 Priority
- Offset: `0x70`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO28", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO28 |               |

## PRIO29
Interrupt Source 29 Priority
- Offset: `0x74`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO29", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO29 |               |

## PRIO30
Interrupt Source 30 Priority
- Offset: `0x78`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO30", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO30 |               |

## PRIO31
Interrupt Source 31 Priority
- Offset: `0x7c`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "PRIO31", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:3  |        |         |        | Reserved      |
|  2:0   |   rw   |   0x0   | PRIO31 |               |

## IP
Interrupt Pending
- Offset: `0x1000`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "P_0", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_1", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_2", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_3", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_4", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_5", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_6", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_7", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_8", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_9", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_10", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_11", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_12", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_13", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_14", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_15", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_16", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_17", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_18", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_19", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_20", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_21", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_22", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_23", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_24", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_25", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_26", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_27", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_28", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_29", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_30", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "P_31", "bits": 1, "attr": ["ro"], "rotate": -90}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                 |
|:------:|:------:|:-------:|:-------|:----------------------------|
|   31   |   ro   |   0x0   | P_31   | Interrupt Pending of Source |
|   30   |   ro   |   0x0   | P_30   | Interrupt Pending of Source |
|   29   |   ro   |   0x0   | P_29   | Interrupt Pending of Source |
|   28   |   ro   |   0x0   | P_28   | Interrupt Pending of Source |
|   27   |   ro   |   0x0   | P_27   | Interrupt Pending of Source |
|   26   |   ro   |   0x0   | P_26   | Interrupt Pending of Source |
|   25   |   ro   |   0x0   | P_25   | Interrupt Pending of Source |
|   24   |   ro   |   0x0   | P_24   | Interrupt Pending of Source |
|   23   |   ro   |   0x0   | P_23   | Interrupt Pending of Source |
|   22   |   ro   |   0x0   | P_22   | Interrupt Pending of Source |
|   21   |   ro   |   0x0   | P_21   | Interrupt Pending of Source |
|   20   |   ro   |   0x0   | P_20   | Interrupt Pending of Source |
|   19   |   ro   |   0x0   | P_19   | Interrupt Pending of Source |
|   18   |   ro   |   0x0   | P_18   | Interrupt Pending of Source |
|   17   |   ro   |   0x0   | P_17   | Interrupt Pending of Source |
|   16   |   ro   |   0x0   | P_16   | Interrupt Pending of Source |
|   15   |   ro   |   0x0   | P_15   | Interrupt Pending of Source |
|   14   |   ro   |   0x0   | P_14   | Interrupt Pending of Source |
|   13   |   ro   |   0x0   | P_13   | Interrupt Pending of Source |
|   12   |   ro   |   0x0   | P_12   | Interrupt Pending of Source |
|   11   |   ro   |   0x0   | P_11   | Interrupt Pending of Source |
|   10   |   ro   |   0x0   | P_10   | Interrupt Pending of Source |
|   9    |   ro   |   0x0   | P_9    | Interrupt Pending of Source |
|   8    |   ro   |   0x0   | P_8    | Interrupt Pending of Source |
|   7    |   ro   |   0x0   | P_7    | Interrupt Pending of Source |
|   6    |   ro   |   0x0   | P_6    | Interrupt Pending of Source |
|   5    |   ro   |   0x0   | P_5    | Interrupt Pending of Source |
|   4    |   ro   |   0x0   | P_4    | Interrupt Pending of Source |
|   3    |   ro   |   0x0   | P_3    | Interrupt Pending of Source |
|   2    |   ro   |   0x0   | P_2    | Interrupt Pending of Source |
|   1    |   ro   |   0x0   | P_1    | Interrupt Pending of Source |
|   0    |   ro   |   0x0   | P_0    | Interrupt Pending of Source |

## IE0
Interrupt Enable for Target 0
- Offset: `0x2000`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "E_0", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_1", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_2", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_3", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_4", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_5", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_6", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_7", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_8", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_9", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_10", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_11", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_12", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_13", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_14", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_15", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_16", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_17", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_18", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_19", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_20", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_21", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_22", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_23", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_24", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_25", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_26", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_27", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_28", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_29", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_30", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "E_31", "bits": 1, "attr": ["rw"], "rotate": -90}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                |
|:------:|:------:|:-------:|:-------|:---------------------------|
|   31   |   rw   |   0x0   | E_31   | Interrupt Enable of Source |
|   30   |   rw   |   0x0   | E_30   | Interrupt Enable of Source |
|   29   |   rw   |   0x0   | E_29   | Interrupt Enable of Source |
|   28   |   rw   |   0x0   | E_28   | Interrupt Enable of Source |
|   27   |   rw   |   0x0   | E_27   | Interrupt Enable of Source |
|   26   |   rw   |   0x0   | E_26   | Interrupt Enable of Source |
|   25   |   rw   |   0x0   | E_25   | Interrupt Enable of Source |
|   24   |   rw   |   0x0   | E_24   | Interrupt Enable of Source |
|   23   |   rw   |   0x0   | E_23   | Interrupt Enable of Source |
|   22   |   rw   |   0x0   | E_22   | Interrupt Enable of Source |
|   21   |   rw   |   0x0   | E_21   | Interrupt Enable of Source |
|   20   |   rw   |   0x0   | E_20   | Interrupt Enable of Source |
|   19   |   rw   |   0x0   | E_19   | Interrupt Enable of Source |
|   18   |   rw   |   0x0   | E_18   | Interrupt Enable of Source |
|   17   |   rw   |   0x0   | E_17   | Interrupt Enable of Source |
|   16   |   rw   |   0x0   | E_16   | Interrupt Enable of Source |
|   15   |   rw   |   0x0   | E_15   | Interrupt Enable of Source |
|   14   |   rw   |   0x0   | E_14   | Interrupt Enable of Source |
|   13   |   rw   |   0x0   | E_13   | Interrupt Enable of Source |
|   12   |   rw   |   0x0   | E_12   | Interrupt Enable of Source |
|   11   |   rw   |   0x0   | E_11   | Interrupt Enable of Source |
|   10   |   rw   |   0x0   | E_10   | Interrupt Enable of Source |
|   9    |   rw   |   0x0   | E_9    | Interrupt Enable of Source |
|   8    |   rw   |   0x0   | E_8    | Interrupt Enable of Source |
|   7    |   rw   |   0x0   | E_7    | Interrupt Enable of Source |
|   6    |   rw   |   0x0   | E_6    | Interrupt Enable of Source |
|   5    |   rw   |   0x0   | E_5    | Interrupt Enable of Source |
|   4    |   rw   |   0x0   | E_4    | Interrupt Enable of Source |
|   3    |   rw   |   0x0   | E_3    | Interrupt Enable of Source |
|   2    |   rw   |   0x0   | E_2    | Interrupt Enable of Source |
|   1    |   rw   |   0x0   | E_1    | Interrupt Enable of Source |
|   0    |   rw   |   0x0   | E_0    | Interrupt Enable of Source |

## THRESHOLD0
Threshold of priority for Target 0
- Offset: `0x200000`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "THRESHOLD0", "bits": 3, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 120}}
```

|  Bits  |  Type  |  Reset  | Name       | Description   |
|:------:|:------:|:-------:|:-----------|:--------------|
|  31:3  |        |         |            | Reserved      |
|  2:0   |   rw   |   0x0   | THRESHOLD0 |               |

## CC0
Claim interrupt by read, complete interrupt by write for Target 0.
Value read/written is interrupt ID. Reading a value of 0 means no pending interrupts.
- Offset: `0x200004`
- Reset default: `0x0`
- Reset mask: `0x1f`

### Fields

```wavejson
{"reg": [{"name": "CC0", "bits": 5, "attr": ["rw"], "rotate": 0}, {"bits": 27}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:5  |        |         |        | Reserved      |
|  4:0   |   rw   |    x    | CC0    |               |

## MSIP0
msip for Hart 0.
Write 1 to here asserts software interrupt for Hart msip_o[0], write 0 to clear.
- Offset: `0x4000000`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "MSIP0", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                         |
|:------:|:------:|:-------:|:-------|:------------------------------------|
|  31:1  |        |         |        | Reserved                            |
|   0    |   rw   |   0x0   | MSIP0  | Software Interrupt Pending register |

## ALERT_TEST
Alert Test Register.
- Offset: `0x4004000`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "fatal_fault", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 130}}
```

|  Bits  |  Type  |  Reset  | Name        | Description                                        |
|:------:|:------:|:-------:|:------------|:---------------------------------------------------|
|  31:1  |        |         |             | Reserved                                           |
|   0    |   wo   |    x    | fatal_fault | 'Write 1 to trigger one alert event of this kind.' |

