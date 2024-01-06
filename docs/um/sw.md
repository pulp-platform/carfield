# Software Stack

Carfield's Software Stack is provided in the `sw/` folder, organized as follows:

```
sw
├── boot
├── include
├── lib
├── link
├── sw.mk
├── tests
    ├── bare-metal
    │   ├── hostd
    │   ├── pulpd
    │   ├── safed
    │   ├── secd
    │   └── spatzd
    └── linux
```

Employing Cheshire as *host domain*, Carfield's software stack is largely based on, and built on top
of, [Cheshire's](https://pulp-platform.github.io/cheshire/um/sw/).

This means that it shares the same:

* Baremetal programs (BMPs) build flow and structure
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

## Compiler requirements

General-purpose processing elements (PEs) integrated in Carfield implement the RISC-V ISA, targeting
either RV64 (*host domain*) or RV32 (all the others: *safe domain*, *secure domain*, *integer PMCA*,
and *vectorial PMCA*).

To build programs written in plain C for a Carfield domain with the base ISA and its regular
extensions (namely, `RV64G` and `RV32IMACF`) *without* using *custom* extensions that each domain
provide, you simply need vanilla RV64 and RV32 compilers.

Otherwise, to use *custom* instruction supported in HW for a domain, specific compiler support is
required. We are working to improve compiler support by providing pointers to pre-built releases or
a container-based build flow.

## Boot Flow and Secure Boot

Carfield supports two *operative boot flows*: 

* **Non-secure**: being an always-on domain, in this *operative boot flow* Cheshire takes over
  Carfield's boot flow. This means that *passive* and *autonomous* boot are equivalent to those
  described in Cheshire's [Software Stack](https://pulp-platform.github.io/cheshire/um/sw/). Since
  the other domains are clock gated, SW to be executed on them requires Cheshire to handle their
  wake-up sequence.

* **Secure**: The *secure domain* performs the secure boot process on the code that will be executed
  on the Carfield system, independently of the domain. For more information, read the dedicated
  [secure boot documentation](https://opentitan.org/book/doc/security/specs/secure_boot) of the
  OpenTitan project.

## Single domain programs build flow

### Baremetal programs (BMPs)

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
supported by the platform, as described in [Simulation](../tg/sim.md) or on FPGA as described in
[Xilinx FPGAs](../tg/xilinx.md).

---

As in Cheshire, Carfield programs can be created to be executed from several memory locations:

* Dynamic SPM (`l2`): the linkerscript is provided in Carfield's `sw/link/` folder, since Dynamic
  SPM is not integrated in the minimal Cheshire
* LLC SPM (`spm`): valid when the LLC is configured as such. In Carfield, half of the LLC is
  configured as SPM from the boot ROM during system bringup, as this is the default behavior in
  Cheshire.
* DRAM (`dram`): the HyperRAM

For example, to build a specific BMP (here `sw/tests/bare-metal/hostd/helloworld.c` to be run on
Cheshire) executing from the Dynamic SPM, run:

```
make sw/tests/bare-metal/hostd/helloworld.car.l2.elf
```

To create the same program executing from DRAM, `sw/tests/bare-metal/hostd/helloworld.car.dram.elf`
can instead be built from the same source. Depending on their assumptions and behavior, not all
programs may be built to execute from both locations.

### Linux programs

When executing *host domain* programs in Linux (on FPGA/ASIC targets) that require access to memory
mapped components of other domains, SW intervention is needed to map virtual to physical addresses,
since domains different than the host *currently* lack support for HW-based virtual memory
translation.

In the current SW stack, this mapping is already provided and hence transparent to the user. Test
programs targeting Linux that require it are located in different folder, `sw/tests/linux/<domain>`.

## Inter-domain offload

Offload of programs to Carfield domains involves:

* An *offloader*, typically one of the two controllers, i.e., the *host* or *safe* domains
* A *target device*, typically the *accelerator domain*. The *safe domain* can also play the role of
  target device when offloaded RTOS payloads from the *host domain*.

Programs can be offloaded with:

* **Simple baremetal offload (BMO)**, recommended for regression tests use cases that are simple
  enough to be executed with cycle-accurate RTL simulations. For instance, this can be the case of
  dynamic timing analysis (DTA) carried out during an ASIC development cycle.

* **The [OpenMP](https://www.openmp.org/) API**, recommended when developing SW for Carfield on a
  FPGA or, eventually, ASIC implementing Carfield, because of the ready-to-use OS support
  (currently, Linux). Usage of the OpenMP API with non OS-directed (baremetal) SW can be supported,
  but is mostly suited for heterogeneous embedded systems with highly constrained resources

In the following, we briefly describe both.

---

**Note for the reader**

Since by default all domains are clock gated and isolated after POR except for the *host domain*
(Cheshire), as described in [Architecture](../um/arch.md), the wake-up process must be handled from
the C source code.

### Baremetal offload

For BMO, the offloader takes care of bootstrapping the target device ELF in the correct memory
location, initializing the target and launching its execution through a simple ELF Loader. The ELF
Loader source code is located in the offloader's SW directory, and follows a naming convention:

```
<target_device>_offloader_<blocking | non_blocking>.c 
```

The target device's ELF is included into the offloader's ELF Loader as a *header file*. The target
device's ELF sections are first pre-processed offline to extract instruction addresses.The resulting
header file provides the ELF loading process at the selected memory location. The loading process
can be carried out by the offloader as R/W sequences, or deferred to a DMA-driven memcopy. In
addition, the offloader takes care of bootstrapping the target device, i.e. initializing it and
launching its execution.

Upon target device completion, the offloader:

* Is asynchronously notified of the event via a mailboxe interrupt; BMOs of this kind are called
  *non-blocking*
* Sychronously polls a specific register to catch the completion; BMOs of this kind are called
  *blocking*

Currently, *blocking BMO* is implemented.

---

As an example, assume the *host domain* as offloader and the *integer PMCA* as target device.

1. The host domain ELF Loader is included in `sw/tests/bare-metal/hostd`
1. A header file is generated out of each regression test available in the integer PMCA repository.
   For this example, the resulting header files are included in `sw/tests/bare-metal/pulpd`
2. The final ELF executed by the offloader is created by subsequently including each header file
   from each integer PMCA regression test
   
The resulting offloader ELF's name reads:

```
<target_device>_offloader_<blocking | non_blocking>.<target_device_test_name>.car.<l2 | spm | dram>.elf
```

According to the memory location where the BMP will be executed.

The final offloader ELF can be preloaded with simulation methods described in the
[Simulation](../tg/sim.md) section, and can be built again as explained above.

---

*Note for the reader*

BMO is in general not recommended for developing SW for Carfield, as it was introduced during ASIC
development cycle and can be an effective litmus test to find and fix HW bugs, or during DTA.

For SW development on Carfield and in particular domain-driven offload, it is recommended to use
OpenMP offload on FPGA/ASIC, described below.

### OpenMP offload (recommended: use on FPGA/ASIC)

TODO Cyril

## External benchmarks

We support several external benchmarks, whose build flow has been slightly adapted to align with
Carfield's. Currently, they are:

* [Mibench, a free, commercially representative embedded benchmark suite](https://ieeexplore.ieee.org/document/990739)
