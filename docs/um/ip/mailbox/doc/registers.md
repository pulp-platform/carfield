## Summary

| Name                                    | Offset   |   Length | Description                                 |
|:----------------------------------------|:---------|---------:|:--------------------------------------------|
| mailbox.[`IRQ_SND_STAT`](#irq_snd_stat) | 0x0      |        4 | Sender interrupt status register            |
| mailbox.[`IRQ_SND_SET`](#irq_snd_set)   | 0x4      |        4 | Sender interrupt set register               |
| mailbox.[`IRQ_SND_CLR`](#irq_snd_clr)   | 0x8      |        4 | Sender interrupt clear register             |
| mailbox.[`IRQ_SND_EN`](#irq_snd_en)     | 0xc      |        4 | Sender interrupt enable register            |
| mailbox.[`IRQ_RCV_STAT`](#irq_rcv_stat) | 0x40     |        4 | Receiver interrupt status register          |
| mailbox.[`IRQ_RCV_SET`](#irq_rcv_set)   | 0x44     |        4 | Receiver interrupt set register             |
| mailbox.[`IRQ_RCV_CLR`](#irq_rcv_clr)   | 0x48     |        4 | Receiver interrupt clear register           |
| mailbox.[`IRQ_RCV_EN`](#irq_rcv_en)     | 0x4c     |        4 | Receiver interrupt enable register          |
| mailbox.[`LETTER0`](#letter0)           | 0x80     |        4 | Memory region 0 to put a message or pointer |
| mailbox.[`LETTER1`](#letter1)           | 0x84     |        4 | Memory region 1 to put a message or pointer |

## IRQ_SND_STAT
Sender interrupt status register
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "stat", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "reserved", "bits": 31, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                                                                                  |
|:------:|:------:|:-------:|:---------|:---------------------------------------------------------------------------------------------|
|  31:1  |   ro   |    x    | reserved | reserved                                                                                     |
|   0    |   ro   |    x    | stat     | Sender side interrupt status. Receiver confirms letter. Reflects interrupt line logic level. |

## IRQ_SND_SET
Sender interrupt set register
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "set", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "reserved", "bits": 31, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                                          |
|:------:|:------:|:-------:|:---------|:-----------------------------------------------------|
|  31:1  |   ro   |    x    | reserved | reserved                                             |
|   0    |   wo   |    x    | set      | Sender side interrupt set. Receiver confirms letter. |

## IRQ_SND_CLR
Sender interrupt clear register
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "clr", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "reserved", "bits": 31, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                                            |
|:------:|:------:|:-------:|:---------|:-------------------------------------------------------|
|  31:1  |   ro   |    x    | reserved | reserved                                               |
|   0    |   wo   |    x    | clr      | Sender side interrupt clear. Receiver confirms letter. |

## IRQ_SND_EN
Sender interrupt enable register
- Offset: `0xc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "en", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "reserved", "bits": 31, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                                             |
|:------:|:------:|:-------:|:---------|:--------------------------------------------------------|
|  31:1  |   ro   |   0x0   | reserved | reserved                                                |
|   0    |   rw   |   0x0   | en       | Sender side interrupt enable. Receiver confirms letter. |

## IRQ_RCV_STAT
Receiver interrupt status register
- Offset: `0x40`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "stat", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "reserved", "bits": 31, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                                                                                                             |
|:------:|:------:|:-------:|:---------|:------------------------------------------------------------------------------------------------------------------------|
|  31:1  |   ro   |    x    | reserved | reserved                                                                                                                |
|   0    |   ro   |    x    | stat     | Receiver side interrupt status. Sender notifies receiver of a new letter arriving. Reflects interrupt line logic level. |

## IRQ_RCV_SET
Receiver interrupt set register
- Offset: `0x44`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "set", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "reserved", "bits": 31, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                                                                     |
|:------:|:------:|:-------:|:---------|:--------------------------------------------------------------------------------|
|  31:1  |   ro   |    x    | reserved | reserved                                                                        |
|   0    |   wo   |    x    | set      | Receiver side interrupt set. Sender notifies receiver of a new letter arriving. |

## IRQ_RCV_CLR
Receiver interrupt clear register
- Offset: `0x48`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "clr", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "reserved", "bits": 31, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                                                                       |
|:------:|:------:|:-------:|:---------|:----------------------------------------------------------------------------------|
|  31:1  |   ro   |    x    | reserved | reserved                                                                          |
|   0    |   wo   |    x    | clr      | Receiver side interrupt clear. Sender notifies receiver of a new letter arriving. |

## IRQ_RCV_EN
Receiver interrupt enable register
- Offset: `0x4c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "en", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "reserved", "bits": 31, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                                                                        |
|:------:|:------:|:-------:|:---------|:-----------------------------------------------------------------------------------|
|  31:1  |   ro   |   0x0   | reserved | reserved                                                                           |
|   0    |   rw   |   0x0   | en       | Receiver side interrupt enable. Sender notifies receiver of a new letter arriving. |

## LETTER0
Memory region 0 to put a message or pointer
- Offset: `0x80`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "LETTER0", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name    | Description   |
|:------:|:------:|:-------:|:--------|:--------------|
|  31:0  |   rw   |   0x0   | LETTER0 |               |

## LETTER1
Memory region 1 to put a message or pointer
- Offset: `0x84`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "LETTER1", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name    | Description   |
|:------:|:------:|:-------:|:--------|:--------------|
|  31:0  |   rw   |   0x0   | LETTER1 |               |

