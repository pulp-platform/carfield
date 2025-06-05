## Summary

| Name                          | Offset   |   Length | Description                                           |
|:------------------------------|:---------|---------:|:------------------------------------------------------|
| CLICINT.[`CLICINT`](#clicint) | 0x0      |        4 | CLIC interrupt pending, enable, attribute and control |

## CLICINT
CLIC interrupt pending, enable, attribute and control
- Offset: `0x0`
- Reset default: `0xc00000`
- Reset mask: `0xffc70101`

### Fields

```wavejson
{"reg": [{"name": "IP", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 7}, {"name": "IE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 7}, {"name": "ATTR_SHV", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "ATTR_TRIG", "bits": 2, "attr": ["rw"], "rotate": -90}, {"bits": 3}, {"name": "ATTR_MODE", "bits": 2, "attr": ["rw"], "rotate": -90}, {"name": "CTL", "bits": 8, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 110}}
```

|  Bits  |  Type  |  Reset  | Name      | Description                                  |
|:------:|:------:|:-------:|:----------|:---------------------------------------------|
| 31:24  |   rw   |   0x0   | CTL       | interrupt control for interrupt              |
| 23:22  |   rw   |   0x3   | ATTR_MODE | privilege mode of this interrupt             |
| 21:19  |        |         |           | Reserved                                     |
| 18:17  |   rw   |   0x0   | ATTR_TRIG | specify trigger type for this interrupt      |
|   16   |   rw   |   0x0   | ATTR_SHV  | enable hardware vectoring for this interrupt |
|  15:9  |        |         |           | Reserved                                     |
|   8    |   rw   |   0x0   | IE        | interrupt enable for interrupt               |
|  7:1   |        |         |           | Reserved                                     |
|   0    |   rw   |   0x0   | IP        | interrupt pending for interrupt              |

