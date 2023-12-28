# Simulation

This page describes how to simulate Carfield to execute baremetal programs. Please first read
[Getting Started](../gs.md) to make sure you have all the dependencies and initialized your
repository.

We currently provide working setups for:

- Questa Advanced Simulator (QuestaSim) `>= 2022.3`

We plan on supporting more simulators in the future. If your situation requires it, simulating
Cheshire on other setups should be straightforward.

## Testbench

Carfield comprises several bootable domains, that are described in the
[Architecture](../um/arch.md#domains) section. Each of these domains can be independently booted by
keeping the rest of the SoC asleep. Alternatively, some domains can offload baremetal programs to
other domains at runtime.

Note that while runtime offloading can be exploited by RTL simulation with reasonably-sized
programs, we suggest to follow the [FPGA mapping](xilinx.md) steps for OS-based offload based on
OpenMP with heterogeneous cross-compilation.

We provide a single SystemVerilog testbench for `carfield_soc` that handles standalone execution of
baremetal programs for each domain. The code for domain `X` is preloaded through simulated interface
drivers. In addition, some domains can read from external memory models from their boot ROM and then jump to
execution.

### Passive boot

| `X`                                       | `X_BOOTMODE` | `X_PRELMODE` | Action                  |
| ----------------------------------------- | ---------- | ---------- | --------------------------- |
| `CHS`, `SAFED`, `SECD`, `PULPD`, `SPATZD` | 0          | 0          | Preload through JTAG        |
| `CHS`, `SAFED`, `SECD`, `PULPD`, `SPATZD` | 0          | 1          | Preload through serial link |

Preloading boot modes expect an ELF executable to be passed through `X_BINARY`.

### Autonomous boot

| `X`           | `CHS_BOOTMODE` | `CHS_PRELMODE` | Action                                                |
| ------------- | -------------- | -------------- | ----------------------------------------------------- |
| `CHS`         | 0              | 2              | Preload through UART                                  |
| `CHS`         | 1-3            | -              | Autonomous boot, see [Boot ROM](../um/sw.md#boot-rom) |

Autonomous boot modes expect a disk image (GPT formatted or raw code) to be passed through
`X_IMAGE`. For more information on how to build software for Carfield and the details on the boot
process of each domain, see [Software Stack](../um/sw.md).

For simulation of Carfield in other designs, or in ASIC wrappers that reside in other repositories,
we provide the module `carfield_vip` encapsulating all verification IPs and their interfaces.

## QuestaSim

After building Carfield, the design can be compiled and simulated with QuestaSim. Below, we provide
an example with `Serial Link` passive preload of a baremetal program `helloworld.car.l2.elf` to be
executed on the Cheshire domain (`X=CHS`):

```tcl
# Compile design
make car-hw-build

# Preload `helloworld.spm.elf` through serial link, then start and run simulation
make car-hw-sim CHS_BOOTMODE=0 CHS_PRELMODE=1 CHS_BINARY=./sw/tests/bare-metal/hostd/helloworld.car.l2.elf
```

The design needs to be recompiled only when hardware is changed.

### Debugging

Per default, Questasim compilation is performance-optimised, and GUI and simulation logging are
disabled. To enable full visibility, logging, and the Questa GUI, set `DEBUG=1` when executing the
steps above.
