## Summary

| Name                                                                         | Offset   |   Length | Description                                                            |
|:-----------------------------------------------------------------------------|:---------|---------:|:-----------------------------------------------------------------------|
| carfield.[`VERSION0`](#version0)                                             | 0x0      |        4 | Cheshire sha256 commit                                                 |
| carfield.[`VERSION1`](#version1)                                             | 0x4      |        4 | Safety Island sha256 commit                                            |
| carfield.[`VERSION2`](#version2)                                             | 0x8      |        4 | Security Island sha256 commit                                          |
| carfield.[`VERSION3`](#version3)                                             | 0xc      |        4 | PULP Cluster sha256 commit                                             |
| carfield.[`VERSION4`](#version4)                                             | 0x10     |        4 | Spatz CLuster sha256 commit                                            |
| carfield.[`JEDEC_IDCODE`](#jedec_idcode)                                     | 0x14     |        4 | JEDEC ID CODE -TODO assign-                                            |
| carfield.[`GENERIC_SCRATCH0`](#generic_scratch0)                             | 0x18     |        4 | Scratch                                                                |
| carfield.[`GENERIC_SCRATCH1`](#generic_scratch1)                             | 0x1c     |        4 | Scratch                                                                |
| carfield.[`HOST_RST`](#host_rst)                                             | 0x20     |        4 | Host Domain reset -active high, inverted in HW-                        |
| carfield.[`PERIPH_RST`](#periph_rst)                                         | 0x24     |        4 | Periph Domain reset -active high, inverted in HW-                      |
| carfield.[`SAFETY_ISLAND_RST`](#safety_island_rst)                           | 0x28     |        4 | Safety Island reset -active high, inverted in HW-                      |
| carfield.[`SECURITY_ISLAND_RST`](#security_island_rst)                       | 0x2c     |        4 | Security Island reset -active high, inverted in HW-                    |
| carfield.[`PULP_CLUSTER_RST`](#pulp_cluster_rst)                             | 0x30     |        4 | PULP Cluster reset -active high, inverted in HW-                       |
| carfield.[`SPATZ_CLUSTER_RST`](#spatz_cluster_rst)                           | 0x34     |        4 | Spatz Cluster reset -active high, inverted in HW-                      |
| carfield.[`L2_RST`](#l2_rst)                                                 | 0x38     |        4 | L2 reset -active high, inverted in HW-                                 |
| carfield.[`PERIPH_ISOLATE`](#periph_isolate)                                 | 0x3c     |        4 | Periph Domain  AXI isolate                                             |
| carfield.[`SAFETY_ISLAND_ISOLATE`](#safety_island_isolate)                   | 0x40     |        4 | Safety Island AXI isolate                                              |
| carfield.[`SECURITY_ISLAND_ISOLATE`](#security_island_isolate)               | 0x44     |        4 | Security Island AXI isolate                                            |
| carfield.[`PULP_CLUSTER_ISOLATE`](#pulp_cluster_isolate)                     | 0x48     |        4 | PULP Cluster AXI isolate                                               |
| carfield.[`SPATZ_CLUSTER_ISOLATE`](#spatz_cluster_isolate)                   | 0x4c     |        4 | Spatz Cluster AXI isolate                                              |
| carfield.[`L2_ISOLATE`](#l2_isolate)                                         | 0x50     |        4 | L2 AXI isolate                                                         |
| carfield.[`PERIPH_ISOLATE_STATUS`](#periph_isolate_status)                   | 0x54     |        4 | Periph Domain AXI isolate status                                       |
| carfield.[`SAFETY_ISLAND_ISOLATE_STATUS`](#safety_island_isolate_status)     | 0x58     |        4 | Safety Island AXI isolate status                                       |
| carfield.[`SECURITY_ISLAND_ISOLATE_STATUS`](#security_island_isolate_status) | 0x5c     |        4 | Security Island AXI isolate status                                     |
| carfield.[`PULP_CLUSTER_ISOLATE_STATUS`](#pulp_cluster_isolate_status)       | 0x60     |        4 | PULP Cluster AXI isolate status                                        |
| carfield.[`SPATZ_CLUSTER_ISOLATE_STATUS`](#spatz_cluster_isolate_status)     | 0x64     |        4 | Spatz Cluster AXI isolate status                                       |
| carfield.[`L2_ISOLATE_STATUS`](#l2_isolate_status)                           | 0x68     |        4 | L2 AXI isolate status                                                  |
| carfield.[`PERIPH_CLK_EN`](#periph_clk_en)                                   | 0x6c     |        4 | Periph Domain clk gate enable                                          |
| carfield.[`SAFETY_ISLAND_CLK_EN`](#safety_island_clk_en)                     | 0x70     |        4 | Safety Island clk gate enable                                          |
| carfield.[`SECURITY_ISLAND_CLK_EN`](#security_island_clk_en)                 | 0x74     |        4 | Security Island clk gate enable                                        |
| carfield.[`PULP_CLUSTER_CLK_EN`](#pulp_cluster_clk_en)                       | 0x78     |        4 | PULP Cluster clk gate enable                                           |
| carfield.[`SPATZ_CLUSTER_CLK_EN`](#spatz_cluster_clk_en)                     | 0x7c     |        4 | Spatz Cluster clk gate enable                                          |
| carfield.[`L2_CLK_EN`](#l2_clk_en)                                           | 0x80     |        4 | Shared L2 memory clk gate enable                                       |
| carfield.[`PERIPH_CLK_SEL`](#periph_clk_sel)                                 | 0x84     |        4 | Periph Domain pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll)   |
| carfield.[`SAFETY_ISLAND_CLK_SEL`](#safety_island_clk_sel)                   | 0x88     |        4 | Safety Island pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll)   |
| carfield.[`SECURITY_ISLAND_CLK_SEL`](#security_island_clk_sel)               | 0x8c     |        4 | Security Island pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll) |
| carfield.[`PULP_CLUSTER_CLK_SEL`](#pulp_cluster_clk_sel)                     | 0x90     |        4 | PULP Cluster pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll)    |
| carfield.[`SPATZ_CLUSTER_CLK_SEL`](#spatz_cluster_clk_sel)                   | 0x94     |        4 | Spatz Cluster pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll)   |
| carfield.[`L2_CLK_SEL`](#l2_clk_sel)                                         | 0x98     |        4 | L2 Memory pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll)       |
| carfield.[`PERIPH_CLK_DIV_VALUE`](#periph_clk_div_value)                     | 0x9c     |        4 | Periph Domain clk divider value                                        |
| carfield.[`SAFETY_ISLAND_CLK_DIV_VALUE`](#safety_island_clk_div_value)       | 0xa0     |        4 | Safety Island clk divider value                                        |
| carfield.[`SECURITY_ISLAND_CLK_DIV_VALUE`](#security_island_clk_div_value)   | 0xa4     |        4 | Security Island clk divider value                                      |
| carfield.[`PULP_CLUSTER_CLK_DIV_VALUE`](#pulp_cluster_clk_div_value)         | 0xa8     |        4 | PULP Cluster clk divider value                                         |
| carfield.[`SPATZ_CLUSTER_CLK_DIV_VALUE`](#spatz_cluster_clk_div_value)       | 0xac     |        4 | Spatz Cluster clk divider value                                        |
| carfield.[`L2_CLK_DIV_VALUE`](#l2_clk_div_value)                             | 0xb0     |        4 | L2 Memory clk divider value                                            |
| carfield.[`HOST_FETCH_ENABLE`](#host_fetch_enable)                           | 0xb4     |        4 | Host Domain fetch enable                                               |
| carfield.[`SAFETY_ISLAND_FETCH_ENABLE`](#safety_island_fetch_enable)         | 0xb8     |        4 | Safety Island fetch enable                                             |
| carfield.[`SECURITY_ISLAND_FETCH_ENABLE`](#security_island_fetch_enable)     | 0xbc     |        4 | Security Island fetch enable                                           |
| carfield.[`PULP_CLUSTER_FETCH_ENABLE`](#pulp_cluster_fetch_enable)           | 0xc0     |        4 | PULP Cluster fetch enable                                              |
| carfield.[`SPATZ_CLUSTER_DEBUG_REQ`](#spatz_cluster_debug_req)               | 0xc4     |        4 | Spatz Cluster debug req                                                |
| carfield.[`HOST_BOOT_ADDR`](#host_boot_addr)                                 | 0xc8     |        4 | Host boot address                                                      |
| carfield.[`SAFETY_ISLAND_BOOT_ADDR`](#safety_island_boot_addr)               | 0xcc     |        4 | Safety Island boot address                                             |
| carfield.[`SECURITY_ISLAND_BOOT_ADDR`](#security_island_boot_addr)           | 0xd0     |        4 | Security Island boot address                                           |
| carfield.[`PULP_CLUSTER_BOOT_ADDR`](#pulp_cluster_boot_addr)                 | 0xd4     |        4 | PULP Cluster boot address                                              |
| carfield.[`SPATZ_CLUSTER_BOOT_ADDR`](#spatz_cluster_boot_addr)               | 0xd8     |        4 | Spatz Cluster boot address                                             |
| carfield.[`PULP_CLUSTER_BOOT_ENABLE`](#pulp_cluster_boot_enable)             | 0xdc     |        4 | PULP Cluster boot enable                                               |
| carfield.[`SPATZ_CLUSTER_BUSY`](#spatz_cluster_busy)                         | 0xe0     |        4 | Spatz Cluster busy                                                     |
| carfield.[`PULP_CLUSTER_BUSY`](#pulp_cluster_busy)                           | 0xe4     |        4 | PULP Cluster busy                                                      |
| carfield.[`PULP_CLUSTER_EOC`](#pulp_cluster_eoc)                             | 0xe8     |        4 | PULP Cluster end of computation                                        |
| carfield.[`ETH_RGMII_PHY_CLK_DIV_EN`](#eth_rgmii_phy_clk_div_en)             | 0xec     |        4 | Ethernet RGMII PHY clock divider enable bit                            |
| carfield.[`ETH_RGMII_PHY_CLK_DIV_VALUE`](#eth_rgmii_phy_clk_div_value)       | 0xf0     |        4 | Ethernet RGMII PHY clock divider value                                 |
| carfield.[`ETH_MDIO_CLK_DIV_EN`](#eth_mdio_clk_div_en)                       | 0xf4     |        4 | Ethernet MDIO clock divider enable bit                                 |
| carfield.[`ETH_MDIO_CLK_DIV_VALUE`](#eth_mdio_clk_div_value)                 | 0xf8     |        4 | Ethernet MDIO clock divider value                                      |

## VERSION0
Cheshire sha256 commit
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "VERSION0", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description   |
|:------:|:------:|:-------:|:---------|:--------------|
|  31:0  |   ro   |   0x0   | VERSION0 |               |

## VERSION1
Safety Island sha256 commit
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "VERSION1", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description   |
|:------:|:------:|:-------:|:---------|:--------------|
|  31:0  |   ro   |   0x0   | VERSION1 |               |

## VERSION2
Security Island sha256 commit
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "VERSION2", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description   |
|:------:|:------:|:-------:|:---------|:--------------|
|  31:0  |   ro   |   0x0   | VERSION2 |               |

## VERSION3
PULP Cluster sha256 commit
- Offset: `0xc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "VERSION3", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description   |
|:------:|:------:|:-------:|:---------|:--------------|
|  31:0  |   ro   |   0x0   | VERSION3 |               |

## VERSION4
Spatz CLuster sha256 commit
- Offset: `0x10`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "VERSION4", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description   |
|:------:|:------:|:-------:|:---------|:--------------|
|  31:0  |   ro   |   0x0   | VERSION4 |               |

## JEDEC_IDCODE
JEDEC ID CODE -TODO assign-
- Offset: `0x14`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "JEDEC_IDCODE", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name         | Description   |
|:------:|:------:|:-------:|:-------------|:--------------|
|  31:0  |   rw   |   0x0   | JEDEC_IDCODE |               |

## GENERIC_SCRATCH0
Scratch
- Offset: `0x18`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "GENERIC_SCRATCH0", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name             | Description   |
|:------:|:------:|:-------:|:-----------------|:--------------|
|  31:0  |   rw   |   0x0   | GENERIC_SCRATCH0 |               |

## GENERIC_SCRATCH1
Scratch
- Offset: `0x1c`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "GENERIC_SCRATCH1", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name             | Description   |
|:------:|:------:|:-------:|:-----------------|:--------------|
|  31:0  |   rw   |   0x0   | GENERIC_SCRATCH1 |               |

## HOST_RST
Host Domain reset -active high, inverted in HW-
- Offset: `0x20`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "HOST_RST", "bits": 1, "attr": ["ro"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 100}}
```

|  Bits  |  Type  |  Reset  | Name     | Description   |
|:------:|:------:|:-------:|:---------|:--------------|
|  31:1  |        |         |          | Reserved      |
|   0    |   ro   |   0x0   | HOST_RST |               |

## PERIPH_RST
Periph Domain reset -active high, inverted in HW-
- Offset: `0x24`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "PERIPH_RST", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 120}}
```

|  Bits  |  Type  |  Reset  | Name       | Description   |
|:------:|:------:|:-------:|:-----------|:--------------|
|  31:1  |        |         |            | Reserved      |
|   0    |   rw   |   0x0   | PERIPH_RST |               |

## SAFETY_ISLAND_RST
Safety Island reset -active high, inverted in HW-
- Offset: `0x28`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "SAFETY_ISLAND_RST", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 190}}
```

|  Bits  |  Type  |  Reset  | Name              | Description   |
|:------:|:------:|:-------:|:------------------|:--------------|
|  31:1  |        |         |                   | Reserved      |
|   0    |   rw   |   0x0   | SAFETY_ISLAND_RST |               |

## SECURITY_ISLAND_RST
Security Island reset -active high, inverted in HW-
- Offset: `0x2c`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "SECURITY_ISLAND_RST", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 210}}
```

|  Bits  |  Type  |  Reset  | Name                | Description   |
|:------:|:------:|:-------:|:--------------------|:--------------|
|  31:1  |        |         |                     | Reserved      |
|   0    |   rw   |   0x0   | SECURITY_ISLAND_RST |               |

## PULP_CLUSTER_RST
PULP Cluster reset -active high, inverted in HW-
- Offset: `0x30`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "PULP_CLUSTER_RST", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 180}}
```

|  Bits  |  Type  |  Reset  | Name             | Description   |
|:------:|:------:|:-------:|:-----------------|:--------------|
|  31:1  |        |         |                  | Reserved      |
|   0    |   rw   |   0x0   | PULP_CLUSTER_RST |               |

## SPATZ_CLUSTER_RST
Spatz Cluster reset -active high, inverted in HW-
- Offset: `0x34`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "SPATZ_CLUSTER_RST", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 190}}
```

|  Bits  |  Type  |  Reset  | Name              | Description   |
|:------:|:------:|:-------:|:------------------|:--------------|
|  31:1  |        |         |                   | Reserved      |
|   0    |   rw   |   0x0   | SPATZ_CLUSTER_RST |               |

## L2_RST
L2 reset -active high, inverted in HW-
- Offset: `0x38`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "L2_RST", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description   |
|:------:|:------:|:-------:|:-------|:--------------|
|  31:1  |        |         |        | Reserved      |
|   0    |   rw   |   0x0   | L2_RST |               |

## PERIPH_ISOLATE
Periph Domain  AXI isolate
- Offset: `0x3c`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "PERIPH_ISOLATE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 160}}
```

|  Bits  |  Type  |  Reset  | Name           | Description   |
|:------:|:------:|:-------:|:---------------|:--------------|
|  31:1  |        |         |                | Reserved      |
|   0    |   rw   |   0x0   | PERIPH_ISOLATE |               |

## SAFETY_ISLAND_ISOLATE
Safety Island AXI isolate
- Offset: `0x40`
- Reset default: `0x1`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "SAFETY_ISLAND_ISOLATE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 230}}
```

|  Bits  |  Type  |  Reset  | Name                  | Description   |
|:------:|:------:|:-------:|:----------------------|:--------------|
|  31:1  |        |         |                       | Reserved      |
|   0    |   rw   |   0x1   | SAFETY_ISLAND_ISOLATE |               |

## SECURITY_ISLAND_ISOLATE
Security Island AXI isolate
- Offset: `0x44`
- Reset default: `0x1`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "SECURITY_ISLAND_ISOLATE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 250}}
```

|  Bits  |  Type  |  Reset  | Name                    | Description   |
|:------:|:------:|:-------:|:------------------------|:--------------|
|  31:1  |        |         |                         | Reserved      |
|   0    |   rw   |   0x1   | SECURITY_ISLAND_ISOLATE |               |

## PULP_CLUSTER_ISOLATE
PULP Cluster AXI isolate
- Offset: `0x48`
- Reset default: `0x1`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "PULP_CLUSTER_ISOLATE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 220}}
```

|  Bits  |  Type  |  Reset  | Name                 | Description   |
|:------:|:------:|:-------:|:---------------------|:--------------|
|  31:1  |        |         |                      | Reserved      |
|   0    |   rw   |   0x1   | PULP_CLUSTER_ISOLATE |               |

## SPATZ_CLUSTER_ISOLATE
Spatz Cluster AXI isolate
- Offset: `0x4c`
- Reset default: `0x1`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "SPATZ_CLUSTER_ISOLATE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 230}}
```

|  Bits  |  Type  |  Reset  | Name                  | Description   |
|:------:|:------:|:-------:|:----------------------|:--------------|
|  31:1  |        |         |                       | Reserved      |
|   0    |   rw   |   0x1   | SPATZ_CLUSTER_ISOLATE |               |

## L2_ISOLATE
L2 AXI isolate
- Offset: `0x50`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "L2_ISOLATE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 120}}
```

|  Bits  |  Type  |  Reset  | Name       | Description   |
|:------:|:------:|:-------:|:-----------|:--------------|
|  31:1  |        |         |            | Reserved      |
|   0    |   rw   |   0x0   | L2_ISOLATE |               |

## PERIPH_ISOLATE_STATUS
Periph Domain AXI isolate status
- Offset: `0x54`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "PERIPH_ISOLATE_STATUS", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 230}}
```

|  Bits  |  Type  |  Reset  | Name                  | Description   |
|:------:|:------:|:-------:|:----------------------|:--------------|
|  31:1  |        |         |                       | Reserved      |
|   0    |   rw   |   0x0   | PERIPH_ISOLATE_STATUS |               |

## SAFETY_ISLAND_ISOLATE_STATUS
Safety Island AXI isolate status
- Offset: `0x58`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "SAFETY_ISLAND_ISOLATE_STATUS", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 300}}
```

|  Bits  |  Type  |  Reset  | Name                         | Description   |
|:------:|:------:|:-------:|:-----------------------------|:--------------|
|  31:1  |        |         |                              | Reserved      |
|   0    |   rw   |   0x0   | SAFETY_ISLAND_ISOLATE_STATUS |               |

## SECURITY_ISLAND_ISOLATE_STATUS
Security Island AXI isolate status
- Offset: `0x5c`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "SECURITY_ISLAND_ISOLATE_STATUS", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 320}}
```

|  Bits  |  Type  |  Reset  | Name                           | Description   |
|:------:|:------:|:-------:|:-------------------------------|:--------------|
|  31:1  |        |         |                                | Reserved      |
|   0    |   rw   |   0x0   | SECURITY_ISLAND_ISOLATE_STATUS |               |

## PULP_CLUSTER_ISOLATE_STATUS
PULP Cluster AXI isolate status
- Offset: `0x60`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "PULP_CLUSTER_ISOLATE_STATUS", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 290}}
```

|  Bits  |  Type  |  Reset  | Name                        | Description   |
|:------:|:------:|:-------:|:----------------------------|:--------------|
|  31:1  |        |         |                             | Reserved      |
|   0    |   rw   |   0x0   | PULP_CLUSTER_ISOLATE_STATUS |               |

## SPATZ_CLUSTER_ISOLATE_STATUS
Spatz Cluster AXI isolate status
- Offset: `0x64`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "SPATZ_CLUSTER_ISOLATE_STATUS", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 300}}
```

|  Bits  |  Type  |  Reset  | Name                         | Description   |
|:------:|:------:|:-------:|:-----------------------------|:--------------|
|  31:1  |        |         |                              | Reserved      |
|   0    |   rw   |   0x0   | SPATZ_CLUSTER_ISOLATE_STATUS |               |

## L2_ISOLATE_STATUS
L2 AXI isolate status
- Offset: `0x68`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "L2_ISOLATE_STATUS", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 190}}
```

|  Bits  |  Type  |  Reset  | Name              | Description   |
|:------:|:------:|:-------:|:------------------|:--------------|
|  31:1  |        |         |                   | Reserved      |
|   0    |   rw   |   0x0   | L2_ISOLATE_STATUS |               |

## PERIPH_CLK_EN
Periph Domain clk gate enable
- Offset: `0x6c`
- Reset default: `0x1`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "PERIPH_CLK_EN", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 150}}
```

|  Bits  |  Type  |  Reset  | Name          | Description   |
|:------:|:------:|:-------:|:--------------|:--------------|
|  31:1  |        |         |               | Reserved      |
|   0    |   rw   |   0x1   | PERIPH_CLK_EN |               |

## SAFETY_ISLAND_CLK_EN
Safety Island clk gate enable
- Offset: `0x70`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "SAFETY_ISLAND_CLK_EN", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 220}}
```

|  Bits  |  Type  |  Reset  | Name                 | Description   |
|:------:|:------:|:-------:|:---------------------|:--------------|
|  31:1  |        |         |                      | Reserved      |
|   0    |   rw   |   0x0   | SAFETY_ISLAND_CLK_EN |               |

## SECURITY_ISLAND_CLK_EN
Security Island clk gate enable
- Offset: `0x74`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "SECURITY_ISLAND_CLK_EN", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 240}}
```

|  Bits  |  Type  |  Reset  | Name                   | Description   |
|:------:|:------:|:-------:|:-----------------------|:--------------|
|  31:1  |        |         |                        | Reserved      |
|   0    |   rw   |   0x0   | SECURITY_ISLAND_CLK_EN |               |

## PULP_CLUSTER_CLK_EN
PULP Cluster clk gate enable
- Offset: `0x78`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "PULP_CLUSTER_CLK_EN", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 210}}
```

|  Bits  |  Type  |  Reset  | Name                | Description   |
|:------:|:------:|:-------:|:--------------------|:--------------|
|  31:1  |        |         |                     | Reserved      |
|   0    |   rw   |   0x0   | PULP_CLUSTER_CLK_EN |               |

## SPATZ_CLUSTER_CLK_EN
Spatz Cluster clk gate enable
- Offset: `0x7c`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "SPATZ_CLUSTER_CLK_EN", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 220}}
```

|  Bits  |  Type  |  Reset  | Name                 | Description   |
|:------:|:------:|:-------:|:---------------------|:--------------|
|  31:1  |        |         |                      | Reserved      |
|   0    |   rw   |   0x0   | SPATZ_CLUSTER_CLK_EN |               |

## L2_CLK_EN
Shared L2 memory clk gate enable
- Offset: `0x80`
- Reset default: `0x1`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "L2_CLK_EN", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 110}}
```

|  Bits  |  Type  |  Reset  | Name      | Description   |
|:------:|:------:|:-------:|:----------|:--------------|
|  31:1  |        |         |           | Reserved      |
|   0    |   rw   |   0x1   | L2_CLK_EN |               |

## PERIPH_CLK_SEL
Periph Domain pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll)
- Offset: `0x84`
- Reset default: `0x2`
- Reset mask: `0x3`

### Fields

```wavejson
{"reg": [{"name": "PERIPH_CLK_SEL", "bits": 2, "attr": ["rw"], "rotate": -90}, {"bits": 30}], "config": {"lanes": 1, "fontsize": 10, "vspace": 160}}
```

|  Bits  |  Type  |  Reset  | Name           | Description   |
|:------:|:------:|:-------:|:---------------|:--------------|
|  31:2  |        |         |                | Reserved      |
|  1:0   |   rw   |   0x2   | PERIPH_CLK_SEL |               |

## SAFETY_ISLAND_CLK_SEL
Safety Island pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll)
- Offset: `0x88`
- Reset default: `0x1`
- Reset mask: `0x3`

### Fields

```wavejson
{"reg": [{"name": "SAFETY_ISLAND_CLK_SEL", "bits": 2, "attr": ["rw"], "rotate": -90}, {"bits": 30}], "config": {"lanes": 1, "fontsize": 10, "vspace": 230}}
```

|  Bits  |  Type  |  Reset  | Name                  | Description   |
|:------:|:------:|:-------:|:----------------------|:--------------|
|  31:2  |        |         |                       | Reserved      |
|  1:0   |   rw   |   0x1   | SAFETY_ISLAND_CLK_SEL |               |

## SECURITY_ISLAND_CLK_SEL
Security Island pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll)
- Offset: `0x8c`
- Reset default: `0x1`
- Reset mask: `0x3`

### Fields

```wavejson
{"reg": [{"name": "SECURITY_ISLAND_CLK_SEL", "bits": 2, "attr": ["rw"], "rotate": -90}, {"bits": 30}], "config": {"lanes": 1, "fontsize": 10, "vspace": 250}}
```

|  Bits  |  Type  |  Reset  | Name                    | Description   |
|:------:|:------:|:-------:|:------------------------|:--------------|
|  31:2  |        |         |                         | Reserved      |
|  1:0   |   rw   |   0x1   | SECURITY_ISLAND_CLK_SEL |               |

## PULP_CLUSTER_CLK_SEL
PULP Cluster pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll)
- Offset: `0x90`
- Reset default: `0x1`
- Reset mask: `0x3`

### Fields

```wavejson
{"reg": [{"name": "PULP_CLUSTER_CLK_SEL", "bits": 2, "attr": ["rw"], "rotate": -90}, {"bits": 30}], "config": {"lanes": 1, "fontsize": 10, "vspace": 220}}
```

|  Bits  |  Type  |  Reset  | Name                 | Description   |
|:------:|:------:|:-------:|:---------------------|:--------------|
|  31:2  |        |         |                      | Reserved      |
|  1:0   |   rw   |   0x1   | PULP_CLUSTER_CLK_SEL |               |

## SPATZ_CLUSTER_CLK_SEL
Spatz Cluster pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll)
- Offset: `0x94`
- Reset default: `0x1`
- Reset mask: `0x3`

### Fields

```wavejson
{"reg": [{"name": "SPATZ_CLUSTER_CLK_SEL", "bits": 2, "attr": ["rw"], "rotate": -90}, {"bits": 30}], "config": {"lanes": 1, "fontsize": 10, "vspace": 230}}
```

|  Bits  |  Type  |  Reset  | Name                  | Description   |
|:------:|:------:|:-------:|:----------------------|:--------------|
|  31:2  |        |         |                       | Reserved      |
|  1:0   |   rw   |   0x1   | SPATZ_CLUSTER_CLK_SEL |               |

## L2_CLK_SEL
L2 Memory pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll)
- Offset: `0x98`
- Reset default: `0x1`
- Reset mask: `0x3`

### Fields

```wavejson
{"reg": [{"name": "L2_CLK_SEL", "bits": 2, "attr": ["rw"], "rotate": -90}, {"bits": 30}], "config": {"lanes": 1, "fontsize": 10, "vspace": 120}}
```

|  Bits  |  Type  |  Reset  | Name       | Description   |
|:------:|:------:|:-------:|:-----------|:--------------|
|  31:2  |        |         |            | Reserved      |
|  1:0   |   rw   |   0x1   | L2_CLK_SEL |               |

## PERIPH_CLK_DIV_VALUE
Periph Domain clk divider value
- Offset: `0x9c`
- Reset default: `0x1`
- Reset mask: `0xffffff`

### Fields

```wavejson
{"reg": [{"name": "PERIPH_CLK_DIV_VALUE", "bits": 24, "attr": ["rw"], "rotate": 0}, {"bits": 8}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                 | Description   |
|:------:|:------:|:-------:|:---------------------|:--------------|
| 31:24  |        |         |                      | Reserved      |
|  23:0  |   rw   |   0x1   | PERIPH_CLK_DIV_VALUE |               |

## SAFETY_ISLAND_CLK_DIV_VALUE
Safety Island clk divider value
- Offset: `0xa0`
- Reset default: `0x1`
- Reset mask: `0xffffff`

### Fields

```wavejson
{"reg": [{"name": "SAFETY_ISLAND_CLK_DIV_VALUE", "bits": 24, "attr": ["rw"], "rotate": 0}, {"bits": 8}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                        | Description   |
|:------:|:------:|:-------:|:----------------------------|:--------------|
| 31:24  |        |         |                             | Reserved      |
|  23:0  |   rw   |   0x1   | SAFETY_ISLAND_CLK_DIV_VALUE |               |

## SECURITY_ISLAND_CLK_DIV_VALUE
Security Island clk divider value
- Offset: `0xa4`
- Reset default: `0x1`
- Reset mask: `0xffffff`

### Fields

```wavejson
{"reg": [{"name": "SECURITY_ISLAND_CLK_DIV_VALUE", "bits": 24, "attr": ["rw"], "rotate": 0}, {"bits": 8}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                          | Description   |
|:------:|:------:|:-------:|:------------------------------|:--------------|
| 31:24  |        |         |                               | Reserved      |
|  23:0  |   rw   |   0x1   | SECURITY_ISLAND_CLK_DIV_VALUE |               |

## PULP_CLUSTER_CLK_DIV_VALUE
PULP Cluster clk divider value
- Offset: `0xa8`
- Reset default: `0x1`
- Reset mask: `0xffffff`

### Fields

```wavejson
{"reg": [{"name": "PULP_CLUSTER_CLK_DIV_VALUE", "bits": 24, "attr": ["rw"], "rotate": 0}, {"bits": 8}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                       | Description   |
|:------:|:------:|:-------:|:---------------------------|:--------------|
| 31:24  |        |         |                            | Reserved      |
|  23:0  |   rw   |   0x1   | PULP_CLUSTER_CLK_DIV_VALUE |               |

## SPATZ_CLUSTER_CLK_DIV_VALUE
Spatz Cluster clk divider value
- Offset: `0xac`
- Reset default: `0x1`
- Reset mask: `0xffffff`

### Fields

```wavejson
{"reg": [{"name": "SPATZ_CLUSTER_CLK_DIV_VALUE", "bits": 24, "attr": ["rw"], "rotate": 0}, {"bits": 8}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                        | Description   |
|:------:|:------:|:-------:|:----------------------------|:--------------|
| 31:24  |        |         |                             | Reserved      |
|  23:0  |   rw   |   0x1   | SPATZ_CLUSTER_CLK_DIV_VALUE |               |

## L2_CLK_DIV_VALUE
L2 Memory clk divider value
- Offset: `0xb0`
- Reset default: `0x1`
- Reset mask: `0xffffff`

### Fields

```wavejson
{"reg": [{"name": "L2_CLK_DIV_VALUE", "bits": 24, "attr": ["rw"], "rotate": 0}, {"bits": 8}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name             | Description   |
|:------:|:------:|:-------:|:-----------------|:--------------|
| 31:24  |        |         |                  | Reserved      |
|  23:0  |   rw   |   0x1   | L2_CLK_DIV_VALUE |               |

## HOST_FETCH_ENABLE
Host Domain fetch enable
- Offset: `0xb4`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "HOST_FETCH_ENABLE", "bits": 1, "attr": ["ro"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 190}}
```

|  Bits  |  Type  |  Reset  | Name              | Description   |
|:------:|:------:|:-------:|:------------------|:--------------|
|  31:1  |        |         |                   | Reserved      |
|   0    |   ro   |   0x0   | HOST_FETCH_ENABLE |               |

## SAFETY_ISLAND_FETCH_ENABLE
Safety Island fetch enable
- Offset: `0xb8`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "SAFETY_ISLAND_FETCH_ENABLE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 280}}
```

|  Bits  |  Type  |  Reset  | Name                       | Description   |
|:------:|:------:|:-------:|:---------------------------|:--------------|
|  31:1  |        |         |                            | Reserved      |
|   0    |   rw   |   0x0   | SAFETY_ISLAND_FETCH_ENABLE |               |

## SECURITY_ISLAND_FETCH_ENABLE
Security Island fetch enable
- Offset: `0xbc`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "SECURITY_ISLAND_FETCH_ENABLE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 300}}
```

|  Bits  |  Type  |  Reset  | Name                         | Description   |
|:------:|:------:|:-------:|:-----------------------------|:--------------|
|  31:1  |        |         |                              | Reserved      |
|   0    |   rw   |   0x0   | SECURITY_ISLAND_FETCH_ENABLE |               |

## PULP_CLUSTER_FETCH_ENABLE
PULP Cluster fetch enable
- Offset: `0xc0`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "PULP_CLUSTER_FETCH_ENABLE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 270}}
```

|  Bits  |  Type  |  Reset  | Name                      | Description   |
|:------:|:------:|:-------:|:--------------------------|:--------------|
|  31:1  |        |         |                           | Reserved      |
|   0    |   rw   |   0x0   | PULP_CLUSTER_FETCH_ENABLE |               |

## SPATZ_CLUSTER_DEBUG_REQ
Spatz Cluster debug req
- Offset: `0xc4`
- Reset default: `0x0`
- Reset mask: `0x3`

### Fields

```wavejson
{"reg": [{"name": "SPATZ_CLUSTER_DEBUG_REQ", "bits": 2, "attr": ["rw"], "rotate": -90}, {"bits": 30}], "config": {"lanes": 1, "fontsize": 10, "vspace": 250}}
```

|  Bits  |  Type  |  Reset  | Name                    | Description   |
|:------:|:------:|:-------:|:------------------------|:--------------|
|  31:2  |        |         |                         | Reserved      |
|  1:0   |   rw   |   0x0   | SPATZ_CLUSTER_DEBUG_REQ |               |

## HOST_BOOT_ADDR
Host boot address
- Offset: `0xc8`
- Reset default: `0x1000`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "HOST_BOOT_ADDR", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name           | Description   |
|:------:|:------:|:-------:|:---------------|:--------------|
|  31:0  |   rw   | 0x1000  | HOST_BOOT_ADDR |               |

## SAFETY_ISLAND_BOOT_ADDR
Safety Island boot address
- Offset: `0xcc`
- Reset default: `0x70000000`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "SAFETY_ISLAND_BOOT_ADDR", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |   Reset    | Name                    | Description   |
|:------:|:------:|:----------:|:------------------------|:--------------|
|  31:0  |   rw   | 0x70000000 | SAFETY_ISLAND_BOOT_ADDR |               |

## SECURITY_ISLAND_BOOT_ADDR
Security Island boot address
- Offset: `0xd0`
- Reset default: `0x70000000`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "SECURITY_ISLAND_BOOT_ADDR", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |   Reset    | Name                      | Description   |
|:------:|:------:|:----------:|:--------------------------|:--------------|
|  31:0  |   rw   | 0x70000000 | SECURITY_ISLAND_BOOT_ADDR |               |

## PULP_CLUSTER_BOOT_ADDR
PULP Cluster boot address
- Offset: `0xd4`
- Reset default: `0x70000000`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "PULP_CLUSTER_BOOT_ADDR", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |   Reset    | Name                   | Description   |
|:------:|:------:|:----------:|:-----------------------|:--------------|
|  31:0  |   rw   | 0x70000000 | PULP_CLUSTER_BOOT_ADDR |               |

## SPATZ_CLUSTER_BOOT_ADDR
Spatz Cluster boot address
- Offset: `0xd8`
- Reset default: `0x70000000`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "SPATZ_CLUSTER_BOOT_ADDR", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |   Reset    | Name                    | Description   |
|:------:|:------:|:----------:|:------------------------|:--------------|
|  31:0  |   rw   | 0x70000000 | SPATZ_CLUSTER_BOOT_ADDR |               |

## PULP_CLUSTER_BOOT_ENABLE
PULP Cluster boot enable
- Offset: `0xdc`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "PULP_CLUSTER_BOOT_ENABLE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 260}}
```

|  Bits  |  Type  |  Reset  | Name                     | Description   |
|:------:|:------:|:-------:|:-------------------------|:--------------|
|  31:1  |        |         |                          | Reserved      |
|   0    |   rw   |   0x0   | PULP_CLUSTER_BOOT_ENABLE |               |

## SPATZ_CLUSTER_BUSY
Spatz Cluster busy
- Offset: `0xe0`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "SPATZ_CLUSTER_BUSY", "bits": 1, "attr": ["ro"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 200}}
```

|  Bits  |  Type  |  Reset  | Name               | Description   |
|:------:|:------:|:-------:|:-------------------|:--------------|
|  31:1  |        |         |                    | Reserved      |
|   0    |   ro   |   0x0   | SPATZ_CLUSTER_BUSY |               |

## PULP_CLUSTER_BUSY
PULP Cluster busy
- Offset: `0xe4`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "PULP_CLUSTER_BUSY", "bits": 1, "attr": ["ro"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 190}}
```

|  Bits  |  Type  |  Reset  | Name              | Description   |
|:------:|:------:|:-------:|:------------------|:--------------|
|  31:1  |        |         |                   | Reserved      |
|   0    |   ro   |   0x0   | PULP_CLUSTER_BUSY |               |

## PULP_CLUSTER_EOC
PULP Cluster end of computation
- Offset: `0xe8`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "PULP_CLUSTER_EOC", "bits": 1, "attr": ["ro"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 180}}
```

|  Bits  |  Type  |  Reset  | Name             | Description   |
|:------:|:------:|:-------:|:-----------------|:--------------|
|  31:1  |        |         |                  | Reserved      |
|   0    |   ro   |   0x0   | PULP_CLUSTER_EOC |               |

## ETH_RGMII_PHY_CLK_DIV_EN
Ethernet RGMII PHY clock divider enable bit
- Offset: `0xec`
- Reset default: `0x1`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "ETH_RGMII_PHY_CLK_DIV_EN", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 260}}
```

|  Bits  |  Type  |  Reset  | Name                     | Description   |
|:------:|:------:|:-------:|:-------------------------|:--------------|
|  31:1  |        |         |                          | Reserved      |
|   0    |   rw   |   0x1   | ETH_RGMII_PHY_CLK_DIV_EN |               |

## ETH_RGMII_PHY_CLK_DIV_VALUE
Ethernet RGMII PHY clock divider value
- Offset: `0xf0`
- Reset default: `0x64`
- Reset mask: `0xfffff`

### Fields

```wavejson
{"reg": [{"name": "ETH_RGMII_PHY_CLK_DIV_VALUE", "bits": 20, "attr": ["rw"], "rotate": 0}, {"bits": 12}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                        | Description   |
|:------:|:------:|:-------:|:----------------------------|:--------------|
| 31:20  |        |         |                             | Reserved      |
|  19:0  |   rw   |  0x64   | ETH_RGMII_PHY_CLK_DIV_VALUE |               |

## ETH_MDIO_CLK_DIV_EN
Ethernet MDIO clock divider enable bit
- Offset: `0xf4`
- Reset default: `0x1`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "ETH_MDIO_CLK_DIV_EN", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 31}], "config": {"lanes": 1, "fontsize": 10, "vspace": 210}}
```

|  Bits  |  Type  |  Reset  | Name                | Description   |
|:------:|:------:|:-------:|:--------------------|:--------------|
|  31:1  |        |         |                     | Reserved      |
|   0    |   rw   |   0x1   | ETH_MDIO_CLK_DIV_EN |               |

## ETH_MDIO_CLK_DIV_VALUE
Ethernet MDIO clock divider value
- Offset: `0xf8`
- Reset default: `0x64`
- Reset mask: `0xfffff`

### Fields

```wavejson
{"reg": [{"name": "ETH_MDIO_CLK_DIV_VALUE", "bits": 20, "attr": ["rw"], "rotate": 0}, {"bits": 12}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name                   | Description   |
|:------:|:------:|:-------:|:-----------------------|:--------------|
| 31:20  |        |         |                        | Reserved      |
|  19:0  |   rw   |  0x64   | ETH_MDIO_CLK_DIV_VALUE |               |

