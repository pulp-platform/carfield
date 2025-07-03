// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Yvan Tortorella <yvan.tortorella@unibo.it>

package carfield_configuration;

import cheshire_pkg::*;
/*********************
 * AXI Configuration *
 ********************/
//L2, port 0
localparam bit     L2Port0Enable = 1;
localparam doub_bt L2Port0Base = 'h78000000;
localparam doub_bt L2Port0Size = 'h00200000;
// L2, port 1
localparam bit     L2Port1Enable = 1;
localparam doub_bt L2Port1Base = L2Port0Base + L2Port0Size;
localparam doub_bt L2Port1Size = L2Port0Size;
// Safety Island
localparam bit     SafetyIslandEnable = 0;
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
localparam bit     SpatzClusterEnable = 0;
localparam doub_bt SpatzClusterBase = 'h51000000;
localparam doub_bt SpatzClusterSize = 'h00800000;
// PULP cluster
localparam bit     PulpClusterEnable = 0;
localparam doub_bt PulpClusterBase = 'h50000000;
localparam doub_bt PulpClusterSize = 'h00800000;
// Security Island
localparam bit     SecurityIslandEnable = 0;
localparam doub_bt SecurityIslandBase = 'h0;
localparam doub_bt SecurityIslandSize = 'h0;
// Mailbox
localparam bit     MailboxEnable = 1;
localparam doub_bt MailboxBase = 'h40000000;
localparam doub_bt MailboxSize = 'h00003000;
// Can
localparam bit CanEnable = 0;
localparam doub_bt CanBase = 'h20001000;
localparam doub_bt CanSize = 'h00001000;
// System Timer
localparam doub_bt SystemTimerBase = 'h20004000;
localparam doub_bt SystemTimerSize = 'h00001000;
// System Advanced Timer
localparam doub_bt SystemAdvancedTimerBase = 'h20005000;
localparam doub_bt SystemAdvancedTimerSize = 'h00001000;
// System Watchdog
localparam doub_bt SystemWatchdogBase = 'h20007000;
localparam doub_bt SystemWatchdogSize = 'h00001000;
// Hyperbus Config
localparam doub_bt HyperBusBase = 'h20009000;
localparam doub_bt HyperBusSize = 'h00001000;
/************************
 * RegBus Configuration *
 ***********************/
// Platform control registers
localparam doub_bt PcrsBase = 'h20010000;
localparam doub_bt PcrsSize = 'h00001000;
// PLL
localparam bit     PllCfgEnable = 1;
localparam doub_bt PllCfgBase = 'h20020000;
localparam doub_bt PllCfgSize = 'h00001000;
// Padframe
localparam bit     PadframeCfgEnable = 1;
localparam doub_bt PadframeCfgBase = 'h200A0000;
localparam doub_bt PadframeCfgSize = 'h00001000;
// L2 ECC
localparam bit     L2EccCfgEnable = 1;
localparam doub_bt L2EccCfgBase = 'h200B0000;
localparam doub_bt L2EccCfgSize = 'h00001000;

endpackage
