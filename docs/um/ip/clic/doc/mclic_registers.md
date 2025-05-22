## Summary

| Name                                    | Offset   |   Length | Description                            |
|:----------------------------------------|:---------|---------:|:---------------------------------------|
| MCLIC.[`MCLICCFG`](#mcliccfg)           | 0x0      |        4 | CLIC configuration                     |
| MCLIC.[`CLICMNXTICONF`](#clicmnxticonf) | 0x4      |        4 | CLIC enable mnxti irq forwarding logic |

## MCLICCFG
CLIC configuration
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0xff0f003f`

### Fields

```wavejson
{"reg": [{"name": "mnlbits", "bits": 4, "attr": ["rw"], "rotate": -90}, {"name": "nmbits", "bits": 2, "attr": ["rw"], "rotate": -90}, {"bits": 10}, {"name": "snlbits", "bits": 4, "attr": ["rw"], "rotate": -90}, {"bits": 4}, {"name": "unlbits", "bits": 4, "attr": ["rw"], "rotate": -90}, {"name": "reserved", "bits": 4, "attr": ["ro"], "rotate": -90}], "config": {"lanes": 1, "fontsize": 10, "vspace": 100}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                                      |
|:------:|:------:|:-------:|:---------|:-------------------------------------------------|
| 31:28  |   ro   |   0x0   | reserved | reserved                                         |
| 27:24  |   rw   |   0x0   | unlbits  | number of privilege mode bits in user mode       |
| 23:20  |        |         |          | Reserved                                         |
| 19:16  |   rw   |   0x0   | snlbits  | number of privilege mode bits in supervisor mode |
|  15:6  |        |         |          | Reserved                                         |
|  5:4   |   rw   |   0x0   | nmbits   | number of privilege mode bits                    |
|  3:0   |   rw   |   0x0   | mnlbits  | number of interrupt level bits in machine mode   |

## CLICMNXTICONF
CLIC enable mnxti irq forwarding logic
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "CLICMNXTICONF", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 150}}
```

|  Bits  |  Type  |  Reset  | Name          | Description   |
|:------:|:------:|:-------:|:--------------|:--------------|
|  31:1  |        |         |               | Reserved      |
|   0    |   rw   |   0x0   | CLICMNXTICONF |               |

