// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Thomas Benz  <tbenz@ethz.ch>
// Yvan Tortorella <yvan.tortorella@unibo.it>
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

`include "cheshire/typedef.svh"

/// Carfield constants and Cheshire overwrites
package carfield_pkg;

import cheshire_pkg::*;

localparam int unsigned CarfieldNumExtIntrs           = 32; // Number of external interrupts
localparam int unsigned CarfieldNumInterruptibleHarts = 2;  // Spatz (2 Snitch cores)
localparam int unsigned CarfieldNumRouterTargets      = 1;  // Safety Island

typedef enum int {
  FPClusterIntrHart0Idx = 'd0,
  FPClusterIntrHart1Idx = 'd1,
  SafedIntrHartIdx      = 'd2
} carfield_ext_intr_harts_e;

typedef enum int {
  PeriphDomainIdx     = 'd0,
  SafedDomainIdx      = 'd1,
  SecdDomainIdx       = 'd2,
  IntClusterDomainIdx = 'd3,
  FPClusterDomainIdx  = 'd4,
  L2DomainIdx         = 'd5
} carfield_domains_e;

// Clock dividers integer value after PoR
localparam int unsigned PeriphDomainClkDivValue     = 1;
localparam int unsigned SafedDomainClkDivValue      = 1;
localparam int unsigned SecdDomainClkDivValue       = 1;
localparam int unsigned IntClusterDomainClkDivValue = 1;
localparam int unsigned FPClusterDomainClkDivValue  = 1;
localparam int unsigned L2DomainClkDivValue         = 1;

typedef enum byte_bt {
  L2Port0SlvIdx      = 'd0,
  L2Port1SlvIdx      = 'd1,
  SafetyIslandSlvIdx = 'd2,
  EthernetSlvIdx     = 'd3,
  PeriphsSlvIdx      = 'd4,
  FPClusterSlvIdx    = 'd5,
  IntClusterSlvIdx   = 'd6,
  MailboxSlvIdx      = 'd7
} axi_slv_idx_t;

typedef enum byte_bt {
  SafetyIslandMstIdx   = 'd0,
  SecurityIslandMstIdx = 'd1,
  FPClusterMstIdx      = 'd2,
  IntClusterMstIdx     = 'd3
} axi_mst_idx_t;

typedef enum doub_bt {
  L2Port0Base      = 'h0000_0000_7800_0000,
  L2Port1Base      = 'h0000_0000_7820_0000,
  SafetyIslandBase = 'h0000_0000_6000_0000,
  EthernetBase     = 'h0000_0000_2000_0000,
  PeriphsBase      = 'h0000_0000_2000_1000,
  FPClusterBase    = 'h0000_0000_5100_0000,
  IntClusterBase   = 'h0000_0000_5000_0000,
  MailboxBase      = 'h0000_0000_4000_0000
} axi_start_t;

// AXI Slave Sizes
localparam doub_bt L2Size           = 'h0000_0000_0020_0000;
localparam doub_bt SafetyIslandSize = 'h0000_0000_0080_0000;
localparam doub_bt EthernetSize     = 'h0000_0000_0000_1000;
localparam doub_bt PeriphsSize      = 'h0000_0000_0000_9000;
localparam doub_bt IntClusterSize   = 'h0000_0000_0080_0000;
localparam doub_bt FPClusterSize    = 'h0000_0000_0080_0000;
localparam doub_bt MailboxSize      = 'h0000_0000_0000_1000;

typedef enum doub_bt {
  L2Port0End      = L2Port0Base + L2Size,
  L2Port1End      = L2Port1Base + L2Size,
  SafetyIslandEnd = SafetyIslandBase + SafetyIslandSize,
  EthernetEnd     = EthernetBase + EthernetSize,
  PeriphsEnd      = PeriphsBase + PeriphsSize,
  FPClusterEnd    = FPClusterBase + FPClusterSize,
  IntClusterEnd   = IntClusterBase + IntClusterSize,
  MailboxEnd      = MailboxBase + MailboxSize
} axi_end_t;

// APB peripherals

localparam int unsigned CarfieldNumAdvTimerIntrs  = 4;
localparam int unsigned CarfieldNumAdvTimerEvents = 4;
localparam int unsigned CarfieldNumSysTimerIntrs  = 2;
localparam int unsigned CarfieldNumTimerIntrs = CarfieldNumAdvTimerIntrs +
                        CarfieldNumAdvTimerEvents + CarfieldNumSysTimerIntrs;
localparam int unsigned CarfieldNumWdtIntrs = 5;
localparam int unsigned CarfieldNumCanIntrs = 1;
localparam int unsigned CarfieldNumEthIntrs = 1;
localparam int unsigned CarfieldNumPeriphsIntrs = CarfieldNumTimerIntrs +
                        CarfieldNumWdtIntrs + CarfieldNumCanIntrs + CarfieldNumEthIntrs;

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
// For carfield, PllIdx is the first index of the async reg interfaces. Please add async reg
// interfaces indices to the left of PllIdx, and sync reg interface indices to its right.
typedef enum int {
  CarRegsIdx  = 'd0, // sync
  PllIdx      = 'd1, // async
  PadframeIdx = 'd2, // async
  L2EccIdx    = 'd3  // async
} cheshire_reg_out_e;
localparam int unsigned NumSyncRegSlv = 1;
                                      // CarRegs
localparam int unsigned NumAsyncRegSlv =  1  + 1        + 1;
                                       // PLL  Padframe   L2ECC
localparam int unsigned NumTotalRegSlv = NumSyncRegSlv + NumAsyncRegSlv;
localparam int unsigned NumTotalRegRules = NumTotalRegSlv;

typedef enum doub_bt {
  CarRegsBase  = 'h0000_0000_2001_0000,
  PllBase      = 'h0000_0000_2002_0000,
  PadframeBase = 'h0000_0000_200a_0000,
  L2EccBase    = 'h0000_0000_200b_0000
} reg_start_t;

localparam doub_bt CarRegsSize  = 'h0000_0000_0000_1000;
localparam doub_bt PllSize      = 'h0000_0000_0000_1000;
localparam doub_bt PadframeSize = 'h0000_0000_0000_1000;
localparam doub_bt L2EccSize    = 'h0000_0000_0000_1000;

typedef enum doub_bt {
  CarRegsEnd  = CarRegsBase + CarRegsSize,
  PllEnd      = PllBase + PllSize,
  PadframeEnd = PadframeBase + PadframeSize,
  L2EccEnd    = L2EccBase + L2EccSize
} reg_end_t;

// Ext Slaves: L2Ports + Safety Island + Integer Cluster + Security Island Mailbox + Ethernet + Peripherals + Floating Point Cluster
localparam bit [3:0] AxiNumExtSlv = 3'd2 + 3'd1 + 3'd1 + 3'd1 + 3'd1 + 3'd1 + 3'd1;
// Ext Masters: Integer Cluster + Security Island + Safety Island + Floating Point Cluster
localparam bit [2:0] AxiNumExtMst = 3'd1 + 3'd1 + 3'd1 + 3'd1;

// Synchronization stages (for FIFOs read/write pointers and single-bit signals syncronization after
// CDCs)
localparam int unsigned SyncStages = 3;

// Hart IDs
typedef bit [5:0] hartid_t;

typedef enum hartid_t {
  ChsHartIdOffs       = 'd0 ,
  OpnTitHartIdOffs    = 'd4 ,
  SafetyIslHartIdOffs = 'd8 ,
  SpatzHartIdOffs     = 'd16,
  PulpHartIdOffs      = 'd32
} hartid_offs_e;


localparam int unsigned MaxHartId = 63;
localparam int unsigned IntClusterNumCores = 12;
localparam bit [MaxHartId:0] SafetyIslandExtHarts =
  {MaxHartId+1{1'b0}} | (((1<<IntClusterNumCores) - 1) << PulpHartIdOffs);

localparam dm::hartinfo_t PulpHartInfo = '{
  zero1: '0,
  nscratch: 2,
  zero0: '0,
  dataaccess: 1'b1,
  datasize: dm::DataCount,
  dataaddr: dm::DataAddr
};
function automatic dm::hartinfo_t [MaxHartId:0] pulp_hart_info(bit [MaxHartId:0] available);
  for (int i = 0; i <= MaxHartId; i++) begin
    if (available[i]) begin
      pulp_hart_info[i] = PulpHartInfo;
    end else begin
      pulp_hart_info[i] = '0;
    end
  end
endfunction

localparam dm::hartinfo_t [MaxHartId:0] SafetyIslandExtHartinfo =
  pulp_hart_info(SafetyIslandExtHarts);

// Safety island configuration
localparam safety_island_pkg::safety_island_cfg_t SafetyIslandCfg = '{
    HartId:             SafetyIslHartIdOffs,
    BankNumBytes:       32'h0001_0000,
    NumBanks:           2,
    // JTAG ID code:
    // LSB                        [0]:     1'h1
    // PULP Platform Manufacturer [11:1]:  11'h6d9
    // Part Number                [27:12]: 16'h0000 --> TBD!
    // Version                    [31:28]: 4'h1
    PulpJtagIdCode:     32'h1_0000_db3,
    NumTimers:          1,
    UseClic:            1,
    ClicIntCtlBits:     8,
    UseSSClic:          0,
    UseUSClic:          0,
    UseVSClic:          0,
    UseVSPrio:          0,
    NVsCtxts:           0,
    UseFastIrq:         1,
    UseFpu:             1,
    UseIntegerCluster:  1,
    UseXPulp:           1,
    UseZfinx:           1,
    UseTCLS:            1,
    NumInterrupts:      128,
    NumMhpmCounters:    1,
    // All non-set values should be zero
    default: '0
};

// verilog_lint: waive-start line-length
// Cheshire configuration
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
  NumCores          : 2,
  CoreMaxTxns       : 8,
  CoreMaxTxnsPerId  : 4,
  CoreUserAmoOffs   : 0, // Convention: lower AMO bits for cores, MSB for serial link
  // Interrupt parameters
  NumExtIrqHarts    : CarfieldNumInterruptibleHarts,
  NumExtInIntrs     : CarfieldNumExtIntrs,
  NumExtClicIntrs   : CarfieldNumExtIntrs,
  NumExtOutIntrTgts : 1,
  NumExtOutIntrs    : CarfieldNumExtIntrs+$bits(cheshire_int_intr_t),
  ClicIntCtlBits    : 8,
  ClicUseSMode      : 1,
  ClicUseUMode      : 0,
  ClicUseVsMode     : 1,
  ClicUseVsModePrio : 1,
  ClicNumVsCtxts    : 2, // TODO: choose appropriately
  NumExtIntrSyncs   : SyncStages,
  // Interconnect
  AddrWidth         : 48,
  AxiDataWidth      : 64,
  AxiUserWidth      : 10,  // {CACHE_PARTITIONING(5[9:5]), ECC_ERROR(1[4:4]), ATOPS(4[3:0])}
  AxiMstIdWidth     : 2,
  AxiMaxMstTrans    : 64,
  AxiMaxSlvTrans    : 64,
  AxiUserAmoMsb     : 3, // A0:0001, A1:0011, SF:0101, FP:0111, SL:1XXX, none: '0
  AxiUserAmoLsb     : 0, // A0:0001, A1:0011, SF:0101, FP:0111, SL:1XXX, none: '0
  AxiUserErrBits    : 1,
  AxiUserErrLsb     : 4,
  RegMaxReadTxns    : 8,
  RegMaxWriteTxns   : 8,
  RegAmoNumCuts     : 1,
  RegAmoPostCut     : 1,
  // External AXI ports (at most 8 ports and rules)
  AxiExtNumMst      : AxiNumExtMst,
  AxiExtNumSlv      : AxiNumExtSlv,
  AxiExtNumRules    : AxiNumExtSlv,
  // External AXI region map
  AxiExtRegionIdx   : '{0, 0, 0, 0, 0, 0, 0, 0, MailboxSlvIdx     ,
                                                IntClusterSlvIdx  ,
                                                FPClusterSlvIdx   ,
                                                PeriphsSlvIdx     ,
                                                EthernetSlvIdx    ,
                                                SafetyIslandSlvIdx,
                                                L2Port1SlvIdx     ,
                                                L2Port0SlvIdx     },
  AxiExtRegionStart : '{0, 0, 0, 0, 0, 0, 0, 0, MailboxBase     ,
                                                IntClusterBase  ,
                                                FPClusterBase   ,
                                                PeriphsBase     ,
                                                EthernetBase    ,
                                                SafetyIslandBase,
                                                L2Port1Base     ,
                                                L2Port0Base     },
  AxiExtRegionEnd   : '{0, 0, 0, 0, 0, 0, 0, 0, MailboxEnd     ,
                                                IntClusterEnd  ,
                                                FPClusterEnd   ,
                                                PeriphsEnd     ,
                                                EthernetEnd    ,
                                                SafetyIslandEnd,
                                                L2Port1End     ,
                                                L2Port0End     },
  // External reg slaves (at most 8 ports and rules)
  RegExtNumSlv      : NumTotalRegSlv,
  RegExtNumRules    : NumTotalRegRules,
  // For carfield, PllIdx is the first index of the async reg interfaces. Please add async reg
  // interfaces indices to the left of PllIdx, and sync reg interface indices to its right.
  RegExtRegionIdx   : '{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, L2EccIdx,  PadframeIdx,  PllIdx,  CarRegsIdx  },
  RegExtRegionStart : '{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, L2EccBase, PadframeBase, PllBase, CarRegsBase },
  RegExtRegionEnd   : '{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, L2EccEnd,  PadframeEnd,  PllEnd,  CarRegsEnd  },
  // RTC
  RtcFreq           : 1000000,
  // Features
  Bootrom           : 1,
  Uart              : 1,
  I2c               : 1,
  SpiHost           : 1,
  Gpio              : 1,
  Dma               : 1,
  SerialLink        : 1,
  Vga               : 0,
  AxiRt             : 1,
  Clic              : 1,
  IrqRouter         : 1,
  BusErr            : 1,
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
  LlcMaxReadTxns    : 32,
  LlcMaxWriteTxns   : 32,
  LlcAmoNumCuts     : 1,
  LlcAmoPostCut     : 1,
  LlcOutConnect     : 1,
  LlcOutRegionStart : 'h8000_0000,
  LlcOutRegionEnd   : 'h1_0000_0000,
  LlcUserMsb        : 9,
  LlcUserLsb        : 5,
  LlcCachePartition : 1,
  LlcMaxPartition   : 16,
  LlcRemapHash      : axi_llc_pkg::Modulo,
  // VGA: RGB332; carfield doesn't have a vga, but widths are required for top-level pins anyway.
  VgaRedWidth       : 3,
  VgaGreenWidth     : 3,
  VgaBlueWidth      : 2,
  // Serial Link: map other chip's lower 32bit to 'h1_000_0000
  SlinkMaxTxnsPerId : 4,
  SlinkMaxUniqIds   : 4,
  SlinkMaxClkDiv    : 1024,
  SlinkRegionStart  : 'h1_0000_0000,
  SlinkRegionEnd    : 'h2_0000_0000,
  SlinkTxAddrMask   : 'hFFFF_FFFF,
  SlinkTxAddrDomain : 'h0000_0000,
  SlinkUserAmoBit   : 3,  // Convention: lower AMO bits for cores, MSB for serial link
  // DMA config
  DmaConfMaxReadTxns  : 4,
  DmaConfMaxWriteTxns : 4,
  DmaConfAmoNumCuts   : 1,
  DmaNumAxInFlight    : 24,
  DmaMemSysDepth      : 16,
  DmaJobFifoDepth     : 4,
  DmaRAWCouplingAvail : 1,
  DmaConfAmoPostCut   : 1,
  DmaConfEnableTwoD   : 1,
  // GPIOs
  GpioInputSyncs      : 1,
  // AXI RT
  AxiRtNumPending     : 32,
  AxiRtWBufferDepth   : 32,
  AxiRtNumAddrRegions : 2,
  AxiRtCutPaths       : 1,
  AxiRtEnableChecks   : 0,
  // All non-set values should be zero
  default: '0
};
// verilog_lint: waive-stop line-length

// Control which island to add
typedef struct packed {
  bit     EnPulpCluster;
  bit     EnSafetyIsland;
  bit     EnSpatzCluster;
  bit     EnOpenTitan;
  bit     EnCan;
  bit     EnEthernet;
} islands_cfg_t;

// Enable all islands by default
localparam islands_cfg_t IslandsCfgDefault = '{
  EnPulpCluster   : 1,
  EnSafetyIsland  : 1,
  EnSpatzCluster  : 1,
  EnOpenTitan     : 1,
  EnCan           : 1,
  EnEthernet      : 0,
  default         : '1
};

// CDC FIFO parameters (FIFO depth).
localparam int unsigned LogDepth   = 3;

/*****************/
/* L2 Parameters */
/*****************/
localparam int unsigned NumL2Ports = 2;
localparam int unsigned L2MemSize = 2**20;
localparam int unsigned L2NumRules = 4; // 2 rules per each access mode
                                        // (interleaved, non-interleaved)
localparam doub_bt L2Port0NonInterlBase = L2Port0Base + L2MemSize;
localparam doub_bt L2Port1NonInterlBase = L2Port1Base + L2MemSize;

/****************************/
/* Safety Island Parameters */
/****************************/
localparam int unsigned SafetyIslandMemOffset = 'h0000_0000;
localparam int unsigned SafetyIslandPerOffset = 'h0020_0000;

/******************************/
/* Integer Cluster Parameters */
/******************************/
localparam int unsigned IntClusterNumHwpePorts = 9;
localparam int unsigned IntClusterNumDmas = 4;
localparam int unsigned IntClusterNumMstPer = 1;
localparam int unsigned IntClusterNumSlvPer = 10;
localparam int unsigned IntClusterTcdmSize = 256*1024;
localparam int unsigned IntClusterTcdmBanks = 16;
localparam int unsigned IntClusterHwpePresent = 1;
localparam int unsigned IntClusterUseHci = 1;
localparam int unsigned IntClusterSetAssociative = 4;
localparam int unsigned IntClusterNumCacheBanks = 2;
localparam int unsigned IntClusterNumCacheLines = 1;
localparam int unsigned IntClusterCacheSize = 4*1024;
localparam int unsigned IntClusterDbgStart = SafetyIslandBase+
                                             SafetyIslandPerOffset+
                                             safety_island_pkg::DebugAddrOffset;
localparam int unsigned IntClusterBootAddrDefaultOffs = 'h8080;
localparam int unsigned IntClusterBootAddr = L2Port0Base + IntClusterBootAddrDefaultOffs;
localparam int unsigned IntClusterInstrRdataWidth = 32;
localparam int unsigned IntClusterFpu = 0;
localparam int unsigned IntClusterFpuDivSqrt = 0;
localparam int unsigned IntClusterSharedFpu = 0;
localparam int unsigned IntClusterSharedFpuDivSqrt = 0;
localparam int unsigned IntClusterNumAxiMst = 3;
localparam int unsigned IntClusterNumAxiSlv = 4;
// IntClusterAxiIdInWidth is fixed from PULP Cluster
localparam int unsigned IntClusterAxiIdInWidth = $clog2(IntClusterNumCacheBanks) + 3;
localparam int unsigned IntClusterAxiIdOutWidth = IntClusterAxiIdInWidth     +
                                                  $clog2(IntClusterNumAxiSlv);
localparam int unsigned IntClusterMaxUniqId = 1;
localparam int unsigned IntClusterNumEoc = 1;
localparam logic [ 5:0] IntClusterIndex = (PulpHartIdOffs >> 5);
localparam logic [CarfieldCfgDefault.AddrWidth-1:0] IntClusterInternalSize = 'h0040_0000;

/*******************************/
/* Narrow Parameters: A32, D32 */
/*******************************/
localparam int unsigned AxiNarrowAddrWidth = 32;
localparam int unsigned AxiNarrowDataWidth = 32;
localparam int unsigned AxiNarrowStrobe    = AxiNarrowDataWidth/8;

// Narrow AXI types
typedef logic [     AxiNarrowAddrWidth-1:0] car_nar_addrw_t;
typedef logic [     AxiNarrowDataWidth-1:0] car_nar_dataw_t;
typedef logic [        AxiNarrowStrobe-1:0] car_nar_strb_t;
typedef logic [ IntClusterAxiIdInWidth-1:0] intclust_idin_t;
typedef logic [IntClusterAxiIdOutWidth-1:0] intclust_idout_t;

// Narrow reg types
`REG_BUS_TYPEDEF_ALL(carfield_a32_d32_reg, car_nar_addrw_t, car_nar_dataw_t, car_nar_strb_t)


//////////////////////////////
// Debug Signal Port Struct //
//////////////////////////////


// 6 clock gateable Subdomains in Carfield: periph_domain, safety_island, security_isalnd, spatz &
// pulp_cluster, L2 shared memory
localparam int unsigned NumDomains = 6;


typedef struct packed {
  logic [NumDomains-1:0] domain_clk;
  logic [NumDomains-1:0] domain_rsts_n;
  logic                  host_pwr_on_rst_n;
} carfield_debug_sigs_t;

endpackage
