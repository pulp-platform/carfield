## Summary

| Name                                    | Offset   |   Length | Description                                                                                             |
|:----------------------------------------|:---------|---------:|:--------------------------------------------------------------------------------------------------------|
| dma.[`INTR_STATE`](#intr_state)         | 0x0      |        4 | Interrupt State Register                                                                                |
| dma.[`INTR_ENABLE`](#intr_enable)       | 0x4      |        4 | Interrupt Enable Register                                                                               |
| dma.[`INTR_TEST`](#intr_test)           | 0x8      |        4 | Interrupt Test Register                                                                                 |
| dma.[`ALERT_TEST`](#alert_test)         | 0xc      |        4 | Alert Test Register                                                                                     |
| dma.[`CMD`](#cmd)                       | 0x10     |        4 | ?                                                                                                       |
| dma.[`TID`](#tid)                       | 0x14     |        4 | Transfer identifier value bitfield.                                                                     |
| dma.[`TCDM_ADDR`](#tcdm_addr)           | 0x18     |        4 | Transfer L1 base address configuration bitfield.                                                        |
| dma.[`EXT_ADDR`](#ext_addr)             | 0x1c     |        4 | Transfer L2 base address configuration bitfield.                                                        |
| dma.[`EXT_COUNT_2D`](#ext_count_2d)     | 0x20     |        4 | EXT 2D transfer conut value configuration bitfield.                                                     |
| dma.[`EXT_STRIDE_2D`](#ext_stride_2d)   | 0x24     |        4 | EXT 2D transfer stride value configuration bitfield.                                                    |
| dma.[`TCDM_COUNT_2D`](#tcdm_count_2d)   | 0x28     |        4 | TCDM 2D transfer conut value configuration bitfield.                                                    |
| dma.[`TCDM_STRIDE_2D`](#tcdm_stride_2d) | 0x2c     |        4 | TCDM 2D transfer stride value configuration bitfield.                                                   |
| dma.[`STATUS`](#status)                 | 0x30     |        4 | ?                                                                                                       |
| dma.[`TID_FREE`](#tid_free)             | 0x34     |        4 | Transfer canceller configuration bitfield. Writing a 1'b1 in TID_FREE[i] will free transfer with TID i. |

## INTR_STATE
Interrupt State Register
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "dma_done", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "dma_chunk_done", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "dma_error", "bits": 1, "attr": ["ro"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 160}}
```

|  Bits  |  Type  |  Reset  | Name           | Description                                                               |
|:------:|:------:|:-------:|:---------------|:--------------------------------------------------------------------------|
|  31:3  |        |         |                | Reserved                                                                  |
|   2    |   ro   |   0x0   | dma_error      | DMA error has occurred. DMA_STATUS.error_code register shows the details. |
|   1    |   ro   |   0x0   | dma_chunk_done | Indicates the transfer of a single chunk has been completed.              |
|   0    |   ro   |   0x0   | dma_done       | DMA operation has been completed.                                         |

## INTR_ENABLE
Interrupt Enable Register
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "dma_done", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "dma_chunk_done", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "dma_error", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 160}}
```

|  Bits  |  Type  |  Reset  | Name           | Description                                                              |
|:------:|:------:|:-------:|:---------------|:-------------------------------------------------------------------------|
|  31:3  |        |         |                | Reserved                                                                 |
|   2    |   rw   |   0x0   | dma_error      | Enable interrupt when [`INTR_STATE.dma_error`](#intr_state) is set.      |
|   1    |   rw   |   0x0   | dma_chunk_done | Enable interrupt when [`INTR_STATE.dma_chunk_done`](#intr_state) is set. |
|   0    |   rw   |   0x0   | dma_done       | Enable interrupt when [`INTR_STATE.dma_done`](#intr_state) is set.       |

## INTR_TEST
Interrupt Test Register
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0x7`

### Fields

```wavejson
{"reg": [{"name": "dma_done", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "dma_chunk_done", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "dma_error", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 29}], "config": {"lanes": 1, "fontsize": 10, "vspace": 160}}
```

|  Bits  |  Type  |  Reset  | Name           | Description                                                       |
|:------:|:------:|:-------:|:---------------|:------------------------------------------------------------------|
|  31:3  |        |         |                | Reserved                                                          |
|   2    |   wo   |   0x0   | dma_error      | Write 1 to force [`INTR_STATE.dma_error`](#intr_state) to 1.      |
|   1    |   wo   |   0x0   | dma_chunk_done | Write 1 to force [`INTR_STATE.dma_chunk_done`](#intr_state) to 1. |
|   0    |   wo   |   0x0   | dma_done       | Write 1 to force [`INTR_STATE.dma_done`](#intr_state) to 1.       |

## ALERT_TEST
Alert Test Register
- Offset: `0xc`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "fatal_fault", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 130}}
```

|  Bits  |  Type  |  Reset  | Name        | Description                                      |
|:------:|:------:|:-------:|:------------|:-------------------------------------------------|
|  31:1  |        |         |             | Reserved                                         |
|   0    |   wo   |   0x0   | fatal_fault | Write 1 to trigger one alert event of this kind. |

## CMD
?
?
?
- Offset: `0x10`
- Reset default: `0x0`
- Reset mask: `0xffffff`

### Fields

```wavejson
{"reg": [{"name": "LEN", "bits": 17, "attr": ["wo"], "rotate": 0}, {"name": "TYPE", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "INC", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "EXT_2D", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "ELE", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "ILE", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "BLE", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "TCDM_2D", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 8}], "config": {"lanes": 1, "fontsize": 10, "vspace": 90}}
```

|  Bits  |  Type  |  Reset  | Name    | Description                                                                                                                                                                                                     |
|:------:|:------:|:-------:|:--------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 31:24  |        |         |         | Reserved                                                                                                                                                                                                        |
|   23   |   wo   |   0x0   | TCDM_2D | Transfer type configuration bitfield: -1'b0: linear transfer in TCDM interface -1'b1: 2D transfer in TCDM interface                                                                                             |
|   22   |   wo   |   0x0   | BLE     | Transfer event or interrupt broadcast configuration bitfield: 1'b0: event or interrupt is routed to the cluster core who initiated the transfer. 1'b1: event or interrupt are broadcasted to all cluster cores. |
|   21   |   wo   |   0x0   | ILE     | Transfer interrupt generation configuration bitfield: -1'b0: disabled. -1'b1: enabled.                                                                                                                          |
|   20   |   wo   |   0x0   | ELE     | Transfer event generation configuration bitfield: -1'b0: disabled. -1'b1: enabled.                                                                                                                              |
|   19   |   wo   |   0x0   | EXT_2D  | Transfer type configuration bitfield: -1'b0: linear transfer in EXT interface. -1'b1: 2D transfer in EXT interface.                                                                                             |
|   18   |   wo   |   0x0   | INC     | Transfer incremental configuration bitfield: -1'b0: non incremental. -1'b1: incremental.                                                                                                                        |
|   17   |   wo   |   0x0   | TYPE    | Transfer direction configuration bitfield: -1'b0: L1 to L2 -1'b1: L2 to L1                                                                                                                                      |
|  16:0  |   wo   |   0x0   | LEN     | Transfer length in bytes configuration bitfield.                                                                                                                                                                |

## TID
Transfer identifier value bitfield.
- Offset: `0x14`
- Reset default: `0x0`
- Reset mask: `0xf`

### Fields

```wavejson
{"reg": [{"name": "get_tid", "bits": 4, "attr": ["ro"], "rotate": -90}, {"bits": 28}], "config": {"lanes": 1, "fontsize": 10, "vspace": 90}}
```

|  Bits  |  Type  |  Reset  | Name    | Description                         |
|:------:|:------:|:-------:|:--------|:------------------------------------|
|  31:4  |        |         |         | Reserved                            |
|  3:0   |   ro   |   0x0   | get_tid | Transfer identifier value bitfield. |

## TCDM_ADDR
Transfer L1 base address configuration bitfield.
- Offset: `0x18`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "tcdm_addr", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name      | Description                                      |
|:------:|:------:|:-------:|:----------|:-------------------------------------------------|
|  31:0  |   wo   |   0x0   | tcdm_addr | Transfer L1 base address configuration bitfield. |

## EXT_ADDR
Transfer L2 base address configuration bitfield.
- Offset: `0x1c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "ext_addr", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                                      |
|:------:|:------:|:-------:|:---------|:-------------------------------------------------|
|  31:0  |   wo   |   0x0   | ext_addr | Transfer L2 base address configuration bitfield. |

## EXT_COUNT_2D
EXT 2D transfer conut value configuration bitfield.
- Offset: `0x20`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "ext_count_2D", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name         | Description                                         |
|:------:|:------:|:-------:|:-------------|:----------------------------------------------------|
|  31:0  |   wo   |   0x0   | ext_count_2D | EXT 2D transfer conut value configuration bitfield. |

## EXT_STRIDE_2D
EXT 2D transfer stride value configuration bitfield.
- Offset: `0x24`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "ext_stride_2D", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name          | Description                                          |
|:------:|:------:|:-------:|:--------------|:-----------------------------------------------------|
|  31:0  |   wo   |   0x0   | ext_stride_2D | EXT 2D transfer stride value configuration bitfield. |

## TCDM_COUNT_2D
TCDM 2D transfer conut value configuration bitfield.
- Offset: `0x28`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "tcdm_count_2D", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name          | Description                                          |
|:------:|:------:|:-------:|:--------------|:-----------------------------------------------------|
|  31:0  |   wo   |   0x0   | tcdm_count_2D | TCDM 2D transfer conut value configuration bitfield. |

## TCDM_STRIDE_2D
TCDM 2D transfer stride value configuration bitfield.
- Offset: `0x2c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "tcdm_stride_2D", "bits": 32, "attr": ["wo"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name           | Description                                           |
|:------:|:------:|:-------:|:---------------|:------------------------------------------------------|
|  31:0  |   wo   |   0x0   | tcdm_stride_2D | TCDM 2D transfer stride value configuration bitfield. |

## STATUS
?
?
?
- Offset: `0x30`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "TID_TR", "bits": 16, "attr": ["ro"], "rotate": 0}, {"name": "TID_ALLOC", "bits": 16, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name      | Description                                                                                                                                                               |
|:------:|:------:|:-------:|:----------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 31:16  |   ro   |   0x0   | TID_ALLOC | Transfer status bitfield: - TID_TR[i]=1'b0 means that transfer allocator with TID i-16 is free. - TID_TR[i]=1'b1 means that transfer allocator with TID i-16 is reserved. |
|  15:0  |   ro   |   0x0   | TID_TR    | Transfer status bitfield: TID_TR[i]=1'b1 means that transfer with TID i is active.                                                                                        |

## TID_FREE
Transfer canceller configuration bitfield. Writing a 1'b1 in TID_FREE[i] will free transfer with TID i.
- Offset: `0x34`
- Reset default: `0x0`
- Reset mask: `0xffff`

### Fields

```wavejson
{"reg": [{"name": "tid_free", "bits": 16, "attr": ["wo"], "rotate": 0}, {"bits": 16}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                                                                                             |
|:------:|:------:|:-------:|:---------|:--------------------------------------------------------------------------------------------------------|
| 31:16  |        |         |          | Reserved                                                                                                |
|  15:0  |   wo   |   0x0   | tid_free | Transfer canceller configuration bitfield. Writing a 1'b1 in TID_FREE[i] will free transfer with TID i. |

