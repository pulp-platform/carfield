## Summary

| Name                       | Offset   |   Length | Description                      |
|:---------------------------|:---------|---------:|:---------------------------------|
| CLICVS.[`vsprio`](#vsprio) | 0x0      |        4 | CLIC virtual supervisor priority |

## vsprio
CLIC virtual supervisor priority
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0x1010101`

### Fields

```wavejson
{"reg": [{"name": "prio0", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 7}, {"name": "prio1", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 7}, {"name": "prio2", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 7}, {"name": "prio3", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 7}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
| 31:25  |        |         |        | Reserved      |
|   24   |   rw   |   0x0   | prio3  | VS3 priority  |
| 23:17  |        |         |        | Reserved      |
|   16   |   rw   |   0x0   | prio2  | VS2 priority  |
|  15:9  |        |         |        | Reserved      |
|   8    |   rw   |   0x0   | prio1  | VS1 priority  |
|  7:1   |        |         |        | Reserved      |
|   0    |   rw   |   0x0   | prio0  | VS0 priority  |

