## Summary

| Name                              | Offset   |   Length | Description                                                                                |
|:----------------------------------|:---------|---------:|:-------------------------------------------------------------------------------------------|
| eth_framing.[`CONFIG0`](#config0) | 0x0      |        4 | Configures the lower 4 bytes of the devices MAC address                                    |
| eth_framing.[`CONFIG1`](#config1) | 0x4      |        4 | Configures the: upper 2 bytes of the devices MAC address, promiscuous flag, MDIO interface |
| eth_framing.[`CONFIG2`](#config2) | 0x8      |        4 | The FCS TX status                                                                          |
| eth_framing.[`CONFIG3`](#config3) | 0xc      |        4 | The FCS RX status                                                                          |

## CONFIG0
Configures the lower 4 bytes of the devices MAC address
- Offset: `0x0`
- Reset default: `0x890702`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "lower_mac_address", "bits": 32, "attr": ["rw"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset   | Name              | Description                             |
|:------:|:------:|:--------:|:------------------|:----------------------------------------|
|  31:0  |   rw   | 0x890702 | lower_mac_address | Lower 32 bit of the devices MAC address |

## CONFIG1
Configures the: upper 2 bytes of the devices MAC address, promiscuous flag, MDIO interface
- Offset: `0x4`
- Reset default: `0x2301`
- Reset mask: `0xfffff`

### Fields

```wavejson
{"reg": [{"name": "upper_mac_address", "bits": 16, "attr": ["rw"], "rotate": 0}, {"name": "promiscuous", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "phy_mdclk", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "phy_mdio_o", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "phy_mdio_oe", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 12}], "config": {"lanes": 1, "fontsize": 10, "vspace": 130}}
```

|  Bits  |  Type  |  Reset  | Name              | Description                             |
|:------:|:------:|:-------:|:------------------|:----------------------------------------|
| 31:20  |        |         |                   | Reserved                                |
|   19   |   rw   |   0x0   | phy_mdio_oe       | MDIO output enable                      |
|   18   |   rw   |   0x0   | phy_mdio_o        | MDIO output                             |
|   17   |   rw   |   0x0   | phy_mdclk         | MDIO clock                              |
|   16   |   rw   |   0x0   | promiscuous       | promiscuous flag                        |
|  15:0  |   rw   | 0x2301  | upper_mac_address | Upper 16 bit of the devices MAC address |

## CONFIG2
The FCS TX status
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "tx_fcs_reg", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name       | Description   |
|:------:|:------:|:-------:|:-----------|:--------------|
|  31:0  |   ro   |   0x0   | tx_fcs_reg | FCS TX status |

## CONFIG3
The FCS RX status
- Offset: `0xc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "rx_fcs_reg", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name       | Description   |
|:------:|:------:|:-------:|:-----------|:--------------|
|  31:0  |   ro   |   0x0   | rx_fcs_reg | FCS RX status |

