# Simulation

This page describes how to simulate Carfield to execute baremetal programs. Please first read
[Getting Started](../gs.md) to make sure you have all the dependencies and initialized your
repository.

We currently provide working setups for:

- Questa Advanced Simulator (QuestaSim) `>= 2022.3`

We plan on supporting more simulators in the future. If your situation requires it, simulating
Carfield on other setups should be straightforward.

## Testbench

Carfield comprises several bootable domains, that are described in the
[Architecture](../um/arch.md#domains) section.

Each of these domains can be independently booted by keeping the rest of the SoC asleep through the
domain JTAG, or Cheshire's JTAG and Serial Link, which have access to the whole platform except for
the *secure domain*.

Alternatively, some domains can offload baremetal programs to other domains at runtime. This is
common pratice when offloading programs to the *accelerator domain* from the *host* or *safe
domains*.

Note that while runtime offloading can be exploited by RTL simulation with reasonably-sized
programs, we suggest to follow the [FPGA mapping](xilinx.md) steps and use [OpenMP-based
offload](../um/sw.md) with heterogeneous cross-compilation.

---

We provide a single SystemVerilog testbench for `carfield_soc` that handles standalone execution of
baremetal programs for each domain. The code for domain `X` is preloaded through simulated interface
drivers. In addition, some domains can read from external memory models from their boot ROM and then jump to
execution.

As for Cheshire, Carfield testbench employs physical interfaces (JTAG or Serial Link) for memory
preload by default. This could increase the memory preload time (independently from the target
memory: dynamic SPM, LLC-SPM, or DRAM), significantly based on the ELF size. 

Since by default all domains are clock gated and isolated after POR except for the *host domain*
(Cheshire), as described in [Architecture](../um/arch.md), the testbench handles the wake-up
process.

To speed up the process, the external DRAM can be initialized in simulation (namely, at time `0ns`)
for domain `X` through the make variable `HYP_USER_PRELOAD`. Carfield [SW Stack](../um/sw.md)
provides automatic generation of the required `*.slm` files, targeting an HyperRAM configured with
two physical chips. Note, this flow is **not** recommended during ASIC development cycle as it may
hide bugs in the physical interfaces.

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
executed on the *host domain* (Cheshire, i.e., `X=CHS`):

```tcl
# Initialize Carfield
make car-init-all

# Enter Questasim folder
cd target/sim/vsim

# Compile the design
make car-vsim-sim-build

# Preload `helloworld.car.l2.elf` in passive bootmode through serial link, then start the simulation
make car-vsim-sim-run CHS_BOOTMODE=0 CHS_PRELMODE=1 CHS_BINARY=../../../sw/tests/bare-metal/hostd/helloworld.car.l2.elf
```

The design needs to be recompiled only when hardware is changed.

To clean simulation builds, from the `vsim` folder run

```tcl
make car-vsim-sim-clean
```

To display general help for each *Make* target, type

```tcl
make help
```

### Debugging

Per default, Questasim compilation is performance-optimised, and GUI and simulation logging are
disabled. To enable full visibility, logging, and the Questa GUI, set `DEBUG=1` when launching the
simulation.
