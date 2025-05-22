## Summary

| Name                                                                         | Offset   |   Length | Description                                                                                         |
|:-----------------------------------------------------------------------------|:---------|---------:|:----------------------------------------------------------------------------------------------------|
| spatz_cluster_peripheral.[`PERF_COUNTER_ENABLE_0`](#perf_counter_enable)     | 0x0      |        8 | Enable particular performance counter and start tracking.                                           |
| spatz_cluster_peripheral.[`PERF_COUNTER_ENABLE_1`](#perf_counter_enable)     | 0x8      |        8 | Enable particular performance counter and start tracking.                                           |
| spatz_cluster_peripheral.[`HART_SELECT_0`](#hart_select)                     | 0x10     |        8 | Select from which hart in the cluster, starting from `0`,                                           |
| spatz_cluster_peripheral.[`HART_SELECT_1`](#hart_select)                     | 0x18     |        8 | Select from which hart in the cluster, starting from `0`,                                           |
| spatz_cluster_peripheral.[`PERF_COUNTER_0`](#perf_counter)                   | 0x20     |        8 | Performance counter. Set corresponding PERF_COUNTER_ENABLE bits depending on what                   |
| spatz_cluster_peripheral.[`PERF_COUNTER_1`](#perf_counter)                   | 0x28     |        8 | Performance counter. Set corresponding PERF_COUNTER_ENABLE bits depending on what                   |
| spatz_cluster_peripheral.[`CL_CLINT_SET`](#cl_clint_set)                     | 0x30     |        8 | Set bits in the cluster-local CLINT. Writing a 1 at location i sets the cluster-local interrupt     |
| spatz_cluster_peripheral.[`CL_CLINT_CLEAR`](#cl_clint_clear)                 | 0x38     |        8 | Clear bits in the cluster-local CLINT. Writing a 1 at location i clears the cluster-local interrupt |
| spatz_cluster_peripheral.[`HW_BARRIER`](#hw_barrier)                         | 0x40     |        8 | Hardware barrier register. Loads to this register will block until all cores have                   |
| spatz_cluster_peripheral.[`ICACHE_PREFETCH_ENABLE`](#icache_prefetch_enable) | 0x48     |        8 | Controls prefetching of the instruction cache.                                                      |
| spatz_cluster_peripheral.[`SPATZ_STATUS`](#spatz_status)                     | 0x50     |        8 | Sets the status of the Spatz cluster.                                                               |
| spatz_cluster_peripheral.[`CLUSTER_BOOT_CONTROL`](#cluster_boot_control)     | 0x58     |        8 | Controls the cluster boot process.                                                                  |

## PERF_COUNTER_ENABLE
Enable particular performance counter and start tracking.
- Reset default: `0x0`
- Reset mask: `0x7fffffff`

### Instances

| Name                  | Offset   |
|:----------------------|:---------|
| PERF_COUNTER_ENABLE_0 | 0x0      |
| PERF_COUNTER_ENABLE_1 | 0x8      |


### Fields

```wavejson
{"reg": [{"name": "CYCLE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "TCDM_ACCESSED", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "TCDM_CONGESTED", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "ISSUE_FPU", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "ISSUE_FPU_SEQ", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "ISSUE_CORE_TO_FPU", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "RETIRED_INSTR", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "RETIRED_LOAD", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "RETIRED_I", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "RETIRED_ACC", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "DMA_AW_STALL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "DMA_AR_STALL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "DMA_R_STALL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "DMA_W_STALL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "DMA_BUF_W_STALL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "DMA_BUF_R_STALL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "DMA_AW_DONE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "DMA_AW_BW", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "DMA_AR_DONE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "DMA_AR_BW", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "DMA_R_DONE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "DMA_R_BW", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "DMA_W_DONE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "DMA_W_BW", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "DMA_B_DONE", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "DMA_BUSY", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "ICACHE_MISS", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "ICACHE_HIT", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "ICACHE_PREFETCH", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "ICACHE_DOUBLE_HIT", "bits": 1, "attr": ["rw"], "rotate": -90}, {"name": "ICACHE_STALL", "bits": 1, "attr": ["rw"], "rotate": -90}, {"bits": 33}], "config": {"lanes": 1, "fontsize": 10, "vspace": 190}}
```

|  Bits  |  Type  |  Reset  | Name                                                         |
|:------:|:------:|:-------:|:-------------------------------------------------------------|
| 63:31  |        |         | Reserved                                                     |
|   30   |   rw   |   0x0   | [ICACHE_STALL](#perf_counter_enable--icache_stall)           |
|   29   |   rw   |   0x0   | [ICACHE_DOUBLE_HIT](#perf_counter_enable--icache_double_hit) |
|   28   |   rw   |   0x0   | [ICACHE_PREFETCH](#perf_counter_enable--icache_prefetch)     |
|   27   |   rw   |   0x0   | [ICACHE_HIT](#perf_counter_enable--icache_hit)               |
|   26   |   rw   |   0x0   | [ICACHE_MISS](#perf_counter_enable--icache_miss)             |
|   25   |   rw   |   0x0   | [DMA_BUSY](#perf_counter_enable--dma_busy)                   |
|   24   |   rw   |   0x0   | [DMA_B_DONE](#perf_counter_enable--dma_b_done)               |
|   23   |   rw   |   0x0   | [DMA_W_BW](#perf_counter_enable--dma_w_bw)                   |
|   22   |   rw   |   0x0   | [DMA_W_DONE](#perf_counter_enable--dma_w_done)               |
|   21   |   rw   |   0x0   | [DMA_R_BW](#perf_counter_enable--dma_r_bw)                   |
|   20   |   rw   |   0x0   | [DMA_R_DONE](#perf_counter_enable--dma_r_done)               |
|   19   |   rw   |   0x0   | [DMA_AR_BW](#perf_counter_enable--dma_ar_bw)                 |
|   18   |   rw   |   0x0   | [DMA_AR_DONE](#perf_counter_enable--dma_ar_done)             |
|   17   |   rw   |   0x0   | [DMA_AW_BW](#perf_counter_enable--dma_aw_bw)                 |
|   16   |   rw   |   0x0   | [DMA_AW_DONE](#perf_counter_enable--dma_aw_done)             |
|   15   |   rw   |   0x0   | [DMA_BUF_R_STALL](#perf_counter_enable--dma_buf_r_stall)     |
|   14   |   rw   |   0x0   | [DMA_BUF_W_STALL](#perf_counter_enable--dma_buf_w_stall)     |
|   13   |   rw   |   0x0   | [DMA_W_STALL](#perf_counter_enable--dma_w_stall)             |
|   12   |   rw   |   0x0   | [DMA_R_STALL](#perf_counter_enable--dma_r_stall)             |
|   11   |   rw   |   0x0   | [DMA_AR_STALL](#perf_counter_enable--dma_ar_stall)           |
|   10   |   rw   |   0x0   | [DMA_AW_STALL](#perf_counter_enable--dma_aw_stall)           |
|   9    |   rw   |   0x0   | [RETIRED_ACC](#perf_counter_enable--retired_acc)             |
|   8    |   rw   |   0x0   | [RETIRED_I](#perf_counter_enable--retired_i)                 |
|   7    |   rw   |   0x0   | [RETIRED_LOAD](#perf_counter_enable--retired_load)           |
|   6    |   rw   |   0x0   | [RETIRED_INSTR](#perf_counter_enable--retired_instr)         |
|   5    |   rw   |   0x0   | [ISSUE_CORE_TO_FPU](#perf_counter_enable--issue_core_to_fpu) |
|   4    |   rw   |   0x0   | [ISSUE_FPU_SEQ](#perf_counter_enable--issue_fpu_seq)         |
|   3    |   rw   |   0x0   | [ISSUE_FPU](#perf_counter_enable--issue_fpu)                 |
|   2    |   rw   |   0x0   | [TCDM_CONGESTED](#perf_counter_enable--tcdm_congested)       |
|   1    |   rw   |   0x0   | [TCDM_ACCESSED](#perf_counter_enable--tcdm_accessed)         |
|   0    |   rw   |   0x0   | [CYCLE](#perf_counter_enable--cycle)                         |

### PERF_COUNTER_ENABLE . ICACHE_STALL
  Incremented for instruction cache stalls.
  _This is a hart-local signal_
  

### PERF_COUNTER_ENABLE . ICACHE_DOUBLE_HIT
  Incremented for instruction cache double hit.
  _This is a hart-local signal_
  

### PERF_COUNTER_ENABLE . ICACHE_PREFETCH
  Incremented for instruction cache prefetches.
  _This is a hart-local signal_
  

### PERF_COUNTER_ENABLE . ICACHE_HIT
  Incremented for instruction cache hits.
  _This is a hart-local signal_
  

### PERF_COUNTER_ENABLE . ICACHE_MISS
  Incremented for instruction cache misses.
  _This is a hart-local signal_
  

### PERF_COUNTER_ENABLE . DMA_BUSY
  Incremented whenever DMA is busy.
  _This is a DMA-local signal_
  

### PERF_COUNTER_ENABLE . DMA_B_DONE
  Incremented whenever B handshake occurs.
  _This is a DMA-local signal_
  

### PERF_COUNTER_ENABLE . DMA_W_BW
  Whenever W handshake occurs, the counter is incremented
  by the number of bytes transfered in this cycle
  _This is a DMA-local signal_
  

### PERF_COUNTER_ENABLE . DMA_W_DONE
  Incremented whenvever W handshake occurs.
  _This is a DMA-local signal_
  

### PERF_COUNTER_ENABLE . DMA_R_BW
  Whenever R handshake occurs, the counter is incremented
  by the number of bytes transfered in this cycle
  _This is a DMA-local signal_
  

### PERF_COUNTER_ENABLE . DMA_R_DONE
  Incremented whenever R handshake occurs.
  _This is a DMA-local signal_
  

### PERF_COUNTER_ENABLE . DMA_AR_BW
  Whenever AR handshake occurs, the counter is incremented
  by the number of bytes transfered for this transaction
  _This is a DMA-local signal_
  

### PERF_COUNTER_ENABLE . DMA_AR_DONE
  Incremented whenever AR handshake occurs.
  _This is a DMA-local signal_
  

### PERF_COUNTER_ENABLE . DMA_AW_BW
  Whenever AW handshake occurs, the counter is incremented
  by the number of bytes transfered for this transaction
  _This is a DMA-local signal_
  

### PERF_COUNTER_ENABLE . DMA_AW_DONE
  Incremented whenever AW handshake occurs.
  _This is a DMA-local signal_
  

### PERF_COUNTER_ENABLE . DMA_BUF_R_STALL
  Incremented whenever r_valid = 1 but r_ready = 0.
  _This is a DMA-local signal_
  

### PERF_COUNTER_ENABLE . DMA_BUF_W_STALL
  Incremented whenever w_ready = 1 but w_valid = 0.
  _This is a DMA-local signal_
  

### PERF_COUNTER_ENABLE . DMA_W_STALL
  Incremented whenever w_valid = 1 but w_ready = 0.
  _This is a DMA-local signal_
  

### PERF_COUNTER_ENABLE . DMA_R_STALL
  Incremented whenever r_ready = 1 but r_valid = 0.
  _This is a DMA-local signal_
  

### PERF_COUNTER_ENABLE . DMA_AR_STALL
  Incremented whenever ar_valid = 1 but ar_ready = 0.
  _This is a DMA-local signal_
  

### PERF_COUNTER_ENABLE . DMA_AW_STALL
  Incremented whenever aw_valid = 1 but aw_ready = 0.
  _This is a DMA-local signal_
  

### PERF_COUNTER_ENABLE . RETIRED_ACC
  Offloaded instructions retired by the core. _This is a hart-local signal._
  

### PERF_COUNTER_ENABLE . RETIRED_I
  Base instructions retired by the core. _This is a hart-local signal._
  

### PERF_COUNTER_ENABLE . RETIRED_LOAD
  Load instructions retired by the core. _This is a hart-local signal._
  

### PERF_COUNTER_ENABLE . RETIRED_INSTR
  Instructions retired by the core. _This is a hart-local signal._
  

### PERF_COUNTER_ENABLE . ISSUE_CORE_TO_FPU
Incremented whenever the core issues an FPU instruction.
  _This is a hart-local signal._

### PERF_COUNTER_ENABLE . ISSUE_FPU_SEQ
  Incremented whenever the FPU Sequencer issues an FPU instruction.
  Might be non available if the hardware doesn't support FREP.
  _This is a hart-local signal._
  

### PERF_COUNTER_ENABLE . ISSUE_FPU
  Core operations performed in the FPU. _This is a hart-local signal._
  

### PERF_COUNTER_ENABLE . TCDM_CONGESTED
  Incremented whenever an access twoards the TCDM is made but the arbitration
  logic didn't grant the access (due to congestion). Is strictly less than TCDM_ACCESSED.
  _This is a cluster-global signal._
  

### PERF_COUNTER_ENABLE . TCDM_ACCESSED
  Increased whenever the TCDM is accessed. Each individual access is tracked,
  so if `n` cores access the TCDM, `n` will be added. Accesses are tracked at the TCDM,
  so it doesn't matter whether the cores or the for example the SSR hardware accesses
  the TCDM. _This is a cluster-global signal._
  

### PERF_COUNTER_ENABLE . CYCLE
Cycle counter. Counts up as long as the cluster is powered.

## HART_SELECT
Select from which hart in the cluster, starting from `0`,
   the event should be counted. For each performance counter
   the cores can be selected individually. If a hart greater
   than the clusters total hart size is selected the selection
   will wrap and the hart corresponding to `hart_select % total_harts_in_cluster`
   will be selected.
- Reset default: `0x0`
- Reset mask: `0x3ff`

### Instances

| Name          | Offset   |
|:--------------|:---------|
| HART_SELECT_0 | 0x10     |
| HART_SELECT_1 | 0x18     |


### Fields

```wavejson
{"reg": [{"name": "HART_SELECT", "bits": 10, "attr": ["rw"], "rotate": -90}, {"bits": 54}], "config": {"lanes": 1, "fontsize": 10, "vspace": 130}}
```

|  Bits  |  Type  |  Reset  | Name        | Description                                   |
|:------:|:------:|:-------:|:------------|:----------------------------------------------|
| 63:10  |        |         |             | Reserved                                      |
|  9:0   |   rw   |   0x0   | HART_SELECT | Select source of per-hart performance counter |

## PERF_COUNTER
Performance counter. Set corresponding PERF_COUNTER_ENABLE bits depending on what
performance metric you would like to track.
- Reset default: `0x0`
- Reset mask: `0xffffffffffff`

### Instances

| Name           | Offset   |
|:---------------|:---------|
| PERF_COUNTER_0 | 0x20     |
| PERF_COUNTER_1 | 0x28     |


### Fields

```wavejson
{"reg": [{"name": "PERF_COUNTER", "bits": 48, "attr": ["rw"], "rotate": 0}, {"bits": 16}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name         | Description         |
|:------:|:------:|:-------:|:-------------|:--------------------|
| 63:48  |        |         |              | Reserved            |
|  47:0  |   rw   |    x    | PERF_COUNTER | Performance counter |

## CL_CLINT_SET
Set bits in the cluster-local CLINT. Writing a 1 at location i sets the cluster-local interrupt
of hart i, where i is relative to the first hart in the cluster, ignoring the cluster base hart ID.
- Offset: `0x30`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "CL_CLINT_SET", "bits": 32, "attr": ["wo"], "rotate": 0}, {"bits": 32}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name         | Description                           |
|:------:|:------:|:-------:|:-------------|:--------------------------------------|
| 63:32  |        |         |              | Reserved                              |
|  31:0  |   wo   |    x    | CL_CLINT_SET | Set cluster-local interrupt of hart i |

## CL_CLINT_CLEAR
Clear bits in the cluster-local CLINT. Writing a 1 at location i clears the cluster-local interrupt
of hart i, where i is relative to the first hart in the cluster, ignoring the cluster base hart ID.
- Offset: `0x38`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "CL_CLINT_CLEAR", "bits": 32, "attr": ["wo"], "rotate": 0}, {"bits": 32}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name           | Description                             |
|:------:|:------:|:-------:|:---------------|:----------------------------------------|
| 63:32  |        |         |                | Reserved                                |
|  31:0  |   wo   |    x    | CL_CLINT_CLEAR | Clear cluster-local interrupt of hart i |

## HW_BARRIER
Hardware barrier register. Loads to this register will block until all cores have
performed the load. At this stage we know that they reached the same point in the control flow,
i.e., the cores are synchronized.
- Offset: `0x40`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "HW_BARRIER", "bits": 32, "attr": ["ro"], "rotate": 0}, {"bits": 32}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name       | Description                |
|:------:|:------:|:-------:|:-----------|:---------------------------|
| 63:32  |        |         |            | Reserved                   |
|  31:0  |   ro   |    x    | HW_BARRIER | Hardware barrier register. |

## ICACHE_PREFETCH_ENABLE
Controls prefetching of the instruction cache.
- Offset: `0x48`
- Reset default: `0x1`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "ICACHE_PREFETCH_ENABLE", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 63}], "config": {"lanes": 1, "fontsize": 10, "vspace": 240}}
```

|  Bits  |  Type  |  Reset  | Name                   | Description                |
|:------:|:------:|:-------:|:-----------------------|:---------------------------|
|  63:1  |        |         |                        | Reserved                   |
|   0    |   wo   |   0x1   | ICACHE_PREFETCH_ENABLE | Hardware barrier register. |

## SPATZ_STATUS
Sets the status of the Spatz cluster.
- Offset: `0x50`
- Reset default: `0x0`
- Reset mask: `0x1`

### Fields

```wavejson
{"reg": [{"name": "SPATZ_CLUSTER_PROBE", "bits": 1, "attr": ["wo"], "rotate": -90}, {"bits": 63}], "config": {"lanes": 1, "fontsize": 10, "vspace": 210}}
```

|  Bits  |  Type  |  Reset  | Name                | Description                                  |
|:------:|:------:|:-------:|:--------------------|:---------------------------------------------|
|  63:1  |        |         |                     | Reserved                                     |
|   0    |   wo   |   0x0   | SPATZ_CLUSTER_PROBE | Indicates the cluster is computing a kernel. |

## CLUSTER_BOOT_CONTROL
Controls the cluster boot process.
- Offset: `0x58`
- Reset default: `0x0`
- Reset mask: `0xffffffff`

### Fields

```wavejson
{"reg": [{"name": "ENTRY_POINT", "bits": 32, "attr": ["rw"], "rotate": 0}, {"bits": 32}], "config": {"lanes": 1, "fontsize": 10, "vspace": 80}}
```

|  Bits  |  Type  |  Reset  | Name        | Description                     |
|:------:|:------:|:-------:|:------------|:--------------------------------|
| 63:32  |        |         |             | Reserved                        |
|  31:0  |   rw   |   0x0   | ENTRY_POINT | Post-bootstrapping entry point. |

