## Summary

| Name                                                      | Offset   |   Length | Description                               |
|:----------------------------------------------------------|:---------|---------:|:------------------------------------------|
| axi_vga.[`CONTROL`](#control)                             | 0x0      |        4 | Control register                          |
| axi_vga.[`CLK_DIV`](#clk_div)                             | 0x4      |        4 | Clock divider                             |
| axi_vga.[`HORI_VISIBLE_SIZE`](#hori_visible_size)         | 0x8      |        4 | Size of horizontal visible area           |
| axi_vga.[`HORI_FRONT_PORCH_SIZE`](#hori_front_porch_size) | 0xc      |        4 | Size of horizontal front porch            |
| axi_vga.[`HORI_SYNC_SIZE`](#hori_sync_size)               | 0x10     |        4 | Size of horizontal sync area              |
| axi_vga.[`HORI_BACK_PORCH_SIZE`](#hori_back_porch_size)   | 0x14     |        4 | Size of horizontal back porch             |
| axi_vga.[`VERT_VISIBLE_SIZE`](#vert_visible_size)         | 0x18     |        4 | Size of vertical visible area             |
| axi_vga.[`VERT_FRONT_PORCH_SIZE`](#vert_front_porch_size) | 0x1c     |        4 | Size of vertical front porch              |
| axi_vga.[`VERT_SYNC_SIZE`](#vert_sync_size)               | 0x20     |        4 | Size of vertical sync area                |
| axi_vga.[`VERT_BACK_PORCH_SIZE`](#vert_back_porch_size)   | 0x24     |        4 | Size of vertical back porch               |
| axi_vga.[`START_ADDR_LOW`](#start_addr_low)               | 0x28     |        4 | Low end of start address of frame buffer  |
| axi_vga.[`START_ADDR_HIGH`](#start_addr_high)             | 0x2c     |        4 | High end of start address of frame buffer |
| axi_vga.[`FRAME_SIZE`](#frame_size)                       | 0x30     |        4 | Size of whole frame                       |
| axi_vga.[`BURST_LEN`](#burst_len)                         | 0x34     |        4 | Number of beats in a burst                |

## CONTROL
Control register
- Offset: `0x0`
- Reset default: `0x6`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "enable", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "hsync_pol", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "vsync_pol", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 110}}
```

|  Bits  |  Type  |  Reset  | Name      | Description                                            |
|:------:|:------:|:-------:|:----------|:-------------------------------------------------------|
|  31:3  |        |         |           | Reserved                                               |
|   2    |   rw   |   0x1   | vsync_pol | Sets polarity for VSYNC 0 - Active Low 1 - Active High |
|   1    |   rw   |   0x1   | hsync_pol | Sets polarity for HSYNC 0 - Active Low 1 - Active High |
|   0    |   rw   |   0x0   | enable    | Enables FSM.                                           |

## CLK_DIV
Clock divider
- Offset: `0x4`
- Reset default: `0x1`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "clk_div", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name    | Description    |
|:------:|:------:|:-------:|:--------|:---------------|
|  31:8  |        |         |         | Reserved       |
|  7:0   |   rw   |   0x1   | clk_div | Clock divider. |

## HORI_VISIBLE_SIZE
Size of horizontal visible area
- Offset: `0x8`
- Reset default: `0x1`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "hori_visible_size", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name              | Description                      |
|:------:|:------:|:-------:|:------------------|:---------------------------------|
|  31:0  |   rw   |   0x1   | hori_visible_size | Size of horizontal visible area. |

## HORI_FRONT_PORCH_SIZE
Size of horizontal front porch
- Offset: `0xc`
- Reset default: `0x1`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "hori_front_porch_size", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                  | Description                     |
|:------:|:------:|:-------:|:----------------------|:--------------------------------|
|  31:0  |   rw   |   0x1   | hori_front_porch_size | Size of horizontal front porch. |

## HORI_SYNC_SIZE
Size of horizontal sync area
- Offset: `0x10`
- Reset default: `0x1`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "hori_sync_size", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name           | Description                   |
|:------:|:------:|:-------:|:---------------|:------------------------------|
|  31:0  |   rw   |   0x1   | hori_sync_size | Size of horizontal sync area. |

## HORI_BACK_PORCH_SIZE
Size of horizontal back porch
- Offset: `0x14`
- Reset default: `0x1`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "hori_back_porch_size", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                 | Description                    |
|:------:|:------:|:-------:|:---------------------|:-------------------------------|
|  31:0  |   rw   |   0x1   | hori_back_porch_size | Size of horizontal back porch. |

## VERT_VISIBLE_SIZE
Size of vertical visible area
- Offset: `0x18`
- Reset default: `0x1`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "vert_visible_size", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name              | Description                    |
|:------:|:------:|:-------:|:------------------|:-------------------------------|
|  31:0  |   rw   |   0x1   | vert_visible_size | Size of vertical visible area. |

## VERT_FRONT_PORCH_SIZE
Size of vertical front porch
- Offset: `0x1c`
- Reset default: `0x1`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "vert_front_porch_size", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                  | Description                   |
|:------:|:------:|:-------:|:----------------------|:------------------------------|
|  31:0  |   rw   |   0x1   | vert_front_porch_size | Size of vertical front porch. |

## VERT_SYNC_SIZE
Size of vertical sync area
- Offset: `0x20`
- Reset default: `0x1`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "vert_sync_size", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name           | Description                 |
|:------:|:------:|:-------:|:---------------|:----------------------------|
|  31:0  |   rw   |   0x1   | vert_sync_size | Size of vertical sync area. |

## VERT_BACK_PORCH_SIZE
Size of vertical back porch
- Offset: `0x24`
- Reset default: `0x1`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "vert_back_porch_size", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                 | Description                  |
|:------:|:------:|:-------:|:---------------------|:-----------------------------|
|  31:0  |   rw   |   0x1   | vert_back_porch_size | Size of vertical back porch. |

## START_ADDR_LOW
Low end of start address of frame buffer
- Offset: `0x28`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "start_addr_low", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name           | Description                               |
|:------:|:------:|:-------:|:---------------|:------------------------------------------|
|  31:0  |   rw   |   0x0   | start_addr_low | Low end of start address of frame buffer. |

## START_ADDR_HIGH
High end of start address of frame buffer
- Offset: `0x2c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "start_addr_high", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name            | Description                                |
|:------:|:------:|:-------:|:----------------|:-------------------------------------------|
|  31:0  |   rw   |   0x0   | start_addr_high | High end of start address of frame buffer. |

## FRAME_SIZE
Size of whole frame
- Offset: `0x30`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "frame_size", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name       | Description          |
|:------:|:------:|:-------:|:-----------|:---------------------|
|  31:0  |   rw   |   0x0   | frame_size | Size of whole frame. |

## BURST_LEN
Number of beats in a burst
- Offset: `0x34`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "burst_len", "bits": 8, "attr": ["rw"], "rotate": 0}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name      | Description                 |
|:------:|:------:|:-------:|:----------|:----------------------------|
|  31:8  |        |         |           | Reserved                    |
|  7:0   |   rw   |   0x0   | burst_len | Number of beats in a burst. |

