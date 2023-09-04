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

    // mmap the __base_soc_ctrl region (page offset 0)
    device_fd = open(device_path, O_RDWR | O_SYNC);
    __base_soc_ctrl =
        mmap(NULL, 0x1000, PROT_READ | PROT_WRITE, MAP_SHARED, device_fd, 0);

    if (__base_soc_ctrl == MAP_FAILED) {
        printf("mmap() failed %s\n", strerror(errno));
        return -EIO;
    }
    printf("mmap() success at %p\n", __base_soc_ctrl);

    // Safety Island

    // We write a bunch of bytes to the safety island's boot register and check
    // that it reads the reset value after a warm reset. Note that we can't use
    // the safety island's scratchpad for that since it is not resetable
    uint64_t magic = 0xcafebeef;

    // Write a pattern to safety island boot addr
    writew(magic, CAR_SAFETY_ISLAND_PERIPHS_BASE_ADDR +
                      SAFETY_SOC_CTRL_BOOTADDR_REG_OFFSET);

    // Double check
    if (readw(CAR_SAFETY_ISLAND_PERIPHS_BASE_ADDR +
              SAFETY_SOC_CTRL_BOOTADDR_REG_OFFSET) != magic)
        return ESAFEDNOACCES;

    // engage reset sequence for safety island
    car_reset_domain(CAR_SAFETY_RST);

    // After the reset we should only see zeros
    if (readw(CAR_SAFETY_ISLAND_PERIPHS_BASE_ADDR +
              SAFETY_SOC_CTRL_BOOTADDR_REG_OFFSET) !=
        SAFETY_ISLAND_BOOT_ADDR_RSVAL)
        return ESAFEDNOACCES;

    sleep(1);

    munmap(__base_soc_ctrl, 0x1000);
    close(device_fd);

    return 0;
}