# Carfield

Home of the Carfield SoC.

## Dependencies
To handle project dependencies, you can use [bender](https://github.com/pulp-platform/bender).

## Simulation

Do the following steps to launch a Carfield simulation:

 * `bender update` to fetch the required dependencies.
 * `make chs-hw-all` to generate the needed hardware in `Cheshire` (Carfield top-level).
 * `export RISCV=/path/to/rv64gc_zfincei/toolchain` which is under `/usr/pack/riscv-1.0-kgf/riscv64-gcc-11.2.0` in IIS machines.
 * `export RISCV_GCC_BINROOT=$RISCV/bin`.
 * `make chs-sw-all` to compile the libraries and tests within `cheshire/sw`.
 * either download the freely-available Hyperram models from [here](https://www.cypress.com/documentation/models/verilog/s27kl0641-s27ks0641-verilog) and unzip them according to the bender or, if you have access to iis-gitlab, `make tb/hyp_vip` to fetch the `.sv` model of the memories.
 * `make chs-sim-all`.
 * `make hw-build` generate compile scripts for Questasim and compile Carfield.
 * It is also possible to run `make scripts/carfield_compile.tcl` to re-generate the compile script when doing hardware modfications.
 * Finally, run `make hw-sim testname=<testname> memtype=<memtype>` (e.g. `make hw-sim testname=axi_llc memtype=dram`) to run one of the tests available under `cheshire/sw/tests`.
 * As an alternative, you can run `make hw-sim elf-bin=<path/to/compiled.elf>` to run any desired test binary.
