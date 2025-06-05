## Summary

| Name                                  | Offset   |   Length | Description                                                         |
|:--------------------------------------|:---------|---------:|:--------------------------------------------------------------------|
| idma_desc64.[`desc_addr`](#desc_addr) | 0x0      |        8 | This register specifies the bus address at which the first transfer |
| idma_desc64.[`status`](#status)       | 0x8      |        8 | This register contains status information for the DMA.              |

## desc_addr
This register specifies the bus address at which the first transfer
descriptor can be found. A write to this register starts the transfer.
- Offset: `0x0`
- Reset default: `0xffffffffffffffff`
- Reset mask: `0xffffffffffffffff`

### Fields

```wavejson
{"reg": [{"name": "desc_addr", "bits": 64, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |       Reset        | Name      | Description   |
|:------:|:------:|:------------------:|:----------|:--------------|
|  63:0  |   wo   | 0xffffffffffffffff | desc_addr |               |

## status
This register contains status information for the DMA.
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0x3`

### Fields

```wavejson
{"reg": [{"name": "busy", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "fifo_full", "bits": 1, "attr": ["ro"], "rotate": -90}, {"bits": 62}], "config": {"lanes": 1, "fontsize": 10, "vspace": 110}}
```

|  Bits  |  Type  |  Reset  | Name      | Description                                                                                                                                                  |
|:------:|:------:|:-------:|:----------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  63:2  |        |         |           | Reserved                                                                                                                                                     |
|   1    |   ro   |   0x0   | fifo_full | If this bit is set, the buffers of the DMA are full. Any further submissions via the desc_addr register may overwrite previously submitted jobs or get lost. |
|   0    |   ro   |   0x0   | busy      | The DMA is busy                                                                                                                                              |

