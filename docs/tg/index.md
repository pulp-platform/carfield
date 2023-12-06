# Targets

A *target* refers to an end use of Carfield. This could be a simulation setup, 
an FPGA or ASIC implementation, or the integration into other SoCs.

Target setups can either be *included* in this repository or live in an 
*external* repository and use Cheshire as a dependency.

## Included Targets

Included target setups live in the `target` directory. The associated make 
targets `<target>-all`  set up necessary resources and scripts before use.

Each included target has a *documentation page* in this chapter:

- [Simulation](sim.md)
- [Xilinx FPGAs](xilinx.md)
