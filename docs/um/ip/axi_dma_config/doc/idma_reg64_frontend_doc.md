## Summary

| Name                                          | Offset   |   Length | Description                                                            |
|:----------------------------------------------|:---------|---------:|:-----------------------------------------------------------------------|
| idma_reg64_frontend.[`src_addr`](#src_addr)   | 0x0      |        8 | Source Address                                                         |
| idma_reg64_frontend.[`dst_addr`](#dst_addr)   | 0x8      |        8 | Destination Address                                                    |
| idma_reg64_frontend.[`num_bytes`](#num_bytes) | 0x10     |        8 | Number of bytes                                                        |
| idma_reg64_frontend.[`conf`](#conf)           | 0x18     |        8 | Configuration Register for DMA settings                                |
| idma_reg64_frontend.[`status`](#status)       | 0x20     |        8 | DMA Status                                                             |
| idma_reg64_frontend.[`next_id`](#next_id)     | 0x28     |        8 | Next ID, launches transfer, returns 0 if transfer not set up properly. |
| idma_reg64_frontend.[`done`](#done)           | 0x30     |        8 | Get ID of finished transactions.                                       |

## src_addr
Source Address
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0xffffffffffffffff`

### Fields

```wavejson
{"reg": [{"name": "src_addr", "bits": 64, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description    |
|:------:|:------:|:-------:|:---------|:---------------|
|  63:0  |   rw   |   0x0   | src_addr | Source Address |

## dst_addr
Destination Address
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0xffffffffffffffff`

### Fields

```wavejson
{"reg": [{"name": "dst_addr", "bits": 64, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description         |
|:------:|:------:|:-------:|:---------|:--------------------|
|  63:0  |   rw   |   0x0   | dst_addr | Destination Address |

## num_bytes
Number of bytes
- Offset: `0x10`
- Reset default: `0x0`
- Reset mask: `0xffffffffffffffff`

### Fields

```wavejson
{"reg": [{"name": "num_bytes", "bits": 64, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name      | Description     |
|:------:|:------:|:-------:|:----------|:----------------|
|  63:0  |   rw   |   0x0   | num_bytes | Number of bytes |

## conf
Configuration Register for DMA settings
- Offset: `0x18`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "decouple", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "deburst", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "serialize", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 61}], "config": {"lanes": 1, "fontsize": 10, "vspace": 110}}
```

|  Bits  |  Type  |  Reset  | Name      | Description      |
|:------:|:------:|:-------:|:----------|:-----------------|
|  63:3  |        |         |           | Reserved         |
|   2    |   rw   |   0x0   | serialize | Serialize enable |
|   1    |   rw   |   0x0   | deburst   | Deburst enable   |
|   0    |   rw   |   0x0   | decouple  | Decouple enable  |

## status
DMA Status
- Offset: `0x20`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "busy", "bits": 1, "attr": ["ro"], "rotate": -90}, {"bits": 63}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  63:1  |        |         |        | Reserved      |
|   0    |   ro   |    x    | busy   | DMA busy      |

## next_id
Next ID, launches transfer, returns 0 if transfer not set up properly.
- Offset: `0x28`
- Reset default: `0x0`
- Reset mask: `0xffffffffffffffff`

### Fields

```wavejson
{"reg": [{"name": "next_id", "bits": 64, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name    | Description                                                            |
|:------:|:------:|:-------:|:--------|:-----------------------------------------------------------------------|
|  63:0  |   ro   |    x    | next_id | Next ID, launches transfer, returns 0 if transfer not set up properly. |

## done
Get ID of finished transactions.
- Offset: `0x30`
- Reset default: `0x0`
- Reset mask: `0xffffffffffffffff`

### Fields

```wavejson
{"reg": [{"name": "done", "bits": 64, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                      |
|:------:|:------:|:-------:|:-------|:---------------------------------|
|  63:0  |   ro   |    x    | done   | Get ID of finished transactions. |

