# SoC Integration

Carfield is a complex platform, therefore the case of it being integrated in larger SoCs is rare. A
more common scenario is the use of Carfield in a ASIC wrapper that includes bidirectional pads,
clock generation blocks (PLLs, FLLs...) or other circuitry.

This page explain how to integrate Carfield to fulfill on of these needs. Since Carfield heavily
relies on Cheshire, for better understanding we suggest to integrate this reading with its
equivalent in the Cheshire's documentation.

## Using Carfield In Your Project

As for internal targets, Carfield *must be built* before use in external projects. We aim to
simplify this as much as possible with a portable *make fragment*, `carfield.mk`.

If you use GNU Make to build your project and Bender to handle dependencies, you can include the
Carfield build system into your own makefile with:

```make
include $(shell bender path carfield)/carfield.mk
```

All of Carfield's build targets are available with the prefix `car-`.

You can leverage this to ensure your Carfield build is up to date and rebuild hardware and software
whenever necessary. You can change the default value of any build parameter, replace source files to
adapt Carfield, or reuse parts of its build system, such as the software stack or the register and
ROM generators.

## Instantiating Carfield

A minimal clean instantiation would look as follows:

```systemverilog
`include "cheshire/typedef.svh"

// Define function to derive configuration from defaults.
// This could also (preferrably) be done in a system package.
function automatic cheshire_pkg::cheshire_cfg_t gen_cheshire_cfg();
  cheshire_pkg::cheshire_cfg_t ret = cheshire_pkg::DefaultCfg;
  // Make overriding changes. Here, we add two AXI manager ports
  ret.AxiExtNumMst = 2;
  return ret;
endfunction

localparam cheshire_cfg_t CheshireCfg = gen_cheshire_cfg();

// Generate interface types prefixed by `csh_` from our configuration.
`CHESHIRE_TYPEDEF_ALL(csh_, CheshireCfg)

// Instantiate Cheshire with our configuration and interface types.
  carfield      #(
	.Cfg         ( DutCfg    ),
	.HypNumPhys  ( NumPhys   ),
	.HypNumChips ( NumChips  ),
	.reg_req_t   ( reg_req_t ),
	.reg_rsp_t   ( reg_rsp_t )
  ) dut                       (
  // ... IOs here ...
  );
```

## Verifying Cheshire In-System

To simplify the simulation and verification of Carfield in other systems, we provide a monolithic
block of verification IPs called `carfield_vip`. This is used along with the `X_vip` modules of
other domains, such as Cheshire, Safe domain and Secure domain. Their description can be found in
the associated domain's documentation. In particular, `carfield_ip` currently includes:

* Preloadable Cypress HyperRAM models (used to simulate boot).

Additionally, we provide a module `carfield_vip_tristate` which adapts the unidirectional IO of this
module to bidirectional IOs which may be interfaced with pads where necessary.
