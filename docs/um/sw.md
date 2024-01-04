# Software Stack

Carfield's Software Stack is provided in the `sw/` folder, organized as follows:

```
TODO add tree
```

Employing Cheshire as *host domain*, Carfield's software stack is largely based on, and built on top
of, [Cheshire's](https://pulp-platform.github.io/cheshire/um/sw/).

This means that it shares the same:

* Baremetal programs (BMPs) build flow
* Boot Flow (*passive* and *autonomous* boot)
* Boot ROM
* Zero-Stage Loader
* OpenSBI Firmware
* Linux

Therefore, we defer the reader to Cheshire's Software Stack description for more information.

Programs compiled for Carfield that requiree additional, Carfield-specific drivers (for domains'
offload, peripheral control, etc) are linked against Cheshire's static library (`libcheshire.a`).
This operation is transparent to the programmer, that can take advantage of Cheshire's device
drivers and SW routines within Carfield seamlessly.

Provided the equivalence and reuse between Carfield and Cheshire, in this page we focus on
Carfield-specific SW components and build flow, with an emphasis on domains different than Cheshire.

# Compiler requirements

General-purpose processing elements (PEs) integrated in Carfield implement the RISC-V ISA, targeting
either RV64 (*host domain*) or RV32 (all the others: *safe domain*, *secure domain*, *integer PMCA*,
and *vectorial PMCA*).

To build programs written in plain C for a Carfield domain with the base ISA and its regular
extensions (namely, `RV64G` and `RV32IMACF`) *without* using *custom* extensions that each domain
provide, you simply need vanilla RV64 and RV32 compilers.

Otherwise, to use *custom* instruction supported in HW for a domain, specific compiler support is
required. We are working to improve compiler support by providing pointers to pre-built releases or
a container-based build flow.

# Single domain programs build flow

## Baremetal programs (BMPs)

BMPs for all domains can be built from the root of Carfield through a portable *make fragment*
`sw.mk` located in the `sw/` folder.

To simplify each domain SW build as much as possible, we provide a make fragment located at
`sw/tests/bare-metal/<domain>/sw.mk`, included in the main `sw.mk`.

BMPs for each domain are compiled *in situ* in the domain repository, since each IP was design for,
or supports also, standalone execution and has its own build flow.

The global command

```
make car-sw-build
```

builds program binaries in ELF format for each domain, which can be used with the simulation methods
supported by the platform, as descrbied in [Simulation](../tg/sim.md).
As in Cheshire, Carfield programs can be created to be executed from several memory locations:

* Dynamic SPM
* LLC SPM, when the LLC is configured as such (runtime configurable)
* DRAM, namely the HyperRAM

## Linux programs

When executing *host domain* programs in Linux (on FPGA/ASIC targets) that require access to memory
mapped components of other domains, manual intervention is needed to map virtual to physical
addresses in SW, since domains different than the host *currently* lack support for HW-based virtual
memory translation.

Support for this is provided in the current SW runtime, hence transparent to the user. Test programs
targeting Linux are are found under `sw/tests/linux/<domain>`.

# Inter-domain offload

Offload of programs to Carfield domains involves:

* An *offloader*, typically one of the two controllers, namely the *host* or *safe* domains
* A *target device*, namely the *accelerator domain*. The *safe domain* can play the role of target
  device when offloaded RTOS payloads from the *host domain*.

Programs can be offloaded with:

* Simple baremetal runtime, recommended for regression tests use cases that are simple enough to be
  executed with cycle-accurate RTL simulations. For instance, this can be the case of dynamic timing
  analysis (DTA) carried out during an ASIC development cycle.
* The [OpenMP](https://www.openmp.org/) API, recommended when running SW on a FPGA or, eventually,
  ASIC version of Carfield, because of the ready-to-use OS support (currently, Linux). Usage of the
  OpenMP API with bare-metal (non OS-directed) SW can be supported, but is mostly suited for
  heterogeneous embedded systems with highly constrained resources

In the following, we briefly describe both.

## Baremetal offload (BMO)

The ELF of a *target device* is embedded into the *offloader* ELF as a header file. The latter
contains the memory preload process of the target device in terms of R/W sequence from the host
core, or as a DMA memcopy.

In addition, the offloader takes care of initializing and launching the *target device* execution in
SW.

The `sw.mk` make fragment automatically converts a target device compiled ELF into a header file via
an util script, and generates an offloader ELF embedding the header file of the domain. This is
iteratively done for each test present *in situ* within each target device repository.

For instance, assume the *host domain* as offloader and *integer PMCA* as target device:

1. First, a header file is generated out of each test available in the integer PMCA repository
2. Second, the offloader source code is compiled by subsequently including each header file from
   each integer PMCA test

The final offloader ELF can be preloaded with simulation methods described in the
[Simulation](../tg/sim.md) section.

BMO is in general not recommended for developing SW for Carfield, as it was introduced during ASIC
development cycle and can be an effective litmus test to find and fix HW bugs.

For SW development on Carfield and in particular domain-driven offload, it is recommended to use
OpenMP offload on FPGA/ASIC, described below.

## OpenMP offload (recommended: use on FPGA/ASIC)

TODO Cyril

# External benchmarks

We support several external benchmarks, whose build flow has been slightly adapted to align with
Carfield's. Currently, they are:

* [Mibench, a free, commercially representative embedded benchmark suite](https://ieeexplore.ieee.org/document/990739)
