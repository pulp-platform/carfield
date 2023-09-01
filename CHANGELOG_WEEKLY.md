# Weekly Changelog

We keep all RTL changes relevant for weekly releases here

## Unreleased

### Carfield Top

### Cheshire

### Safety Island

### Security Island

### Spatz

### PULP Cluster

### L2 Memory


## Weekly 2023_09_01 (weekly_20230901)

### Carfield Top
- Update AXI-RT configuration
- Add `mibench` benchmark compilation flow
- Cleanup and fix variable names in SW makefrag
- Bump pulp cluster to latest stable version (see `PULP Cluster` changes below)
- Force hier-icache in Bender.local to use FF instead of SCMs
- Update bender targets and defines for scripts generation involving pulp cluster
- Fix and simplify pulp cluster parametrization
- Add Spatz cluster and L2 isolate and isolate status registers
- Wire missing isolate and isolate status registers
- Align HW and SW terminology for L2 ports
  * Ports were sometimes named 0/1 and other times 1/2
- Connect L2 ECC error interrupt
- Extend SW reset basic test
- Point to open-source opentitan and can_bus
- Bump hyperbus to latest stable version
  * Change DQ and RWDS tri-state enable signals before data,
  relaxing timing through the OE pin

### Cheshire
- Point to open-source AXI-RT

### Security Island
- Fix secure boot by using bit enable in memory cuts
- Bump to latest tech_cells_generic (`0.2.12`) to support bit->byte remapping for `tc_sram_xilinx`

### PULP Cluster
- Fix address issue. Data/Periph demux did not consider the cluster
- Use FF-based RF in RedMule
- Use FFs instead of SCMs in icache


## Weekly 2023_08_14 (weekly_20230814)

### Carfield Top
- Reduce clock divider div width to reduce critical path within clk div
- Add secure boot pin

### Cheshire
- Bump CVA6 to `pulp-v0.4.3` to densely pack Valid/Dirty SRAMs
- Force latest `axi_riscv_atomics` version (`v0.8.1`)


## Weekly 2023_08_04 (weekly_20230804)

### Carfield Top
- Add missing port connection in `lossy_valid_to_stream` module
- Cleanup makefrags
- Cleanup SoC fixture and testbench (add security island VIPs)
- Propagate `CDCSyncStages` parameter through the design. Required bump of AXI to `v0.39.1-beta`,
  bump of IPs. Set `CDCSyncStages` and `SyncStages` (the latter for single-bit lines synchronization
  through CDC crossings) to **3 stages**.
- Add offlad flow to integer cluster
- Configure cheshire to support 2 CVA6 cores

### Cheshire
- Bump CVA6 to support self-invalidation (enables SMP execution)
- Bump to support multicore (adds logic to instantiate multiple CVA6 cores)
- Modify Cheshire's crt0 and bootrom. Bootcode is modified to:
  - Pause all harts except 0 at the beginning of the bootrom;
  - Let all harts jump to next boot stage after hart 0 finished bootrom;
  - Park all harts except 0 at the beginning of crt0 for now (to be extended).
- Increase number of *scratch* registers from 4 to 16
- Add a register storing the number of harts
- Expose number of synchronization stages for single-bit lines (e.g., interrupts), previously a
  localparam

### Safety Island
- Bump AXI to `v0.39.1-beta` and expose `CDCSyncStages`

### Security Island
- Bump AXI to `v0.39.1-beta` and expose `CDCSyncStages`

### Spatz
- Point to latest stable release `v0.4.3`
  - Bump AXI to `v0.39.1-beta` and expose `CDCSyncStages`

### PULP Cluster
- Bump AXI to `v0.39.1-beta` and expose `CDCSyncStages`
- Fixes to support offload within carfield
  - **[Interface]** Increase AXI ID width; interface change for integer cluster macro and cheshire
    macros
- Add support for rapid recovery

### L2 Memory


## Weekly 2023_07_28 (weekly_20230728)

### Carfield Top
- Bump FPU with fixes (`pulp-v0.1.3`)
- Bump AXI with proper release (`v0.39.0`)
- Add new preload mode (`3`) to boot from Security Island
- **[Interface]** Increase Serial Link data lanes to 8 (previously 4)

### Cheshire
- Align Cheshire to main branch
  - Add external serial link AXI port in `vip_cheshire.sv`

### Safety Island

### Security Island
- Update dependency
  - Add `carfield_boot` code to boot cva6 from Ibex in OT

### Spatz
- Align commit to released version (`v0.4.2`)
  - Fix and cleanup FFT kernel
  - Update carfield configuration (latency of fp64 and sdotp)
  - Remove register_offload_req parameter
  - Pipeline the core response
  - Add the dp-fdotp kernel and dp-faxpy kernel
  - Remove manually-inserted test ports
  - Update testbench
  - **[Interface]** Remove testmode, scan enable and scan data signals

### PULP Cluster

### L2 Memory
- **[Interface]** Update with ECC manager and register interface port


## Weekly 2023_07_20 (weekly_20230720)

### Carfield Top
- Fix out-of-bounds array
- Add SW test for offloading

### Cheshire
- Adjust SW build, minor bootrom adjustments
- Update interrupt routing
- Update `axi-rt`

### Safety Island

### Security Island

### Spatz
- Bump spatz to newest version
  - Add new and fix existing SW tests
  - Fix undriven nets
  - Fix race condition between vector store and load
  - Decouple scatter-gather index width from SEW
  - Fix hazard detection of indexed memory operations
  - Propagate testmode signal

### PULP Cluster

### L2 Memory


## Weekly 2023_07_12 (weekly_20230712)

### Carfield Top
* FPGA flow integration
* Fix isolate array bounds in `carfield_soc`
* Fix AXI CDC array bounds in `carfield_soc`
* Fix timer interrupt `X`s in `carfield_soc`
* Add temporary error slave for L2 ECC manager

### Cheshire
* Fix and update `axi_rt`
* Integrate `bus_err_unit`
* **[Interface]** Update ATOP configuration
* **[Interface]** Add register port for L2 ECC manager

### Safety Island
* Add ECC Manager
* Fix atomics
* Add configurable number of memory banks

### Security Island

### Spatz
* Enable custom config now located in carfield repository

### PULP Cluster
* Bump unused ibex to fix bender target issue

### L2 Memory


## Weekly 2023_07_06 (weekly_20230706)

* Initial tag
