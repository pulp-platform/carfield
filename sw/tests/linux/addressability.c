#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>

#include <sys/mman.h> // mmap

#include "car_memory_map.h"
#include "io.h"
#include "car_util.h"
#include "regs/cheshire.h"

void *__base_peripherals, *__base_soc_ctrl, *__base_safety_island;
void *base_peripherals, *base_soc_ctrl, *base_safety_island;

int load_binary() { return 0; }

int main(int argc, char *argv[]) {
    char *device_path;
    int device_fd;

    // Receive device path as argument (/dev/carfield for instance)
    if (argc != 2) {
        printf("Wrong usage : %s device\n", argv[0]);
        return -1;
    }

    device_path = argv[1];

    printf("Starting addressability test with %s\n", device_path);

    // mmap the base_soc_ctrl region (page offset 0)
    device_fd = open(device_path, O_RDWR | O_SYNC);
    base_soc_ctrl = mmap(NULL, 0x1000, PROT_READ | PROT_WRITE, MAP_SHARED,
                         device_fd, 0 * getpagesize());

    if (base_soc_ctrl == MAP_FAILED) {
        printf("mmap() failed %s\n", strerror(errno));
        return -EIO;
    }
    printf("mmap() success at %p\n", base_soc_ctrl);

    // mmap the base_safety_island region (page offset 1*get)
    printf("Trying mmap on base_safety_island\n");
    base_safety_island = mmap(NULL, 0x800000, PROT_READ | PROT_WRITE,
                              MAP_SHARED, device_fd, 1 * getpagesize());

    if (base_safety_island == MAP_FAILED) {
        printf("mmap() failed %s\n", strerror(errno));
        return -EIO;
    }
    printf("mmap() success at %p\n", base_safety_island);

    writew(0x1, CAR_SAFETY_ISLAND_PERIPHS_BASE_ADDR(base_safety_island) +
                    SAFETY_SOC_CTRL_BOOTADDR_REG_OFFSET);

    printf("Boot addr : %x\n",
           readw(CAR_SAFETY_ISLAND_PERIPHS_BASE_ADDR(base_safety_island) +
                 SAFETY_SOC_CTRL_BOOTADDR_REG_OFFSET));

    printf("Reset safety\n");
    car_reset_domain(CAR_SAFETY_RST);

    printf("Boot addr : %x\n",
           readw(CAR_SAFETY_ISLAND_PERIPHS_BASE_ADDR(base_safety_island) +
                 SAFETY_SOC_CTRL_BOOTADDR_REG_OFFSET));

    sleep(1);

    munmap(base_soc_ctrl, 0x1000);
    munmap(base_safety_island, 0x800000);
    close(device_fd);

    return 0;
}