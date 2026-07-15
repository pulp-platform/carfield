#include "car_iommu.h"

/** IOMMU hw structure only visible inside IOMMU driver */
static const iommu_t *iommu = (const iommu_t *)0x2000a000;

ddt_t root_ddt[DDT_N_ENTRIES] __attribute__((aligned(PAGE_SIZE))) __attribute__((section(".noinit.data")));
pte_t s1pt[6][PAGE_SIZE/sizeof(pte_t)] __attribute__((aligned(PAGE_SIZE))) __attribute__((section(".noinit.data")));
uint64_t command_queue[CQ_N_ENTRIES * 2 * sizeof(uint64_t)] __attribute__((aligned(PAGE_SIZE))) __attribute__((section(".noinit.data")));
uint64_t fault_queue[FQ_N_ENTRIES * 4 * sizeof(uint64_t)] __attribute__((aligned(PAGE_SIZE))) __attribute__((section(".noinit.data")));


static inline uint64_t read64(uintptr_t addr){
    return *((volatile uint64_t*) addr);
}

static inline uint32_t read32(uintptr_t addr){
    return *((volatile uint32_t*) addr);
}

static inline uint16_t read16(uintptr_t addr){
    return *((volatile uint16_t*) addr);    
}

static inline uint8_t read8(uintptr_t addr){
    return *((volatile uint8_t*) addr);    
}

static inline void write64(uintptr_t addr, uint64_t val){
    *((volatile uint64_t*) addr) = val;
}

static inline void write32(uintptr_t addr, uint32_t val){
    *((volatile uint32_t*) addr) = val;
}

static inline void write16(uintptr_t addr, uint16_t val){
    *((volatile uint16_t*) addr) = val;    
}

static inline void write8(uintptr_t addr, uint8_t val){
    *((volatile uint8_t*) addr) = val;    
}

void set_iommu_off()
{
    // Program ddtp register with DDT mode and root DDT base PPN
    uintptr_t ddtp = ((((uintptr_t)root_ddt) >> 2) & DDTP_PPN_MASK) | (DDTP_MODE_OFF);

    write64((uintptr_t)&iommu->ddtp, ddtp);
}


void set_iommu_bare()
{
    // Program ddtp register with DDT mode and root DDT base PPN
    uintptr_t ddtp = ((((uintptr_t)root_ddt) >> 2) & DDTP_PPN_MASK) | (DDTP_MODE_BARE);

    write64((uintptr_t)&iommu->ddtp, ddtp);
}

void set_iommu_1lvl()
{
    // Program ddtp register with DDT mode and root DDT base PPN
    uintptr_t ddtp = ((((uintptr_t)root_ddt) >> 2) & DDTP_PPN_MASK) | (DDTP_MODE_1LVL);
    
    write64((uintptr_t)&iommu->ddtp, ddtp);
}

void s1pt_map(uint64_t p_addr, uint64_t iov_addr, uint64_t size) {
	uint64_t n_pages = size >> PAGE_SHIFT;
	for(uint64_t i = 0; i < n_pages; i++) {
		s1pt[2][PTE_INDEX(2, iov_addr)] = ((p_addr >> 2) & PTE_ADDR_MSK) | (PTE_AD | PTE_V | PTE_U | PTE_RWX);
		s1pt[1][PTE_INDEX(1, iov_addr)] = PTE_V | ((((uintptr_t)&s1pt[2][PTE_INDEX(2, iov_addr)]) >> 2) & PTE_PPN_MSK);
		s1pt[0][PTE_INDEX(0, iov_addr)] = PTE_V | ((((uintptr_t)&s1pt[1][PTE_INDEX(1, iov_addr)]) >> 2) & PTE_PPN_MSK);

		p_addr += PAGE_SIZE;
		iov_addr += PAGE_SIZE;
	}
}

void rv_iommu_cq_init(void)
{
    // Configure cqb with base PPN of the queue and size as log2(N)
    write64((uintptr_t)&iommu->cqb, ((((uintptr_t)command_queue) >> 2) & CQB_PPN_MASK) | CQ_LOG2SZ_1);

    // Set cqt equal to cqh
    write32((uintptr_t)&iommu->cqt, read32((uintptr_t)&iommu->cqh));

    // Write 1 to cqcsr.cqen to enable the CQ
    write32((uintptr_t)&iommu->cqcsr, CQCSR_CQEN | CQCSR_CIE);

    // Poll cqcsr.cqon until it reads 1
    while (!(read32((uintptr_t)&iommu->cqcsr) & CQCSR_CQON));
}