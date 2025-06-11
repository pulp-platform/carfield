## Summary

| Name                             | Offset   |   Length | Description                   |
|:---------------------------------|:---------|---------:|:------------------------------|
| CLICINTV.[`CLICINTV`](#clicintv) | 0x0      |        4 | CLIC interrupt virtualization |

## CLICINTV
CLIC interrupt virtualization
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0xfdfdfdfd`

### Fields

```wavejson
{"reg": [{"name": "V0", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 1}, {"name": "VSID0", "bits": 6, "attr": ["rw"], "rotate": 0}, {"name": "V1", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 1}, {"name": "VSID1", "bits": 6, "attr": ["rw"], "rotate": 0}, {"name": "V2", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 1}, {"name": "VSID2", "bits": 6, "attr": ["rw"], "rotate": 0}, {"name": "V3", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 1}, {"name": "VSID3", "bits": 6, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                    |
|:------:|:------:|:-------:|:-------|:-------------------------------|
| 31:26  |   rw   |   0x0   | VSID3  | interrupt VS id                |
|   25   |        |         |        | Reserved                       |
|   24   |   rw   |   0x0   | V3     | interrupt delegated to VS-mode |
| 23:18  |   rw   |   0x0   | VSID2  | interrupt VS id                |
|   17   |        |         |        | Reserved                       |
|   16   |   rw   |   0x0   | V2     | interrupt delegated to VS-mode |
| 15:10  |   rw   |   0x0   | VSID1  | interrupt VS id                |
|   9    |        |         |        | Reserved                       |
|   8    |   rw   |   0x0   | V1     | interrupt delegated to VS-mode |
|  7:2   |   rw   |   0x0   | VSID0  | interrupt VS id                |
|   1    |        |         |        | Reserved                       |
|   0    |   rw   |   0x0   | V0     | interrupt delegated to VS-mode |

