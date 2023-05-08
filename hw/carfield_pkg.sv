// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Thomas Benz  <tbenz@ethz.ch>
// Yvan Tortorella <yvan.tortorella@unibo.it>
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

/// Carfield constants and Cheshire overwrites
package carfield_pkg;

import cheshire_pkg::*;

typedef enum byte_bt {
  L2Port1SlvIdx      = 'd0,
  L2Port2SlvIdx      = 'd1,
  SafetyIslandSlvIdx = 'd2,
  OTMailboxSlvIdx    = 'd3,
  EthernetSlvIdx     = 'd4,
  PeriphsSlvIdx      = 'd5,
  FPClusterSlvIdx    = 'd6,
  IntClusterSlvIdx   = 'd7
} axi_slv_idx_t;

typedef enum byte_bt {
  SafetyIslandMstIdx   = 'd0,
  SecurityIslandMstIdx = 'd1,
  FPClusterMstIdx      = 'd2,
  IntClusterMstIdx     = 'd3
} axi_mst_idx_t;

typedef enum doub_bt {
  L2Port1Base      = 'h0000_0000_7800_0000,
  L2Port2Base      = 'h0000_0000_7820_0000,
  SafetyIslandBase = 'h0000_0000_6000_0000,
  OTMailboxBase    = 'h0000_0000_4000_0000,
  EthernetBase     = 'h0000_0000_2000_0000,
  PeriphsBase      = 'h0000_0000_2000_1000,
  FPClusterBase    = 'h0000_0000_5100_0000,
  IntClusterBase   = 'h0000_0000_5000_0000
} axi_start_t;

// AXI Slave Sizes
localparam doub_bt L2Size           = 'h0000_0000_0020_0000;
localparam doub_bt SafetyIslandSize = 'h0000_0000_0080_0000;
localparam doub_bt OTMailboxSize    = 'h0000_0000_0000_1000;
localparam doub_bt EthernetSize     = 'h0000_0000_0000_1000;
localparam doub_bt PeriphsSize      = 'h0000_0000_0000_9000;
localparam doub_bt IntClusterSize   = 'h0000_0000_0080_0000;
localparam doub_bt FPClusterSize    = 'h0000_0000_0080_0000;

typedef enum doub_bt {
  L2Port1End      = L2Port1Base + L2Size,
  L2Port2End      = L2Port2Base + L2Size,
  SafetyIslandEnd = SafetyIslandBase + SafetyIslandSize,
  OTMailboxEnd    = OTMailboxBase + OTMailboxSize,
  EthernetEnd     = EthernetBase + EthernetSize,
  PeriphsEnd      = PeriphsBase + PeriphsSize,
  FPClusterEnd    = FPClusterBase + FPClusterSize,
  IntClusterEnd   = IntClusterBase + IntClusterSize
} axi_end_t;

// APB peripherals
localparam int unsigned NumApbMst = 5;

typedef enum int {
  SystemTimerIdx   = 'd0,
  AdvancedTimerIdx = 'd1,
  SystemWdtIdx     = 'd2,
  CanIdx           = 'd3,
  HyperBusIdx      = 'd4
} carfield_peripherals_e;

// APB start
typedef enum word_bt {
  SystemTimerBase   = 'h2000_4000,
  AdvancedTimerBase = 'h2000_5000,
  SystemWdtBase     = 'h2000_7000,
  CanBase           = 'h2000_1000,
  HyperBusBase      = 'h2000_9000
} apb_start_t;

// APB Sizes
localparam word_bt SystemTimerSize   = 'h0000_1000;
localparam word_bt AdvancedTimerSize = 'h0000_1000;
localparam word_bt SystemWdtSize     = 'h0000_1000;
localparam word_bt CanSize           = 'h0000_1000;
localparam word_bt HyperBusSize      = 'h0000_1000;

typedef enum word_bt {
  SystemTimerEnd   = SystemTimerBase + SystemTimerSize,
  AdvancedTimerEnd = AdvancedTimerBase + AdvancedTimerSize,
  SystemWdtEnd     = SystemWdtBase + SystemWdtSize,
  CanEnd           = CanBase + CanSize,
  HyperBusEnd      = HyperBusBase + HyperBusSize
} apb_end_t;

// Cheshire regbus out
typedef enum int {
  PllIdx = 'd0
} cheshire_reg_out_e;

typedef enum doub_bt {
  PllBase   = 'h0000_0000_2000_2000
} reg_start_t;

localparam doub_bt PllSize   = 'h0000_0000_0000_1000;

typedef enum doub_bt {
  PllEnd   = PllBase + PllSize
} reg_end_t;

// Ext Slaves: L2Ports + Safety Island + Integer Cluster + Security Island Mailbox + Ethernet + Peripherals + Floating Point Cluster
localparam bit [3:0] AxiNumExtSlv = 3'd2 + 3'd1 + 3'd1 + 3'd1 + 3'd1 + 3'd1 + 3'd1;
// Ext Masters: Integer Cluster + Security Island + Safety Island + Floating Point Cluster
localparam bit [2:0] AxiNumExtMst = 3'd1 + 3'd1 + 3'd1 + 3'd1;
// Ext Interrupts: Security Island Mailbox
localparam bit [2:0] NumExtIntrs = 3'd1;

localparam cheshire_cfg_t CarfieldCfgDefault = '{
  // CVA6 parameters
  Cva6RASDepth      : ariane_pkg::ArianeDefaultConfig.RASDepth,
  Cva6BTBEntries    : ariane_pkg::ArianeDefaultConfig.BTBEntries,
  Cva6BHTEntries    : ariane_pkg::ArianeDefaultConfig.BHTEntries,
  Cva6NrPMPEntries  : 0,
  Cva6ExtCieLength  : 'h1000_0000, // [0x2000_0000, 0x7000_0000) is non-CIE,
                                   // [0x7000_0000, 0x8000_0000) is CIE
  Cva6ExtCieOnTop   : 1,
  // Harts
  DualCore          : 0,  // Only one core, but rest of config allows for two
  CoreMaxTxnsPerId  : 4,
  CoreMaxUniqIds    : 4,
  // Interconnect
  AddrWidth         : 48,
  AxiDataWidth      : 64,
  AxiUserWidth      : 2,  // Convention: bit 0 for core(s), bit 1 for serial link
  AxiMstIdWidth     : 2,
  AxiMaxMstTrans    : 8,
  AxiMaxSlvTrans    : 8,
  AxiUserAmoMsb     : 1,
  AxiUserAmoLsb     : 0,
  RegMaxReadTxns    : 8,
  RegMaxWriteTxns   : 8,
  RegAmoNumCuts     : 1,
  RegAmoPostCut     : 1,
  // External AXI ports (at most 8 ports and rules)
  AxiExtNumMst      : AxiNumExtMst,
  AxiExtNumSlv      : AxiNumExtSlv,
  AxiExtNumRules    : AxiNumExtSlv,
  // External AXI region map
  AxiExtRegionIdx   : '{      IntClusterSlvIdx  ,
                              FPClusterSlvIdx   ,
                              PeriphsSlvIdx     ,
                              EthernetSlvIdx    ,
                              OTMailboxSlvIdx   ,
                              SafetyIslandSlvIdx,
                              L2Port2SlvIdx     ,
                              L2Port1SlvIdx     },
  AxiExtRegionStart : '{      IntClusterBase  ,
                              FPClusterBase   ,
                              PeriphsBase     ,
                              EthernetBase    ,
                              OTMailboxBase   ,
                              SafetyIslandBase,
                              L2Port2Base     ,
                              L2Port1Base     },
  AxiExtRegionEnd   : '{      IntClusterEnd  ,
                              FPClusterEnd   ,
                              PeriphsEnd     ,
                              EthernetEnd    ,
                              OTMailboxEnd   ,
                              SafetyIslandEnd,
                              L2Port2End     ,
                              L2Port1End     },
  // External reg slaves (at most 8 ports and rules)
  RegExtNumSlv      : 1,
  RegExtNumRules    : 1,
  RegExtRegionIdx   : '{ 0, 0, 0, 0, 0, 0, 0, PllIdx },
  RegExtRegionStart : '{ 0, 0, 0, 0, 0, 0, 0, PllBase},
  RegExtRegionEnd   : '{ 0, 0, 0, 0, 0, 0, 0, PllEnd },
  // RTC
  RtcFreq           : 32768,
  // Ext Irq
  NumExtIntrs       : NumExtIntrs,
  // Features
  Bootrom           : 1,
  Uart              : 1,
  I2c               : 1,
  SpiHost           : 1,
  Gpio              : 1,
  Dma               : 1,
  SerialLink        : 1,
  Vga               : 1,
  // Debug
  DbgIdCode         : CheshireIdCode,
  DbgMaxReqs        : 4,
  DbgMaxReadTxns    : 4,
  DbgMaxWriteTxns   : 4,
  DbgAmoNumCuts     : 1,
  DbgAmoPostCut     : 1,
  // LLC: 128 KiB, up to 2 GiB DRAM
  LlcNotBypass      : 1,
  LlcSetAssoc       : 8,
  LlcNumLines       : 256,
  LlcNumBlocks      : 8,
  LlcMaxReadTxns    : 8,
  LlcMaxWriteTxns   : 8,
  LlcAmoNumCuts     : 1,
  LlcAmoPostCut     : 1,
  LlcOutConnect     : 1,
  LlcOutRegionStart : 'h8000_0000,
  LlcOutRegionEnd   : 'h1_0000_0000,
  // VGA: RGB332
  VgaRedWidth       : 3,
  VgaGreenWidth     : 3,
  VgaBlueWidth      : 2,
  VgaHCountWidth    : 24, // TODO: Default is 32; is this needed?
  VgaVCountWidth    : 24, // TODO: See above
  // Serial Link: map other chip's lower 32bit to 'h1_000_0000
  SlinkMaxTxnsPerId : 4,
  SlinkMaxUniqIds   : 4,
  SlinkMaxClkDiv    : 1024,
  SlinkRegionStart  : 'h1_0000_0000,
  SlinkRegionEnd    : 'h2_0000_0000,
  SlinkTxAddrMask   : 'hFFFF_FFFF,
  SlinkTxAddrDomain : 'h0000_0000,
  SlinkUserAmoBit   : 1,  // Upper atomics bit for serial link
  // DMA config
  DmaConfMaxReadTxns  : 4,
  DmaConfMaxWriteTxns : 4,
  DmaConfAmoNumCuts   : 1,
  DmaConfAmoPostCut   : 1,
  // GPIOs
  GpioInputSyncs    : 1,
  // All non-set values should be zero
  default: '0
};

/**********************/
/* General Parameters */
/**********************/
localparam int unsigned AxiNarrowAddrWidth = 32;
localparam int unsigned AxiNarrowDataWidth = 32;

/*****************/
/* L2 Parameters */
/*****************/
localparam int unsigned NumL2Ports = 2;
localparam int unsigned L2MemSize = 2**20;
localparam int unsigned L2NumRules = 4; // 2 rules per each access mode
                                        // (interleaved, non-interleaved)
localparam doub_bt L2Port1NonInterlBase = L2Port1Base + L2MemSize;
localparam doub_bt L2Port2NonInterlBase = L2Port2Base + L2MemSize;

/****************************/
/* Safety Island Parameters */
/****************************/
localparam int unsigned LogDepth = 3;
localparam int unsigned SafetyIslandMemOffset = 'h0000_0000;
localparam int unsigned SafetyIslandMemSize   = 'h0020_0000;
localparam int unsigned SafetyIslandPerOffset = 'h0020_0000;
localparam int unsigned SafetyIslandPerSize   = 'h0010_0000;

/******************************/
/* Integer Cluster Parameters */
/******************************/
localparam int unsigned IntClusterNumCores = 8;
localparam int unsigned IntClusterNumHwpePorts = 0;
localparam int unsigned IntClusterNumDmas = 4;
localparam int unsigned IntClusterNumMstPer = 1;
localparam int unsigned IntClusterNumSlvPer = 10;
localparam int unsigned IntClusterAlias = 1;
localparam int unsigned IntClusterAliasBase = 12'h000;
localparam int unsigned IntClusterTcdmSize = 256*1024;
localparam int unsigned IntClusterTcdmBanks = 16;
localparam int unsigned IntClusterHwpePresent = 0;
localparam int unsigned IntClusterUseHci = 1;
localparam int unsigned IntClusterSetAssociative = 4;
localparam int unsigned IntClusterNumCacheBanks = 2;
localparam int unsigned IntClusterNumCacheLines = 1;
localparam int unsigned IntClusterCacheSize = 4*1024;
localparam int unsigned IntClusterDbgStart = 32'h1A110000;
localparam int unsigned IntClusterRomBoot = 32'h1A000000;
localparam int unsigned IntClusterBootAddr = L2Port1Base;
localparam int unsigned IntClusterInstrRdataWidth = 32;
localparam int unsigned IntClusterFpu = 0;
localparam int unsigned IntClusterFpuDivSqrt = 0;
localparam int unsigned IntClusterSharedFpu = 0;
localparam int unsigned IntClusterSharedFpuDivSqrt = 0;
localparam int unsigned IntClusterNumAxiMst = 3;
localparam int unsigned IntClusterNumAxiSlv = 4;
// IntClusterAxiIdInWidth is fixed from PULP Cluster
localparam int unsigned IntClusterAxiIdInWidth = $clog2(IntClusterNumCacheBanks) + 1;
localparam int unsigned IntClusterAxiIdOutWidth = IntClusterAxiIdInWidth     +
                                                  $clog2(IntClusterNumAxiSlv);
localparam int unsigned IntClusterMaxUniqId = 1;
localparam logic [ 5:0] IntClusterIndex = '0;

endpackage
