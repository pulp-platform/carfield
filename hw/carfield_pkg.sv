// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Thomas Benz  <tbenz@ethz.ch>

/// Carfield constants and Cheshire overwrites
package carfield_pkg;

    // the address carfield boots from
    localparam logic[63:0] carfield_boot_addr = 64'h0000_0000_0100_0000;

endpackage
