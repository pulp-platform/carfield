// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>

module tb_carfield_soc;

  carfield_soc_fixture fix();

  string       binary;
  string       boot_hex;
  logic [ 1:0] boot_mode;
  logic [ 1:0] preload_mode;
  bit   [31:0] exit_code;
  int          exit_status = -1;

  initial begin

    if (!$value$plusargs("BOOTMODE=%d", boot_mode))     boot_mode     = 0;
    if (!$value$plusargs("PRELMODE=%d", preload_mode))  preload_mode  = 0;
    if (!$value$plusargs("BINARY=%s",   binary)) binary  = "./cheshire/sw/tests/helloworld.spm.elf";
    if (!$value$plusargs("IMAGE=%s",    boot_hex))      boot_hex      = "";

    fix.set_boot_mode(boot_mode);

    fix.wait_for_reset();

    if (boot_mode == 0) begin
      // Idle boot: preload with the specified mode
      case (preload_mode)
        0: begin      // JTAG
          fix.jtag_init();
          fix.jtag_elf_run(binary);
          fix.jtag_wait_for_eoc(exit_code);
        end 1: begin  // Serial Link
          fix.slink_elf_run(binary);
          fix.slink_wait_for_eoc(exit_code);
        end 2: begin  // UART
          fix.uart_debug_elf_run_and_wait(binary, exit_code);
        end default: begin
          $fatal(1, "Unsupported preload mode %d (reserved)!", boot_mode);
        end
      endcase
    end else if (boot_mode == 1) begin
      $fatal(1, "Unsupported boot mode %d (SD Card)!", boot_mode);
    end else begin
      // Autonomous boot: Only poll return code
      fix.jtag_init();
      fix.jtag_wait_for_eoc(exit_code);
    end

    exit_status = exit_code;     
    $finish;
    
  end

endmodule
