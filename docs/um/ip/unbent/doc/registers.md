## Summary

| Name                                         | Offset   |   Length | Description                         |
|:---------------------------------------------|:---------|---------:|:------------------------------------|
| bus_err_unit.[`err_addr`](#err_addr)         | 0x0      |        4 | Address of the bus error            |
| bus_err_unit.[`err_addr_top`](#err_addr_top) | 0x4      |        4 | Top of the address of the bus error |
| bus_err_unit.[`err_code`](#err_code)         | 0x8      |        4 | Error code of the bus error         |
| bus_err_unit.[`meta`](#meta)                 | 0xc      |        4 | Meta information of the bus error   |

## err_addr
Address of the bus error
- Offset: `0x0`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "err_addr", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description              |
|:------:|:------:|:-------:|:---------|:-------------------------|
|  31:0  |   ro   |    x    | err_addr | Address of the bus error |

## err_addr_top
Top of the address of the bus error
- Offset: `0x4`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "err_addr", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description              |
|:------:|:------:|:-------:|:---------|:-------------------------|
|  31:0  |   ro   |    x    | err_addr | Address of the bus error |

## err_code
Error code of the bus error
- Offset: `0x8`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "err_code", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name     | Description                 |
|:------:|:------:|:-------:|:---------|:----------------------------|
|  31:0  |   ro   |    x    | err_code | Error code of the bus error |

## meta
Meta information of the bus error
- Offset: `0xc`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "meta", "bits": 32, "attr": ["ro"], "rotate": 0}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name   | Description                       |
|:------:|:------:|:-------:|:-------|:----------------------------------|
|  31:0  |   ro   |    x    | meta   | Meta information of the bus error |

