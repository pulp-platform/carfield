## Summary

| Name                                          | Offset   |   Length | Description                                       |
|:----------------------------------------------|:---------|---------:|:--------------------------------------------------|
| axi_llc.[`CFG_SPM_LOW`](#cfg_spm_low)         | 0x0      |        4 | SPM Configuration (lower 32 bit)                  |
| axi_llc.[`CFG_SPM_HIGH`](#cfg_spm_high)       | 0x4      |        4 | SPM Configuration (upper 32 bit)                  |
| axi_llc.[`CFG_FLUSH_LOW`](#cfg_flush_low)     | 0x8      |        4 | Flush Configuration (lower 32 bit)                |
| axi_llc.[`CFG_FLUSH_HIGH`](#cfg_flush_high)   | 0xc      |        4 | Flush Configuration (upper 32 bit)                |
| axi_llc.[`COMMIT_CFG`](#commit_cfg)           | 0x10     |        4 | Commit the configuration                          |
| axi_llc.[`FLUSHED_LOW`](#flushed_low)         | 0x18     |        4 | Flushed Flag (lower 32 bit)                       |
| axi_llc.[`FLUSHED_HIGH`](#flushed_high)       | 0x1c     |        4 | Flushed Flag (upper 32 bit)                       |
| axi_llc.[`BIST_OUT_LOW`](#bist_out_low)       | 0x20     |        4 | Tag Storage BIST Result (lower 32 bit)            |
| axi_llc.[`BIST_OUT_HIGH`](#bist_out_high)     | 0x24     |        4 | Tag Storage BIST Result (upper 32 bit)            |
| axi_llc.[`SET_ASSO_LOW`](#set_asso_low)       | 0x28     |        4 | Instantiated Set-Associativity (lower 32 bit)     |
| axi_llc.[`SET_ASSO_HIGH`](#set_asso_high)     | 0x2c     |        4 | Instantiated Set-Associativity (upper 32 bit)     |
| axi_llc.[`NUM_LINES_LOW`](#num_lines_low)     | 0x30     |        4 | Instantiated Number of Cache-Lines (lower 32 bit) |
| axi_llc.[`NUM_LINES_HIGH`](#num_lines_high)   | 0x34     |        4 | Instantiated Number of Cache-Lines (upper 32 bit) |
| axi_llc.[`NUM_BLOCKS_LOW`](#num_blocks_low)   | 0x38     |        4 | Instantiated Number of Blocks (lower 32 bit)      |
| axi_llc.[`NUM_BLOCKS_HIGH`](#num_blocks_high) | 0x3c     |        4 | Instantiated Number of Blocks (upper 32 bit)      |
| axi_llc.[`VERSION_LOW`](#version_low)         | 0x40     |        4 | AXI LLC Version (lower 32 bit)                    |
| axi_llc.[`VERSION_HIGH`](#version_high)       | 0x44     |        4 | AXI LLC Version (upper 32 bit)                    |
| axi_llc.[`BIST_STATUS`](#bist_status)         | 0x48     |        4 | Status register of the BIST                       |

## CFG_SPM_LOW
SPM Configuration (lower 32 bit)
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "low", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   rw   |   0x0   | low    | lower 32 bit  |

## CFG_SPM_HIGH
SPM Configuration (upper 32 bit)
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "high", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   rw   |   0x0   | high   | upper 32 bit  |

## CFG_FLUSH_LOW
Flush Configuration (lower 32 bit)
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "low", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   rw   |   0x0   | low    | lower 32 bit  |

## CFG_FLUSH_HIGH
Flush Configuration (upper 32 bit)
- Offset: `0xc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "high", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   rw   |   0x0   | high   | upper 32 bit  |

## COMMIT_CFG
Commit the configuration
- Offset: `0x10`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "commit", "bits": 1, "attr": ["rw1s"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description          |
|:------:|:------:|:-------:|:-------|:---------------------|
|  31:1  |        |         |        | Reserved             |
|   0    |  rw1s  |   0x0   | commit | commit configuration |

## FLUSHED_LOW
Flushed Flag (lower 32 bit)
- Offset: `0x18`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "low", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   ro   |   0x0   | low    | lower 32 bit  |

## FLUSHED_HIGH
Flushed Flag (upper 32 bit)
- Offset: `0x1c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "high", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   ro   |   0x0   | high   | upper 32 bit  |

## BIST_OUT_LOW
Tag Storage BIST Result (lower 32 bit)
- Offset: `0x20`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "low", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   ro   |   0x0   | low    | lower 32 bit  |

## BIST_OUT_HIGH
Tag Storage BIST Result (upper 32 bit)
- Offset: `0x24`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "high", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   ro   |   0x0   | high   | upper 32 bit  |

## SET_ASSO_LOW
Instantiated Set-Associativity (lower 32 bit)
- Offset: `0x28`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "low", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   ro   |   0x0   | low    | lower 32 bit  |

## SET_ASSO_HIGH
Instantiated Set-Associativity (upper 32 bit)
- Offset: `0x2c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "high", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   ro   |   0x0   | high   | upper 32 bit  |

## NUM_LINES_LOW
Instantiated Number of Cache-Lines (lower 32 bit)
- Offset: `0x30`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "low", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   ro   |   0x0   | low    | lower 32 bit  |

## NUM_LINES_HIGH
Instantiated Number of Cache-Lines (upper 32 bit)
- Offset: `0x34`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "high", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   ro   |   0x0   | high   | upper 32 bit  |

## NUM_BLOCKS_LOW
Instantiated Number of Blocks (lower 32 bit)
- Offset: `0x38`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "low", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   ro   |   0x0   | low    | lower 32 bit  |

## NUM_BLOCKS_HIGH
Instantiated Number of Blocks (upper 32 bit)
- Offset: `0x3c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "high", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   ro   |   0x0   | high   | upper 32 bit  |

## VERSION_LOW
AXI LLC Version (lower 32 bit)
- Offset: `0x40`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "low", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   ro   |   0x0   | low    | lower 32 bit  |

## VERSION_HIGH
AXI LLC Version (upper 32 bit)
- Offset: `0x44`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "high", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:0  |   ro   |   0x0   | high   | upper 32 bit  |

## BIST_STATUS
Status register of the BIST
- Offset: `0x48`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "done", "bits": 1, "attr": ["ro"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                 |
|:------:|:------:|:-------:|:-------|:----------------------------|
|  31:1  |        |         |        | Reserved                    |
|   0    |   ro   |   0x0   | done   | BIST successfully completed |

