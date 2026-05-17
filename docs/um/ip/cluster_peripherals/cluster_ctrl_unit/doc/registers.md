## Summary

| Name                                                                       | Offset   |   Length | Description                                                           |
|:---------------------------------------------------------------------------|:---------|---------:|:----------------------------------------------------------------------|
| cluster_control_unit.[`EOC`](#eoc)                                         | 0x0      |        4 | End Of Computation status register.                                   |
| cluster_control_unit.[`FETCH_EN`](#fetch_en)                               | 0x4      |        4 | Cluster cores fetch enable configuration register.                    |
| cluster_control_unit.[`CLOCK_GATE`](#clock_gate)                           | 0x8      |        4 | Cluster clock gate configuration register.                            |
| cluster_control_unit.[`DBG_RESUME`](#dbg_resume)                           | 0xc      |        4 | Cluster cores debug resume register.                                  |
| cluster_control_unit.[`DBG_HALT_STATUS`](#dbg_halt_status)                 | 0x10     |        4 | Cluster cores debug halt status register.                             |
| cluster_control_unit.[`DBG_HALT_MASK`](#dbg_halt_mask)                     | 0x14     |        4 | Cluster cores debug halt mask configuration register.                 |
| cluster_control_unit.[`BOOT_ADDR0`](#boot_addr0)                           | 0x18     |        4 | Cluster core 0 boot address configuration register.                   |
| cluster_control_unit.[`TCDM_ARB_POLICY_CH0`](#tcdm_arb_policy_ch0)         | 0x1c     |        4 | TCDM arbitration policy ch0 for cluster cores configuration register. |
| cluster_control_unit.[`TCDM_ARB_POLICY_CH1`](#tcdm_arb_policy_ch1)         | 0x20     |        4 | TCDM arbitration policy ch1 for DMA/HWCE configuration register.      |
| cluster_control_unit.[`TCDM_ARB_POLICY_CH0_REP`](#tcdm_arb_policy_ch0_rep) | 0x24     |        4 | Read only duplicate of TCDM_ARB_POLICY_CH0 register                   |
| cluster_control_unit.[`TCDM_ARB_POLICY_CH1_REP`](#tcdm_arb_policy_ch1_rep) | 0x28     |        4 | Read only duplicate of TCDM_ARB_POLICY_CH1 register                   |

## EOC
End Of Computation status register.
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "eoc", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                       |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------------------------------------|
|  31:1  |        |         |        | Reserved                                                                                                          |
|   0    |   rw   |   0x0   | eoc    | End of computation status flag bitfield: - 1'b0: program execution under going - 1'b1: end of computation reached |

## FETCH_EN
Cluster cores fetch enable configuration register.
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "CORE0", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE1", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE2", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE3", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE4", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE5", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE6", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE7", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                  |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                     |
|   7    |   rw   |   0x0   | CORE7  | Core 7 fetch enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |
|   6    |   rw   |   0x0   | CORE6  | Core 6 fetch enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |
|   5    |   rw   |   0x0   | CORE5  | Core 5 fetch enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |
|   4    |   rw   |   0x0   | CORE4  | Core 4 fetch enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |
|   3    |   rw   |   0x0   | CORE3  | Core 3 fetch enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |
|   2    |   rw   |   0x0   | CORE2  | Core 2 fetch enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |
|   1    |   rw   |   0x0   | CORE1  | Core 1 fetch enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |
|   0    |   rw   |   0x0   | CORE0  | Core 0 fetch enable configuration bitfield: - 1'b0: disabled - 1'b1: enabled |

## CLOCK_GATE
Cluster clock gate configuration register.
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "EN", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                 |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------|
|  31:1  |        |         |        | Reserved                                                                    |
|   0    |   rw   |   0x0   | EN     | Cluster clock gate configuration bitfield: - 1'b0: disabled - 1'b1: enabled |

## DBG_RESUME
Cluster cores debug resume register.
- Offset: `0xc`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "CORE0", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "CORE1", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "CORE2", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "CORE3", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "CORE4", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "CORE5", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "CORE6", "bits": 1, "attr": ["wo"], "rotate": -90}, {"name": "CORE7", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                           |
|:------:|:------:|:-------:|:-------|:--------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                              |
|   7    |   wo   |   0x0   | CORE7  | Core 7 debug resume configuration bitfield: - 1'b0: stay halted - 1'b1: resume core 7 |
|   6    |   wo   |   0x0   | CORE6  | Core 6 debug resume configuration bitfield: - 1'b0: stay halted - 1'b1: resume core 6 |
|   5    |   wo   |   0x0   | CORE5  | Core 5 debug resume configuration bitfield: - 1'b0: stay halted - 1'b1: resume core 5 |
|   4    |   wo   |   0x0   | CORE4  | Core 4 debug resume configuration bitfield: - 1'b0: stay halted - 1'b1: resume core 4 |
|   3    |   wo   |   0x0   | CORE3  | Core 3 debug resume configuration bitfield: - 1'b0: stay halted - 1'b1: resume core 3 |
|   2    |   wo   |   0x0   | CORE2  | Core 2 debug resume configuration bitfield: - 1'b0: stay halted - 1'b1: resume core 2 |
|   1    |   wo   |   0x0   | CORE1  | Core 1 debug resume configuration bitfield: - 1'b0: stay halted - 1'b1: resume core 1 |
|   0    |   wo   |   0x0   | CORE0  | Core 0 debug resume configuration bitfield: - 1'b0: stay halted - 1'b1: resume core 0 |

## DBG_HALT_STATUS
Cluster cores debug halt status register.
- Offset: `0x10`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "CORE0", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "CORE1", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "CORE2", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "CORE3", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "CORE4", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "CORE5", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "CORE6", "bits": 1, "attr": ["ro"], "rotate": -90}, {"name": "CORE7", "bits": 1, "attr": ["ro"], "rotate": -90}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                            |
|:------:|:------:|:-------:|:-------|:-----------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                               |
|   7    |   ro   |   0x0   | CORE7  | Core 7 debug halt status flag bitfield: - 1'b0: running - 1'b1: halted |
|   6    |   ro   |   0x0   | CORE6  | Core 6 debug halt status flag bitfield: - 1'b0: running - 1'b1: halted |
|   5    |   ro   |   0x0   | CORE5  | Core 5 debug halt status flag bitfield: - 1'b0: running - 1'b1: halted |
|   4    |   ro   |   0x0   | CORE4  | Core 4 debug halt status flag bitfield: - 1'b0: running - 1'b1: halted |
|   3    |   ro   |   0x0   | CORE3  | Core 3 debug halt status flag bitfield: - 1'b0: running - 1'b1: halted |
|   2    |   ro   |   0x0   | CORE2  | Core 2 debug halt status flag bitfield: - 1'b0: running - 1'b1: halted |
|   1    |   ro   |   0x0   | CORE1  | Core 1 debug halt status flag bitfield: - 1'b0: running - 1'b1: halted |
|   0    |   ro   |   0x0   | CORE0  | Core 0 debug halt status flag bitfield: - 1'b0: running - 1'b1: halted |

## DBG_HALT_MASK
Cluster cores debug halt mask configuration register.
- Offset: `0x14`
- Reset default: `0x0`
- Reset mask: `0xff`

### Fields

```wavejson
{"reg": [{"name": "CORE0", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE1", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE2", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE3", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE4", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE5", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE6", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "CORE7", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 24}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                                               |
|:------:|:------:|:-------:|:-------|:------------------------------------------------------------------------------------------------------------------------------------------|
|  31:8  |        |         |        | Reserved                                                                                                                                  |
|   7    |   rw   |   0x0   | CORE7  | Core 7 debug halt mask bitfield. When bit is set, core will be part of mask group and stopped when one of the members of the group stops. |
|   6    |   rw   |   0x0   | CORE6  | Core 6 debug halt mask bitfield. When bit is set, core will be part of mask group and stopped when one of the members of the group stops. |
|   5    |   rw   |   0x0   | CORE5  | Core 5 debug halt mask bitfield. When bit is set, core will be part of mask group and stopped when one of the members of the group stops. |
|   4    |   rw   |   0x0   | CORE4  | Core 4 debug halt mask bitfield. When bit is set, core will be part of mask group and stopped when one of the members of the group stops. |
|   3    |   rw   |   0x0   | CORE3  | Core 3 debug halt mask bitfield. When bit is set, core will be part of mask group and stopped when one of the members of the group stops. |
|   2    |   rw   |   0x0   | CORE2  | Core 2 debug halt mask bitfield. When bit is set, core will be part of mask group and stopped when one of the members of the group stops. |
|   1    |   rw   |   0x0   | CORE1  | Core 1 debug halt mask bitfield. When bit is set, core will be part of mask group and stopped when one of the members of the group stops. |
|   0    |   rw   |   0x0   | CORE0  | Core 0 debug halt mask bitfield. When bit is set, core will be part of mask group and stopped when one of the members of the group stops. |

## BOOT_ADDR0
Cluster core 0 boot address configuration register.
- Offset: `0x18`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "BA", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                         |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------|
|  31:0  |   rw   |   0x0   | BA     | Cluster core 0 boot address configuration bitfield. |

## TCDM_ARB_POLICY_CH0
TCDM arbitration policy ch0 for cluster cores configuration register.
- Offset: `0x1c`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "POL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                    |
|:------:|:------:|:-------:|:-------|:---------------------------------------------------------------------------------------------------------------|
|  31:1  |        |         |        | Reserved                                                                                                       |
|   0    |   rw   |   0x0   | POL    | TCDM arbitration policy for cluster cores configuration bitfield: - 1'b0: fair round robin - 1'b1: fixed order |

## TCDM_ARB_POLICY_CH1
TCDM arbitration policy ch1 for DMA/HWCE configuration register.
- Offset: `0x20`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "POL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                               |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------------|
|  31:1  |        |         |        | Reserved                                                                                                  |
|   0    |   rw   |   0x0   | POL    | TCDM arbitration policy for DMA/HWCE configuration bitfield: - 1'b0: fair round robin - 1'b1: fixed order |

## TCDM_ARB_POLICY_CH0_REP
Read only duplicate of TCDM_ARB_POLICY_CH0 register
- Offset: `0x24`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "POL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                                    |
|:------:|:------:|:-------:|:-------|:---------------------------------------------------------------------------------------------------------------|
|  31:1  |        |         |        | Reserved                                                                                                       |
|   0    |   rw   |   0x0   | POL    | TCDM arbitration policy for cluster cores configuration bitfield: - 1'b0: fair round robin - 1'b1: fixed order |

## TCDM_ARB_POLICY_CH1_REP
Read only duplicate of TCDM_ARB_POLICY_CH1 register
- Offset: `0x28`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "POL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                                                               |
|:------:|:------:|:-------:|:-------|:----------------------------------------------------------------------------------------------------------|
|  31:1  |        |         |        | Reserved                                                                                                  |
|   0    |   rw   |   0x0   | POL    | TCDM arbitration policy for DMA/HWCE configuration bitfield: - 1'b0: fair round robin - 1'b1: fixed order |

