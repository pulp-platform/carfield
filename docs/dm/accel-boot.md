# Accelerator Boot Flow

This section documents the boot flow of the different accelerators.

## Spatz Cluster

On bootup, the Spatz domain needs to be enabled using `car_enable_domain(CAR_SPATZ_RST)`, which takes
the cluster out of reset. The bootloader of the cluster then waits for an interrupt to continue booting.

At this point, the accelerator code needs to be copied by the host domain into an area of memory accessible
by the cluster. Once the code is in place, the address to the code needs to be communicated to the accelerator
at `SPATZ_CLUSTER_BOOT_ADDR`. Make sure that the code is accessible to the accelerator and not in a cache:
currently, this is can be accomplished using a fence instruction.

To signal the Spatz bootloader that it can continue booting, assert an interrupt using a mailbox. If
executing from the host domain, core 0, the mailbox IDs are 2 and 3, otherwise refer to the mailbox
ID table in the [corresponding section of the user manual](../um/arch.md#mailbox-unit).

Once the main function is done executing, the accelerator runtime writes the exit status into the
`SPATZ_CLUSTER_EOC` register as `exit_status << 1 | 1` and returns to the bootloader. The bootloader
then is in an infinite loop and is not able to restart execution of any program. To execute another
program, disable and re-enable the domain and re-do the steps above. Alternatively, upload a program
to the cluster that acts as runtime environment for program execution and implements chainloading
different programs / functions (which is what the OpenMP implementation does).

The bootloader can be found at `spatz/hw/system/spatz_cluster/test`, and does not pull in the Spatz runtime
environment in `spatz/sw/snRuntime/sw` (which is where the startup / exit code of the application lives).
