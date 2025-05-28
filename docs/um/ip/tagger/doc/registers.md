## Summary

| Name                                   | Offset   |   Length | Description                             |
|:---------------------------------------|:---------|---------:|:----------------------------------------|
| tagger_reg.[`PAT_COMMIT`](#PAT_COMMIT) | 0x0      |        4 | Partition configuration commit register |
| tagger_reg.[`PAT_ADDR_0`](#pat_addr)   | 0x4      |        4 | Partition address                       |
| tagger_reg.[`PAT_ADDR_1`](#pat_addr)   | 0x8      |        4 | Partition address                       |
| tagger_reg.[`PAT_ADDR_2`](#pat_addr)   | 0xc      |        4 | Partition address                       |
| tagger_reg.[`PAT_ADDR_3`](#pat_addr)   | 0x10     |        4 | Partition address                       |
| tagger_reg.[`PAT_ADDR_4`](#pat_addr)   | 0x14     |        4 | Partition address                       |
| tagger_reg.[`PAT_ADDR_5`](#pat_addr)   | 0x18     |        4 | Partition address                       |
| tagger_reg.[`PAT_ADDR_6`](#pat_addr)   | 0x1c     |        4 | Partition address                       |
| tagger_reg.[`PAT_ADDR_7`](#pat_addr)   | 0x20     |        4 | Partition address                       |
| tagger_reg.[`PAT_ADDR_8`](#pat_addr)   | 0x24     |        4 | Partition address                       |
| tagger_reg.[`PAT_ADDR_9`](#pat_addr)   | 0x28     |        4 | Partition address                       |
| tagger_reg.[`PAT_ADDR_10`](#pat_addr)  | 0x2c     |        4 | Partition address                       |
| tagger_reg.[`PAT_ADDR_11`](#pat_addr)  | 0x30     |        4 | Partition address                       |
| tagger_reg.[`PAT_ADDR_12`](#pat_addr)  | 0x34     |        4 | Partition address                       |
| tagger_reg.[`PAT_ADDR_13`](#pat_addr)  | 0x38     |        4 | Partition address                       |
| tagger_reg.[`PAT_ADDR_14`](#pat_addr)  | 0x3c     |        4 | Partition address                       |
| tagger_reg.[`PAT_ADDR_15`](#pat_addr)  | 0x40     |        4 | Partition address                       |
| tagger_reg.[`PATID_0`](#patid)         | 0x44     |        4 | Partition ID                            |
| tagger_reg.[`PATID_1`](#patid)         | 0x48     |        4 | Partition ID                            |
| tagger_reg.[`PATID_2`](#patid)         | 0x4c     |        4 | Partition ID                            |
| tagger_reg.[`ADDR_CONF`](#addr_conf)   | 0x50     |        4 | Address encoding mode switch register   |

## PAT_COMMIT
Partition configuration commit register
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "commit_0", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 100}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                               |
|:------:|:------:|:-------:|:---------|:------------------------------------------|
|  31:1  |        |         |          | Reserved                                  |
|   0    |   rw   |   0x0   | commit_0 | commit changes of partition configuration |

## PAT_ADDR
Partition address
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name        | Offset   |
|:------------|:---------|
| PAT_ADDR_0  | 0x4      |
| PAT_ADDR_1  | 0x8      |
| PAT_ADDR_2  | 0xc      |
| PAT_ADDR_3  | 0x10     |
| PAT_ADDR_4  | 0x14     |
| PAT_ADDR_5  | 0x18     |
| PAT_ADDR_6  | 0x1c     |
| PAT_ADDR_7  | 0x20     |
| PAT_ADDR_8  | 0x24     |
| PAT_ADDR_9  | 0x28     |
| PAT_ADDR_10 | 0x2c     |
| PAT_ADDR_11 | 0x30     |
| PAT_ADDR_12 | 0x34     |
| PAT_ADDR_13 | 0x38     |
| PAT_ADDR_14 | 0x3c     |
| PAT_ADDR_15 | 0x40     |


### Fields

```wavejson
{"reg": [{"name": "PAT_ADDR", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                              |
|:------:|:------:|:-------:|:---------|:-----------------------------------------|
|  31:0  |   rw   |   0x0   | PAT_ADDR | Single partition configurations: address |

## PATID
Partition ID
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name    | Offset   |
|:--------|:---------|
| PATID_0 | 0x44     |
| PATID_1 | 0x48     |
| PATID_2 | 0x4c     |


### Fields

```wavejson
{"reg": [{"name": "PATID", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                                                          |
|:------:|:------:|:-------:|:-------|:---------------------------------------------------------------------|
|  31:0  |   rw   |   0x0   | PATID  | Partition ID (PatID) for each partition, length determined by params |

## ADDR_CONF
Address encoding mode switch register
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Instances

| Name      | Offset   |
|:----------|:---------|
| ADDR_CONF | 0x50     |


### Fields

```wavejson
{"reg": [{"name": "addr_conf", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name      | Description                                                                 |
|:------:|:------:|:-------:|:----------|:----------------------------------------------------------------------------|
|  31:0  |   rw   |   0x0   | addr_conf | 2 bits configuration for each partition. 2'b00: OFF, 2'b01: TOR, 2'b10: NA4 |

