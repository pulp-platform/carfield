## Summary

| Name                                             | Offset   |   Length | Description                               |
|:-------------------------------------------------|:---------|---------:|:------------------------------------------|
| irq_router.[`IRQ_TARGET_MASK`](#irq_target_mask) | 0x0      |        4 | Target selection bitmask control register |

## IRQ_TARGET_MASK
Target selection bitmask control register
- Offset: `0x0`
- Reset default: `0x1`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "mask", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                               |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------------|
|  31:0  |   rw   |   0x1   | mask   | Target selection bitmask control register for single interrupt line. Reflects interrupt line logic level. |

