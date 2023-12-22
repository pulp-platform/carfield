## Memory Map

| Start Address        | End Address (excl.) | Length         | Size    | Region       | Device                                  |
| -------------------- | ------------------- | -------------- | ------- | ------------ | --------------------------------------- |
| Internal to Cheshire |                     |                |         |              |
| 0x0000_0000_0000     | 0x0000_0004_0000    | 0x4_0000       | 256 KiB | Debug        | Debug CVA6                              |
| 0x0000_0004_0000     | 0x0000_0100_0000    |                |         | Reserved     |
| 0x0000_0100_0000     | 0x0000_0100_1000    | 0x1000         | 4 KiB   | Config       | AXI DMA Config                          |
| 0x0000_0100_1000     | 0x0000_0200_0000    |                |         | Reserved     |
| 0x0000_0200_0000     | 0x0000_0204_0000    | 0x4_0000       | 256 KiB | Memory       | Boot ROM                                |
| 0x0000_0204_0000     | 0x0000_0208_0000    | 0x4_0000       | 256 KiB | Irq          | CLINT                                   |
| 0x0000_0208_0000     | 0x0000_020c_0000    | 0x4_0000       | 256 KiB | Irq          | IRQ Routing                             |
| 0x0000_020c_0000     | 0x0000_0210_0000    | 0x4_0000       | 256 KiB | Irq          | AXI-REALM unit                          |
| 0x0000_020c_0000     | 0x0000_0300_0000    |                |         | Reserved     |
| 0x0000_0300_0000     | 0x0000_0300_1000    | 0x1000         | 4 KiB   | Config       | CSRs                                    |
| 0x0000_0300_1000     | 0x0000_0300_2000    | 0x1000         | 4 KiB   | Config       | LLC                                     |
| 0x0000_0300_2000     | 0x0000_0300_3000    | 0x1000         | 4 KiB   | I/O          | UART                                    |
| 0x0000_0300_3000     | 0x0000_0300_4000    | 0x1000         | 4 KiB   | I/O          | I2C                                     |
| 0x0000_0300_4000     | 0x0000_0300_5000    | 0x1000         | 4 KiB   | I/O          | SPIM                                    |
| 0x0000_0300_5000     | 0x0000_0300_6000    | 0x1000         | 4 KiB   | I/O          | GPIO                                    |
| 0x0000_0300_6000     | 0x0000_0300_7000    | 0x1000         | 4 KiB   | Config       | Serial Link                             |
| 0x0000_0300_7000     | 0x0000_0300_8000    | 0x1000         | 4 KiB   | Config       | VGA                                     |
| 0x0000_0300_8000     | 0x0000_0300_A000    | 0x1000         | 8 KiB   | Config       | UNBENT (bus error unit)                 |
| 0x0000_0300_A000     | 0x0000_0300_B000    | 0x1000         | 4 KiB   | Config       | Tagger (cache partitioning)             |
| 0x0000_0300_8000     | 0x0000_0400_0000    |                |         | Reserved     |
| 0x0000_0400_0000     | 0x0000_1000_0000    | 0x40_0000      | 64 MiB  | Irq          | PLIC                                    |
| 0x0000_0800_0000     | 0x0000_0C00_0000    | 0x40_0000      | 64 MiB  | Irq          | CLICs                                   |
| 0x0000_1000_0000     | 0x0000_1400_0000    | 0x40_0000      | 64 MiB  | Memory       | LLC Scratchpad                          |
| 0x0000_1400_0000     | 0x0000_1800_0000    | 0x40_0000      | 64 MiB  | Memory       | LLC Scratchpad                          |
| 0x0000_1800_0000     | 0x0000_2000_0000    |                |         | Reserved     |
| External to Cheshire |                     |                |         |              |
| 0x0000_2000_0000     | 0x0000_2000_1000    | 0x1000         | 4 KiB   | I/O          | ETHERNET                                |
| 0x0000_2000_1000     | 0x0000_2000_2000    | 0x1000         | 4 KiB   | I/O          | CAN BUS                                 |
| 0x0000_2000_2000     | 0x0000_2000_3000    | 0x1000         | 4 KiB   | I/O          | (empty)                                 |
| 0x0000_2000_3000     | 0x0000_2000_4000    | 0x1000         | 4 KiB   | I/O          | (empty)                                 |
| 0x0000_2000_4000     | 0x0000_2000_5000    | 0x1000         | 4 KiB   | I/O          | GP TIMER 1 (System timer)               |
| 0x0000_2000_5000     | 0x0000_2000_6000    | 0x1000         | 4 KiB   | I/O          | GP TIMER 2 (Advanced timer)             |
| 0x0000_2000_6000     | 0x0000_2000_7000    | 0x1000         | 4 KiB   | I/O          | GP TIMER 3                              |
| 0x0000_2000_7000     | 0x0000_2000_8000    | 0x1000         | 4 KiB   | I/O          | WATCHDOG timer                          |
| 0x0000_2000_8000     | 0x0000_2000_9000    | 0x1000         | 4 KiB   | I/O          | (empty)                                 |
| 0x0000_2000_9000     | 0x0000_2000_a000    | 0x1000         | 4 KiB   | I/O          | HyperBUS                                |
| 0x0000_2000_a000     | 0x0000_2000_b000    | 0x1000         | 4 KiB   | I/O          | Pad Config                              |
| 0x0000_2000_b000     | 0x0000_2000_c000    | 0x1000         | 4 KiB   | I/O          | L2 ECC Config                           |
| 0x0000_2001_0000     | 0x0000_2001_1000    | 0x1000         | 4 KiB   | I/O          | Carfield Control and Status             |
| 0x0000_2002_0000     | 0x0000_2002_1000    | 0x1000         | 4 KiB   | I/O          | PLL/CLOCK                               |
| 0x0000_2800_1000     | 0x0000_4000_0000    |                |         | Reserved     |
| 0x0000_4000_0000     | 0x0000_4000_1000    | 0x1000         | 4 KiB   | Irq          | Mailboxes                               |
| 0x0000_4000_1000     | 0x0000_5000_0000    |                |         | Reserved     |
| 0x0000_5000_0000     | 0x0000_5080_0000    | 0x80_0000      | 8 MiB   | Accelerators | Integer Cluster                         |
| 0x0000_5080_0000     | 0x0000_5100_0000    |                |         | Reserved     |
| 0x0000_5100_0000     | 0x0000_5180_0000    | 0x80_0000      | 8 MiB   | Accelerators | FP Cluster                              |
| 0x0000_5100_0000     | 0x0000_6000_0000    |                |         | Reserved     |
| 0x0000_6000_0000     | 0x0000_6002_0000    | 0x2_0000       | 128 KiB | Safety       | Safety Island Memory                    |
| 0x0000_6002_0000     | 0x0000_6020_0000    | 0x1e_0000      |         | Safety       | reserved                                |
| 0x0000_6020_0000     | 0x0000_6030_0000    | 0x10_0000      |         | Safety       | Safety Island Peripherals               |
| 0x0000_6030_0000     | 0x0000_6080_0000    | 0x50_0000      |         | Safety       | reserved                                |
| 0x0000_6080_0000     | 0x0000_7000_0000    |                |         | Reserved     |
| 0x0000_7000_0000     | 0x0000_7002_0000    | 0x2_0000       | 128 KiB | Memory       | LLC Scratchpad                          |
| 0x0000_7800_0000     | 0x0000_7810_0000    | 0x10_0000      | 1 MiB   | Memory       | L2 Scratchpad (Port 1, interleaved)     |
| 0x0000_7810_0000     | 0x0000_7820_0000    | 0x10_0000      | 1 MiB   | Memory       | L2 Scratchpad (Port 1, non-interleaved) |
| 0x0000_7820_0000     | 0x0000_7830_0000    | 0x10_0000      | 1 MiB   | Memory       | L2 Scratchpad (Port 2, interleaved)     |
| 0x0000_7830_0000     | 0x0000_7840_0000    | 0x10_0000      | 1 MiB   | Memory       | L2 Scratchpad (Port 2, non-interleaved) |
| 0x0000_8000_0000     | 0x0020_8000_0000    | 0x20_0000_0000 | 128 GiB | Memory       | LLC/DRAM                                |

