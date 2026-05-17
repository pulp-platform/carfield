## Summary

| Name                                                       | Offset   |   Length | Description                                 |
|:-----------------------------------------------------------|:---------|---------:|:--------------------------------------------|
| hyperbus.[`T_LATENCY_ACCESS`](#t_latency_access)           | 0x0      |        4 | Initial latency                             |
| hyperbus.[`EN_LATENCY_ADDITIONAL`](#en_latency_additional) | 0x4      |        4 | Force 2x Latency count                      |
| hyperbus.[`T_BURST_MAX`](#t_burst_max)                     | 0x8      |        4 | Max burst Length between two memory refresh |
| hyperbus.[`T_READ_WRITE_RECOVERY`](#t_read_write_recovery) | 0xc      |        4 | Idle time between transactions              |
| hyperbus.[`T_RX_CLOCK_DELAY`](#t_rx_clock_delay)           | 0x10     |        4 | RX Delay Line                               |
| hyperbus.[`T_TX_CLOCK_DELAY`](#t_tx_clock_delay)           | 0x14     |        4 | TX Delay Line                               |
| hyperbus.[`ADDRESS_MASK_MSB`](#address_mask_msb)           | 0x18     |        4 | Address Mask MSB                            |
| hyperbus.[`ADDRESS_SPACE`](#address_space)                 | 0x1c     |        4 | L2 sleep configuration register             |
| hyperbus.[`PHYS_IN_USE`](#phys_in_use)                     | 0x20     |        4 | Number of PHYs on use                       |
| hyperbus.[`WHICH_PHY`](#which_phy)                         | 0x24     |        4 | PHY used in single PHY mode                 |
| hyperbus.[`CS0_BASE`](#cs0_base)                           | 0x28     |        4 | CS0 Base address range                      |
| hyperbus.[`CS0_END`](#cs0_end)                             | 0x2c     |        4 | CS0 End address range                       |
| hyperbus.[`CS1_BASE`](#cs1_base)                           | 0x30     |        4 | CS1 Base address range                      |
| hyperbus.[`CS1_END`](#cs1_end)                             | 0x34     |        4 | CS1 End address range                       |
| hyperbus.[`CS2_BASE`](#cs2_base)                           | 0x38     |        4 | CS2 Base address range                      |
| hyperbus.[`CS2_END`](#cs2_end)                             | 0x3c     |        4 | CS2 End address range                       |
| hyperbus.[`CS3_BASE`](#cs3_base)                           | 0x40     |        4 | CS3 Base address range                      |
| hyperbus.[`CS3_END`](#cs3_end)                             | 0x44     |        4 | CS3 End address range                       |

## T_LATENCY_ACCESS
Initial latency
- Offset: `0x0`
- Reset default: `0x6`
- Reset mask: `0xf`

### Fields

```wavejson
{"reg": [{"name": "T_LATENCY_ACCESS", "bits": 4, "attr": ["rw"], "rotate": -90}, {"bits": 28}], "config": {"lanes": 1, "fontsize": 10, "vspace": 180}}
```

|  Bits  |  Type  |  Reset  | Name             | Description     |
|:------:|:------:|:-------:|:-----------------|:----------------|
|  31:4  |        |         |                  | Reserved        |
|  3:0   |   rw   |   0x6   | T_LATENCY_ACCESS | Initial latency |

## EN_LATENCY_ADDITIONAL
Force 2x Latency count
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "EN_LATENCY_ADDITIONAL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 230}}
```

|  Bits  |  Type  |  Reset  | Name                  | Description            |
|:------:|:------:|:-------:|:----------------------|:-----------------------|
|  31:1  |        |         |                       | Reserved               |
|   0    |   rw   |   0x0   | EN_LATENCY_ADDITIONAL | Force 2x Latency count |

## T_BURST_MAX
Max burst Length between two memory refresh
- Offset: `0x8`
- Reset default: `0x15e`
- Reset mask: `0xffff`

### Fields

```wavejson
{"reg": [{"name": "T_BURST_MAX", "bits": 16, "attr": ["rw"], "rotate": 0}, {"bits": 16}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name        | Description                                 |
|:------:|:------:|:-------:|:------------|:--------------------------------------------|
| 31:16  |        |         |             | Reserved                                    |
|  15:0  |   rw   |  0x15e  | T_BURST_MAX | Max burst Length between two memory refresh |

## T_READ_WRITE_RECOVERY
Idle time between transactions
- Offset: `0xc`
- Reset default: `0x6`
- Reset mask: `0xf`

### Fields

```wavejson
{"reg": [{"name": "T_READ_WRITE_RECOVERY", "bits": 4, "attr": ["rw"], "rotate": -90}, {"bits": 28}], "config": {"lanes": 1, "fontsize": 10, "vspace": 230}}
```

|  Bits  |  Type  |  Reset  | Name                  | Description                    |
|:------:|:------:|:-------:|:----------------------|:-------------------------------|
|  31:4  |        |         |                       | Reserved                       |
|  3:0   |   rw   |   0x6   | T_READ_WRITE_RECOVERY | Idle time between transactions |

## T_RX_CLOCK_DELAY
RX Delay Line
- Offset: `0x10`
- Reset default: `0x8`
- Reset mask: `0xf`

### Fields

```wavejson
{"reg": [{"name": "T_RX_CLOCK_DELAY", "bits": 4, "attr": ["rw"], "rotate": -90}, {"bits": 28}], "config": {"lanes": 1, "fontsize": 10, "vspace": 180}}
```

|  Bits  |  Type  |  Reset  | Name             | Description   |
|:------:|:------:|:-------:|:-----------------|:--------------|
|  31:4  |        |         |                  | Reserved      |
|  3:0   |   rw   |   0x8   | T_RX_CLOCK_DELAY | RX Delay Line |

## T_TX_CLOCK_DELAY
TX Delay Line
- Offset: `0x14`
- Reset default: `0x8`
- Reset mask: `0xf`

### Fields

```wavejson
{"reg": [{"name": "T_TX_CLOCK_DELAY", "bits": 4, "attr": ["rw"], "rotate": -90}, {"bits": 28}], "config": {"lanes": 1, "fontsize": 10, "vspace": 180}}
```

|  Bits  |  Type  |  Reset  | Name             | Description   |
|:------:|:------:|:-------:|:-----------------|:--------------|
|  31:4  |        |         |                  | Reserved      |
|  3:0   |   rw   |   0x8   | T_TX_CLOCK_DELAY | TX Delay Line |

## ADDRESS_MASK_MSB
Address Mask MSB
- Offset: `0x18`
- Reset default: `0x19`
- Reset mask: `0x7ffff`

### Fields

```wavejson
{"reg": [{"name": "ADDRESS_MASK_MSB", "bits": 19, "attr": ["rw"], "rotate": 0}, {"bits": 13}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name             | Description      |
|:------:|:------:|:-------:|:-----------------|:-----------------|
| 31:19  |        |         |                  | Reserved         |
|  18:0  |   rw   |  0x19   | ADDRESS_MASK_MSB | Address Mask MSB |

## ADDRESS_SPACE
L2 sleep configuration register
- Offset: `0x1c`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "ADDRESS_SPACE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 150}}
```

|  Bits  |  Type  |  Reset  | Name          | Description                     |
|:------:|:------:|:-------:|:--------------|:--------------------------------|
|  31:1  |        |         |               | Reserved                        |
|   0    |   rw   |   0x0   | ADDRESS_SPACE | L2 sleep configuration register |

## PHYS_IN_USE
Number of PHYs on use
- Offset: `0x20`
- Reset default: `0x1`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "PHYS_IN_USE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 130}}
```

|  Bits  |  Type  |  Reset  | Name        | Description                                                   |
|:------:|:------:|:-------:|:------------|:--------------------------------------------------------------|
|  31:1  |        |         |             | Reserved                                                      |
|   0    |   rw   |   0x1   | PHYS_IN_USE | Number of PHYs on use: - 1'b0: Uses 1 PHY - 1'b1: Uses 2 PHYs |

## WHICH_PHY
PHY used in single PHY mode
- Offset: `0x24`
- Reset default: `0x1`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "WHICH_PHY", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 110}}
```

|  Bits  |  Type  |  Reset  | Name      | Description                                                              |
|:------:|:------:|:-------:|:----------|:-------------------------------------------------------------------------|
|  31:1  |        |         |           | Reserved                                                                 |
|   0    |   rw   |   0x1   | WHICH_PHY | PHY used in single PHY mode: - 1'b0: PHY 0 is used - 1'b1: PHY 1 is used |

## CS0_BASE
CS0 Base address range
- Offset: `0x28`
- Reset default: `0x80000000`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "CS0_BASE", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |   Reset    | Name     | Description            |
|:------:|:------:|:----------:|:---------|:-----------------------|
|  31:0  |   rw   | 0x80000000 | CS0_BASE | CS0 Base address range |

## CS0_END
CS0 End address range
- Offset: `0x2c`
- Reset default: `0x81000000`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "CS0_END", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |   Reset    | Name    | Description           |
|:------:|:------:|:----------:|:--------|:----------------------|
|  31:0  |   rw   | 0x81000000 | CS0_END | CS0 End address range |

## CS1_BASE
CS1 Base address range
- Offset: `0x30`
- Reset default: `0x81000000`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "CS1_BASE", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |   Reset    | Name     | Description            |
|:------:|:------:|:----------:|:---------|:-----------------------|
|  31:0  |   rw   | 0x81000000 | CS1_BASE | CS1 Base address range |

## CS1_END
CS1 End address range
- Offset: `0x34`
- Reset default: `0x82000000`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "CS1_END", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |   Reset    | Name    | Description           |
|:------:|:------:|:----------:|:--------|:----------------------|
|  31:0  |   rw   | 0x82000000 | CS1_END | CS1 End address range |

## CS2_BASE
CS2 Base address range
- Offset: `0x38`
- Reset default: `0x82000000`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "CS2_BASE", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |   Reset    | Name     | Description            |
|:------:|:------:|:----------:|:---------|:-----------------------|
|  31:0  |   rw   | 0x82000000 | CS2_BASE | CS2 Base address range |

## CS2_END
CS2 End address range
- Offset: `0x3c`
- Reset default: `0x83000000`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "CS2_END", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |   Reset    | Name    | Description           |
|:------:|:------:|:----------:|:--------|:----------------------|
|  31:0  |   rw   | 0x83000000 | CS2_END | CS2 End address range |

## CS3_BASE
CS3 Base address range
- Offset: `0x40`
- Reset default: `0x83000000`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "CS3_BASE", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |   Reset    | Name     | Description            |
|:------:|:------:|:----------:|:---------|:-----------------------|
|  31:0  |   rw   | 0x83000000 | CS3_BASE | CS3 Base address range |

## CS3_END
CS3 End address range
- Offset: `0x44`
- Reset default: `0x84000000`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "CS3_END", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |   Reset    | Name    | Description           |
|:------:|:------:|:----------:|:--------|:----------------------|
|  31:0  |   rw   | 0x84000000 | CS3_END | CS3 End address range |

