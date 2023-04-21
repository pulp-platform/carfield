# Carfield

Home of the Carfield SoC. This repository uses
[`Cheshire`](https://github.com/pulp-platform/cheshire) to build a
mixed-criticality SoC targeting the automotive domain.

## Dependencies
To handle project dependencies, you can use
[bender](https://github.com/pulp-platform/bender).

## Carfield Initialization
To initialize Carfield, do the following:
 * Export the `RISCV` environment variable to the RISC-V toolchain. To work on IIS machines,
 do `export RISCV=/usr/pack/riscv-1.0-kgf/riscv64-gcc-11.2.0`.
 * Execute the command `make car-init` that will take care of:
   ** Clone all the Carfield dependencies;
   ** Initialize the [Cheshire SoC](https://github.com/pulp-platform/cheshire). This can be
      done separately by running `make chs-init`
   ** Downloads the Hyperram models from the iis-gitlab. If you don't have access to it, you
      can also download the freely-available Hyperram models from
      [here](https://www.cypress.com/documentation/models/verilog/s27kl0641-s27ks0641-verilog)
      and unzip them according to the bender.

## Simulation

Do the following steps to launch a Carfield simulation:
 * `make car-hw-build` to generate the compile scripts for Questasim and compile
   Carfield.
 * It is also possible to run `make -B scripts/carfield_compile.tcl` to re-generate
   the compile script when doing hardware modfications.
 * Run `make car-hw-sim testname=<testname> memtype=<memtype>` (e.g.
   `make car-hw-sim testname=axi_llc memtype=dram`) to run one of the tests
   available under the Carfield test folder or the Cheshire one.
 * As an alternative, you can run `make car-hw-sim elf-bin=<path/to/compiled.elf>`
   to run any desired test binary.
