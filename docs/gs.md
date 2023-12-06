# Getting Started

We first discuss the Carfield's project structure, its dependencies, and how to 
build it.

## Cheshire documentation

Carfield relies on Cheshire, our 64-bit RISC-V host SoC. Please follow the 
[Cheshire documentation](https://pulp-platform.github.io/cheshire/gs/) for more 
details concerning the host and Linux. 

## Repository structure

The project is structured as follows:

| Directory | Description                                | Documentation          |
| --------- | ------------------------------------------ | ---------------------  |
| `doc`     | Documentation                              | [Home](index.md)       |
| `hw`      | Hardware sources as SystemVerilog RTL      | todo                   |
| `scripts` | Some helper scripts for bash and EDA tools |                        |
| `sw`      | Software stack, build setup, and tests     | todo                   |
| `target`  | Simulation, FPGA, and ASIC target setups   | [Targets](tg/index.md) |
| `tb`      | Testbench sources as SystemVerilog RTL     |                        |
| `utils`   | Utility scripts                            |                        |

## Dependencies

To *build* Carfield, you will need:

- GNU Make `>= 3.82`
- Python `>= 3.9`
- Bender `>= 0.27.1`
- RISCV GCC `>= 11.2.0`
- Python packages in `requirements.txt`

We use [Bender](https://github.com/pulp-platform/bender) for hardware IP and 
dependency management; for more information on using Bender, please see its 
documentation. You can install Bender directly through the Rust package manager 
Cargo:

```
cargo install bender
```

Depending on your desired target, additional dependencies may be needed.

## Building Carfield

You first need to fetch and generate software and hardware sources for all the 
IPs.
Run the following command:

```bash
make car-init
```

It will take care of:

1. Clone all the Carfield dependencies;
2. Initialize the [Cheshire SoC](https://github.com/pulp-platform/cheshire). 
This can be done separately by running `make chs-init`
3. Downloads the Hyperram models from the iis-gitlab. If you don't have access 
to it, you can also download the freely-available Hyperram models from 
[here](https://www.cypress.com/documentation/models/verilog/s27kl0641-s27ks0641-
verilog) and unzip them according to the bender.
4. Create the following symbolic links to the main IPs local repositories : 
`cheshire`, `pulp_cluster`, `safety-island` and `spatz`,


Check that you have a RISCV toolchain for both RV64 and RV32 ISAs. For ETH, 
type:
```
source scripts/env-iis.sh
```

Running `car-init` is *required* at least once to correctly configure IPs we 
depend on. On reconfiguring any generated hardware or changing IP versions, 
`car-init` should be rerun.

To build different parts of Carfield, the `carfield.mk` Makefile defines the 
following targets (example usages will be given in [Targets](tg/index.md)):

- `car-hw-build` - generated hardware, including IPs and boot ROM
- `car-sw-build` - all the software target all the islands
- `car-hw-sim` - scripts and external models for simulation
- `car-xil-all` - build FPGA bitstream

The following additional targets are not invoked by the above, but also 
available:

- `chs-bootrom-all` - rebuilds Cheshire's boot ROM. This is not done by default 
as reproducible builds (as checked by CI) can only be guaranteed for fixed 
compiler versions.
    - *Note that all the host related targets are available with chs-\* and 
documented in Cheshire's documentation.*
- `nonfree-init` - clones our internal repository with nonfree resources we 
cannot release, including our internal CI. *This is not necessary to use 
Carfield*.

## Targets

A *target* is an end use for Carfield. Each target requires different steps 
from here; read the page for your desired target in the following 
[Targets](tg/index.md) chapter.
