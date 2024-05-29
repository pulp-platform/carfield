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
   parameter int unsigned NumPlls = 3,
   parameter time ClkPeriodFLL    = 10ns,
   parameter time ClkPeriodRT     = 1us
) (
   output logic [NumPlls-1:0] clk_pll_o,
   output logic [NumPlls-1:0] dbg_pll_o,
   output logic               rt_clk_o
);
  
  logic clk_fll;
  logic clk_rt;

  initial begin: clk_initialization
    clk_fll = 1'b0;
    clk_rt  = 1'b0;
  end

  always begin: fll_oscillator
    // Emit rising clock edge.
    clk_fll = 1'b1;
    #(ClkPeriodFLL/2);
    clk_fll = 1'b0;
    #(ClkPeriodFLL/2);
  end

  always begin: rt_oscillator
    // Emit rising clock edge.
    clk_rt = 1'b1;
    #(ClkPeriodRT/2);
    clk_rt = 1'b0;
    #(ClkPeriodRT/2);
  end

  for (genvar i=0;i<NumPlls;i++) begin
    assign clk_pll_o[i] = clk_fll;
    assign dbg_pll_o[i] = clk_fll;
  end

  assign rt_clk_o = clk_rt;

endmodule
