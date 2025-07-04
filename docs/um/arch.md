# Architecture

![Carfield Block Diagram](../img/arch.svg)

Carfield is organized in *domains*. As a mixed-criticality system (MCS), each domain serves
different purposes in terms of functional safety and reliability, security, and computation
capabilities.

Carfield relies on Cheshire as its host domain, and extends its minimal SoC with additional
interconnect ports and interrupts.

The above block diagram depicts a fully-featured Carfield SoC, which currently provides:

- **Domains**:
	- *Host domain* (Cheshire), a Linux-capable RV64 system based on dual-core CVA6 processors with
	  self-invalidation coherency mechanism
	- *Safe domain*, a Triple-Core-Lockstep (TCLS) RV32 microcontroller system based on CV32E40P,
	  with fast interrupt handling through the RISC-V CLIC
	- *Secure domain*, a Dual-Core-Lockstep (DCLS) RV32 Hardware Root of Trust (HW RoT) systems that
	  ensures the secure boot for the whole platform, serves as secure monitor for the entire
	  system, and provides crypto acceleration services through various crypto-accelerators
	- *Accelerator domain*, comprises two programmable multi-core accelerators (PMCAs), an 12-cores
	  integer cluster with Hybrid Modular Redundancy (HMR) capabilities oriented to compute
	  intensive integer workloads such as AI, and a vectorial cluster with floating point vector
	  processing capabilities to accelerate intensive control tasks

- **On-chip and off-chip memory endpoints**:
	- *Dynamic SPM*: dynamically configurable scratchpad memory (SPM) for *interleaved* or
	  *contiguous* accesses aiming at reducing systematic bus conflicts to improve the
	  time-predictability of the on-chip communication
	- *Partitionable hybrid LLC SPM*: the last-level cache (*host domain*) can be configured as SPM
	  at runtime, as described in Cheshire's
	  [Architecture](https://pulp-platform.github.io/cheshire/um/arch/)
	- *External DRAM*: off-chip HyperRAM (Infineon) interfaced with in-house, open-source AXI4
	  Hyberbus memory controller and digital PHY connected to Cheshire's LLC

- **Mailbox unit**
	- Main communication vehicle among domains, based on an interrupt notification mechanism

- **Platform control registers (PCRs)**
	- Management and control registers for the entire platform, control clock sources assignments,
	  clock gating, isolation.

- **Interconnect** (as in Cheshire):
	- A last level cache (LLC) configurable as a scratchpad memory (SPM) per-way
	- Up to 16 external AXI4 manager ports and 16 AXI and Regbus subordinate ports
	- Per-manager AXI4 traffic regulators for real-time applications
	- Per-manager AXI4 bus error units (UNBENT) for interconnect error handling

- **Interrupts** (as in Cheshire):
	- Core-local (CLINT *and* CLIC) and platform (PLIC) interrupt controllers
	- Dynamic interrupt routing from and to internal and external targets.

- **Peripherals**:
	- Generic timers
	- PWM timers
	- Watchdog timer
	- Ethernet
	- CAN

## Memory Map

This section shows Carfield's memory map. The group `Internal to Cheshire` in the table below only
recalls the memory map described in the dedicatd [documentation for
Cheshire](https://pulp-platform.github.io/cheshire/um/arch/) and is explicitely shown here for
clarity.

| **Start Address**        | **End Address (excl.)** | **Length**       | **Size** | **Permissions** | **Cacheable** | **Atomics** | **Region**   | **Device**                                                           |
|--------------------------|-------------------------|------------------|----------|-----------------|---------------|-------------|--------------|----------------------------------------------------------------------|
| **Internal to Cheshire** |                         |                  |          |                 |               |             |              |                                                                      |
| `0x0000_0000`            | `0x0004_0000`           | `0x04_0000`      | 256 KiB  | (debug)         |               |             | Debug        | Debug CVA6                                                           |
| `0x0004_0000`            | `0x0100_0000`           |                  |          |                 |               |             | *Reserved*   |                                                                      |
| `0x0100_0000`            | `0x0100_1000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | Config       | AXI DMA Config                                                       |
| `0x0100_1000`            | `0x0200_0000`           |                  |          |                 |               |             | *Reserved*   |                                                                      |
| `0x0200_0000`            | `0x0204_0000`           | `0x04_0000`      | 256 KiB  | rx              |               |             | Memory       | Boot ROM                                                             |
| `0x0204_0000`            | `0x0208_0000`           | `0x04_0000`      | 256 KiB  | rw              |               |             | Irq          | CLINT                                                                |
| `0x0208_0000`            | `0x020c_0000`           | `0x04_0000`      | 256 KiB  | rw              |               |             | Irq          | IRQ Routing                                                          |
| `0x020c_0000`            | `0x0210_0000`           | `0x04_0000`      | 256 KiB  | rw              |               |             | Irq          | AXI-REALM unit                                                       |
| `0x020c_0000`            | `0x0300_0000`           |                  |          |                 |               |             | *Reserved*   |                                                                      |
| `0x0300_0000`            | `0x0300_1000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | Config       | Cheshire PCRs                                                        |
| `0x0300_1000`            | `0x0300_2000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | Config       | LLC                                                                  |
| `0x0300_2000`            | `0x0300_3000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | [UART](https://opentitan.org/book/hw/ip/uart/doc/registers.html)     |
| `0x0300_3000`            | `0x0300_4000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | [I2C](https://opentitan.org/book/hw/ip/i2c/doc/registers.html)       |
| `0x0300_4000`            | `0x0300_5000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | [SPIM](https://opentitan.org/book/hw/ip/spi_host/doc/registers.html) |
| `0x0300_5000`            | `0x0300_6000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | [GPIO](https://opentitan.org/book/hw/ip/gpio/doc/registers.html)     |
| `0x0300_6000`            | `0x0300_7000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | Config       | Serial Link                                                          |
| `0x0300_7000`            | `0x0300_8000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | Config       | VGA                                                                  |
| `0x0300_8000`            | `0x0300_A000`           | `0x00_1000`      | 8 KiB    | rw              |               |             | Config       | UNBENT (bus error unit)                                              |
| `0x0300_A000`            | `0x0300_B000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | Config       | Tagger (LLC partitioning)                                            |
| `0x0300_8000`            | `0x0400_0000`           |                  |          |                 |               |             | *Reserved*   |                                                                      |
| `0x0400_0000`            | `0x1000_0000`           | `0x40_0000`      | 64 MiB   | rw              |               |             | Irq          | PLIC                                                                 |
| `0x0800_0000`            | `0x0C00_0000`           | `0x40_0000`      | 64 MiB   | rw              |               |             | Irq          | CLICs                                                                |
| `0x1000_0000`            | `0x1400_0000`           | `0x40_0000`      | 64 MiB   | rwx             | yes           | yes         | Memory       | LLC Scratchpad                                                       |
| `0x1400_0000`            | `0x1800_0000`           | `0x40_0000`      | 64 MiB   | rwx             |               | yes         | Memory       | LLC Scratchpad                                                       |
| `0x1800_0000`            | `0x2000_0000`           |                  |          |                 |               |             | *Reserved*   |                                                                      |
| **External to Cheshire** |                         |                  |          | rw              |               |             |              |                                                                      |
| `0x2000_0000`            | `0x2000_1000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | Ethernet                                                             |
| `0x2000_1000`            | `0x2000_2000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | CAN BUS                                                              |
| `0x2000_2000`            | `0x2000_3000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | (empty)                                                              |
| `0x2000_3000`            | `0x2000_4000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | (empty)                                                              |
| `0x2000_4000`            | `0x2000_5000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | GP timer 1 (System timer)                                            |
| `0x2000_5000`            | `0x2000_6000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | GP timer 2 (Advanced timer)                                          |
| `0x2000_6000`            | `0x2000_7000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | GP timer 3                                                           |
| `0x2000_7000`            | `0x2000_8000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | Watchdog timer                                                       |
| `0x2000_8000`            | `0x2000_9000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | (empty)                                                              |
| `0x2000_9000`            | `0x2000_a000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | HyperBUS                                                             |
| `0x2000_a000`            | `0x2000_b000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | Pad Config                                                           |
| `0x2000_b000`            | `0x2000_c000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | L2 ECC Config                                                        |
| `0x2001_0000`            | `0x2001_1000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | Carfield Control and Status                                          |
| `0x2002_0000`            | `0x2002_1000`           | `0x00_1000`      | 4 KiB    | rw              |               |             | I/O          | (if any) PLL/CLOCK                                                   |
| `0x2800_1000`            | `0x4000_0000`           |                  |          |                 |               |             | *Reserved*   |                                                                      |
| `0x4000_0000`            | `0x4000_3000`           | `0x00_3000`      | 12 KiB   | rw              |               |             | Irq          | Mailboxes                                                            |
| `0x4000_3000`            | `0x5000_0000`           |                  |          |                 |               |             | *Reserved*   |                                                                      |
| `0x5000_0000`            | `0x5080_0000`           | `0x80_0000`      | 8 MiB    | rw              |               |             | Accelerators | Integer Cluster                                                      |
| `0x5080_0000`            | `0x5100_0000`           |                  |          |                 |               |             | *Reserved*   |                                                                      |
| `0x5100_0000`            | `0x5180_0000`           | `0x80_0000`      | 8 MiB    | rw              |               |             | Accelerators | FP Cluster                                                           |
| `0x5100_0000`            | `0x6000_0000`           |                  |          |                 |               |             | *Reserved*   |                                                                      |
| `0x6000_0000`            | `0x6002_0000`           | `0x02_0000`      | 128 KiB  | rw              |               | yes         | Safe domain  | Safety Island Memory                                                 |
| `0x6002_0000`            | `0x6020_0000`           | `0x1e_0000`      |          | rw              |               |             | Safe domain  | reserved                                                             |
| `0x6020_0000`            | `0x6030_0000`           | `0x10_0000`      | 1 MiB    | rw              |               | yes         | Safe domain  | Safety Island Peripherals                                            |
| `0x6030_0000`            | `0x6080_0000`           | `0x50_0000`      |          | rw              |               |             | Safe domain  | reserved                                                             |
| `0x6080_0000`            | `0x7000_0000`           |                  |          |                 |               |             | *Reserved*   |                                                                      |
| `0x7000_0000`            | `0x7002_0000`           | `0x02_0000`      | 128 KiB  | rwx             | yes           | yes         | Memory       | LLC Scratchpad                                                       |
| `0x7800_0000`            | `0x7810_0000`           | `0x10_0000`      | 1 MiB    | rwx             | yes           | yes         | Memory       | L2 Scratchpad (Port 1, interleaved)                                  |
| `0x7810_0000`            | `0x7820_0000`           | `0x10_0000`      | 1 MiB    | rwx             | yes           | yes         | Memory       | L2 Scratchpad (Port 1, non-interleaved)                              |
| `0x7820_0000`            | `0x7830_0000`           | `0x10_0000`      | 1 MiB    | rwx             | yes           | yes         | Memory       | L2 Scratchpad (Port 2, interleaved)                                  |
| `0x7830_0000`            | `0x7840_0000`           | `0x10_0000`      | 1 MiB    | rwx             | yes           | yes         | Memory       | L2 Scratchpad (Port 2, non-interleaved)                              |
| `0x8000_0000`            | `0x20_8000_0000`        | `0x20_0000_0000` | 128 GiB  | rwx             | yes           | yes         | Memory       | LLC/DRAM                                                             |

## Interrupt map

Carfield's interrupt components are exhaustivly described in
the dedicated section of the [documentation for
Cheshire](https://pulp-platform.github.io/cheshire/um/arch/). This section describes Carfield's interrupt map.

| **Interrupt Source**        | **Interrupt sink**  | **Bitwidth** | **Connection**                                                | **Type**        | **Comment**               |
|-----------------------------|---------------------|--------------|---------------------------------------------------------------|-----------------|---------------------------|
| **Carfield peripherals**    |                     |              |                                                               |                 |                           |
| `intr_wkup_timer_expired_o` |                     | 1            | `car_wdt_intrs[0]       `                                     | level-sensitive |                           |
| `intr_wdog_timer_bark_o   ` |                     | 1            | `car_wdt_intrs[1]       `                                     | level-sensitive |                           |
| `nmi_wdog_timer_bark_o    ` |                     | 1            | `car_wdt_intrs[2]       `                                     | level-sensitive |                           |
| `wkup_req_o               ` |                     | 1            | `car_wdt_intrs[3]       `                                     | level-sensitive |                           |
| `aon_timer_rst_req_o      ` |                     | 1            | `car_wdt_intrs[4]       `                                     | level-sensitive |                           |
| `irq                      ` |                     | 1            | `car_can_intr           `                                     | level-sensitive |                           |
| `ch_0_o[0]                ` |                     | 1            | `car_adv_timer_ch0      `                                     | edge-sensitive  |                           |
| `ch_0_o[1]                ` |                     | 1            | `car_adv_timer_ch1      `                                     | edge-sensitive  |                           |
| `ch_0_o[2]                ` |                     | 1            | `car_adv_timer_ch2      `                                     | edge-sensitive  |                           |
| `ch_0_o[3]                ` |                     | 1            | `car_adv_timer_ch3      `                                     | edge-sensitive  |                           |
| `events_o[0]              ` |                     | 1            | `car_adv_timer_events[0]`                                     | edge-sensitive  |                           |
| `events_o[1]              ` |                     | 1            | `car_adv_timer_events[1]`                                     | edge-sensitive  |                           |
| `events_o[2]              ` |                     | 1            | `car_adv_timer_events[2]`                                     | edge-sensitive  |                           |
| `events_o[3]              ` |                     | 1            | `car_adv_timer_events[3]`                                     | edge-sensitive  |                           |
| `irq_lo_o                 ` |                     | 1            | `car_sys_timer_lo       `                                     | edge-sensitive  |                           |
| `irq_hi_o                 ` |                     | 1            | `car_sys_timer_hi       `                                     | edge-sensitive  |                           |
| **Cheshire peripherals**    |                     |              |                                                               |                 |                           |
| `zero                `      |                     | 1            | `zero                `                                        | level-sensitive |                           |
| `uart                `      |                     | 1            | `uart                `                                        | level-sensitive |                           |
| `i2c_fmt_threshold   `      |                     | 1            | `i2c_fmt_threshold   `                                        | level-sensitive |                           |
| `i2c_rx_threshold    `      |                     | 1            | `i2c_rx_threshold    `                                        | level-sensitive |                           |
| `i2c_fmt_overflow    `      |                     | 1            | `i2c_fmt_overflow    `                                        | level-sensitive |                           |
| `i2c_rx_overflow     `      |                     | 1            | `i2c_rx_overflow     `                                        | level-sensitive |                           |
| `i2c_nak             `      |                     | 1            | `i2c_nak             `                                        | level-sensitive |                           |
| `i2c_scl_interference`      |                     | 1            | `i2c_scl_interference`                                        | level-sensitive |                           |
| `i2c_sda_interference`      |                     | 1            | `i2c_sda_interference`                                        | level-sensitive |                           |
| `i2c_stretch_timeout `      |                     | 1            | `i2c_stretch_timeout `                                        | level-sensitive |                           |
| `i2c_sda_unstable    `      |                     | 1            | `i2c_sda_unstable    `                                        | level-sensitive |                           |
| `i2c_cmd_complete    `      |                     | 1            | `i2c_cmd_complete    `                                        | level-sensitive |                           |
| `i2c_tx_stretch      `      |                     | 1            | `i2c_tx_stretch      `                                        | level-sensitive |                           |
| `i2c_tx_overflow     `      |                     | 1            | `i2c_tx_overflow     `                                        | level-sensitive |                           |
| `i2c_acq_full        `      |                     | 1            | `i2c_acq_full        `                                        | level-sensitive |                           |
| `i2c_unexp_stop      `      |                     | 1            | `i2c_unexp_stop      `                                        | level-sensitive |                           |
| `i2c_host_timeout    `      |                     | 1            | `i2c_host_timeout    `                                        | level-sensitive |                           |
| `spih_error          `      |                     | 1            | `spih_error          `                                        | level-sensitive |                           |
| `spih_spi_event      `      |                     | 1            | `spih_spi_event      `                                        | level-sensitive |                           |
| `gpio                `      |                     | 32           | `gpio                `                                        | level-sensitive |                           |
| **Spatz cluster**           |                     |              |                                                               |                 |                           |
|                             | `msip_i[0]`         | 1            | `(hostd_spatzcl_mb_intr_ored[0] \| safed_spatzcl_intr_mb[0])` | level-sensitive | Snitch core #0            |
|                             | `msip_i[1]`         | 1            | `(hostd_spatzcl_mb_intr_ored[1] \| safed_spatzcl_intr_mb[1])` | level-sensitive | Snitch core #1            |
|                             | `mtip_i[0]`         | 1            | `chs_mti[0]                                                 ` | level-sensitive | Snitch core #0            |
|                             | `mtip_i[1]`         | 1            | `chs_mti[1]                                                 ` | level-sensitive | Snitch core #1            |
|                             | `meip_i   `         | 2            | `\-                                                         ` |                 | unconnected               |
|                             | `seip_i   `         | 2            | `\-                                                         ` |                 | unconnected               |
| **HRM integer cluster**     |                     |              |                                                               |                 |                           |
| `eoc_o`                     |                     | 1            | `pulpcl_eoc                                         `         | level-sensitive |                           |
|                             | `mbox_irq_i`        | 1            | `(hostd_pulpcl_mb_intr_ored \| safed_pulpcl_intr_mb)`         | level-sensitive | to offload binaries       |
| **Secure domain**           |                     |              |                                                               |                 |                           |
|                             | `irq_ibex_i`        | 1            | `(hostd_secd_mb_intr_ored \| safed_secd_intr_mb)`             | level-sensitive | to wake-up Ibex core      |
| **Safe domain**             |                     |              |                                                               |                 |                           |
|                             | `irqs_i[0]     `    | 1            | `hostd_safed_mbox_intr[0]  `                                  | level-sensitive | from host domain CVA6#0   |
|                             | `irqs_i[1]     `    | 1            | `hostd_safed_mbox_intr[1]  `                                  | level-sensitive | from host domain CVA6#1   |
|                             | `irqs_i[2]     `    | 1            | `secd_safed_mbox_intr      `                                  | level-sensitive | from secure domain        |
|                             | `irqs_i[3]     `    | 1            | `pulpcl_safed_mbox_intr    `                                  | level-sensitive | from HMR custer           |
|                             | `irqs_i[4]     `    | 1            | `spatzcl_safed_mbox_intr   `                                  | level-sensitive | from vectorial cluster    |
|                             | `irqs[5]       `    | 1            | `irqs_distributed_249      `                                  | level-sensitive | tied to 0                 |
|                             | `irqs[6]       `    | 1            | `irqs_distributed_250      `                                  | level-sensitive | host domain UART          |
|                             | `irqs[7]       `    | 1            | `irqs_distributed_251      `                                  | level-sensitive | i2c_fmt_threshold         |
|                             | `irqs[8]       `    | 1            | `irqs_distributed_252      `                                  | level-sensitive | i2c_rx_threshold          |
|                             | `irqs[9]       `    | 1            | `irqs_distributed_253      `                                  | level-sensitive | i2c_fmt_overview          |
|                             | `irqs[10]      `    | 1            | `irqs_distributed_254      `                                  | level-sensitive | i2c_rx_overflow           |
|                             | `irqs[11]      `    | 1            | `irqs_distributed_255      `                                  | level-sensitive | i2c_nak                   |
|                             | `irqs[12]      `    | 1            | `irqs_distributed_256      `                                  | level-sensitive | i2c_scl_interference      |
|                             | `irqs[13]      `    | 1            | `irqs_distributed_257      `                                  | level-sensitive | i2c_sda_interference      |
|                             | `irqs[14]      `    | 1            | `irqs_distributed_258      `                                  | level-sensitive | i2c_stret h_timeout       |
|                             | `irqs[15]      `    | 1            | `irqs_distributed_259      `                                  | level-sensitive | i2c_sda_unstable          |
|                             | `irqs[16]      `    | 1            | `irqs_distributed_260      `                                  | level-sensitive | i2c_cmd_complete          |
|                             | `irqs[17]      `    | 1            | `irqs_distributed_261      `                                  | level-sensitive | i2c_tx_stretch            |
|                             | `irqs[18]      `    | 1            | `irqs_distributed_262      `                                  | level-sensitive | i2c_tx_overflow           |
|                             | `irqs[19]      `    | 1            | `irqs_distributed_263      `                                  | level-sensitive | i2c_acq_full              |
|                             | `irqs[20]      `    | 1            | `irqs_distributed_264      `                                  | level-sensitive | i2c_unexp_stop            |
|                             | `irqs[21]      `    | 1            | `irqs_distributed_265      `                                  | level-sensitive | i2c_host_timeout          |
|                             | `irqs[22]      `    | 1            | `irqs_distributed_266      `                                  | level-sensitive | spih_error                |
|                             | `irqs[23]      `    | 1            | `irqs_distributed_267      `                                  | level-sensitive | spih_spi_event            |
|                             | `irqs[55:24]   `    | 32           | `irqs_distributed_299:268  `                                  | level-sensitive | gpio                      |
|                             | `irqs_i[56]    `    | 1            | `irqs_distributed_300      `                                  | level-sensitive | pulpcl_eoc                |
|                             | `irqs_i[57]    `    | 1            | `irqs_distributed_309      `                                  | level-sensitive | car_wdt_intrs[0]          |
|                             | `irqs_i[58]    `    | 1            | `irqs_distributed_310      `                                  | level-sensitive | car_wdt_intrs[1]          |
|                             | `irqs_i[59]    `    | 1            | `irqs_distributed_311      `                                  | level-sensitive | car_wdt_intrs[2]          |
|                             | `irqs_i[60]    `    | 1            | `irqs_distributed_312      `                                  | level-sensitive | car_wdt_intrs[3]          |
|                             | `irqs_i[61]    `    | 1            | `irqs_distributed_313      `                                  | level-sensitive | car_wdt_intrs[4]          |
|                             | `irqs_i[62]    `    | 1            | `irqs_distributed_314      `                                  | level-sensitive | car_can_intr              |
|                             | `irqs_i[63]    `    | 1            | `irqs_distributed_315      `                                  | edge-sensitive  | car_adv_timer_ch0         |
|                             | `irqs_i[64]    `    | 1            | `irqs_distributed_316      `                                  | edge-sensitive  | car_adv_timer_ch1         |
|                             | `irqs_i[65]    `    | 1            | `irqs_distributed_317      `                                  | edge-sensitive  | car_adv_timer_ch2         |
|                             | `irqs_i[66]    `    | 1            | `irqs_distributed_318      `                                  | edge-sensitive  | car_adv_timer_ch3         |
|                             | `irqs_i[67]    `    | 1            | `irqs_distributed_319      `                                  | edge-sensitive  | car_adv_timer_events[0]   |
|                             | `irqs_i[68]    `    | 1            | `irqs_distributed_320      `                                  | edge-sensitive  | car_adv_timer_events[1]   |
|                             | `irqs_i[69]    `    | 1            | `irqs_distributed_321      `                                  | edge-sensitive  | car_adv_timer_events[2]   |
|                             | `irqs_i[70]    `    | 1            | `irqs_distributed_322      `                                  | edge-sensitive  | car_adv_timer_events[0]   |
|                             | `irqs_i[71]    `    | 1            | `irqs_distributed_323      `                                  | edge-sensitive  | car_sys_timer_lo          |
|                             | `irqs_i[72]    `    | 1            | `irqs_distributed_324      `                                  | edge-sensitive  | car_sys_timer_hi          |
|                             | `irqs_i[127:73]`    | 54           | `irqs_distributed_331:325  `                                  | -               | tied to 0                 |
| **Cheshire**                |                     |              |                                                               |                 |                           |
|                             | `intr_ext_i[0]    ` | 1            | `pulpcl_eoc             `                                     | level-sensitive | from HMR cluster          |
|                             | `intr_ext_i[2:1]  ` | 2            | `pulpcl_hostd_mbox_intr `                                     | level-sensitive | from HMR cluster          |
|                             | `intr_ext_i[4:3]  ` | 2            | `spatzcl_hostd_mbox_intr`                                     | level-sensitive | from vectorial cluster    |
|                             | `intr_ext_i[6:5]  ` | 2            | `safed_hostd_mbox_intr  `                                     | level-sensitive | from safe domain          |
|                             | `intr_ext_i[8:7]  ` | 2            | `secd_hostd_mbox_intr   `                                     | level-sensitive | from secure domain        |
|                             | `intr_ext_i[9]    ` | 1            | `car_wdt_intrs[0]       `                                     | level-sensitive | from carfield peripherals |
|                             | `intr_ext_i[10]   ` | 1            | `car_wdt_intrs[1]       `                                     | level-sensitive | from carfield peripherals |
|                             | `intr_ext_i[11]   ` | 1            | `car_wdt_intrs[2]       `                                     | level-sensitive | from carfield peripherals |
|                             | `intr_ext_i[12]   ` | 1            | `car_wdt_intrs[3]       `                                     | level-sensitive | from carfield peripherals |
|                             | `intr_ext_i[13]   ` | 1            | `car_wdt_intrs[4]       `                                     | level-sensitive | from carfield peripherals |
|                             | `intr_ext_i[14]   ` | 1            | `car_can_intr           `                                     | level-sensitive | from carfield peripherals |
|                             | `intr_ext_i[15]   ` | 1            | `car_adv_timer_ch0      `                                     | edge-sensitive  | from carfield peripherals |
|                             | `intr_ext_i[16]   ` | 1            | `car_adv_timer_ch1      `                                     | edge-sensitive  | from carfield peripherals |
|                             | `intr_ext_i[17]   ` | 1            | `car_adv_timer_ch2      `                                     | edge-sensitive  | from carfield peripherals |
|                             | `intr_ext_i[18]   ` | 1            | `car_adv_timer_ch3      `                                     | edge-sensitive  | from carfield peripherals |
|                             | `intr_ext_i[19]   ` | 1            | `car_adv_timer_events[0]`                                     | edge-sensitive  | from carfield peripherals |
|                             | `intr_ext_i[20]   ` | 1            | `car_adv_timer_events[1]`                                     | edge-sensitive  | from carfield peripherals |
|                             | `intr_ext_i[21]   ` | 1            | `car_adv_timer_events[2]`                                     | edge-sensitive  | from carfield peripherals |
|                             | `intr_ext_i[22]   ` | 1            | `car_adv_timer_events[3]`                                     | edge-sensitive  | from carfield peripherals |
|                             | `intr_ext_i[23]   ` | 1            | `car_sys_timer_lo       `                                     | edge-sensitive  | from carfield peripherals |
|                             | `intr_ext_i[24]   ` | 1            | `car_sys_timer_hi       `                                     | edge-sensitive  | from carfield peripherals |
|                             | `intr_ext_i[31:25]` | 7            | `0                      `                                     |                 | tied to 0                 |
| `meip_ext_o[0]`             |                     | \-           |                                                               | level-sensitive | unconnected               |
| `meip_ext_o[1]`             |                     | \-           |                                                               | level-sensitive | unconnected               |
| `meip_ext_o[2]`             |                     | \-           |                                                               | level-sensitive | unconnected               |
| `seip_ext_o[0]`             |                     | \-           |                                                               | level-sensitive | unconnected               |
| `seip_ext_o[1]`             |                     | \-           |                                                               | level-sensitive | unconnected               |
| `seip_ext_o[2]`             |                     | \-           |                                                               | level-sensitive | unconnected               |
| `msip_ext_o[0]`             |                     | \-           |                                                               | level-sensitive | unconnected               |
| `msip_ext_o[1]`             |                     | \-           |                                                               | level-sensitive | unconnected               |
| `msip_ext_o[2]`             |                     | \-           |                                                               | level-sensitive | unconnected               |
| `mtip_ext_o[0]`             |                     | \-           |                                                               | level-sensitive | Snitch core #0            |
| `mtip_ext_o[1]`             |                     | \-           |                                                               | level-sensitive | Snitch core #1            |
| `mtip_ext_o[2]`             |                     | \-           |                                                               | level-sensitive | unconnected               |

## Domains

The total number of domains is 7: *host domain*, *safe domain*, *secure domain*, *integer PMCA
domain*, *vectorial PMCA domain*, *peripheral domain*, *dynamic SPM*.

Carfield's domains live in dedicated repositories. We therefore invite the reader to consult the
documentation of each domain.

For more information about domains' memory requirements, visit [Synthesis and physical
implementation](../tg/synth.md).

Below, we focus on domains' parameterization within Carfield.

### [Host domain (Cheshire)](https://github.com/pulp-platform/cheshire)

The *host domain* (Cheshire) embeds all the necessary components required to run OSs such as
embedded Linux. It has two orthogonal *operation modes*.

1. *Untrusted mode*: in this operation mode, the host domain is tasked to run untrusted services,
i.e. non time- and non safety-critical applications. For example, this could be the case of infotainment
on a modern car. In this mode, as in traditional automotive platforms, safety and resiliency
features are deferred to a dedicated 32-bit microcontroller-like system, called `safe domain` in
Carfield.

2. *Hybrid trusted/untrusted mode*: in this operation mode, the host domain is in charge of both
critical and non-critical applications. Key features supported to achieve this are:
  * A virtualization layer, which allows the system to accommodate the execution of multiple OSs,
including rich, Unix-like OSs and Real-Time OSs (RTOS), coexisting on the same HW.
  * Spatial and temporal partitioning of resources: AXI matrix crossbar
	([AXI-REALM](https://arxiv.org/abs/2311.09662)), LLC, TLB, and a `physical tagger` in front of
	the cores to mark partitions by acting directly on the physical address space
  * Runtime configurable data/instruction cache and SPM
  * Fast interrupt handling, with optional interrupt routing through the RISC-V fast interrupt
controller CLIC,
  * Configurable dual core setup between *lockstep* or *SMP* mode.

  Hybrid operation mode is currently experimental, and mostly for research purposes. We advise of
  relying on a combination of host ad safe domain for a more traditional approach.

Cheshire is configured as follows:

* Two 64-bit, RISC-V CVA6 cores, with lightweight self-invalidation cache coherency, fast interrupt
and virtualization support.
* 8 external AXI manager ports (`AxiNumExtSlv`) added to the matrix crossbar:
  - Dynamic SPM port 0
  - Dynamic SPM port 1
  - Safe domain
  - HMR cluster
  - Vectorial cluster
  - Mailbox unit
  - Ethernet
  - Peripherals
* 4 external AXI subordinate ports (`AxiNumExtMst`) added to the matrix crossbar:
  - Safe domain
  - Secure domain
  - HMR cluster
  - Vectorial cluster
* 4 external regbus subordinate ports (`NumTotalRegSlv`):
  - PCRs: control domains enable, clock gate, isolation
  - PLL control registers: for ASIC top-levels, leave unconnected otherwise
  - Padmux control registers: for ASIC top-levels, leave unconnected otherwise
  - Dynamic SPM ECC control registers
* [AXI-REALM](https://arxiv.org/abs/2311.09662) unit for bandwidth regulation and monitoring
  integrated in front of each AXI matrix crossbar manager
* Last-level cache (LLC) with HW spatial partitioning
* 32 *external* input interrupts (`CarfieldNumExtIntrs`), see [Interrupt map](#interrupt-map) in
  addition to Cheshire's own internal interrupts. Unused are tied to 0 (currently 9/32)
* 2 external interruptible harts (`CarfieldNumInterruptibleHarts`). The interruptible harts are
  Snitch core \#0 and \#1 in the vectorial cluster.
* An interrupt router with 1 external target (`CarfieldNUmRouterTargets`), tasked to distribute N
  input interrupts to M targets. In Carfield, the external target is the `safe domain`.
* All Cheshire peripherals, except for VGA

By default, Cheshire hosts 128KiB of hybrid LLC/SPM, user-configurable.

### [Safe domain](https://github.com/pulp-platform/safety_island)

The *safe domain* is a simple MCU-like domain that comprises three 32-bit real-time CV32E40P
(CV32RT) RISC-V cores operating in triple-core-lockstep mode (TCLS).

These cores, enhanced with the RISC-V CLIC controller and optimized for fast interrupt handling and
context switch, run RTOSs and safety-critical applications, embodying a core tenet of the platform
reliability.

The *safe domain* is essential when the *host domain* is operated in *untrusted* mode.

The *safe domain* is configured as follows:

* 1 RISC-V debug module prividing indipendent JTAG interface off-Carfield
* 1 AXI manager and 1 AXI subordinate ports, 32-bit data and 32-bit address wide, to and from the
  *host domain*, respectively. AXI datawidth conversion with the host domain is handled internally
  to the safe domain.
* 1 generic timer, essential for periodic ticks common in RTOSs. The generic timer in the *safe
  domain* is the same integrated in [Carfield's *peripheral domain*](#peripheral-domain).
* CLIC RISC-V interrupt controller; as opposed to Cheshire, currently the CLIC is configured to run
  run in M-mode.
* 128 *external* input interrupts. Unused are tied to 0.
* Fast interrupt extension that extends CV32 with additional logic to accelerate context switching.
  From here, the name [CV32RT](https://arxiv.org/abs/2311.08320)
* 1 32-bit per-core FPU with down to float-16 precision, totaling 3 FPUs

By default, the processing elements share access to 128KiB of SPM for instructions and data,
user-configurable.

### [Secure domain](https://github.com/pulp-platform/opentitan/tree/carfield-soc)

The secure domain, based on the [OpenTitan
project](https://opentitan.org/book/doc/introduction.html), serves as the Hardware Root-of-Trust
(HWRoT) of the platform. It handles *secure boot* and system integrity monitoring fully in HW
through cryptographic acceleration services.

Compared to vanilla OpenTitan, the secure domain integrated in Carfield is modified/configured as follows:

* 1 AXI4 manager interface to Carfield, with a bridge between AXI4 and TileLink Uncached Lightweight
  (TL-UL) internally used by OpenTitan. By only exposing a manager port, unwanted access to the
  secure domain is prevented.

* Embedded flash memory replaced with an SRAM preloaded before secure boot procedure from an
  external SPI flash through OpenTitan private SPI peripheral. Once preload is over, the OpenTitan
  secure boot framework is unchanged compared to the vanilla version.

* Finally, a *boot manager* module has been designed and integrated to manage the [two available
  bootmodes](./sw.md). In **Secure** mode, the systems executes the secure boot framework as soon as
  the reset is asserted, loading code from the external SPI and performing the signature check on
  its content. Otherwise, in **Non-secure** mode, the *secure domain* is clock gated and must be
  clocked and woken-up by an external entity (e.g., *host domain*)

By default, the secure domain hosts 512KiB of main SPM, and 16KiB of OTP memory, user-configurable.

### Accelerator domain

To augment computational capabilities, Carfield incorporates two PMCAs, described below. Both PMCAs
integrate DMA engines to independently fetch data from the on-chip SPM or external DRAM.

#### [HMR integer PMCA](https://github.com/pulp-platform/pulp_cluster/tree/yt/rapidrecovery)

The [hybrid modular redundancy (HMR) *integer PMCA*](https://arxiv.org/abs/2303.08706) is
specialized in accelerating the inference of Deep Learning and Machine Learning models. The
multicore accelerator is built around 12 32-bit RISC-V cores empowered with ISA extensions, enabling
integer arithmetic from 32-bit down to 2-bit precision.

The integer PMCA does not integrate a fully-fledged FPU co-processor. Nevertheless, it features a
highly specialized domain specific accelerator (DSA),
[RedMulE](https://www.sciencedirect.com/science/article/pii/S0167739X23002546), which enables fast
and energy-efficient floating-point GEMM on 16-bit and 8-bit data formats. This makes the PMCA
capable of on-chip training of generalized Deep Learning models.

As part of a MCS, the integer PMCA's general-purpose cores can be reconfigured for *redundant
execution*. A [Hybrid Modular Redundancy (HMR)](https://doi.org/10.1145/3635161) unit allows the
split/lock of the available cores in different redundant configurations during runtime, trading off
the computing performance and the fault resilience capability according to the criticality of the
application.

The PMCA can be configured in multiple redundant modes:
* **Independent:** All cores act independently with no redundancy mechanism. This configuration allows
  higher performance but has no reliability.
* **Dual Modular Redundancy (DMR)**: The cores are grouped in lock-stepped pairs and rely on a
  specialized hardware extension for fast fault recovery in less than 30 clock cycles in case of
  fault detection. The PMCA provides the best trade-off between performance and fault recovery in
  this configuration.
* **Triple Modular Redundancy (TMR)**: The cores are grouped in lock-stepped triplets and rely on
  either hardware extension or software mechanisms to recover from incurring faults. The PMCA
  provides the highest fault resilience in this configuration, at the cost of reduced performance.

By default, the integer PMCA's processing elements and tensor accelerator share access to 256KiB of
L1 SPM, user-configurable.

#### [Vectorial PMCA](https://github.com/pulp-platform/spatz)

The [*vectorial PMCA*, or Spatz PMCA](https://dl.acm.org/doi/abs/10.1145/3508352.3549367) handles
vectorizable multi-format floating-point workloads.

A Spatz vector unit acts as a coprocessor of the [Snitch
core](https://github.com/pulp-platform/snitch_cluster), a tiny RV32IMA core which decodes and
forwards vector instructions to the vector unit.

A Snitch core and a Spatz vector unit are together referred to as *Core Complex (CC)*. The vectorial
PMCA is composed by two CCs, each with the following configuration:

* 2 KiB of latch-based VRF
* 4 transprecision FPUs
* 1 integer processing unit (IPU)

Each FPU supports *FP8*, *FP16*, *FP32*, and *FP64* computation, while the IPU supports 8, 16, 32,
and 64-bit integer computation.

By default, the CCs share access to 128KiB of L1 SPM, user-configurable.

## On-chip and off-chip memory endpoints

### [Dynamic scratchpad memory (SPM)](https://github.com/pulp-platform/dyn_spm)

The dynamic SPM features dynamically switching address mapping policy. It manages the following
features:

* Two AXI subordinate ports
* Two address mapping modes: *interleaved* and *contiguous*
* 4 address spaces, 2 for each port. The address space is used to select the AXI port to use, and
  the mapping mode
* Every address space points to the same physical SRAM through a low-latency matrix crossbar
* ECC-equipped memory banks

By default, Carfield hosts 1MiB of dynamic SPM, user-configurable.

### [Partitionable hybrid LLC/SPM](https://github.com/pulp-platform/axi_llc)

Carfield hosts a LLC optionaly reconfigurable as SPM during runtime. In addition, the LLC supports
HW-based partitioning to exploit intra-process or inter-processes isolation, improving the system's
predictability. The LLC is described in detail in Cheshire's
[Architecture](https://pulp-platform.github.io/cheshire/um/arch).

### [HyperBus off-chip link](https://github.com/pulp-platform/hyperbus)

Carfield integrates a in-house, open-source implementation of Infineon' HyperBus off-chip controller
to connect to external HyperRAM modules.

It manages the following features:

* An AXI interface that attaches to Cheshire's [partitionable hybrid
  LLC/SPM](#partitionable-hybrid-llc-spm)
* A configurable number of physical HyperRAM chips it can be attached to; by default, support for 2
  physical chips is provided
* Support for HyperRAM chips with different densities (from 8MiB to 64MiB per chip aligned with
  specs).

## System bus interconnect

The interconnect is composed of a main [AXI4](https://github.com/pulp-platform/axi) matrix (or
crossbar) with AXI5 atomic operations (ATOPs) support. The crossbar extends Cheshire's with
additional external AXI manager and subordinate ports.

Cheshire's auxiliary [Regbus](https://github.com/pulp-platform/register_interface) demultiplexer is
extended with additional peripheral configuration ports for external PLL/FLL and padmux
configuration, which are specific of ASIC wrappers.

An additional peripheral subsystem based on APB hosts Carfield-specific peripherals.

## [Mailbox unit](https://github.com/pulp-platform/mailbox_unit)

The mailbox unit consists in a number of configurable mailboxes. Each mailbox is the preferred
communication vehicle between *domains*. It can be used to wake-up certain domains, notify an
*offloader* (e.g., Cheshire) that a *target device* (e.g., the integer PMCA) has reached execution
completion, dispatch *entry points* to a *target device* to jump-start its execution, and many
others.

It manages the following features:

* Interrupt based signaling receiver and sender
* A shared memory space common to all the mailboxes, implemented as a single register file.
  Currently, Carfield implements 25 mailboxes.
* Support for 32-bit word aligned read/write access.
* A convenience AXI-Lite wrapper for the configuration port.

---

Assuming each mailbox is identified with id `i`, the register file map reads:

| **Offset**         | **Register**     | **Width (bit)** | **Note**           |
|--------------------|------------------|-----------------|--------------------|
| `0x00 + i * 0x100` | `INT_SND_STAT`   | `1`             | current irq status |
| `0x04 + i * 0x100` | `INT_SND_SET `   | `1`             | set irq            |
| `0x08 + i * 0x100` | `INT_SND_CLR `   | `1`             | clear irq          |
| `0x0C + i * 0x100` | `INT_SND_EN  `   | `1`             | enable irq         |
| `0x40 + i * 0x100` | `INT_RCV_STAT`   | `1`             | current irq status |
| `0x44 + i * 0x100` | `INT_RCV_SET `   | `1`             | set irq            |
| `0x48 + i * 0x100` | `INT_RCV_CLR `   | `1`             | clear irq          |
| `0x4C + i * 0x100` | `INT_RCV_EN  `   | `1`             | enable irq         |
| `0x80 + i * 0x100` | `LETTER0       ` | `32`            | message            |
| `0x8C + i * 0x100` | `LETTER1       ` | `32`            | message            |

The above register map can be found in the dedicated
[repository](https://github.com/pulp-platform/mailbox_uni) and is reported here for convenience.

## Platform control registers

PCRs provide basic system information, and control clock, reset and other functionalities of
Carfield's *domains*.

A more detailed overview of each PCR (register subfields and description) can be found
[here](../../hw/regs/pcr.md). PCR base address is listed in the [Memory Map](#memory-map) as for the
other devices.

| **Name**                         | **Offset** | **Length** | **Description**                                                        |
|:---------------------------------|:-----------|-----------:|:-----------------------------------------------------------------------|
| `VERSION0`                       | `0x0`      |        `4` | Cheshire sha256 commit                                                 |
| `VERSION1`                       | `0x4`      |        `4` | Safety Island sha256 commit                                            |
| `VERSION2`                       | `0x8`      |        `4` | Security Island sha256 commit                                          |
| `VERSION3`                       | `0xc`      |        `4` | PULP Cluster sha256 commit                                             |
| `VERSION4`                       | `0x10`     |        `4` | Spatz CLuster sha256 commit                                            |
| `JEDEC_IDCODE`                   | `0x14`     |        `4` | JEDEC ID CODE                                                          |
| `GENERIC_SCRATCH0`               | `0x18`     |        `4` | Scratch                                                                |
| `GENERIC_SCRATCH1`               | `0x1c`     |        `4` | Scratch                                                                |
| `HOST_RST`                       | `0x20`     |        `4` | Host Domain reset -active high, inverted in HW-                        |
| `PERIPH_RST`                     | `0x24`     |        `4` | Periph Domain reset -active high, inverted in HW-                      |
| `SAFETY_ISLAND_RST`              | `0x28`     |        `4` | Safety Island reset -active high, inverted in HW-                      |
| `SECURITY_ISLAND_RST`            | `0x2c`     |        `4` | Security Island reset -active high, inverted in HW-                    |
| `PULP_CLUSTER_RST`               | `0x30`     |        `4` | PULP Cluster reset -active high, inverted in HW-                       |
| `SPATZ_CLUSTER_RST`              | `0x34`     |        `4` | Spatz Cluster reset -active high, inverted in HW-                      |
| `L2_RST`                         | `0x38`     |        `4` | L2 reset -active high, inverted in HW-                                 |
| `PERIPH_ISOLATE`                 | `0x3c`     |        `4` | Periph Domain  AXI isolate                                             |
| `SAFETY_ISLAND_ISOLATE`          | `0x40`     |        `4` | Safety Island AXI isolate                                              |
| `SECURITY_ISLAND_ISOLATE`        | `0x44`     |        `4` | Security Island AXI isolate                                            |
| `PULP_CLUSTER_ISOLATE`           | `0x48`     |        `4` | PULP Cluster AXI isolate                                               |
| `SPATZ_CLUSTER_ISOLATE`          | `0x4c`     |        `4` | Spatz Cluster AXI isolate                                              |
| `L2_ISOLATE`                     | `0x50`     |        `4` | L2 AXI isolate                                                         |
| `PERIPH_ISOLATE_STATUS`          | `0x54`     |        `4` | Periph Domain AXI isolate status                                       |
| `SAFETY_ISLAND_ISOLATE_STATUS`   | `0x58`     |        `4` | Safety Island AXI isolate status                                       |
| `SECURITY_ISLAND_ISOLATE_STATUS` | `0x5c`     |        `4` | Security Island AXI isolate status                                     |
| `PULP_CLUSTER_ISOLATE_STATUS`    | `0x60`     |        `4` | PULP Cluster AXI isolate status                                        |
| `SPATZ_CLUSTER_ISOLATE_STATUS`   | `0x64`     |        `4` | Spatz Cluster AXI isolate status                                       |
| `L2_ISOLATE_STATUS`              | `0x68`     |        `4` | L2 AXI isolate status                                                  |
| `PERIPH_CLK_EN`                  | `0x6c`     |        `4` | Periph Domain clk gate enable                                          |
| `SAFETY_ISLAND_CLK_EN`           | `0x70`     |        `4` | Safety Island clk gate enable                                          |
| `SECURITY_ISLAND_CLK_EN`         | `0x74`     |        `4` | Security Island clk gate enable                                        |
| `PULP_CLUSTER_CLK_EN`            | `0x78`     |        `4` | PULP Cluster clk gate enable                                           |
| `SPATZ_CLUSTER_CLK_EN`           | `0x7c`     |        `4` | Spatz Cluster clk gate enable                                          |
| `L2_CLK_EN`                      | `0x80`     |        `4` | Shared L2 memory clk gate enable                                       |
| `PERIPH_CLK_SEL`                 | `0x84`     |        `4` | Periph Domain pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll)   |
| `SAFETY_ISLAND_CLK_SEL`          | `0x88`     |        `4` | Safety Island pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll)   |
| `SECURITY_ISLAND_CLK_SEL`        | `0x8c`     |        `4` | Security Island pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll) |
| `PULP_CLUSTER_CLK_SEL`           | `0x90`     |        `4` | PULP Cluster pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll)    |
| `SPATZ_CLUSTER_CLK_SEL`          | `0x94`     |        `4` | Spatz Cluster pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll)   |
| `L2_CLK_SEL`                     | `0x98`     |        `4` | L2 Memory pll select (0 -> host pll, 1 -> alt PLL, 2 -> per pll)       |
| `PERIPH_CLK_DIV_VALUE`           | `0x9c`     |        `4` | Periph Domain clk divider value                                        |
| `SAFETY_ISLAND_CLK_DIV_VALUE`    | `0xa0`     |        `4` | Safety Island clk divider value                                        |
| `SECURITY_ISLAND_CLK_DIV_VALUE`  | `0xa4`     |        `4` | Security Island clk divider value                                      |
| `PULP_CLUSTER_CLK_DIV_VALUE`     | `0xa8`     |        `4` | PULP Cluster clk divider value                                         |
| `SPATZ_CLUSTER_CLK_DIV_VALUE`    | `0xac`     |        `4` | Spatz Cluster clk divider value                                        |
| `L2_CLK_DIV_VALUE`               | `0xb0`     |        `4` | L2 Memory clk divider value                                            |
| `HOST_FETCH_ENABLE`              | `0xb4`     |        `4` | Host Domain fetch enable                                               |
| `SAFETY_ISLAND_FETCH_ENABLE`     | `0xb8`     |        `4` | Safety Island fetch enable                                             |
| `SECURITY_ISLAND_FETCH_ENABLE`   | `0xbc`     |        `4` | Security Island fetch enable                                           |
| `PULP_CLUSTER_FETCH_ENABLE`      | `0xc0`     |        `4` | PULP Cluster fetch enable                                              |
| `SPATZ_CLUSTER_DEBUG_REQ`        | `0xc4`     |        `4` | Spatz Cluster debug req                                                |
| `HOST_BOOT_ADDR`                 | `0xc8`     |        `4` | Host boot address                                                      |
| `SAFETY_ISLAND_BOOT_ADDR`        | `0xcc`     |        `4` | Safety Island boot address                                             |
| `SECURITY_ISLAND_BOOT_ADDR`      | `0xd0`     |        `4` | Security Island boot address                                           |
| `PULP_CLUSTER_BOOT_ADDR`         | `0xd4`     |        `4` | PULP Cluster boot address                                              |
| `SPATZ_CLUSTER_BOOT_ADDR`        | `0xd8`     |        `4` | Spatz Cluster boot address                                             |
| `PULP_CLUSTER_BOOT_ENABLE`       | `0xdc`     |        `4` | PULP Cluster boot enable                                               |
| `SPATZ_CLUSTER_BUSY`             | `0xe0`     |        `4` | Spatz Cluster busy                                                     |
| `PULP_CLUSTER_BUSY`              | `0xe4`     |        `4` | PULP Cluster busy                                                      |
| `PULP_CLUSTER_EOC`               | `0xe8`     |        `4` | PULP Cluster end of computation                                        |
| `ETH_RGMII_PHY_CLK_DIV_EN`       | `0xec`     |        `4` | Ethernet RGMII PHY clock divider enable bit                            |
| `ETH_RGMII_PHY_CLK_DIV_VALUE`    | `0xf0`     |        `4` | Ethernet RGMII PHY clock divider value                                 |
| `ETH_MDIO_CLK_DIV_EN`            | `0xf4`     |        `4` | Ethernet MDIO clock divider enable bit                                 |
| `ETH_MDIO_CLK_DIV_VALUE`         | `0xf8`     |        `4` | Ethernet MDIO clock divider value                                      |

## Peripherals

Carfield enhances Cheshire's peripheral subsystem with additional capabilities.

An external AXI manager port is attached to the matrix crossbar. The 64-bit data, 48-bit address AXI
protocol is converted to the slower, 32-bit data and address APB protocol. An APB demultiplexer
allows attaching several peripherals, described below.

### Generic and advanced timer

Carfield integrates a generic timer and an advanced timer.

The [*generic timer*](https://github.com/pulp-platform/timer_unit) manages the following features:

- 2 general purpose 32-bit up counter timers
- Input trigger sources:
	 - FLL/PLL clock
	 - FLL/PLL clock + Prescaler
	 - Real-time clock (RTC) at crystal frequency (32kHz) or higher
	 - External event
- 8-bit programmable prescaler to FLL/PLL clock
- Counting modes:
	 - One shot mode: timer is stopped after first comparison match
	 - Continuous mode: timer continues counting after comparison match
	 - Cycle mode: timer resets to 0 after comparison match and continues counting
	 - 64 bit cascaded mode
- Interrupt request generation on comparison match

For more information, read the dedicated
[documentation](https://github.com/pulp-platform/timer_unit/blob/master/doc/TIMER_UNIT_reference.xlsx).

The [*advanced timer*](https://github.com/pulp-platform/apb_adv_timer) manages the following
features:

* 4 timers with 4 output signal channels each
* PWM generation functionality
* Multiple trigger input sources:
   - output signal channels of all timers
   - 32 GPIOs
   - Real-time clock (RTC) at crystal frequency (32kHz) or higher
   - FLL/PLL clock
  In Carfield, we rely on a RTC.
* Configurable input trigger modes
* Configurable prescaler for each timer
* Configurable counting mode for each timer
* Configurable channel threshold action for each timer
* 4 configurable output events
* Configurable clock gating of each timer

For more information, read the dedicated
[documentation](https://github.com/pulp-platform/apb_adv_timer/blob/master/doc/APB_ADV_TIMER_reference.xlsx).

### Watchdog timer

We employ the watchdog timer developed by the [OpenTitan
project](https://opentitan.org/book/doc/introduction.html) project. It manages the following
features:

* Two 32-bit upcounting timers: one timer functions as a wakeup timer, one as a watchdog timer
* 2 thresholds: *bark* (generates an interrupt) and *bite* (resets core)
* A 12 bit pre-scaler for the wakeup timer to enable very long timeouts

For more information, read the dedicated
[documentation](https://opentitan.org/book/hw/ip/aon_timer/).

### CAN

We employ a CAN device developed by the [Czech Technical
University](https://github.com/AlSaqr-platform/can_bus/tree/pulp) in Prague. It manages the
following features:

* CAN 2.0, CAN FD 1.0 and ISO CAN FD
* Avalon memory bus
* Timestamping and transmission at given time
* Optional event and error logging
* Fault confinement state manipulation
* Transceiver delay measurement
* Variety of interrupt sources
* Filtering of received frame
* Listen-only mode, Self-test mode, Acknowledge forbidden mode
* Up to 14 Mbit in “Data” bit-rate (with 100 Mhz Core clock)

For more information, read the dedicated
[documentation](https://github.com/AlSaqr-platform/can_bus/tree/pulp/doc)

### Ethernet

We employ Ethernet IPs developed by [Alex
Forencich](https://github.com/alexforencich/verilog-ethernet) and assemble them with a
high-performant DMA, the same used in Cheshire.

We use Reduced gigabit media-independent interface (RGMII) that supports speed up to 1000Mbit/s
(1GHz).

For more information, read the dedicated
[documentation](http://alexforencich.com/wiki/en/verilog/ethernet/start) of Ethernet components from
its original repository.

## Clock and reset

![Reset and Clock Distribution for a domain *X*](../img/clk_rst.svg)

![Isolation for a domain *X*](../img/isolation.svg)

The two figures above show the clock, reset and isolation distribution for a *domain* `X` in
Carfield, and their relationship. A more detailed description is provided below.

### Clock distribution scheme, clock gating and isolation

Carfield is provided with 3 clocks sources. They can be fully asynchronous and not bound to any
phase relationship, since dual-clock FIFOs are placed between domains to allow clock domain crossing
(CDC):

* `host_clk_i`: preferably, clock of the *host domain*
* `alt_clk_i`: preferably, clock of *alternate* domains, namely *safe domain*, *secure domain*,
  *accelerator domain*
* `per_clk_i`: preferably, clock of *peripheral domain*

In addition, a real-time clock (RTC, `rt_clk_i`) is provided externally, at crystal frequency
(32kHz) or higher.

These clocks are supplied externally, by a dedicated PLL per clock source or by a single PLL that
supplies all three clock sources. The configuration of the clock source can be handled by the
external PLL wrapper configuration registers, e.g. in a ASIC top level

Regardless of the specific name used for the clock signals in HW, Carfield has a flexible clock
distribution that allows each of the 3 clock sources to be assigned to a *domain*, as explained
below.

---

As the top figure shows, out of the 7 *domains* described in [Domains](#domains), 6 can be clock
gated and *isolated*: *safe domain*, *secure domain*, *accelerator domain*, *peripheral domain*,
*dynamic SPM*.

When *isolation* for a domain `X` is enabled, data transfers towards a domain are terminated and
never reach it. To achieve this, an AXI4 compliant *isolation* module is placed in front of each
domain. The bottom figure shows in detail the architecture of the isolation scheme between the *host
domain* and a generic `X` domain, highlighting its relationship with the domain's reset and cloc
signals.

For each of the 6 clock gateable domains, the following clock distribution scheme applies:

1. The user selects one of the 3 different clock sources
2. The selected clock source for the domain is fed into a default-bypassed arbitrary integer clock
   divider with 50% duty cycle. This allows to use different integer clock divisions for every
   target domain to use different clock frequencies
3. The internal clock gate of the clock divider is used to provide clock gating for the domain.

HW resources for the clock distribution (steps 1., 2., and 3.) and isolation of a domain `X`, are
SW-controlled via dedicated PCRs. Refer to [Platform Control Registers](#platform-control-registers)
in this page for more information.

The only domain that is always-on and de-isolated is the *host domain* (Cheshire). If required,
clock gating and/or isolation of it can be handled at higher levels of hierarchy, e.g. in a
dedicated ASIC wrapper.

### Startup behavior after Power-on reset (POR)

The user can decide whether *secure boot* must be performed on the executing code before runtime. If
so, the *secure domain* must be active after POR, i.e., clocked and de-isolated. This behavior is
regulated by the input pin `secure_boot_i` according to the following table:

| `secure_boot_i` | **Secure Boot** | **System status after POR**                                                                                                                       |
|:----------------|----------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------|
| `0`             |           `OFF` | *secure domain* gated and isolated as the other 5 domains, *host domain* always-on and idle                                                       |
| `1`             |            `ON` | *host domain* always-on and idle, *secure domain* active, takes over *secure boot* and can't be warm reset-ed; other 5 domains gated and isolated |

Regardless of the value of `secure_boot_i`, since by default some domains are clock gated and
isolated after POR, SW or external physical interfaces (JTAG/Serial Link) must handle their wake-up
process. Routines are provided in the [Software Stack](../../sw/include/car_util.h).

### Reset distribution scheme

Carfield is provided with one POR (active-low), `pwr_on_rst_ni`, responsible for the platform's
*cold reset*.

The POR is synchronized with the clock of each domain, user-selected as explained above, and
propagated to the domain.

In addition, a *warm reset* can be initiated from SW through the PCRs for each domain. Exceptions to
this are the *host domain* (always-on), and the *secure domain* when `secure_boot_i` is asserted.
