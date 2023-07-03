// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>
// Paul Scheffler <paulsc@iis.ee.ethz.ch>
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
// Maicol Ciani <maicol.ciano@unibo.it>

// The security island is inaccessible from other parts of the SoC, hence we
// need to preload it from the testbench. This testbench checks the
// mailbox-based communication between the security_island and other subsystems.

module tb_carfield_soc;

  import uvm_pkg::*;

  carfield_soc_fixture fix();

  string      chs_preload_elf;
  string      secd_preload_elf;
  string      safed_preload_elf;
  string      chs_boot_hex;
  logic [1:0] boot_mode;
  logic [1:0] preload_mode;
  bit [31:0]  exit_code;
  bit         is_dram;


  initial begin
    // Fetch plusargs or use safe (fail-fast) defaults
    if (!$value$plusargs("BOOTMODE=%d",     boot_mode))         boot_mode         = 0;
    if (!$value$plusargs("PRELMODE=%d",     preload_mode))      preload_mode      = 0;
    if (!$value$plusargs("CHS_BINARY=%s",   chs_preload_elf))   chs_preload_elf   = "";
    if (!$value$plusargs("SECD_BINARY=%s",  secd_preload_elf))  secd_preload_elf  = "";
    if (!$value$plusargs("SAFED_BINARY=%s", safed_preload_elf)) safed_preload_elf = "";
    if (!$value$plusargs("CHS_IMAGE=%s",    chs_boot_hex))      chs_boot_hex      = "";

    // Set boot mode and preload boot image if there is one
    fix.chs_vip.set_boot_mode(boot_mode);
    fix.chs_vip.i2c_eeprom_preload(chs_boot_hex);
    fix.chs_vip.spih_norflash_preload(chs_boot_hex);

    // Wait for reset
    fix.chs_vip.wait_for_reset();

    // Preload in idle mode or wait for completion in autonomous boot
    if (boot_mode == 0) begin
      // Idle boot: preload with the specified mode
      case (preload_mode)
        0: begin      // JTAG
          // Security Island
          if (secd_preload_elf != "") begin
            repeat(10000)
              @(posedge fix.clk);
            fix.debug_secd_module_init();
            fix.load_secd_binary(secd_preload_elf);
            fix.jtag_secd_data_preload();
            fix.jtag_secd_wakeup(32'h E0000080);
          end
          // TODO: Safety Island
          // Cheshire
          is_dram = uvm_re_match("dram",chs_preload_elf);
          if(~is_dram) begin
            $display("Wait the hyperram");
            repeat(120000)
              @(posedge fix.clk);
          end
          fix.chs_vip.jtag_init();
          fix.chs_vip.jtag_elf_run(chs_preload_elf);
          fix.chs_vip.jtag_wait_for_eoc(exit_code);
        end 1: begin  // Serial Link
          // Security Island
          if (secd_preload_elf != "") begin
            fix.chs_vip.slink_elf_run(secd_preload_elf);
          end
          // TODO: Safety Island
          // Cheshire
          fix.chs_vip.slink_elf_run(chs_preload_elf);
          fix.chs_vip.slink_wait_for_eoc(exit_code);
        end 2: begin  // UART
          fix.chs_vip.uart_debug_elf_run_and_wait(chs_preload_elf, exit_code);
        end default: begin
          $fatal(1, "Unsupported preload mode %d (reserved)!", boot_mode);
        end
      endcase
    end else if (boot_mode == 1) begin
      $fatal(1, "Unsupported boot mode %d (SD Card)!", boot_mode);
    end else begin
      // Autonomous boot: Only poll return code
      fix.chs_vip.jtag_init();
      fix.chs_vip.jtag_wait_for_eoc(exit_code);
    end

    $finish;
  end

endmodule
