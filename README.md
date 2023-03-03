# Carfield

Home of the Carfield SoC. 

## Simulation

To launch a simulation, you need to perform a couple of steps.

 * `bender update` to fetch the dependencies
 * `make chs-hw-all` to generate the needed hardware in `cheshire`
 * `export RISCV=/path/to/rv64gc_zfincei/toolchain` which is under `/usr/pack/riscv-1.0-kgf/riscv64-gcc-11.2.0` in IIS machines
 * `export RISCV_GCC_BINROOT=$RISCV/bin`
 * `make chs-sw-all` to compile the libraries and test within `cheshire/sw`
 * either download the freely-available Hyperram models from [here](https://www.cypress.com/documentation/models/verilog/s27kl0641-s27ks0641-verilog) and unzip them according to the bender or `make tb/hyp_vip` to fetch the `.sv` model of the memories
 * `make chs-sim-all`
 * `make scripts/carfield_compile.tcl` to generate the scripts for Questasim
 * `make hw-build` to compile carfield
 * `make hw-sim elf-bin=/path/to/compiled.elf` to run the desired test binary


