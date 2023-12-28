# Getting Started

We first discuss the Carfield's project structure, its dependencies, and how to build it.

## Repository structure

The project is structured as follows:

| Directory | Description                                | Documentation         |
| --------- | ------------------------------------------ | --------------------- |
| `doc`     | Documentation                              | [Home](index.md)      |
| `hw`      | Hardware sources as SystemVerilog RTL      | [Architecture](um/arch.md) |
| `sw`      | Software stack, build setup, and tests     | [Software Stack](um/sw.md) |
| `target`  | Simulation, FPGA, and ASIC target setups   | [Targets](tg/index.md) |
| `utils`   | Utility scripts                            |                        |
| `scripts` | Some helper scripts for env setup          |                        |

## Dependencies

To *build* Carfield, you will need:

- GNU Make `>= 3.82`
- Python `>= 3.9`
- Bender `>= 0.27.1`
- RISCV GCC `>= 11.2.0`
- Python packages in `requirements.txt`

We use [Bender](https://github.com/pulp-platform/bender) for hardware IP and dependency management;
for more information on using Bender, please see its documentation. You can install Bender directly
through the Rust package manager Cargo:

```
cargo install bender
```

Depending on your desired target, additional dependencies may be needed.

## Building Carfield

To build different parts of Carfield, the `carfield.mk` run `make` followed by these targets:

- `car-hw-init`: generated hardware, including IPs and boot ROM
- `car-sim-init`(†):  scripts and external models for simulation
- `car-sw-build` (‡): bare-metal software running on the hardware

† *`car-sim-init` will download externally provided peripheral simulation models, some proprietary
and with non-free license terms, from their publically accessible sources. By running
`car-sim-init`, you accept this.*

‡ *`car-sw-build` requires RV64 and RV32 toolchains. See the [Software Stack](um/sw.md) for more
  details.*

To run all build targets above (†)(‡):

```
make car-init
```

Running `car-init` is *required* at least once to correctly configure IPs we depend on. On
reconfiguring any generated hardware or changing IP versions, `car-init` should be rerun.

The following additional targets are not invoked by the above, but also available:

- `chs-bootrom-all` - rebuilds Cheshire's boot ROM. This is not done by default as reproducible
builds (as checked by CI) can only be guaranteed for fixed compiler versions.
- `car-nonfree-init` - clones our internal repository with nonfree resources we cannot release,
including our internal CI or technology-specific standard cells, scripts and tools. *This is not
necessary to use Carfield*.

### Note
Carfield uses [`Cheshire`](https://github.com/pulp-platform/cheshire) as main dependency. Compared
to the other dependencies, Cheshire provides most of the HW/SW infrastructure used by Carfield. All
Cheshire's `make` targets, described in the dedicated documentation, are available in Carfield
through the inclusion of the makefrag `cheshire.mk` in `carfield.mk`.

## Targets

A *target* is an end use for Carfield. Each target requires different steps from here; read the page
for your desired target in the following [Targets](tg/index.md) chapter.
