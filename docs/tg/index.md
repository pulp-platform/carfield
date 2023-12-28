# Targets

A *target* refers to an end use of Carfield. This could be a simulation setup, an FPGA or ASIC
implementation, or the less common integration into other SoCs.

Target setups can either be *included* in this repository or live in an *external* repository and
use Cheshire as a dependency.

## Included Targets

Included target setups live in the `target` directory. Each included target has a *documentation
page* in this chapter:

- [Simulation](sim.md)
- [Synthesis](synth.md)
- [Xilinx FPGAs](xilinx.md)

## External Targets

For ASIC implementation target, where an additional wrapper is needed for clock generation blocks,
bidirectional pads or additional circuitry, or the less common integration into larger SoCs,
Carfield may be included either as a Bender dependency or Git submodule. For further information and
best pratices, see [SoC Integration](integr.md).
