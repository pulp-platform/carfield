// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

`include "cheshire/typedef.svh"

/// Carfield chip specific parameters
package carfield_chip_pkg;

// import pll_digital_pkg::*;

// localparam int unsigned NumPlls = pll_digital_pkg::NPLLs;

typedef enum int {
  HostDomainClkIdx   = 'd0,
  PeriphDomainClkIdx = 'd1,
  AltDomainClkIdx    = 'd2
} carfield_clocks_e;

// PULP Platform manufacturer and default Carfield Pll part number
// JTAG ID code:
// LSB                        [0]:     1'h1
// PULP Platform Manufacturer [11:1]:  11'h6d9
// Part Number                [27:12]: 16'habc0 --> TBD!
// Version                    [31:28]: 4'h1
localparam int unsigned CarfieldPllJtagIdCode = 32'h1_abc0_db3;

endpackage
