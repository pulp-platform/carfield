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
