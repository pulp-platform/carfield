# Simulation

This page describes how to simulate Carfield to execute baremetal programs. 
Please first read [Getting Started](../gs.md) to make sure have all the 
dependencies and initialized your repository.

### Compile HW and SW

* Generate the compile scripts for Questasim and compile Carfield.

   ```
   make car-hw-build
   ```

  It is also possible to run `make -B scripts/carfield_compile.tcl` to
  re-generate the compile script after hardware modfications.

* Compile tests for Carfield. Tests resides in `sw/tests`.

  ```
  make car-sw-build
  ```

  The latter commands:
  * Compiles safety island and pulp cluster standalone tests
  * Compiles CVA6 standalone and offloading tests

### System bootmodes

* The current supported bootmodes from Cheshire are:

  | `CHS_BOOTMODE` | `CHS_PRELMODE` | Action |
  | --- | --- | --- |
  | 0 | 0 | Passive bootmode, JTAG preload |
  | 0 | 1 | Passive bootmode, Serial Link preload |
  | 0 | 2 | Passive bootmode, UART preload |
  | 0 | 3 | Passive bootmode, Secure Boot from SECD |
  | 1 | - | Autonomous bootmode, SPI SD card |
  | 2 | - | Autonomous bootmode, SPI flash |
  | 3 | - | Autonomous bootmode, I2C EEPROM |

  `Bootmode` indicates the available bootmodes in Cheshire, while `Preload 
mode` indicates the type
  of preload, if any is needed. For RTL simulation, bootmodes 0, 2 and 3 are 
supported. SPI SD card
  bootmode is supported on FPGA emulation.

* The current supported bootmodes for the Safety Island are:

  | `SAFED_BOOTMODE` | Action |
  | --- | --- |
  | 0 | Passive bootmode, JTAG preload |
  | 1 | Passive bootmode, Serial Link preload |

### Simulation

To launch an RTL simulation with the selected boot/preload modes for the island 
of choice, type:


* For cheshire in passive bootmode (`CHS_BOOTMODE=0`), set `CHS_BINARY` for 
Cheshire

```
make car-hw-sim CHS_BOOTMODE=<chs_bootmode> CHS_PRELMODE=<chs_prelmode> 
CHS_BINARY=<chs_binary_path>.car.elf PULPCL_BINARY=<pulpcl_binary> 
SPATZCL_BINARY=<spatzcl_binary> SECD_BINARY=<secd_binary_path> 
SAFED_BOOTMODE=<safed_bootmode> SAFED_BINARY=<safed_binary_path>
```

* For cheshire in autonomous bootmode (`CHS_BOOTMODE` = {1,2,3}), set 
`CHS_IMAGE` for Cheshire

```
make car-hw-sim CHS_BOOTMODE=<chs_bootmode> CHS_PRELMODE=<chs_prelmode> 
CHS_IMAGE=<chs_binary_path>.car.memh PULPCL_BINARY=<pulpcl_binary> 
SPATZCL_BINARY=<spatzcl_binary> SECD_BINARY=<secd_binary_path> 
SAFED_BOOTMODE=<safed_bootmode> SAFED_BINARY=<safed_binary_path>
```

### Debugging

Per default, Questasim compilation is performance-optimised and simulation 
logging is disabled. To enable full visibility, logging, and the Questa GUI, 
set `DEBUG=1` when executing the steps above.