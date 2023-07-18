# Weekly Changelog

We keep all RTL changes relevant for weekly releases here

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


## Weekly 2023_07_06 (weekly_20230706)

* Initial tag
