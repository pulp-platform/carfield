// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Thomas Benz  <tbenz@ethz.ch>

/// Carfield constants and Cheshire overwrites
package carfield_pkg;

  `include "axi/assign.svh"
  `include "axi/typedef.svh"
  `include "register_interface/assign.svh"
  `include "register_interface/typedef.svh"

  import cheshire_pkg::*;

  // the address carfield boots from
  localparam logic[63:0] carfield_boot_addr = 64'h0000_0000_0100_0000;

  localparam logic [15:0] PartNum = 1012;
  localparam logic [31:0] IDCode  = (dm::DbgVersion013 << 28) | (PartNum << 12) | 32'h1;

  // localparam cheshire_cfg_t CarfieldCfgDefault = '{
  //   // CVA6 parameters
  //   Cva6RASDepth      : ariane_pkg::ArianeDefaultConfig.RASDepth,
  //   Cva6BTBEntries    : ariane_pkg::ArianeDefaultConfig.BTBEntries,
  //   Cva6BHTEntries    : ariane_pkg::ArianeDefaultConfig.BHTEntries,
  //   Cva6NrPMPEntries  : 0,
  //   Cva6ExtCieLength  : 'h2000_0000,
  //   // Harts
  //   DualCore          : 0,  // Only one core, but rest of config allows for two
  //   CoreMaxTxnsPerId  : 4,
  //   CoreMaxUniqIds    : 4,
  //   NumExtIrqHarts     : 1      ,
  //   NumExtDbgHarts     : 1      ,
  //   NumExtIntrs        : 1      ,
  //   Core1UserAmoBit    : 1      ,
  //   CoreMaxTxnsPerId   : 1      ,
  //   CoreMaxUniqIds     : 1      ,
  //   AddrWidth          : 48     ,
  //   AxiDataWidth       : 64     ,
  //   AxiUserWidth       : 1      ,
  //   AxiMstIdWidth      : 2      ,
  //   AxiMaxMstTrans     : 12     ,
  //   AxiMaxSlvTrans     : 12     ,
  //   AxiUserAmoMsb      : 0      ,
  //   AxiUserAmoLsb      : 0      ,
  //   AxiUserAmoDomain   : 64     ,
  //   RegMaxReadTxns     : 12     ,
  //   RegMaxWriteTxns    : 12     ,
  //   RegAmoNumCuts      : 0      ,
  //   RegAmoPostCut      : 0      ,
  //   AxiExtNumMst       : 4      ,
  //   AxiExtNumSlv       : 5      ,
  //   AxiExtNumRules     : 5      , // TBC -> This should be = AxiExtNumSlv
  //   AxiExtRegionIdx    : 0      ,
  //   AxiExtRegionStart  : 0      , // TBC -> Carfield MemMap: 48'h0000_4000_0000
  //   AxiExtRegionEnd    : 0      , // TBC -> Carfield MemMap: 48'h0024_0000_0000
  //   RegExtNumSlv       : 0      ,
  //   RegExtNumRules     : 0      , // TBC -> This should be = RegExtNumSlv
  //   RegExtRegionIdx    : 0      , // TBC -> Carfield MemMap: 11 (all periphs + DMA)
  //   RegExtRegionStart  : 0      , // TBC -> Carfield MemMap: 48'h0000_1000_0000
  //   RegExtRegionEnd    : 0      , // TBC -> Carfield MemMap: 48'h0000_6000_0000 -> probably this should swapped and put right at the end of the periph space
  //   RtcFreq            : 32000  ,
  //   PlatformRom        : 1      ,
  //   Bootrom            : 1      ,
  //   Uart               : 1      ,
  //   I2c                : 1      ,
  //   SpiHost            : 1      ,
  //   Gpio               : 1      ,
  //   Dma                : 0      ,
  //   SerialLink         : 1      ,
  //   Vga                : 1      ,
  //   DbgIdCode          : IDCode ,
  //   DbgMaxReqs         : 1      ,
  //   DbgMaxReadTxns     : 12     ,
  //   DbgMaxWriteTxns    : 12     ,
  //   DbgAmoNumCuts      : 1      ,
  //   DbgAmoPostCut      : 1      ,
  //   LlcNotBypass       : 1      ,
  //   LlcSetAssoc        : 8      ,
  //   LlcNumLines        : 256    ,
  //   LlcNumBlocks       : 8      ,
  //   LlcMaxReadTxns     : 12     ,
  //   LlcMaxWriteTxns    : 12     ,
  //   LlcAmoNumCuts      : 0      ,
  //   LlcAmoPostCut      : 0      ,
  //   LlcOutConnect      : 1      ,
  //   LlcOutRegionStart  : 48'h0000_7000_0000, // TBC -> Carfield MemMap: 48'h0000_7000_0000
  //   LlcOutRegionEnd    : 48'h0000_7002_0000, // TBC -> Carfield MemMap: 48'h0000_7002_0000
  //   CSROutConnect      : 1      ,
  //   CSROutRegionStart  : 48'h0000_0200_0000,
  //   CSROutRegionEnd    : 48'h0000_0200_1000,
  //   VgaRedWidth        : 2      ,
  //   VgaGreenWidth      : 3      ,
  //   VgaBlueWidth       : 3      ,
  //   VgaHCountWidth     : 32     ,
  //   VgaVCountWidth     : 32     ,
  //   SlinkMaxTxnsPerId  : 1      ,
  //   // SlinkMaxUniqIds    :, // TBC -> This should be a function of AxiMstIdWidth, so it should not be here -> see cheshire_soc.sv
  //   SlinkMaxClkDiv     : 1      , // TBC -> Did not find it in Cheshire
  //   SlinkRegionStart   : 0      , // TBC -> Carfield MemMap: Serial Link internal to Cheshire
  //   SlinkRegionEnd     : 0      , // TBC -> Carfield MemMap: Serial Link internal to Cheshire
  //   SlinkTxAddrMask    : 0      , // TBC -> Did not find it in Cheshire
  //   SlinkTxAddrDomain  : 32     , // TBC -> Same as in Cheshire
  //   SlinkUserAmoBit    : 0      , // TBC -> Did not find it in Cheshire
  //   DmaConfMaxReadTxns : 4      ,
  //   DmaConfMaxWriteTxns: 4      ,
  //   DmaConfAmoNumCuts  : 1      ,
  //   DmaConfAmoPostCut  : 0      ,
  //   GpioInputSyncs     : 0
  // };

  ////////////////
  //  Defaults  //
  ////////////////

  // DO *NOT* BLINDLY ADOPT THE BELOW DEFAULTS WITHOUT FURTHER CONSIDERATION.
  // They are intended to provide references on reasonable defaults for *most*
  // parameters for select example SoCs. They will *likely* not be suitable for
  // your purposes and, depending on context, *may not work*. You were warned.

  localparam cheshire_cfg_t CarfieldCfgDefault = '{
    // CVA6 parameters
    Cva6RASDepth      : ariane_pkg::ArianeDefaultConfig.RASDepth,
    Cva6BTBEntries    : ariane_pkg::ArianeDefaultConfig.BTBEntries,
    Cva6BHTEntries    : ariane_pkg::ArianeDefaultConfig.BHTEntries,
    Cva6NrPMPEntries  : 0,
    Cva6ExtCieLength  : 'h2000_0000,
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
    // RTC
    RtcFreq           : 32768,
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
    DbgIdCode         : cheshire_pkg::CheshireIdCode,
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

  // AXI Parameters
  localparam axi_out_t  AxiOut  = gen_axi_out(CarfieldCfgDefault);
  localparam AxiAddrWidth = CarfieldCfgDefault.AddrWidth;
  localparam AxiDataWidth = CarfieldCfgDefault.AxiDataWidth;
  localparam AxiStrbWidth = CarfieldCfgDefault.AxiDataWidth / 8;
  localparam AxiUserWidth = CarfieldCfgDefault.AxiUserWidth;
  localparam AxiXbarMasterIdWidth = CarfieldCfgDefault.AxiMstIdWidth;
  localparam AxiXbarSlaveIdWidth  = CarfieldCfgDefault.AxiMstIdWidth + $clog2(AxiOut.num_out);

  // Type for address map entries
  typedef struct packed {
    logic [$bits(aw_bt)-1:0] idx;
    logic [AxiAddrWidth-1:0] start_addr;
    logic [AxiAddrWidth-1:0] end_addr;
  } addr_rule_t;

  localparam reg_out_t RegOut = gen_reg_out(CarfieldCfgDefault);

  function automatic addr_rule_t [RegOut.num_rules-1:0] gen_reg_map();
    automatic addr_rule_t [RegOut.num_rules-1:0] ret;
    for (int i = 0; i < RegOut.num_rules; ++i)
      ret[i] = '{idx: RegOut.map[i].idx, start_addr: RegOut.map[i].start, end_addr: RegOut.map[i].pte};
    return ret;
  endfunction

  localparam addr_rule_t [RegOut.num_rules-1:0] RegMap = gen_reg_map();

  `AXI_TYPEDEF_ALL_CT(axi_mst                        ,
                      axi_mst_req_t                  ,
                      axi_mst_rsp_t                  ,
                      logic [AxiAddrWidth-1:0       ],
                      logic [AxiXbarSlaveIdWidth-1:0],
                      logic [AxiDataWidth-1:0       ],
                      logic [AxiStrbWidth-1:0       ],
                      logic [AxiUserWidth-1:0       ])

  `AXI_TYPEDEF_ALL_CT(axi_slv                        ,
                      axi_slv_req_t                  ,
                      axi_slv_rsp_t                  ,
                      logic [AxiAddrWidth-1:0       ],
                      logic [AxiXbarSlaveIdWidth-1:0],
                      logic [AxiDataWidth-1:0       ],
                      logic [AxiStrbWidth-1:0       ],
                      logic [AxiUserWidth-1:0       ])

  `AXI_TYPEDEF_ALL_CT(axi_llc                      ,
                      axi_llc_mst_req_t            ,
                      axi_llc_mst_rsp_t            ,
                      logic [AxiAddrWidth-1:0     ],
                      logic [AxiXbarSlaveIdWidth:0], // LLC requires one extra ID bit
                      logic [AxiDataWidth-1:0     ],
                      logic [AxiStrbWidth-1:0     ],
                      logic [AxiUserWidth-1:0     ])

  `REG_BUS_TYPEDEF_ALL(reg_a48_d32 ,
                       logic [47:0],
                       logic [31:0],
                       logic [ 7:0])

  // localparam logic [            31:0] LLCBase32 = AxiOut.map[AxiOut.llc].start[31:0];
  // localparam logic [            31:0] CSRBase32 = AxiOut.map[AxiOut.csr].start[31:0];
  // localparam logic [AxiAddrWidth-1:0] CSRBase48 = AxiOut.map[AxiOut.csr].start;

endpackage
