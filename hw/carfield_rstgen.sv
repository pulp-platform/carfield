// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Robert Balas <balasr@iis.ee.ethz.ch>

`include "cheshire/typedef.svh"
`include "apb/typedef.svh"

/// Carfield reset handling
/// Combine power-on and software reset
///
/// The power-on reset will go through a reset synchronizer so there will be
/// single cycle constraint from the syncrhonizer deassertion to all connected
/// flops. This constraint can be relaxed with respect to the maximum runtime
/// clock frequency since system runs with the external (slower clock) during
/// power-on reset.
///
/// The software reset on the other hand comes directly from a configuration
/// register and is AND'd with the power-on reset withouth any reset
/// synchronization. This reset can relaxed to a false path since we will only
/// toggle it when we gate the clock of the domain receving the reset.

module carfield_rstgen import carfield_pkg::*; #(
  parameter int unsigned NumRstDomains = 1
) (
  input logic [NumRstDomains-1:0]  clks_i,
  input logic                      pwr_on_rst_ni,
  input logic [NumRstDomains-1:0]  sw_rsts_ni,
  input logic                      test_mode_i,

  output logic [NumRstDomains-1:0] rsts_no,
  output logic [NumRstDomains-1:0] pwr_on_rsts_no,
  output logic [NumRstDomains-1:0] inits_no
);

  logic [NumRstDomains-1:0] sync_rst_n;

  for (genvar k = 0; k < NumRstDomains; k++) begin : gen_rstgen_for_domains
    // synchronize the power-on reset
    rstgen i_rstgen (
      .clk_i (clks_i[k]),
      .rst_ni (pwr_on_rst_ni),
      .test_mode_i,
      .rst_no (sync_rst_n[k]),
      .init_no (inits_no[k])
    );

    // synchronized power-on reset
    assign pwr_on_rsts_no[k] = sync_rst_n[k];

    // synchronized power-on reset AND software reeset
    assign rsts_no[k] = sw_rsts_ni[k] & sync_rst_n[k];
  end

endmodule // carfield_rstgen
