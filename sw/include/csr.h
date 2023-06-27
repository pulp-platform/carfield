// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Robert Balas <balasr@iis.ee.ethz.ch>
//

/* Description: CSR access macros
 * Authors: Robert Balas (balasr@iis.ee.ethz.ch)
 */

#ifndef __CSR_H
#define __CSR_H

/* TODO: complete this */
#define CSR_MSTATUS    0x300
#define CSR_MISA       0x301
#define CSR_MIE	       0x304
#define CSR_MTVEC      0x305
#define CSR_MSCRATCH   0x340
#define CSR_MEPC       0x341
#define CSR_MCAUSE     0x342
#define CSR_MTVAL      0x343
#define CSR_MIP	       0x344
#define CSR_MNXTI      0x345
#define CSR_PMPCFG0    0x3a0
#define CSR_PMPADDR0   0x3b0
#define CSR_MHARTID    0xf14
#define CSR_MINTSTATUS 0x346
#define CSR_MINTTHRESH 0x347
#define CSR_MCLICBASE  0x350
#define MIE 8

#define __CSR_EXPAND(x) #x

#define csr_read(csr)                                                          \
	({                                                                     \
		register unsigned long __val;                                  \
		asm volatile("csrr %0, " __CSR_EXPAND(csr)                     \
			     : "=r"(__val)                                     \
			     :                                                 \
			     : "memory");                                      \
		__val;                                                         \
	})

#define csr_write(csr, val)                                                    \
	({                                                                     \
		unsigned long __val = (unsigned long)(val);                    \
		asm volatile("csrw " __CSR_EXPAND(csr) ", %0"                  \
			     :                                                 \
			     : "rK"(__val)                                     \
			     : "memory");                                      \
	})

/* I hope this properly does a memory barrier with the "memory" hint */
#define csr_read_clear(csr, val)                                               \
	({                                                                     \
		unsigned long __val = (unsigned long)(val);                    \
		asm volatile("csrrc %0, " __CSR_EXPAND(csr) ", %1"             \
			     : "=r"(__val)                                     \
			     : "rK"(__val)                                     \
			     : "memory");                                      \
		__val;                                                         \
	})

#define csr_read_set(csr, val)                                                 \
	({                                                                     \
		unsigned long __val = (unsigned long)(val);                    \
		asm volatile("csrrs %0, " __CSR_EXPAND(csr) ", %1"             \
			     : "=r"(__val)                                     \
			     : "rK"(__val)                                     \
			     : "memory");                                      \
		__val;                                                         \
	})

#endif
