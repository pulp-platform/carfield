#pragma once
#include "encoding.h"
#include <stdint.h>
#include <stddef.h>

#define PULP_NOINLINE __attribute__ ((noinline))

extern volatile uint8_t l1_alloc_base;

typedef uint32_t pulp_id_t;
typedef uint32_t pulp_timer_t;

extern volatile uint32_t barrier_reg;

#define l1_alloc(size, l1_alloc_base_ptr) next_l1_alloc; next_l1_alloc += size;

static inline void * const get_l1_alloc_base() { return &l1_alloc_base;}

/// Obtain the number of cores in the current cluster.
static inline pulp_id_t pulp_get_core_count() {
    extern uint32_t nr_cores_address_reg;
	return nr_cores_address_reg;
}

/// Obtain the ID of the current core.
static inline pulp_id_t pulp_get_core_id() {
	pulp_id_t r;
	asm volatile ("csrr %0, mhartid" : "=r"(r));
    // Hart of snitch starts at 0 (avispado before)
	return r-0x10;
}

/// Obtain a monotonically increasing cycle count.
static inline pulp_timer_t pulp_get_timer() {
	return read_csr(mcycle);
}

/// Synchronize the integer and float pipelines. A no-op on non-F/D cores.
static inline void fpu_fence() {
    if (read_csr(misa) & (1 << 5)) {
        uint32_t tmp;
        asm volatile (
            "fmv.x.w %[tmp], fa0 \n"
            "mv zero, %[tmp] \n"
            : [tmp] "=r"(tmp)
            :: "memory"
        );
    }
}

/// A cluster-local barrier.
static inline void pulp_barrier() {
    // // The following is a software-only barrier using AMOs.
    // uint32_t core_id = pulp_get_core_id();
    // uint32_t core_count = pulp_get_core_count();
    // uint32_t mask = 1 << core_id;
    // uint32_t others = ((1 << core_count) - 1) ^ mask;
    // if (core_id == 0) {
    //     while ((__atomic_load_n(&atomic_barrier, __ATOMIC_RELAXED) & others) != others);
    //     __atomic_or_fetch(&atomic_barrier, mask, __ATOMIC_RELAXED);
    //     while ((__atomic_load_n(&atomic_barrier, __ATOMIC_RELAXED) & others) != 0);
    //     __atomic_and_fetch(&atomic_barrier, ~mask, __ATOMIC_RELAXED);
    // } else {
    //     while ((__atomic_load_n(&atomic_barrier, __ATOMIC_RELAXED) & 1) != 0);
    //     __atomic_or_fetch(&atomic_barrier, mask, __ATOMIC_RELAXED);
    //     while ((__atomic_load_n(&atomic_barrier, __ATOMIC_RELAXED) & 1) != 1);
    //     __atomic_and_fetch(&atomic_barrier, ~mask, __ATOMIC_RELAXED);
    // }

    // The following uses the hardware barrier.
    uint32_t tmp;
    fpu_fence();
    asm volatile (
        "lw %[tmp], 0(%[addr]) \n"
        "mv zero, %[tmp] \n"
        : [tmp] "=r"(tmp)
        : [addr] "r"(&barrier_reg)
        : "memory");
    asm volatile("csrr x0, 0x7C2" ::: "memory");
}

/// A cluster-local barrier *without* FPU fence
static inline void pulp_barrier_nofpu() {
    uint32_t tmp;
    asm volatile (
        "lw %[tmp], 0(%[addr]) \n"
        "mv zero, %[tmp] \n"
        : [tmp] "=r"(tmp)
        : [addr] "r"(&barrier_reg)
        : "memory");
}


/// The different SSR data movers.
enum ssr_dm {
    SSR_DM0 = 0,
    SSR_DM1 = 1,
    SSR_DM2 = 2,
    // To write to all SSRs, use index 31
    SSR_DM_ALL = 31,
};

/// The different dimensions.
enum ssr_dim {
    SSR_1D = 0,
    SSR_2D = 1,
    SSR_3D = 2,
    SSR_4D = 3,
};

/// The SSR configuration registers.
enum {
    REG_STATUS = 0,
    REG_REPEAT = 1,
    REG_BOUNDS = 2,   // + loop index
    REG_STRIDES = 6,  // + loop index
    REG_RPTR = 24,    // + ssr_dim
    REG_WPTR = 28,    // + ssr_dim
};

/// Enable SSR.
inline void ssr_enable() {
#ifdef __TOOLCHAIN_LLVM__
    __builtin_ssr_enable();
#else
    asm volatile("csrsi 0x7C0, 1\n");
#endif
}

/// Disable SSR.
inline void ssr_disable() {
#ifdef __TOOLCHAIN_LLVM__
    __builtin_ssr_disable();
#else
    asm volatile("csrci 0x7C0, 1\n");
#endif
}

inline uint32_t read_ssr_cfg(uint32_t reg, uint32_t dm) {
    uint32_t value;
    asm volatile("scfgri %[value], %[dm] | %[reg]<<5\n"
                 : [ value ] "=r"(value)
                 : [ dm ] "i"(dm), [ reg ] "i"(reg));
    return value;
}

inline void write_ssr_cfg(uint32_t reg, uint32_t dm, uint32_t value) {
    asm volatile("scfgwi %[value], %[dm] | %[reg]<<5\n" ::[value] "r"(value),
                 [ dm ] "i"(dm), [ reg ] "i"(reg));
}

// Configure an SSR data mover for a 1D loop nest.
inline void ssr_loop_1d(enum ssr_dm dm, size_t b0, size_t s0) {
    --b0;
    write_ssr_cfg(REG_BOUNDS + 0, dm, b0);
    size_t a = 0;
    write_ssr_cfg(REG_STRIDES + 0, dm, s0 - a);
    a += s0 * b0;
}

// Configure an SSR data mover for a 2D loop nest.
inline void ssr_loop_2d(enum ssr_dm dm, size_t b0, size_t b1,
                             size_t s0, size_t s1) {
    --b0;
    --b1;
    write_ssr_cfg(REG_BOUNDS + 0, dm, b0);
    write_ssr_cfg(REG_BOUNDS + 1, dm, b1);
    size_t a = 0;
    write_ssr_cfg(REG_STRIDES + 0, dm, s0 - a);
    a += s0 * b0;
    write_ssr_cfg(REG_STRIDES + 1, dm, s1 - a);
    a += s1 * b1;
}

// Configure an SSR data mover for a 3D loop nest.
inline void ssr_loop_3d(enum ssr_dm dm, size_t b0, size_t b1,
                             size_t b2, size_t s0, size_t s1, size_t s2) {
    --b0;
    --b1;
    --b2;
    write_ssr_cfg(REG_BOUNDS + 0, dm, b0);
    write_ssr_cfg(REG_BOUNDS + 1, dm, b1);
    write_ssr_cfg(REG_BOUNDS + 2, dm, b2);
    size_t a = 0;
    write_ssr_cfg(REG_STRIDES + 0, dm, s0 - a);
    a += s0 * b0;
    write_ssr_cfg(REG_STRIDES + 1, dm, s1 - a);
    a += s1 * b1;
    write_ssr_cfg(REG_STRIDES + 2, dm, s2 - a);
    a += s2 * b2;
}

// Configure an SSR data mover for a 4D loop nest.
// b0: Inner-most bound (limit of loop)
// b3: Outer-most bound (limit of loop)
// s0: increment size of inner-most loop
inline void ssr_loop_4d(enum ssr_dm dm, size_t b0, size_t b1,
                             size_t b2, size_t b3, size_t s0, size_t s1,
                             size_t s2, size_t s3) {
    --b0;
    --b1;
    --b2;
    --b3;
    write_ssr_cfg(REG_BOUNDS + 0, dm, b0);
    write_ssr_cfg(REG_BOUNDS + 1, dm, b1);
    write_ssr_cfg(REG_BOUNDS + 2, dm, b2);
    write_ssr_cfg(REG_BOUNDS + 3, dm, b3);
    size_t a = 0;
    write_ssr_cfg(REG_STRIDES + 0, dm, s0 - a);
    a += s0 * b0;
    write_ssr_cfg(REG_STRIDES + 1, dm, s1 - a);
    a += s1 * b1;
    write_ssr_cfg(REG_STRIDES + 2, dm, s2 - a);
    a += s2 * b2;
    write_ssr_cfg(REG_STRIDES + 3, dm, s3 - a);
    a += s3 * b3;
}

/// Configure the repetition count for a stream.
inline void ssr_repeat(enum ssr_dm dm, size_t count) {
    write_ssr_cfg(REG_REPEAT, dm, count - 1);
}

/// Start a streaming read.
inline void ssr_read(enum ssr_dm dm, enum ssr_dim dim,
                          volatile void *ptr) {
    write_ssr_cfg(REG_RPTR + dim, dm, (uintptr_t)ptr);
}

/// Start a streaming write.
inline void ssr_write(enum ssr_dm dm, enum ssr_dim dim,
                           volatile void *ptr) {
    write_ssr_cfg(REG_WPTR + dim, dm, (uintptr_t)ptr);
}


/// A DMA transfer indentifier.
typedef uint32_t dma_txid_t;

/// Initiate an asynchronous 1D DMA transfer with wide 64-bit pointers.
static inline dma_txid_t __dma_start_1d_wideptr_base(
    uint64_t dst,
    uint64_t src,
    size_t size,
    uint32_t const __deserialize
) {
    register uint32_t reg_dst_low   asm ("a0") = dst >> 0;   // 10
    register uint32_t reg_dst_high  asm ("a1") = dst >> 32;  // 11
    register uint32_t reg_src_low   asm ("a2") = src >> 0;   // 12
    register uint32_t reg_src_high  asm ("a3") = src >> 32;  // 13
    register uint32_t reg_size      asm ("a4") = size;       // 14

    // dmsrc a0, a1
    asm volatile (
        ".word (0b0000000 << 25) | \
               (     (13) << 20) | \
               (     (12) << 15) | \
               (    0b000 << 12) | \
               (0b0101011 <<  0)   \n"
        :: "r"(reg_src_high), "r"(reg_src_low) \
    );

    // dmdst a0, a1
    asm volatile (
        ".word (0b0000001 << 25) | \
               (     (11) << 20) | \
               (     (10) << 15) | \
               (    0b000 << 12) | \
               (0b0101011 <<  0)   \n"
        :: "r"(reg_dst_high), "r"(reg_dst_low) \
    );

    // dmcpyi a0, a4, 0b00
    register uint32_t reg_txid asm ("a0");  // 10
    asm volatile (
        ".word (0b0000010 << 25) | \
               (   %[cfg] << 20) | \
               (     (14) << 15) | \
               (    0b000 << 12) | \
               (     (10) <<  7) | \
               (0b0101011 <<  0)   \n"
        : "=r"(reg_txid) : "r"(reg_size), [cfg]"i"((__deserialize & 1) << 2) \
    );

    return reg_txid;
}

/// Initiate a *serialized* (deadlock-safe) asynchronous 1D DMA transfer with wide 64-bit pointers.
static inline dma_txid_t dma_start_1d_wideptr(
    uint64_t dst,
    uint64_t src,
    size_t size
) {
    return __dma_start_1d_wideptr_base(dst, src, size, 0);
}

/// Initiate a *de-serialized* (deadlock-prone) asynchronous 1D DMA transfer with wide 64-bit pointers.
/// CAUTION: Do *not* issue transfers with different direction, src, or dst in sequence without wait_all()!
static inline dma_txid_t dma_start_1d_wideptr_deser(
    uint64_t dst,
    uint64_t src,
    size_t size
) {
    return __dma_start_1d_wideptr_base(dst, src, size, 1);
}

/// Initiate an asynchronous 1D DMA transfer.
static inline dma_txid_t dma_start_1d(
    void *dst,
    const void *src,
    size_t size
) {
    return dma_start_1d_wideptr((size_t)dst, (size_t)src, size);
}

/// Initiate an asynchronous 2D DMA transfer with wide 64-bit pointers.
static inline dma_txid_t __dma_start_2d_wideptr_base(
    uint64_t dst,
    uint64_t src,
    size_t size,
    size_t dst_stride,
    size_t src_stride,
    size_t repeat,
    uint32_t const __deserialize
) {
    register uint32_t reg_dst_low    asm ("a0") = dst >> 0;    // 10
    register uint32_t reg_dst_high   asm ("a1") = dst >> 32;   // 11
    register uint32_t reg_src_low    asm ("a2") = src >> 0;    // 12
    register uint32_t reg_src_high   asm ("a3") = src >> 32;   // 13
    register uint32_t reg_size       asm ("a4") = size;        // 14
    register uint32_t reg_dst_stride asm ("a5") = dst_stride;  // 15
    register uint32_t reg_src_stride asm ("a6") = src_stride;  // 16
    register uint32_t reg_repeat     asm ("a7") = repeat;      // 17

    // dmsrc a0, a1
    asm volatile (
        ".word (0b0000000 << 25) | \
               (     (13) << 20) | \
               (     (12) << 15) | \
               (    0b000 << 12) | \
               (0b0101011 <<  0)   \n"
        :: "r"(reg_src_high), "r"(reg_src_low) \
    );

    // dmdst a0, a1
    asm volatile (
        ".word (0b0000001 << 25) | \
               (     (11) << 20) | \
               (     (10) << 15) | \
               (    0b000 << 12) | \
               (0b0101011 <<  0)   \n"
        :: "r"(reg_dst_high), "r"(reg_dst_low) \
    );

    // dmstr a5, a6
    asm volatile (
        ".word (0b0000110 << 25) | \
               (     (15) << 20) | \
               (     (16) << 15) | \
               (    0b000 << 12) | \
               (0b0101011 <<  0)   \n"
        : : "r"(reg_dst_stride), "r"(reg_src_stride) \
    );

    // dmrep a7
    asm volatile (
        ".word (0b0000111 << 25) | \
               (     (17) << 15) | \
               (    0b000 << 12) | \
               (0b0101011 <<  0)   \n"
        : : "r"(reg_repeat) \
    );

    // dmcpyi a0, a4, 0b10
    register uint32_t reg_txid asm ("a0");  // 10
    asm volatile (
        ".word (0b0000010 << 25) | \
               (   %[cfg] << 20) | \
               (     (14) << 15) | \
               (    0b000 << 12) | \
               (     (10) <<  7) | \
               (0b0101011 <<  0)   \n"
        : "=r"(reg_txid) : "r"(reg_size), [cfg]"i"(((__deserialize & 1) << 2) | 0b00010) \
    );

    return reg_txid;
}

/// Initiate a *serialized* (deadlock-safe) asynchronous 2D DMA transfer with wide 64-bit pointers.
static inline dma_txid_t dma_start_2d_wideptr(
    uint64_t dst,
    uint64_t src,
    size_t size,
    size_t dst_stride,
    size_t src_stride,
    size_t repeat
) {
    return __dma_start_2d_wideptr_base(dst, src, size, dst_stride, src_stride, repeat, 0);
}

/// Initiate a *de-serialized* (deadlock-prone) asynchronous 2D DMA transfer with wide 64-bit pointers.

static inline dma_txid_t dma_start_2d_wideptr_deser(
    uint64_t dst,
    uint64_t src,
    size_t size,
    size_t dst_stride,
    size_t src_stride,
    size_t repeat
) {
    return __dma_start_2d_wideptr_base(dst, src, size, dst_stride, src_stride, repeat, 1);
}

/// Initiate an asynchronous 2D DMA transfer.
static inline dma_txid_t dma_start_2d(
    void *dst,
    const void *src,
    size_t size,
    size_t src_stride,
    size_t dst_stride,
    size_t repeat
) {
    return dma_start_2d_wideptr(
        (size_t)dst, (size_t)src, size,
        src_stride, dst_stride, repeat
    );
}

/// Block until a transfer finishes.
static inline void dma_wait(dma_txid_t tid) {
    // dmstati t0, 0  # 2=status.completed_id
    asm volatile (
        "1: \n"
        ".word (0b0000100 << 25) | \
               (  0b00000 << 20) | \
               (    0b000 << 12) | \
               (      (5) <<  7) | \
               (0b0101011 <<  0)   \n"
        "sub t0, t0, %0 \n"
        "blez t0, 1b \n"
        :: "r"(tid) : "t0"
    );
}

/// Block until all operation on the DMA ceases.
static inline void dma_wait_all() {
    // dmstati t0, 2  # 2=status.busy
    asm volatile (
        "1: \n"
        ".word (0b0000100 << 25) | \
               (  0b00010 << 20) | \
               (    0b000 << 12) | \
               (      (5) <<  7) | \
               (0b0101011 <<  0)   \n"
        "bne t0, zero, 1b \n"
        ::: "t0"
    );
}

static inline void mutex_release(volatile uint32_t *pmtx) {
    asm volatile("fence \n"
                 "amoswap.w.rl  x0,x0,(%0)   # Release lock by storing 0\n"
                 : "+r"(pmtx));
}

static inline void mutex_acquire(volatile uint32_t *pmtx) {
    asm volatile(
        "li            t0,1          # t0 = 1\n"
        "1:\n"
        "  amoswap.w.aq  t0,t0,(%0)   # t0 = oldlock & lock = 1\n"
        "  bnez          t0,1b      # Retry if previously set)\n"
        "  fence \n"
        : "+r"(pmtx)
        :
        : "t0");
}
