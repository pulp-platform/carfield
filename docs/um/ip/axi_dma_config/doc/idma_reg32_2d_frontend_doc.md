## Summary

| Name                                                         | Offset   |   Length | Description                                                            |
|:-------------------------------------------------------------|:---------|---------:|:-----------------------------------------------------------------------|
| idma_reg32_2d_frontend.[`src_addr`](#src_addr)               | 0x0      |        4 | Source Address                                                         |
| idma_reg32_2d_frontend.[`dst_addr`](#dst_addr)               | 0x4      |        4 | Destination Address                                                    |
| idma_reg32_2d_frontend.[`num_bytes`](#num_bytes)             | 0x8      |        4 | Number of bytes                                                        |
| idma_reg32_2d_frontend.[`conf`](#conf)                       | 0xc      |        4 | Configuration Register for DMA settings                                |
| idma_reg32_2d_frontend.[`stride_src`](#stride_src)           | 0x10     |        4 | Source Stride                                                          |
| idma_reg32_2d_frontend.[`stride_dst`](#stride_dst)           | 0x14     |        4 | Destination Stride                                                     |
| idma_reg32_2d_frontend.[`num_repetitions`](#num_repetitions) | 0x18     |        4 | Number of 2D repetitions                                               |
| idma_reg32_2d_frontend.[`status`](#status)                   | 0x1c     |        4 | DMA Status                                                             |
| idma_reg32_2d_frontend.[`next_id`](#next_id)                 | 0x20     |        4 | Next ID, launches transfer, returns 0 if transfer not set up properly. |
| idma_reg32_2d_frontend.[`done`](#done)                       | 0x24     |        4 | Get ID of finished transactions.                                       |

## src_addr
Source Address
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "src_addr", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description    |
|:------:|:------:|:-------:|:---------|:---------------|
|  31:0  |   rw   |   0x0   | src_addr | Source Address |

## dst_addr
Destination Address
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "dst_addr", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description         |
|:------:|:------:|:-------:|:---------|:--------------------|
|  31:0  |   rw   |   0x0   | dst_addr | Destination Address |

## num_bytes
Number of bytes
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "num_bytes", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name      | Description     |
|:------:|:------:|:-------:|:----------|:----------------|
|  31:0  |   rw   |   0x0   | num_bytes | Number of bytes |

## conf
Configuration Register for DMA settings
- Offset: `0xc`
- Reset default: `0x0`
- Reset mask: `0xf`

### Fields

```wavejson
{"reg": [{"name": "decouple", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "deburst", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "serialize", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "twod", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 28}], "config": {"lanes": 1, "fontsize": 10, "vspace": 110}}
```

|  Bits  |  Type  |  Reset  | Name      | Description      |
|:------:|:------:|:-------:|:----------|:-----------------|
|  31:4  |        |         |           | Reserved         |
|   3    |   rw   |   0x0   | twod      | 2D transfer      |
|   2    |   rw   |   0x0   | serialize | Serialize enable |
|   1    |   rw   |   0x0   | deburst   | Deburst enable   |
|   0    |   rw   |   0x0   | decouple  | Decouple enable  |

## stride_src
Source Stride
- Offset: `0x10`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "stride_src", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name       | Description   |
|:------:|:------:|:-------:|:-----------|:--------------|
|  31:0  |   rw   |   0x0   | stride_src | Source Stride |

## stride_dst
Destination Stride
- Offset: `0x14`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "stride_dst", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name       | Description        |
|:------:|:------:|:-------:|:-----------|:-------------------|
|  31:0  |   rw   |   0x0   | stride_dst | Destination Stride |

## num_repetitions
Number of 2D repetitions
- Offset: `0x18`
- Reset default: `0x1`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "num_repetitions", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name            | Description              |
|:------:|:------:|:-------:|:----------------|:-------------------------|
|  31:0  |   rw   |   0x1   | num_repetitions | Number of 2D repetitions |

## status
DMA Status
- Offset: `0x1c`
- Reset default: `0x0`
- Reset mask: `0xffff`

### Fields

```wavejson
{"reg": [{"name": "busy", "bits": 16, "attr": ["ro"], "rotate": 0}, {"bits": 16}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
| 31:16  |        |         |        | Reserved      |
|  15:0  |   ro   |    x    | busy   | DMA busy      |

## next_id
Next ID, launches transfer, returns 0 if transfer not set up properly.
- Offset: `0x20`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "next_id", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name    | Description                                                            |
|:------:|:------:|:-------:|:--------|:-----------------------------------------------------------------------|
|  31:0  |   ro   |    x    | next_id | Next ID, launches transfer, returns 0 if transfer not set up properly. |

## done
Get ID of finished transactions.
- Offset: `0x24`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "done", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                      |
|:------:|:------:|:-------:|:-------|:---------------------------------|
|  31:0  |   ro   |    x    | done   | Get ID of finished transactions. |

