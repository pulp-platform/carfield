// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>

module tb_carfield_soc;

  carfield_soc_fixture fix();

  string        binary;
  logic [1:0]   boot_mode;
  logic         test_mode;

  bit [31:0] ret;

  initial begin

    if ($value$plusargs("BOOTMODE=%d", boot_mode)) begin
      fix.set_boot_mode(boot_mode);
    end else begin
      // If no BOOTMODE is provided, use default
      fix.set_boot_mode(0);
    end

    fix.wait_for_reset();

    if ($value$plusargs("TESTMODE=%d", test_mode)) begin
      fix.set_test_mode(test_mode);
    end else begin
      // If no BOOTMODE is provided, use default
      fix.set_test_mode(0);
    end

    if ($value$plusargs("BINARY=%s", binary)) begin
      $display("[tb_carfield_soc] BINARY = %s", binary);
      fix.slink_elf_run(binary);
    end else begin
      fix.slink_elf_run("./cheshire/sw/tests/helloworld.spm.elf");
    end

    fix.slink_wait_for_eoc(ret);
    $display("[tb_carfield_soc] Ret Value: %x", ret);
    
    $finish;
    
  end

endmodule
