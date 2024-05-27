// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//

module pad_behav (
   output outi,
   output outi_1v8,
   inout pad,
   inout ana_io_1v8,
   input dq,
   input drv0,
   input drv1,
   input drv2,
   input enabq,
   input enq,
   input pd,
   input ppen,
   input prg_slew,
   input puq,
   input pwrupzhl,
   input pwrup_pull_en
);

   wire   PAD_wi;

   bufif0 (pad, ~dq, enq);
   buf    (outi, pad);
   bufif0 (PAD_wi, ~pwrup_pull_en, 1'b0);
   rpmos  (pad, PAD_wi, 1'b0);

   assign outi_1v8 = 1'b0;

endmodule // pad_beh
