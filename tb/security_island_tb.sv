// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>
// Miacol Ciani <creinwar@student.ethz.ch>

// The security island is inaccessible from other parts of the SoC, hence we
// need to preload it from the testbench. This testbench checks the
// mailbox-based communication between the security_island and other subsystems.

module tb_carfield_soc;

  carfield_soc_fixture fix();

  string      binary;
  string      ot_binary;
  string      boot_hex;
  logic [1:0] boot_mode;
  logic [1:0] preload_mode;
  bit [31:0]  exit_code;
  int         exit_status = -1;

  initial begin

    if (!$value$plusargs("BOOTMODE=%d", boot_mode))     boot_mode     = 0;
    if (!$value$plusargs("PRELMODE=%d", preload_mode))  preload_mode  = 0;
    if (!$value$plusargs("BINARY=%s",   binary)) binary  = "./cheshire/sw/tests/helloworld.spm.elf";
    if (!$value$plusargs("IMAGE=%s",    boot_hex))      boot_hex      = "";
    if (!$value$plusargs("OT_BINARY=%s",ot_binary)); ot_binary  = "./sw/security_island/mbox_test/mbox_test.elf";

    fix.set_boot_mode(boot_mode);

    fix.wait_for_reset();

    repeat(4)
        @(posedge fix.rtc);

    if (boot_mode == 0) begin
      // Idle boot: preload with the specified mode
      case (preload_mode)
        0: begin      // JTAG
          // Security Island
          fix.debug_ibex_module_init();
          fix.load_ibex_binary(ot_binary);
          fix.jtag_ibex_data_preload();
          fix.jtag_ibex_wakeup(32'h E0000080);
          // Cheshire
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
