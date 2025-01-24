# Xilinx FGPAs

This page describes how to map Carfield on Xilinx FPGAs to *execute baremetal programs* or *boot
CVA6 Linux*. Please first read [Getting Started](../gs.md) to make sure have all dependencies.
Additionally, for on-chip debugging you need:

- OpenOCD `>= 0.10.0`

We currently provide working setups for:

- Xilinx VCU128 with Vivado `== 2020.2`
- Xilinx VCU118 with Vivado `== 2020.2`

:warning: At the moment it is required to use the Vivado version above

**Note: Certain version of Vivado might cause issue, until these issues are resolved it is safer to use 2020.2**

We are working on support for more boards in the future.

The Carfield bitstreams are divided in two flavors at the moment. The `flavor_vanilla` and the
`flavor_bd`.

- `flavor_vanilla` - The hardware to be mapped on the FPGA is fully described in System Verilog.
This flow is lightweight, easily reproducible, and self contained. As each IP is integrated by hand
in the RTL, only the Xilinx DDR, Xilinx VIO and Xilinx clock wizard are available (at the moment).

- `flavor_bd` - In order to allow for more complex top level, this flow relies on the Vivado block
design flow to link Carfield with external IPs. This flow is less human readable but allows
integrating more complex IPs as Xilinx Ethernet. *Note that this may require you to own the
respective licenses.*

## Quick Start

The recommended command to build a bitstream (for VCU128) is

```bash
make car-xil-all XILINX_FLAVOR=bd VIVADO="vitis-2020.2 vivado" VIVADO_MODE=gui XILINX_BOARD=vcu128 GEN_NO_HYPERBUS=1 GEN_EXT_JTAG=1 CARFIELD_CONFIG=carfield_l2dual_spatz_periph
```

Please find below more explanations.

## Building the vanilla bistream (VCU128 only)

Due to the structure of the Makefile flow. All the following commands are to be executed at the root
of the Carfield repository. If you want to see the Makefiles that you will be using, you can find
the generic FPGA rules in `target/xilinx/xilinx.mk` and the vanilla specific rules in
`target/xilinx/flavor_vanilla/flavor_vanilla.mk`.

First, make sure that you have fetch and generated all the RTL:

```bash
make car-init
```

Generate the bitstream in `target/xilinx/out/` by running:

```bash
make car-xil-all XILINX_FLAVOR=vanilla [VIVADO=version]
[VIVADO_MODE={batch,gui}] [XILINX_BOARD={vcu128}] [GEN_NO_HYPERBUS={0,1}]
[GEN_EXT_JTAG={0,1}] [CARFIELD_CONFIG=carfield_l2dual_{safe,spatz}_periph]
```

See the argument list below:

| Argument        | Relevance | Description                                                                                                                           |
|-----------------|-----------|---------------------------------------------------------------------------------------------------------------------------------------|
| VIVADO          | all       | Vivado command to use                                                                                                                 |
| XILINX_BOARD    | all       | `vcu128`                                                                                                                              |
| GEN_NO_HYPERBUS | all       | `0` Use the hyperram controller inside `carfield.sv`<br>`1` Use the Xilinx DDR controller                                             |
| GEN_EXT_JTAG    | vcu128    | `0` Connect the JTAG debugger to the board's JTAG (see [vcu128](#xilinx-vcu128)) <br>`1` Connect the JTAG debugger to an external JTAG chain |
| CARFIELD_CONFIG | all       | Select the Carfield configuration to implement. See below for supported configs.                                                      |
| VIVADO_MODE     | all       | `batch` Compile in Vivado shell<br>`gui` Compile in Vivado gui                                                                        |

See below some typical building time for reference:

| Config                                 | Board  | Duration   |
|----------------------------------------|--------|------------|
| carfield_l2dual_pulp_periph            | vcu128 | ~5h        |
| carfield_l2dual_safe_periph            | vcu128 | ~5h        |
| carfield_l2dual_spatz_periph           | vcu128 | ~5h        |
| carfield_l2dual_secure_periph          | vcu128 | __ISSUE__  |

You can find which sources are used by looking at `Bender.yml` (target `all(xilinx, fpga,
xilinx_vanilla)`). This file is used by bender to generate
`target/xilinx/flavor_vanilla/scripts/add_sources.tcl`. You can open this file to see all the file
list of the project. (Note that even if you disable an IP, its files will still needed by Vivado and
added to the `add_sources.tcl`).

Note that the `make` command above will first compile the Xilinx ips located in
`target/xilinx/xilinx_ips` before compiling the bitstream.

## Building the bd (block design) bistream

Please read and try to compile a vanilla bitstream first to identify potential issues.

You can find the bd specific rules in `target/xilinx/flavor_vanilla/flavor_bd.mk`.

Again, make sure that you have fetched and generated all the RTL:

```bash
make car-init
```

Generate the bitstream in `target/xilinx/out/` by running:

```bash
make car-xil-all XILINX_FLAVOR=bd [VIVADO=version] [VIVADO_MODE={batch,gui}]
[XILINX_BOARD={vcu128, vcu118}] [GEN_NO_HYPERBUS={0,1}] [GEN_EXT_JTAG={0,1}]
[CARFIELD_CONFIG=carfield_l2dual_{safe,spatz}_periph]
```

See the argument list below:

| Argument        | Relevance | Description                                                                                                                           |
|---------------- |-----------|---------------------------------------------------------------------------------------------------------------------------------------|
| VIVADO          | all       | Vivado command to use                                                                                                                 |
| XILINX_BOARD    | all       | `vcu128` `vcu118`                                                                                                                              |
| GEN_NO_HYPERBUS | all       | `0` Use the hyperram controller inside `carfield.sv`<br>`1` Use the Xilinx DDR controller                                             |
| GEN_EXT_JTAG    | all    | `0` Connect the JTAG debugger to the board's JTAG (see [vcu128](#xilinx-vcu128)) <br>`1` Connect the JTAG debugger to an external JTAG chain |
| CARFIELD_CONFIG | all       | Select the Carfield configuration to implement. See below for supported configs.                                                      |
| VIVADO_MODE     | all       | `batch` Compile in Vivado shell<br>`gui` Compile in Vivado gui                                                                        |
| XILINX_BOOT_ETH | vcu128       | `0` Boot via SPI flash only (see [booting Linux](#booting_linux)) <br>`1` Boot via SPI flash and Ethernet                             |

See below some typical building time for reference:

| Config                                 | Board  | Duration   |
|----------------------------------------|--------|------------|
| carfield_l2dual_pulp_periph            | vcu128 | ~5h        |
| carfield_l2dual_safe_periph            | vcu128 | ~5h        |
| carfield_l2dual_spatz_periph           | vcu128 | ~5h        |
| carfield_l2dual_secure_periph          | vcu128 | __ISSUE__  |

You can find which sources are used by looking at `Bender.yml` (target `all(xilinx, fpga,
xilinx_bd)`). This file is used by bender to generate
`target/xilinx/flavor_bd/scripts/add_sources.tcl`. You can open this file to see all the file list
of the project. (Note that even if you disable an IP, its files will still needed by Vivado and
added to the `add_sources.tcl`).

Note that the `make` command above will first package a Carfield ip before compiling the bitstream.

## Board specificities

### All
> #### Ethernet
> As the MAC address of each FPGA is unique (but reconfigurable), if you wish to use the Ethernet
> IP (`bd` flavor) you will need to add the MAC address of your board in `sw/boot/mac_address.dtsi`.
### Xilinx VCU128
> #### Bootmodes and VIOs
>
> As there are no switches on this board, the CVA6 bootmode (see [Cheshire
bootrom](https://pulp-platform.github.io/cheshire/um/sw/#boot-rom)) is selected by Xilinx VIOs that
can be set in the Vivado GUI (see [Using Vivado GUI](#bringup_vivado_gui)).
>
> #### External JTAG chain
>
> The VCU128 development board only provides one JTAG chain, used by Vivado to program the
bitstream, and interact with certain Xilinx IPs (ILAs, VIOs, ...). The RV64 requires access to a
JTAG chain to connect GDB to the debug-module in the bitstream.
> When using `EXT_JTAG=0` it is possible to connect the debug module to the internal FPGA's JTAG by
using the Xilinx BSCANE macro. With this, you will only need the normal Xilinx USB cable to interact
with CVA6. Note that it means that
Vivado and OpenOCD can not use the same cable at the same time.
> :warning: This setup (with `EXT_JTAG=0`) will only work for designs containing the host only** as
it is not possible to chain multiple devices on the BSCANE macro. If you need to use `EXT_JTAG=0`
consider modifying the RTL to remove the debug modules of the IPs.
> When using `EXT_JTAG=1` we add an external JTAG chain for the RV64 host and other island through
the FPGA's GPIOs. Since the VCU128 does not have GPIOs we use we use a Digilent JTAG-HS2 cable
connected to the Xilinx XM105 FMC debug card. See the connections in `vcu128.xdc`.

### Xilinx VCU118
> #### Bootmodes and VIOs
>
> We currently do not use the switches on this board, the CVA6 bootmode (see [Cheshire
bootrom](https://pulp-platform.github.io/cheshire/um/sw/#boot-rom)) is selected by Xilinx VIOs that
can be set in the Vivado GUI (see [Using Vivado GUI](#bringup_vivado_gui)).
>
> #### External JTAG chain
>
> Similarly to the VCU128 we use GPIOs to connect an external JTAG-USB dongle (Digilent HS2). Unlike the VCU128, the availability of GPIOs directly on the board allow us to connect the HS2 without an FMC debug board (see constraints for related pins).
>**WARNING: this setup (with `EXT_JTAG=0`) will only work for designs containing the host only** as
it is not possible to chain multiple devices on the BSCANE macro. If you need to use `EXT_JTAG=0`
consider modifying the RTL to remove the debug modules of the IPs.
> #### Block design and Xilinx Ethernet IP
>
> The Xilinx Ethernet IP integration is still under debug and does not work out of the box in Linux or U-boot at the moment.

## Bare-metal bringup

### Programming the FPGA

#### Using Vivado GUI

If you have closed Vivado, or compiled in batch mode, you can open the Vivado GUI:

```bash
# Find your project
find . -name "*.xpr"
# Open it in gui
vitis-2020.2 vivado project.xpr
```

You can now open the Hardware Manager and program the FPGA. Once done, Vivado will give you access
the to Virtual Inputs Outputs (VIOs). You can now assert the following signals (on Cheshire top
level).

  | VIO               | Function                                                        |
  | ----------------- | ----------------------------------------------------------------|
  | vio_reset         | Positive edge-sensitive reset for the whole system              |
  | vio_boot_mode     | Override the boot-mode switches described above                 |
  | vio_boot_mode_sel | Select between 0: using boot mode switches 1: use boot mode VIO |

#### Using command line <a name="bringup_vivado_cli"></a>

A script `program.tcl` is available to flash the bitstream without opening Vivado GUI. You will need
to give the following variable to access your board (see `target/xilinx/xilinx.mk`).

- `XILINX_PORT` - Vivado opened port (default **3121**)
- `FPGA_PATH` - Vivado path to your FPGA (default **xilinx_tcf/Xilinx/[serial_id]**)
- `XILINX_HOST` - Path to your Vivado server (default **localhost**)

Change the values to the appropriate ones (they be found in the Hardware Manager in Vivado GUI) and
program the board:

```bash
make chs-xil-program VIVADO_MODE=batch XILINX_BOARD=vcu128 XILINX_FLAVOR=flavor
```

### Loading binary and debugging with OpenOCD

Tbd

## Running Baremetal Code

Tbd

## Booting Linux

To boot Linux, we must load the *OpenSBI* firmware, which takes over M mode and launches the U-boot
bootloader. U-boot then loads Linux. For more details, see [Boot Flow](../um/sw.md#boot-flow).

Clone the `carfield` branch of CVA6 SDK at the root of this repository and build the firmware
(OpenSBI + U-boot) and Linux images (*this will take about 30 minutes*):

```bash
git submodule update --init --recursive sw/deps/cva6-sdk
make -C sw/deps/cva6-sdk images
```

In principle, we can boot Linux through JTAG by loading all images into memory, launching OpenSBI,
and instructing U-boot to load the kernel directly from memory. Here, we focus on autonomous boot
from SD card or SPI flash.

In this case, OpenSBI is loaded by a regular baremetal program called the Zero-Stage Loader (ZSL).
The boot ROM loads the ZSL from SD card, which then loads the device tree and firmware from other SD
card partitions into memory and launches OpenSBI.

To create a full Linux disk image from the ZSL, device tree, firmware, and Linux, run:

```bash
# Place the cva6-sdk where they are expected:
ln -s sw/deps/cva6-sdk/install64 sw/boot/install64
# Optional: Pre-build explicitely the image
make CAR_ROOT=. sw/boot/linux_carfield_bd_vcu128.gpt.bin
```

### Via SPI flash
>
> Boards like VCU128 does not offer a SD card reader. We need to load the image in the
integrated flash:
>
> ```
> make chs-xil-flash VIVADO_MODE=batch XILINX_BOARD=vcu128 XILINX_FLAVOR=flavor
> ```
>
> Use the parameters defined in [Using command line](#bringup_vivado_cli)
(defaults are in `target/xilinx/xilinx.mk`) to select your board:
>
> This script will erase your bitstream, once the flash has been written (c.a.
10min) you will need to re-program the bitstream on the board.
> You can attach the UART port of the FPGA to minicom and see the boot process! 
### Via Ethernet (VCU128 only)
>
> As flashing and reading the kernel from SPI can take a few minutes, a faster way is to
> [ask U-Boot to fetch the image from the network](https://www.emcraft.com/som/using-dhcp).
> This feature can be enabled in the Carfield `bd` flavor. You will need to add the MAC
> address of your FPGA in `sw/boot/mac_address.dtsi` and the path to your Linux image (on a FTP server)
> in `sw/boot/remote_boot.dtsi`.
> You will still need to flash u-boot but it will be now faster:
> ```
> make chs-xil-flash VIVADO_MODE=batch XILINX_BOARD=vcu128 XILINX_FLAVOR=bd XILINX_BOOT_ETH=1
> ```

## Add your own board

If you wish to add a flow for a new FPGA board, please do the following steps:
_Please consider opening a pull request containing the necessary changes to integrate your new board
(:_

### Makefile

Add your board on top of `target/xilinx/xilinx.mk`, in particular `xilinx_part` and
`xilinx_board_long` are identifying the FPGA chip and board (can be found in VIvado GUI). The
parameters identifying your personal device `XILINX_PORT`, `XILINX_FPGA_PATH`, `XILINX_HOST` can be
left empty for now.

### Vanilla flow
>
> #### Re-arametrize existing IPs
>
> Carfield's emulation requires a few Vivado IPs to work properly. They are
defined and pre-compiled in `target/xilinx/xilinx_ips/*`.
> If you add a new board, you will need to reconfigure your IPs for this board. For instance, to use
the _Vivado MIG DDR4 controller_, modify `target/xilinx/xilinx_ips/xlnx_mig_ddr4/run.tcl`. There,
add the relevant
`$::env(XILINX_BOARD)` entry with your configuration.
> To know which configuration to use your board, you can open a blank project in Vivado GUI, create
a blank block design, and instanciate the MIG DDR4 IP there. The Vivado TCL console should write the
default parameters for your FPGA. You can later re-configure the IP in the block design and Vivado
will print to the tcl console the modified parameters. Then you can copy these tcl lines to the
`run.tcl` file. Make sure that you added your ip to `target/xilinx/flavor_vanilla/flavor_vanilla.mk`
under "xilinx_ips_names_vanilla_**your_board**".
>
> #### Add a new IP
>
> If your board require a new IP that has not been integrated already do the
following :
>
> - Add a new folder `target/xilinx/xilinx_ips/[your_ip]` taking the example of the `xlnx_mig_ddr4`.
> - Modify `target/xilinx/xilinx_ips/[your_ip]/tcl/run.tcl` and
`target/xilinx/xilinx_ips/[your_ip]/Makefile` accordingly. > - Add your IP to
`target/flavor_vanilla/flavor_vanilla.mk` under "xilinx_ips_names_vanilla_**your_board**".
>
> #### Instantiate your IP
>
> Connect it's top module in the top-level:
`target/xilinx/flavor_vanilla/src/cheshire_top_xilinx.sv`. If your IP is a DDR controller, please
add it to `target/xilinx/src/dram_wrapper_xilinx.sv`. Note that this file contains a pipeline to
resize AXI transactions from Cheshire to your controller.
>
> Add the relevant macro parameters to `target/xilinx/flavor_vanilla/src/phy_definitions.sv` in
order to disable your IP for non-relevant boards.
>
> #### Add a new device tree
>
> Each board is defined by a device-tree, when adding a new board, please add a device tree in
`sw/boot` for each supported flavors.
>
> #### Debug
>
> It is possible to use ILA (Integrated Logic Analyzers) in order to debug some signals on the
running FPGA. Add the following before declaring your signals:
>
```verilog
// Indicate that you need to debug a signal
(* dont_touch = "yes" *) (* mark_debug = "true" *) logic signal_d0;
// You can also use the following macro from phy_definitions.svh
`ila(ila_signal_d0, signal_d0)
```
>
> Then, re-build your bitstream.
