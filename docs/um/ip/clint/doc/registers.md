## Summary

| Name                                      | Offset   |   Length | Description                        |
|:------------------------------------------|:---------|---------:|:-----------------------------------|
| CLINT.[`MSIP_0`](#msip)                   | 0x0      |        4 | Machine Software Interrupt Pending |
| CLINT.[`MSIP_1`](#msip)                   | 0x4      |        4 | Machine Software Interrupt Pending |
| CLINT.[`MTIMECMP_LOW0`](#mtimecmp_low0)   | 0x4000   |        4 | Machine Timer Compare for Core 0   |
| CLINT.[`MTIMECMP_HIGH0`](#mtimecmp_high0) | 0x4004   |        4 | Machine Timer Compare for Core 0   |
| CLINT.[`MTIMECMP_LOW1`](#mtimecmp_low1)   | 0x4008   |        4 | Machine Timer Compare for Core 1   |
| CLINT.[`MTIMECMP_HIGH1`](#mtimecmp_high1) | 0x400c   |        4 | Machine Timer Compare for Core 1   |
| CLINT.[`MTIME_LOW`](#mtime_low)           | 0xbff8   |        4 | Timer Register Low                 |
| CLINT.[`MTIME_HIGH`](#mtime_high)         | 0xbffc   |        4 | Timer Register High                |

## MSIP
Machine Software Interrupt Pending
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name   | Offset   |
|:-------|:---------|
| MSIP_0 | 0x0      |
| MSIP_1 | 0x4      |


### Fields

```wavejson
{"reg": [{"name": "P", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "RSVD", "bits": 31, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                        |
|:------:|:------:|:-------:|:-------|:-----------------------------------|
|  31:1  |   ro   |   0x0   | RSVD   | Reserved                           |
|   0    |   rw   |   0x0   | P      | Machine Software Interrupt Pending |

## MTIMECMP_LOW0
Machine Timer Compare for Core 0
- Offset: `0x4000`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "MTIMECMP_LOW", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name         | Description                       |
|:------:|:------:|:-------:|:-------------|:----------------------------------|
|  31:0  |   rw   |   0x0   | MTIMECMP_LOW | Machine Time Compare (Low) Core 0 |

## MTIMECMP_HIGH0
Machine Timer Compare for Core 0
- Offset: `0x4004`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "MTIMECMP_HIGH", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name          | Description                        |
|:------:|:------:|:-------:|:--------------|:-----------------------------------|
|  31:0  |   rw   |   0x0   | MTIMECMP_HIGH | Machine Time Compare (High) Core 0 |

## MTIMECMP_LOW1
Machine Timer Compare for Core 1
- Offset: `0x4008`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "MTIMECMP_LOW", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name         | Description                       |
|:------:|:------:|:-------:|:-------------|:----------------------------------|
|  31:0  |   rw   |   0x0   | MTIMECMP_LOW | Machine Time Compare (Low) Core 1 |

## MTIMECMP_HIGH1
Machine Timer Compare for Core 1
- Offset: `0x400c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "MTIMECMP_HIGH", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name          | Description                        |
|:------:|:------:|:-------:|:--------------|:-----------------------------------|
|  31:0  |   rw   |   0x0   | MTIMECMP_HIGH | Machine Time Compare (High) Core 1 |

## MTIME_LOW
Timer Register Low
- Offset: `0xbff8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "MTIME_LOW", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name      | Description        |
|:------:|:------:|:-------:|:----------|:-------------------|
|  31:0  |   rw   |   0x0   | MTIME_LOW | Machine Time (Low) |

## MTIME_HIGH
Timer Register High
- Offset: `0xbffc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "MTIME_HIGH", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name       | Description         |
|:------:|:------:|:-------:|:-----------|:--------------------|
|  31:0  |   rw   |   0x0   | MTIME_HIGH | Machine Time (High) |

