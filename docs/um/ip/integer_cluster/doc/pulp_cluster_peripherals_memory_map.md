## PULP Cluster Peripheral Memory Map

This document describes the memory-mapped peripheral devices accessible from the PULP cluster through the peripheral interconnect slave port.

## Base Address

- **Cluster Base Address**: `0x5000_0000`
- **Peripheral Offset**: `0x0020_0000`
- **External Offset**: `0x0040_0000`

**Cluster Peripheral Base Address**:  
`0x5020_0000` – `0x5040_0000` (2 MiB region)

---

## Peripheral Layout

| Peripheral           | ID   | Offset (from Peripheral Base) | Address Range                  |
|----------------------|------|-------------------------------|--------------------------------|
| EOC                  | 0    | `0x0000`                      | `0x5020_0000` – `0x5020_03FF`  |
| Timer                | 1    | `0x0400`                      | `0x5020_0400` – `0x5020_07FF`  |
| Event Unit (also 3)  | 2/3  | `0x0800`                      | `0x5020_0800` – `0x5020_0FFF`  |
| HWPE                 | 4    | `0x1000`                      | `0x5020_1000` – `0x5020_13FF`  |
| ICache Controller    | 5    | `0x1400`                      | `0x5020_1400` – `0x5020_17FF`  |
| DMA (Cluster)        | 6    | `0x1800`                      | `0x5020_1800` – `0x5020_1BFF`  |
| DMA (Fabric Ctrl)    | 7    | `0x1C00`                      | `0x5020_1C00` – `0x5020_1FFF`  |
| HMR Unit             | 8    | `0x2000`                      | `0x5020_2000` – `0x5020_23FF`  |
| External             | 9    | `0x2400`                      | `0x5020_2400` – `0x5020_27FF`  |
| Error Unit           | 10   | `0x2800`                      | `0x5020_2800` – `0x5020_2BFF`  |

---

## Address Mapping Summary

| Region           | Index | Start Address | End Address   | Notes                          |
|------------------|--------|----------------|---------------|--------------------------------|
| TCDM             | 0      | `0x5000_0000`   | `0x5000_0000 + TCDM_SIZE` | Tightly Coupled Data Memory    |
| Peripherals      | 1      | `0x5020_0000`   | `0x5040_0000` | Cluster Peripheral Region      |
| External         | 2      | `0x5040_0000`   | `0xFFFF_FFFF` | Access beyond cluster          |
| Below Cluster    | 3      | `0x0000_0000`   | `0x5000_0000` | Not cluster-related            |
