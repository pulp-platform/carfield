# Troubleshooting

This is a collection of issues and their fixes.

## Bare Metal: Accelerator domain never returns an exit code

Double-check that the accelerator binaries are compiled for Carfield:
In stand-alone mode the exit function does not write to the `EOC` register.

## Bare Metal: `printf` does not work on accelerators

Double-check that the accelerator binaries are compiled for Carfield:
In stand-alone mode the peripheral addresses will not match for the UART.
