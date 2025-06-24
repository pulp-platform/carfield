#include <inttypes.h>
#include "runtime.h"
#include "sw_mailbox.h"
#include "printf.h"

void _putchar(char byte) {
    snrt_putchar((uint32_t)byte);
}

extern volatile uint8_t l1_alloc_base;
const uint32_t __attribute__((section(".init_l1"))) *l1_alloc_base_ptr = (uint32_t *) &l1_alloc_base;
extern volatile uint32_t jump_address;
const uint32_t __attribute__((section(".init_l1"))) *jump_address_ptr  = (uint32_t *) &jump_address;
extern volatile uint32_t scratch_reg;
const uint32_t __attribute__((section(".init_l1"))) *scratch_reg_ptr   = (uint32_t *) &scratch_reg;


volatile uint32_t lock __attribute__ ((section(".noinit_l1")));
static volatile uint32_t quit __attribute__ ((section(".noinit_l1")));

volatile void (*offloadFn)(uint64_t) __attribute__ ((section(".noinit_l1")));
volatile uint64_t offloadArgs __attribute__ ((section(".noinit_l1")));

static int gomp_offload_manager(uint32_t core_idx) {

  uint32_t cmd = (uint32_t)NULL;
  uint32_t data;
  unsigned nbOffloadRabMissHandlers = 0x0;
  uint32_t offload_rab_miss_sync = 0x0U;
  int cycles = 0, dma_wait_cycles = 0;
  uint32_t issue_fpu, dma_busy;

  while (1) {
    if(core_idx == 8) {
        mailbox_read((unsigned int *)&cmd, 1);
        // printf("\n\rReceived command: %x\n\r", cmd);
        cycles = read_csr(mcycle);
        if (MBOX_DEVICE_STOP == cmd) {
            quit = 1;
            // Wake up the other cores (pre offload barrier)
            pulp_barrier();
            break;
        } else if (MBOX_DEVICE_LOGLVL == cmd) {
        mailbox_read((unsigned int *)&data, 1);
        continue;
        } else if (MBOX_DEVICE_START != cmd) {
        break;
        }
        mailbox_read((unsigned int *)&offloadFn, 1);
        mailbox_read((unsigned int *)&offloadArgs, 1);
        mailbox_read((unsigned int *)&nbOffloadRabMissHandlers, 1);

        if (offloadArgs != 0x0) {
        }
        cycles = read_csr(mcycle);
        dma_wait_cycles = 0;

    }

    pulp_barrier();

    if(quit)
        break;

    offloadFn(offloadArgs);

    pulp_barrier();

    if(core_idx == 8) {
        mailbox_write(MBOX_DEVICE_DONE);
        cycles = read_csr(mcycle) - cycles;
        mailbox_write(cycles);
        mailbox_write(dma_wait_cycles);
    }
  }
    //exit here
    // CORRECT
  return 0;
}

int main() {
    uint32_t core_idx = pulp_get_core_id();
    int err = 0;

    if(core_idx == 8) {
        lock = 0;
        quit = 0;
        struct l3_layout *l3l_ptr = (struct l3_layout *)(*scratch_reg_ptr);
        g_a2h_rb =   (struct ring_buf*)l3l_ptr->a2h_rb;
        g_a2h_mbox = (struct ring_buf*)l3l_ptr->a2h_mbox;
        g_h2a_mbox = (struct ring_buf*)l3l_ptr->h2a_mbox;
    }

    gomp_offload_manager(core_idx);

    return 0;
}
