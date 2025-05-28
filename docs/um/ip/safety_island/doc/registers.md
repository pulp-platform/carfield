## Summary

| Name                                        | Offset   |   Length | Description                            |
|:--------------------------------------------|:---------|---------:|:---------------------------------------|
| safety_soc_ctrl.[`bootaddr`](#bootaddr)     | 0x0      |        4 | Core Boot Address                      |
| safety_soc_ctrl.[`fetchen`](#fetchen)       | 0x4      |        4 | Core Fetch Enable                      |
| safety_soc_ctrl.[`corestatus`](#corestatus) | 0x8      |        4 | Core Return Status (return value, EOC) |
| safety_soc_ctrl.[`bootmode`](#bootmode)     | 0xc      |        4 | Core Boot Mode                         |

## bootaddr
Core Boot Address
- Offset: `0x0`
- Reset default: `0x1a000000`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "bootaddr", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |   Reset    | Name     | Description   |
|:------:|:------:|:----------:|:---------|:--------------|
|  31:0  |   rw   | 0x1a000000 | bootaddr | Boot Address  |

## fetchen
Core Fetch Enable
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "fetchen", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 90}}
```

|  Bits  |  Type  |  Reset  | Name    | Description   |
|:------:|:------:|:-------:|:--------|:--------------|
|  31:1  |        |         |         | Reserved      |
|   0    |   rw   |   0x0   | fetchen | Fetch Enable  |

## corestatus
Core Return Status (return value, EOC)
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "core_status", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name        | Description                                             |
|:------:|:------:|:-------:|:------------|:--------------------------------------------------------|
|  31:0  |   rw   |   0x0   | core_status | Core Return Status (EOC(bit[31]) and status(bit[30:0])) |

## bootmode
Core Boot Mode
- Offset: `0xc`
- Reset default: `0x0`
- Reset mask: `0x3`

### Fields

```wavejson
{"reg": [{"name": "bootmode", "bits": 2, "attr": ["rw"], "rotate": -90}, {"bits": 30}], "config": {"lanes": 1, "fontsize": 10, "vspace": 100}}
```

|  Bits  |  Type  |  Reset  | Name     | Description   |
|:------:|:------:|:-------:|:---------|:--------------|
|  31:2  |        |         |          | Reserved      |
|  1:0   |   rw   |   0x0   | bootmode | Boot Mode     |

