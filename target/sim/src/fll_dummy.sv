// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Dummy PLL/FLL for RTL simualtion only
//

`ifndef TEST_CLOCK_BYPASS
  `timescale 1ns/1ns
`endif

module fll_dummy #(
   parameter int unsigned NumPlls = 3
) (
   logic [NumPlls-1:0] clk_pll_out,
   logic [NumPlls-1:0] dbg_pll_out
);

   logic  clk;
   parameter time ClkPeriod = 10ns;

   initial begin
     clk = 1'b0;
     end
     always begin
       // Emit rising clock edge.
       clk = 1'b1;
       #(ClkPeriod/2);
       clk = 1'b0;
       #(ClkPeriod/2);
     end

     for (genvar i=0;i<NumPlls;i++) begin
        assign clk_pll_out[i] = clk;
        assign dbg_pll_out[i] = clk;
     end

endmodule
