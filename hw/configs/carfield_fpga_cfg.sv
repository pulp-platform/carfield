// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Yvan Tortorella <yvan.tortorella@unibo.it>

package carfield_configuration;

import cheshire_pkg::*;

`ifndef GEN_PULP_CLUSTER
`define GEN_PULP_CLUSTER 0
`endif
`ifndef GEN_SAFETY_ISLAND
`define GEN_SAFETY_ISLAND 0
`endif
`ifndef GEN_SPATZ_CLUSTER
`define GEN_SPATZ_CLUSTER 0
`endif
`ifndef GEN_OPEN_TITAN
`define GEN_OPEN_TITAN 0
`endif

//L2, port 0
localparam bit     L2Port0Enable = 1;
localparam doub_bt L2Port0Base = 'h78000000;
localparam doub_bt L2Port0Size = 'h00200000;
// L2, port 1
localparam bit     L2Port1Enable = 1;
localparam doub_bt L2Port1Base = L2Port0Base + L2Port0Size;
localparam doub_bt L2Port1Size = L2Port0Size;
// Safety Island
localparam bit     SafetyIslandEnable = `GEN_SAFETY_ISLAND;
localparam doub_bt SafetyIslandBase = 'h60000000;
localparam doub_bt SafetyIslandSize = 'h00800000;
// Ethernet
localparam bit     EthernetEnable = 0;
localparam doub_bt EthernetBase = 'h20000000;
localparam doub_bt EthernetSize = 'h00001000;
// Peripherals
localparam bit     PeriphEnable = 1;
localparam doub_bt PeriphBase = 'h20001000;
localparam doub_bt PeriphSize = 'h00009000;
// Spatz cluster
localparam bit     SpatzClusterEnable = `GEN_SPATZ_CLUSTER;
localparam doub_bt SpatzClusterBase = 'h51000000;
localparam doub_bt SpatzClusterSize = 'h00800000;
// PULP cluster
localparam bit     PulpClusterEnable = `GEN_PULP_CLUSTER;
localparam doub_bt PulpClusterBase = 'h50000000;
localparam doub_bt PulpClusterSize = 'h00800000;
// Security Island
localparam bit     SecurityIslandEnable = `GEN_OPEN_TITAN;
localparam doub_bt SecurityIslandBase = 'h0;
localparam doub_bt SecurityIslandSize = 'h0;
// Mailbox
localparam bit     MailboxEnable = 1;
localparam doub_bt MailboxBase = 'h40000000;
localparam doub_bt MailboxSize = 'h00001000;
// Can
localparam bit CanEnable = 0;

endpackage
