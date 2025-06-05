## Summary

| Name                                                      | Offset   |   Length | Description                                                      |
|:----------------------------------------------------------|:---------|---------:|:-----------------------------------------------------------------|
| cluster_icache_ctrl.[`ENABLE`](#enable)                   | 0x0      |        4 | Cluster instruction cache unit enable configuration register.    |
| cluster_icache_ctrl.[`FLUSH`](#flush)                     | 0x4      |        4 | Cluster instruction cache unit flush command register.           |
| cluster_icache_ctrl.[`L0_FLUSH`](#l0_flush)               | 0x8      |        4 | Cluster level 0 instruction cache unit flush command register.   |
| cluster_icache_ctrl.[`SEL_FLUSH`](#sel_flush)             | 0xc      |        4 | Cluster instruction cache unit selective flush command register. |
| cluster_icache_ctrl.[`L1_L15_PREFETCH`](#l1_l15_prefetch) | 0x10     |        4 | Enable L1 and L1.5 prefetch register.                            |

## ENABLE
Cluster instruction cache unit enable configuration register.
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "EN", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                               |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------------|
|  31:1  |        |         |        | Reserved                                                                                  |
|   0    |   rw   |   0x0   | EN     | Cluster instruction cache enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |

## FLUSH
Cluster instruction cache unit flush command register.
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "FL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                   |
|:------:|:------:|:-------:|:-------|:----------------------------------------------|
|  31:1  |        |         |        | Reserved                                      |
|   0    |   rw   |   0x0   | FL     | Cluster instruction cache full flush command. |

## L0_FLUSH
Cluster level 0 instruction cache unit flush command register.
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "L0_FL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                           |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------|
|  31:1  |        |         |        | Reserved                                              |
|   0    |   rw   |   0x0   | L0_FL  | Cluster level 0 instruction cache full flush command. |

## SEL_FLUSH
Cluster instruction cache unit selective flush command register.
- Offset: `0xc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "ADDR", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                               |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------|
|  31:0  |   rw   |   0x0   | ADDR   | Cluster instruction cache selective flush address configuration bitfield. |

## L1_L15_PREFETCH
Enable L1 and L1.5 prefetch register.
- Offset: `0x10`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "CORE0", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE1", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE2", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE3", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE4", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE5", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE6", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE7", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                            |
|:------:|:------:|:-------:|:-------|:---------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                               |
|   7    |   rw   |   0x0   | CORE7  | Core 7 icache prefetch enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |
|   6    |   rw   |   0x0   | CORE6  | Core 6 icache prefetch enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |
|   5    |   rw   |   0x0   | CORE5  | Core 5 icache prefetch enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |
|   4    |   rw   |   0x0   | CORE4  | Core 4 icache prefetch enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |
|   3    |   rw   |   0x0   | CORE3  | Core 3 icache prefetch enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |
|   2    |   rw   |   0x0   | CORE2  | Core 2 icache prefetch enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |
|   1    |   rw   |   0x0   | CORE1  | Core 1 icache prefetch enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |
|   0    |   rw   |   0x0   | CORE0  | Core 0 icache prefetch enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |

