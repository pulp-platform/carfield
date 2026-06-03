#include <stdint.h>
#include "regs/cheshire.h"
#include "dif/clint.h"
#include "dif/uart.h"
#include "params.h"
#include "util.h"

#define TEST_ADDR 0x80010000UL
#define N_WORDS   10

volatile uint64_t *ddr = (volatile uint64_t *)TEST_ADDR;

static void delay_loop(void)
{
    for (volatile uint64_t i = 0; i < 50000000ULL; i++);
}

static void uart_puts(const char *s)
{
    const char *p = s;
    while (*p) p++;

    uart_write_str(&__base_uart, (void *)s, (uint64_t)(p - s));
    uart_write_flush(&__base_uart);
}

static void u64_to_hex(uint64_t val, char *out)
{
    const char hex[] = "0123456789abcdef";

    for (int i = 0; i < 16; i++) {
        out[15 - i] = hex[val & 0xFULL];
        val >>= 4;
    }

    out[16] = '\0';
}

static void print_entry(int idx, uint64_t val)
{
    char line[40];
    char hexstr[17];

    u64_to_hex(val, hexstr);

    line[0] = '[';
    line[1] = '0' + idx;
    line[2] = ']';
    line[3] = ' ';
    line[4] = '=';
    line[5] = ' ';
    line[6] = '0';
    line[7] = 'x';

    for (int i = 0; i < 16; i++) {
        line[8 + i] = hexstr[i];
    }

    line[24] = '\r';
    line[25] = '\n';
    line[26] = '\0';

    uart_puts(line);
}

int main(void)
{
    uint32_t rtc_freq;
    uint64_t reset_freq;

    rtc_freq = *reg32(&__base_regs, CHESHIRE_RTC_FREQ_REG_OFFSET);
    reset_freq = clint_get_core_freq(rtc_freq, 2500);

    uart_init(&__base_uart, reset_freq, 115200);

    uart_puts("Carfield DDR reader start\r\n");

    while (1) {
        uart_puts("\r\nBuffer:\r\n");

        for (int i = 0; i < N_WORDS; i++) {
            print_entry(i, ddr[i]);
        }

        uart_puts("----------------------\r\n");

        delay_loop();
    }

    return 0;
}

// PS C Code
/*
#include <stdint.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_cache.h"

#define TEST_ADDR 0x00010000UL

volatile uint64_t *ddr = (volatile uint64_t *)TEST_ADDR;

int main()
{
    int i;
    
    init_platform();

    xil_printf("ARM DDR writer start\r\n");

    for (i = 0; i < 10; i++) {
        ddr[i] = 0x1111111100000000ULL + i;
    }

    Xil_DCacheFlushRange(TEST_ADDR, 10 * sizeof(uint64_t));

    xil_printf("ARM wrote 10 entries\r\n");

    while (1);

    return 0;
}
*/