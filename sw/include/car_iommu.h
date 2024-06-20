#pragma once

#include <stdint.h>

#define PAGE_SIZE 0x1000ULL // 4kiB

#define IOMMU_MAX_HPM_COUNTERS 31
#define IOMMU_MAX_MSI_CFG_TABLE 16

// Number of entries in the CQ. Must be POT
#define CQ_N_ENTRIES    (64 )
// Size of the queue represented as Log2(64)-1 = 5
#define CQ_LOG2SZ_1     (5  )

// Number of entries in the FQ. Must be POT
#define FQ_N_ENTRIES    (64)
// Size of the queue represented as Log2(64)-1 = 5
#define FQ_LOG2SZ_1     (5 )

// Mask for ddtp.PPN (ddtp[53:10])
#define DDTP_PPN_MASK    (0x3FFFFFFFFFFC00ULL)

// Define DDT (IOMMU) mode
#define DDTP_MODE_OFF   (0ULL)
#define DDTP_MODE_BARE  (1ULL)
#define DDTP_MODE_1LVL  (2ULL)
#define DDTP_MODE_2LVL  (3ULL)
#define DDTP_MODE_3LVL  (4ULL)

// IOMMU Register Offsets
#define IOMMU_CAPABILITIES_OFFSET   0x0
#define IOMMU_FCTL_OFFSET           0x8
#define IOMMU_DDTP_OFFSET           0x10
#define IOMMU_CQB_OFFSET            0x18
#define IOMMU_CQH_OFFSET            0x20
#define IOMMU_CQT_OFFSET            0x24
#define IOMMU_FQB_OFFSET            0x28
#define IOMMU_FQH_OFFSET            0x30
#define IOMMU_FQT_OFFSET            0x34
#define IOMMU_CQCSR_OFFSET          0x48
#define IOMMU_FQCSR_OFFSET          0x4c
#define IOMMU_IPSR_OFFSET           0x54
#define IOMMU_IOCOUNTOVF_OFFSET     0x58
#define IOMMU_IOCOUNTINH_OFFSET     0x5c
#define IOMMU_IOHPMCYCLES_OFFSET    0x60
#define IOMMU_IOHPMCTR_OFFSET       0x68
#define IOMMU_IOHPMEVT_OFFSET       0x160
#define IOMMU_TR_REQ_IOVA_OFFSET    0x258
#define IOMMU_TR_REQ_CTL_OFFSET     0x260
#define IOMMU_TR_RESPONSE_OFFSET    0x268
#define IOMMU_ICVEC_OFFSET          0x2f8

// iosatp encoding to configure DC.fsc
#define IOSATP_MODE_BARE    (0x0ULL << 60)
#define IOSATP_MODE_SV39    (0x8ULL << 60)
// iohgatp encoding to configure DC.iohgatp
#define IOHGATP_MODE_BARE   (0x0ULL << 60)
#define IOHGATP_MODE_SV39X4 (0x8ULL << 60)

// DC.tc flags
#define DC_TC_VALID     (1ULL << 0 )    // Valid
#define DC_TC_EN_ATS    (1ULL << 1 )    // EN PCIe Address Translation Services
#define DC_TC_EN_PRI    (1ULL << 2 )    // EN PCIe Page Request If
#define DC_TC_T2GPA     (1ULL << 3 )    // The IOMMU respond ATS Requests with GPAs
#define DC_TC_DTF       (1ULL << 4 )    // Disable report of translation faults through the FQ
#define DC_TC_PDTV      (1ULL << 5 )    // PC associated to this DC
#define DC_TC_PRPR      (1ULL << 6 )    // Include PASID in IOMMU-generated PRGR message if associated PR has a PASID
#define DC_TC_GADE      (1ULL << 7 )    // The IOMMU updates second-stage A and D bits atomically
#define DC_TC_SADE      (1ULL << 8 )    // The IOMMU updates first-stage A and D bits atomically
#define DC_TC_DPE       (1ULL << 9 )    // Default process_id value is 0 for requests without valid process_id
#define DC_TC_SBE       (1ULL << 10)    // Endianness for implicit accesses to PDT and first-stage PTEs
#define DC_TC_SXL       (1ULL << 11)    // To define first-stage translation scheme
#define DC_TC_RSV       (1ULL << 12)    // To raise fault for setting rsvd fields

#define GSCID_OFF       (44)
#define PSCID_OFF       (12)

// Number of entries of the root DDT (4-kiB / 64 bytes p/ entry)
#if (MSI_TRANSLATION == 1)
# define DDT_N_ENTRIES      (0x1000 / 64)   // 64 entries
typedef struct ddt{
    uint64_t tc;                // translation control
    uint64_t iohgatp;           // IO hypervisor guest address translation and protection
    uint64_t ta;                // translation attributes
    uint64_t fsc;               // first-stage context
    uint64_t msiptp;            // MSI page-table pointer
    uint64_t msi_addr_mask;     // MSI address mask
    uint64_t msi_addr_pattern;  // MSI address pattern
    uint64_t reserved;
}ddt_t;
#define DC_SIZE (8)
#else
# define DDT_N_ENTRIES      (0x1000 / 32)   // 128 entries
# define DC_SIZE            (4)
typedef struct ddt{
    uint64_t tc; // translation control
    uint64_t iohgatp; // IO hypervisor guest address translation and protection
    uint64_t ta; // translation attributes
    uint64_t fsc; // first-stage context
}ddt_t;
#endif

typedef struct debug {
  uint64_t tr_req_iova; // translation-request IOVA
  uint64_t tr_req_ctl;  // translation-request control
  uint64_t tr_response; // translation-request response
} iommu_debug_t;

typedef struct msi_cfg_table_t {
  uint64_t addr;
  uint32_t data;
  uint32_t vctl;
} iommu_msi_cfg_table_t;

typedef struct iommu {
  uint64_t capabilities;// IOMMU implemented capabilities
  uint32_t fctl;        // features control
  uint32_t reserved0;
  uint64_t ddtp;        // device directory table pointer
  uint64_t cqb;         // command-queue base
  uint32_t cqh;         // command-queue head
  uint32_t cqt;         // command-queue tail
  uint64_t fqb;         // fault-queue base
  uint32_t fqh;         // fault-queue head
  uint32_t fqt;         // fault-queue tail
  uint64_t pqb;         // page-request-queue base
  uint32_t pqh;         // page-request-queue head
  uint32_t pqt;         // page-request-queue tail
  uint32_t cqcsr;       // command-queue csr
  uint32_t fqcsr;       // fault-queue csr
  uint32_t pqcsr;       // page-request-queue csr
  uint32_t ipsr;        // interrupt pending status register
  uint32_t iocntovf;    // hpm counter overflows
  uint32_t iocntinh;    // hpm counter inhibits
  uint64_t iohpmcycles; // hpm cycles counter
  uint64_t iohpmctr[IOMMU_MAX_HPM_COUNTERS]; // hpm event counters
  uint64_t iohpmevt[IOMMU_MAX_HPM_COUNTERS]; // hpm event selector
  iommu_debug_t debug_inf; // IOMMU debug interface
  uint64_t reserved[8]; // reserved for future use
  uint64_t custom[9];   // designated for costum use
  uint64_t icvec;       // interrupt cause to interrupt vector
  iommu_msi_cfg_table_t msi_cfg_tbl[IOMMU_MAX_MSI_CFG_TABLE]; 
}__attribute__((__packed__, aligned(PAGE_SIZE))) iommu_t;

typedef uint64_t command_t[2];


/***************************************************************************************************
 *                             RISC-V Page Tables Related Macros                                   *
 **************************************************************************************************/

#define BIT_MASK(pos, len) ( ( (1ULL<<(len)) - 1) << (pos) )

#define PT_SIZE (PAGE_SIZE)
#define PAGE_ADDR_MSK (~(PAGE_SIZE - 1))  // ... 1111 1111 0000 0000 0000
#define PAGE_SHIFT (12)

// N = 0:   1 GiB superpages (addr[55:30] = '0) (0x40000000)
// N = 1:   2 MiB superpages (addr[55:21] = '0) (0x00200000)
// N = 2:   4 kiB pages      (addr[55:12] = '0) (0x00001000)
#define SUPERPAGE_SIZE(N) ((PAGE_SIZE) << (((2-N))*9))

#define PT_LVLS (3)  // assumes sv39 for rv64
#define PTE_INDEX_SHIFT(LEVEL) ((9 * (PT_LVLS - 1 - (LEVEL))) + 12)
#define PTE_ADDR_MSK BIT_MASK(12, 44)

#define PTE_INDEX(LEVEL, ADDR) (((ADDR) >> PTE_INDEX_SHIFT(LEVEL)) & (0x1FF))
#define PTE_FLAGS_MSK BIT_MASK(0, 8)

#define PTE_VALID   (1ULL << 0)
#define PTE_READ    (1ULL << 1)
#define PTE_WRITE   (1ULL << 2)
#define PTE_EXECUTE (1ULL << 3)
#define PTE_USER    (1ULL << 4)
#define PTE_GLOBAL  (1ULL << 5)
#define PTE_ACCESS  (1ULL << 6)
#define PTE_DIRTY   (1ULL << 7)

#define PTE_V       PTE_VALID
#define PTE_AD      (PTE_ACCESS | PTE_DIRTY)
#define PTE_U       PTE_USER
#define PTE_R       (PTE_READ)
#define PTE_RW      (PTE_READ | PTE_WRITE)
#define PTE_X       (PTE_EXECUTE)
#define PTE_RX      (PTE_READ | PTE_EXECUTE)
#define PTE_RWX     (PTE_READ | PTE_WRITE | PTE_EXECUTE)

#define PTE_PPN_MSK (0x3FFFFFFFFFFC00ULL)

#define PTE_RSW_OFF (8)
#define PTE_RSW_LEN (2)
#define PTE_RSW_MSK BIT_MASK(PTE_RSW_OFF, PTE_RSW_LEN)

#define STAGE1_PERM_1GIB    (PTE_V | PTE_AD | PTE_U | PTE_RWX)
#define STAGE1_PERM_2MIB    (PTE_V | PTE_AD | PTE_U | PTE_RWX)
#define STAGE2_PERM_1GIB    (PTE_V | PTE_AD | PTE_U | PTE_RWX)
#define STAGE2_PERM_2MIB    (PTE_V | PTE_AD | PTE_U | PTE_RWX)


/***************************************************************************************************
 *                             RISC-V Command queue  Related Macros                                *
 **************************************************************************************************/

// Mask for cqb.PPN (cqb[53:10])
#define CQB_PPN_MASK    (0x3FFFFFFFFFFC00ULL)
// Mask for CQ PPN (cqb[55:12])
#define CQ_PPN_MASK        (0xFFFFFFFFFFF000ULL)
// Mask for ADDR[63:12]
#define ADDR_63_12_MASK (0xFFFFFFFFFFFFF000ULL)
// Offset for cqb.PPN
#define CQB_PPN_OFF     (10)

// opcodes
#define IOTINVAL    (0x1ULL << 0)
#define IOFENCE     (0x2ULL << 0)
#define IODIR       (0x3ULL << 0)

// func3
#define VMA         (0ULL << 7)
#define GVMA        (1ULL << 7)
#define FUNC3_C     (0ULL << 7)
#define INVAL_DDT   (0ULL << 7)
#define INVAL_PDT   (1ULL << 7)

// misc fields
#define IOTINVAL_AV     (1ULL << 10)
#define IOTINVAL_GV     (1ULL << 33)
#define IOTINVAL_PSCV   (1ULL << 32)

#define IOFENCE_AV      (1ULL << 10)
#define IOFENCE_WSI     (1ULL << 11)
#define IOFENCE_PR      (1ULL << 12)
#define IOFENCE_PW      (1ULL << 13)
#define IOFENCE_ADDR    (0x82000000ULL)

#define IODIR_DV        (1ULL << 33)

// cqcsr masks
#define CQCSR_CQEN          (1UL << 0)
#define CQCSR_CIE           (1UL << 1)
#define CQCSR_CQMF          (1UL << 8)
#define CQCSR_CMD_TO        (1UL << 9)
#define CQCSR_CMD_ILL       (1UL << 10)
#define CQCSR_FENCE_W_IP    (1UL << 11)
#define CQCSR_CQON          (1UL << 16)
#define CQCSR_BUSY          (1UL << 17)

// offsets
#define IOTINVAL_PSCID_OFF  (12)
#define IOTINVAL_GSCID_OFF  (44)
#define IOTINVAL_IOVA_OFF   (10)

#define IODIR_DID_OFF       (40)

typedef uint64_t pte_t;

extern void set_iommu_off();
extern void set_iommu_bare();
extern void set_iommu_1lvl();

extern void rv_iommu_cq_init();

extern void s1pt_map(uint64_t p_addr, uint64_t iov_addr, uint64_t size);

extern ddt_t root_ddt[DDT_N_ENTRIES] __attribute__((aligned(PAGE_SIZE))) __attribute__((section(".noinit.data")));
extern pte_t s1pt[6][PAGE_SIZE/sizeof(pte_t)] __attribute__((aligned(PAGE_SIZE))) __attribute__((section(".noinit.data")));
extern uint64_t command_queue[CQ_N_ENTRIES * 2 * sizeof(uint64_t)] __attribute__((aligned(PAGE_SIZE))) __attribute__((section(".noinit.data")));
extern uint64_t fault_queue[FQ_N_ENTRIES * 4 * sizeof(uint64_t)] __attribute__((aligned(PAGE_SIZE))) __attribute__((section(".noinit.data")));
