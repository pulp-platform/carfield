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

import carfield_configuration::*;

/***********************************
* Carfield Configuration functions *
***********************************/

// Below there are the functions used to flexibly reconfigure
// Carfield's depending on a `carfield_configuration` file were
// it is possible to enable/disable given islands and adapt the
// SoC's memory map accordingly. The following functions are all
// used within the `carfield_pkg` only.

typedef struct packed {
  bit enable;
  doub_bt base;
  doub_bt size;
} islands_properties_t;

typedef struct packed {
  islands_properties_t l2_port0;
  islands_properties_t l2_port1;
  islands_properties_t safed;
  islands_properties_t ethernet;
  islands_properties_t periph;
  islands_properties_t spatz;
  islands_properties_t pulp;
  islands_properties_t secured;
  islands_properties_t mbox;
} islands_cfg_t;

// Types are obtained from Cheshire package
// Parameter MaxExtAxiSlvWidth is obtained from Cheshire
// Structure used to create the AXI map to be passed to
// the Cheshire configuration parameter to create the
// AXI crossbar.
localparam int unsigned MaxExtAxiSlv = 2**MaxExtAxiSlvWidth;
typedef struct packed {
  byte_bt [MaxExtAxiSlv-1:0] AxiIdx;
  doub_bt [MaxExtAxiSlv-1:0] AxiStart;
  doub_bt [MaxExtAxiSlv-1:0] AxiEnd;
} axi_struct_t;

typedef struct packed {
  byte_bt l2_port0;
  byte_bt l2_port1;
  byte_bt safed;
  byte_bt ethernet;
  byte_bt periph;
  byte_bt spatz;
  byte_bt pulp;
  byte_bt mbox;
} carfield_slave_idx_t;

typedef struct packed {
  byte_bt safed;
  byte_bt spatz;
  byte_bt secured;
  byte_bt secured_idma;
  byte_bt pulp;
} carfield_master_idx_t;

// Generate the number of AXI slave devices to be connected to the
// crossbar starting from the islands enable structure.
function automatic int unsigned gen_num_axi_slave(islands_cfg_t island_cfg);
  int unsigned ret = 0; // Number of slaves starts from 0
  if (island_cfg.l2_port0.enable) begin
    ret++; // If we enable L2, we increase by 1
    if (island_cfg.l2_port1.enable)
      ret++; // If the L2 is dualport, increase again
  end
  if (island_cfg.safed.enable   ) begin ret++; end
  if (island_cfg.periph.enable  ) begin ret++; end
  if (island_cfg.ethernet.enable) begin ret++; end
  if (island_cfg.spatz.enable   ) begin ret++; end
  if (island_cfg.pulp.enable    ) begin ret++; end
  if (island_cfg.mbox.enable    ) begin ret++; end
  return ret;
endfunction

// Generate the IDs for each AXI slave device
function automatic carfield_slave_idx_t carfield_gen_axi_slave_idx(islands_cfg_t island_cfg);
  carfield_slave_idx_t ret = '{default: '0}; // Initialize struct first
  byte_bt i = 0;
  byte_bt j = 0;
  if (island_cfg.l2_port0.enable) begin ret.l2_port0 = i; i++;
    if (island_cfg.l2_port1.enable) begin ret.l2_port1 = i; i++; end
  end else begin
    ret.l2_port0 = MaxExtAxiSlv + j; j++;
    ret.l2_port1 = MaxExtAxiSlv + j; j++;
  end
  if (island_cfg.safed.enable) begin ret.safed = i; i++;
  end else begin ret.safed = MaxExtAxiSlv + j; j++; end
  if (island_cfg.ethernet.enable) begin ret.ethernet = i; i++;
  end else begin ret.ethernet = MaxExtAxiSlv + j; j++; end
  if (island_cfg.periph.enable) begin ret.periph = i; i++;
  end else begin ret.periph = MaxExtAxiSlv + j; j++; end
  if (island_cfg.spatz.enable) begin ret.spatz = i; i++;
  end else begin ret.spatz = MaxExtAxiSlv + j; j++; end
  if (island_cfg.pulp.enable) begin ret.pulp = i; i++;
  end else begin ret.pulp = MaxExtAxiSlv + j; j++; end
  if (island_cfg.mbox.enable) begin ret.mbox = i; i++;
  end else begin ret.mbox = MaxExtAxiSlv + j; j++; end
  return ret;
endfunction

// Generate the number of AXI master devices that connect to the
// crossbar starting from the islands enable structure.
function automatic int unsigned gen_num_axi_master(islands_cfg_t island_cfg);
  int unsigned ret = 0; // Number of masters starts from 0
  if (island_cfg.safed.enable  ) begin ret++; end
  if (island_cfg.spatz.enable  ) begin ret++; end
  if (island_cfg.pulp.enable   ) begin ret++; end
  if (island_cfg.secured.enable) begin ret+=2; end
  return ret;
endfunction

// Generate the IDs for each AXI master device
localparam int unsigned MaxExtAxiMst = 2**MaxExtAxiMstWidth;
function automatic carfield_master_idx_t carfield_gen_axi_master_idx(islands_cfg_t island_cfg);
  carfield_master_idx_t ret = '{default: '0}; // Initialize struct first
  byte_bt i = 0;
  byte_bt j = 0;
  if (island_cfg.safed.enable) begin ret.safed = i; i++;
  end else begin ret.safed = MaxExtAxiMst + j; j++; end
  if (island_cfg.secured.enable) begin ret.secured = i; ret.secured_idma = i+1; i+=2;
  end else begin ret.secured = MaxExtAxiMst + j; ret.secured_idma = MaxExtAxiMst + j + 1; j+=2; end
  if (island_cfg.spatz.enable) begin ret.spatz = i; i++;
  end else begin ret.spatz = MaxExtAxiMst + j; j++; end
  if (island_cfg.pulp.enable) begin ret.pulp = i; i++;
  end else begin ret.pulp = MaxExtAxiMst + j; j++; end
  return ret;
endfunction

// Compute memory map
function automatic axi_struct_t carfield_gen_axi_map(int unsigned NumSlave  ,
                                                    islands_cfg_t island_cfg,
                                                    carfield_slave_idx_t idx);
  axi_struct_t ret = '0; // Initialize the map first
  int unsigned i = 0;
  if (island_cfg.l2_port0.enable) begin
    ret.AxiIdx[i] = idx.l2_port0;
    ret.AxiStart[i] = island_cfg.l2_port0.base;
    ret.AxiEnd[i] = island_cfg.l2_port0.base + island_cfg.l2_port0.size;
    if (i < NumSlave - 1) i++;
    if (island_cfg.l2_port1.enable) begin
      ret.AxiIdx[i] = idx.l2_port1;
      ret.AxiStart[i] = island_cfg.l2_port1.base;
      ret.AxiEnd[i] = island_cfg.l2_port1.base + island_cfg.l2_port1.size;
      if (i < NumSlave - 1) i++;
    end
  end
  if (island_cfg.safed.enable) begin
    ret.AxiIdx[i] = idx.safed;
    ret.AxiStart[i] = island_cfg.safed.base;
    ret.AxiEnd[i] = island_cfg.safed.base + island_cfg.safed.size;
    if (i < NumSlave - 1) i++;
  end
  if (island_cfg.ethernet.enable) begin
    ret.AxiIdx[i] = idx.ethernet;
    ret.AxiStart[i] = island_cfg.ethernet.base;
    ret.AxiEnd[i] = island_cfg.ethernet.base + island_cfg.ethernet.size;
    if (i < NumSlave - 1) i++;
  end
  if (island_cfg.periph.enable) begin
    ret.AxiIdx[i] = idx.periph;
    ret.AxiStart[i] = island_cfg.periph.base;
    ret.AxiEnd[i] = island_cfg.periph.base + island_cfg.periph.size;
    if (i < NumSlave - 1) i++;
  end
  if (island_cfg.spatz.enable) begin
    ret.AxiIdx[i] = idx.spatz;
    ret.AxiStart[i] = island_cfg.spatz.base;
    ret.AxiEnd[i] = island_cfg.spatz.base + island_cfg.spatz.size;
    if (i < NumSlave - 1) i++;
  end
  if (island_cfg.pulp.enable) begin
    ret.AxiIdx[i] = idx.pulp;
    ret.AxiStart[i] = island_cfg.pulp.base;
    ret.AxiEnd[i] = island_cfg.pulp.base + island_cfg.pulp.size;
    if (i < NumSlave - 1) i++;
  end
  if (island_cfg.mbox.enable) begin
    ret.AxiIdx[i] = idx.mbox;
    ret.AxiStart[i] = island_cfg.mbox.base;
    ret.AxiEnd[i] = island_cfg.mbox.base + island_cfg.mbox.size;
    if (i < NumSlave - 1) i++;
  end
  return ret;
endfunction

/********************
 * RegBus functions *
 *******************/
typedef struct packed {
  islands_properties_t pcrs;
  islands_properties_t pll;
  islands_properties_t padframe;
  islands_properties_t l2ecc;
} regbus_cfg_t;

typedef struct packed {
  byte_bt pcrs;
  byte_bt pll;
  byte_bt padframe;
  byte_bt l2ecc;
} carfield_regbus_slave_idx_t;

// Generate the number of AXI slave devices to be connected to the
// crossbar starting from the islands enable structure.
function automatic int unsigned gen_num_regbus_sync_slave(regbus_cfg_t regbus_cfg);
  int unsigned ret = 0; // Number of slaves starts from 0
  if (regbus_cfg.pcrs.enable) begin ret++; end
  return ret;
endfunction

function automatic int unsigned gen_num_regbus_async_slave(regbus_cfg_t regbus_cfg);
  int unsigned ret = 0; // Number of slaves starts from 0
  if (regbus_cfg.pll.enable     ) begin ret++; end
  if (regbus_cfg.padframe.enable) begin ret++; end
  if (regbus_cfg.l2ecc.enable   ) begin ret++; end
  return ret;
endfunction

localparam regbus_cfg_t CarfieldRegBusCfg = '{
  pcrs:     '{1, PcrsBase, PcrsSize},
  pll:      '{PllCfgEnable, PllCfgBase, PllCfgSize},
  padframe: '{PadframeCfgEnable, PadframeCfgBase, PadframeCfgSize},
  l2ecc:    '{L2EccCfgEnable, L2EccCfgBase, L2EccCfgSize}
};

localparam int unsigned NumSyncRegSlv = gen_num_regbus_sync_slave(CarfieldRegBusCfg);
localparam int unsigned NumAsyncRegSlv = gen_num_regbus_async_slave(CarfieldRegBusCfg);
localparam int unsigned NumTotalRegSlv = NumSyncRegSlv + NumAsyncRegSlv;

// Generate the IDs for each AXI slave device
// verilog_lint: waive-start line-length
function automatic carfield_regbus_slave_idx_t carfield_gen_regbus_slave_idx(regbus_cfg_t regbus_cfg);
// verilog_lint: waive-stop line-length
  carfield_regbus_slave_idx_t ret = '{default: '0}; // Initialize struct first
  byte_bt i = 0;
  byte_bt j = 0;
  if (regbus_cfg.pcrs.enable) begin ret.pcrs = i; i++;
  end else begin ret.pcrs = NumTotalRegSlv + j; j++; end
  if (regbus_cfg.pll.enable) begin ret.pll = i; i++;
  end else begin ret.pll = NumTotalRegSlv + j; j++; end
  if (regbus_cfg.padframe.enable) begin ret.padframe = i; i++;
  end else begin ret.padframe = NumTotalRegSlv + j; j++; end
  if (regbus_cfg.l2ecc.enable) begin ret.l2ecc = i; i++;
  end else begin ret.l2ecc = NumTotalRegSlv + j; j++; end
  return ret;
endfunction

typedef struct packed {
  byte_bt [NumTotalRegSlv-1:0] RegBusIdx;
  doub_bt [NumTotalRegSlv-1:0] RegBusStart;
  doub_bt [NumTotalRegSlv-1:0] RegBusEnd;
} regbus_struct_t;

// Compute RegBus memory map
function automatic regbus_struct_t carfield_gen_regbus_map(int unsigned NumSlave          ,
                                                           regbus_cfg_t regbus_cfg        ,
                                                           carfield_regbus_slave_idx_t idx);
  regbus_struct_t ret = '0; // Initialize the map first
  int unsigned i = 0;
  if (regbus_cfg.pcrs.enable) begin
    ret.RegBusIdx[i] = idx.pcrs;
    ret.RegBusStart[i] = regbus_cfg.pcrs.base;
    ret.RegBusEnd[i] = regbus_cfg.pcrs.base + regbus_cfg.pcrs.size;
    if (i < NumSlave - 1) i++;
  end
  if (regbus_cfg.pll.enable) begin
    ret.RegBusIdx[i] = idx.pll;
    ret.RegBusStart[i] = regbus_cfg.pll.base;
    ret.RegBusEnd[i] = regbus_cfg.pll.base + regbus_cfg.pll.size;
    if (i < NumSlave - 1) i++;
  end
  if (regbus_cfg.padframe.enable) begin
    ret.RegBusIdx[i] = idx.padframe;
    ret.RegBusStart[i] = regbus_cfg.padframe.base;
    ret.RegBusEnd[i] = regbus_cfg.padframe.base + regbus_cfg.padframe.size;
    if (i < NumSlave - 1) i++;
  end
  if (regbus_cfg.l2ecc.enable) begin
    ret.RegBusIdx[i] = idx.l2ecc;
    ret.RegBusStart[i] = regbus_cfg.l2ecc.base;
    ret.RegBusEnd[i] = regbus_cfg.l2ecc.base + regbus_cfg.l2ecc.size;
    if (i < NumSlave - 1) i++;
  end
  return ret;
endfunction

// Generate number of existent domains
function automatic int unsigned gen_carfield_domains(islands_cfg_t island_cfg);
  int unsigned ret = 0; // Number of availale domains starts from 0
  if (island_cfg.l2_port0.enable) begin ret++; end
  if (island_cfg.safed.enable   ) begin ret++; end
  if (island_cfg.periph.enable  ) begin ret++; end
  if (island_cfg.spatz.enable   ) begin ret++; end
  if (island_cfg.pulp.enable    ) begin ret++; end
  if (island_cfg.secured.enable ) begin ret++; end
  return ret;
endfunction

localparam islands_cfg_t CarfieldIslandsCfg = '{
  l2_port0:      '{L2Port0Enable, L2Port0Base, L2Port0Size},
  l2_port1:      '{L2Port1Enable, L2Port1Base, L2Port1Size},
  safed:         '{SafetyIslandEnable, SafetyIslandBase, SafetyIslandSize},
  ethernet:      '{EthernetEnable, EthernetBase, EthernetSize},
  periph:        '{PeriphEnable, PeriphBase, PeriphSize},
  spatz:         '{SpatzClusterEnable, SpatzClusterBase, SpatzClusterSize},
  pulp:          '{PulpClusterEnable, PulpClusterBase, PulpClusterSize},
  secured:       '{SecurityIslandEnable, SecurityIslandBase, SecurityIslandSize},
  mbox:          '{MailboxEnable, MailboxBase, MailboxSize}
};

localparam int unsigned CarfieldAxiNumSlaves  = gen_num_axi_slave(CarfieldIslandsCfg);
localparam carfield_slave_idx_t CarfieldAxiSlvIdx = carfield_gen_axi_slave_idx(CarfieldIslandsCfg);
localparam int unsigned CarfieldAxiNumMasters = gen_num_axi_master(CarfieldIslandsCfg);
localparam carfield_master_idx_t CarfieldMstIdx = carfield_gen_axi_master_idx(CarfieldIslandsCfg);

localparam axi_struct_t CarfieldAxiMap = carfield_gen_axi_map(CarfieldAxiNumSlaves,
                                                              CarfieldIslandsCfg  ,
                                                              CarfieldAxiSlvIdx   );
// verilog_lint: waive-start line-length
localparam carfield_regbus_slave_idx_t CarfieldRegBusSlvIdx = carfield_gen_regbus_slave_idx(CarfieldRegBusCfg);
// verilog_lint: waive-stop line-length

localparam regbus_struct_t CarfieldRegBusMap = carfield_gen_regbus_map(NumTotalRegSlv      ,
                                                                       CarfieldRegBusCfg   ,
                                                                       CarfieldRegBusSlvIdx);

localparam int unsigned CarfieldNumDomains = gen_carfield_domains(CarfieldIslandsCfg);

typedef struct {
  int unsigned clock_div_value[CarfieldNumDomains];
} carfield_clk_div_values_t;

function automatic carfield_clk_div_values_t gen_carfield_clk_div_value(int unsigned num_domains);
  carfield_clk_div_values_t ret = '{default: '0};
  for (int i = 0; i < num_domains; i++) ret.clock_div_value[i] = 1;
  return ret;
endfunction

// verilog_lint: waive-start line-length
localparam carfield_clk_div_values_t CarfieldClkDivValue = gen_carfield_clk_div_value(CarfieldNumDomains);
// verilog_lint: waive-stop line-length

typedef struct packed {
  byte_bt l2;
  byte_bt spatz;
  byte_bt pulp;
  byte_bt secured;
  byte_bt safed;
  byte_bt periph;
} carfield_domain_idx_t;

function automatic carfield_domain_idx_t gen_domain_idx(islands_cfg_t island_cfg);
  carfield_domain_idx_t ret = '{default: '0};
  int unsigned i = 0;
  if (island_cfg.periph.enable   ) begin ret.periph  = i; i++; end
  if (island_cfg.safed.enable    ) begin ret.safed   = i; i++; end
  if (island_cfg.secured.enable  ) begin ret.secured = i; i++; end
  if (island_cfg.pulp.enable     ) begin ret.pulp    = i; i++; end
  if (island_cfg.spatz.enable    ) begin ret.spatz   = i; i++; end
  if (island_cfg.l2_port0.enable ) begin ret.l2      = i; i++; end
  return ret;
endfunction

localparam carfield_domain_idx_t CarfieldDomainIdx = gen_domain_idx(CarfieldIslandsCfg);

/*******************************
* Carfield package starts here *
*******************************/
localparam int unsigned CheshireNumInternalHarts = 2;
localparam bit CheshireSerialLinkEnable = 1;
localparam int unsigned CarfieldNumExtIntrs           = 32; // Number of external interrupts
localparam int unsigned CarfieldNumInterruptibleHarts = 2;  // Spatz (2 Snitch cores)
localparam int unsigned CarfieldNumRouterTargets      = 1;  // Safety Island

typedef enum int {
  FPClusterIntrHart0Idx = 'd0,
  FPClusterIntrHart1Idx = 'd1,
  SafedIntrHartIdx      = 'd2
} carfield_ext_intr_harts_e;

// Clock dividers integer value after PoR
localparam int unsigned PeriphDomainClkDivValue     = 1;
localparam int unsigned SafedDomainClkDivValue      = 1;
localparam int unsigned SecdDomainClkDivValue       = 1;
localparam int unsigned IntClusterDomainClkDivValue = 1;
localparam int unsigned FPClusterDomainClkDivValue  = 1;
localparam int unsigned L2DomainClkDivValue         = 1;

typedef enum byte_bt {
  L2Port0SlvIdx      = CarfieldAxiSlvIdx.l2_port0,
  L2Port1SlvIdx      = CarfieldAxiSlvIdx.l2_port1,
  SafetyIslandSlvIdx = CarfieldAxiSlvIdx.safed,
  EthernetSlvIdx     = CarfieldAxiSlvIdx.ethernet,
  PeriphsSlvIdx      = CarfieldAxiSlvIdx.periph,
  FPClusterSlvIdx    = CarfieldAxiSlvIdx.spatz,
  IntClusterSlvIdx   = CarfieldAxiSlvIdx.pulp,
  MailboxSlvIdx      = CarfieldAxiSlvIdx.mbox
} axi_slv_idx_t;

typedef enum byte_bt {
  SafetyIslandMstIdx       = CarfieldMstIdx.safed,
  SecurityIslandTlulMstIdx = CarfieldMstIdx.secured,
  SecurityIslandiDMAMstIdx = CarfieldMstIdx.secured_idma,
  FPClusterMstIdx          = CarfieldMstIdx.spatz,
  IntClusterMstIdx         = CarfieldMstIdx.pulp
} axi_mst_idx_t;

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
localparam int unsigned IntClusterNumCores = 8;
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
  carfield_pkg::pulp_hart_info(SafetyIslandExtHarts);

// Safety island configuration
`ifdef SAFED_ENABLE
  localparam bit [31:0] SafedDebugOffs          = safety_island_pkg::DebugAddrOffset;
  localparam int unsigned SafetyIslandMemOffset = 'h0000_0000;
  localparam int unsigned SafetyIslandPerOffset = 'h0020_0000;
  localparam safety_island_pkg::safety_island_cfg_t SafetyIslandCfg = '{
      HartId:             carfield_pkg::SafetyIslHartIdOffs,
      BankNumBytes:       32'h0001_0000,
      NumBanks:           2,
      // JTAG ID code:
      // LSB                        [0]:     1'h1
      // PULP Platform Manufacturer [11:1]:  11'h6d9
      // Part Number                [27:12]: 16'hca71
      // Version                    [31:28]: 4'h1
      PulpJtagIdCode:     32'h1_ca71_db3,
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
  localparam int unsigned SafetyIslandIrqs = SafetyIslandCfg.NumInterrupts;
`else
  localparam int unsigned SafetyIslandCfg = '0;
  localparam bit [31:0] SafedDebugOffs          = 0;
  localparam int unsigned SafetyIslandMemOffset = 0;
  localparam int unsigned SafetyIslandPerOffset = 0;
  localparam int unsigned SafetyIslandIrqs = 1;
`endif

// Compute the number of atomic MSBs depending on the configuration
function automatic dw_bt carfield_get_axi_user_amo_msb(islands_cfg_t island_cfg,
                                                       int unsigned CheshireNumHarts,
                                                       bit SerialLinkEnabled);
  dw_bt ret = '{default: 0}; // Initialize value
  int unsigned i = CheshireNumHarts; // Start with the number of Cheshire internal Harts
  if (SerialLinkEnabled) i += 1;
  if (island_cfg.safed.enable) i += 1;
  if (island_cfg.spatz.enable) i += 1;
  ret = $clog2(i);
  return ret;
endfunction

localparam dw_bt AxiUserAmoMsb = carfield_get_axi_user_amo_msb(CarfieldIslandsCfg,
                                                               CheshireNumInternalHarts,
                                                               CheshireSerialLinkEnable);

// verilog_lint: waive-start line-length
// Cheshire configuration
localparam cheshire_cfg_t CarfieldCfgDefault = '{
  // CVA6 parameters
  Cva6RASDepth      : cva6_config_pkg::cva6_cfg.RASDepth,
  Cva6BTBEntries    : cva6_config_pkg::cva6_cfg.BTBEntries,
  Cva6BHTEntries    : cva6_config_pkg::cva6_cfg.BHTEntries,
  Cva6NrPMPEntries  : 0,
  Cva6ExtCieLength  : 'h1000_0000, // [0x2000_0000, 0x7000_0000) is non-CIE,
                                   // [0x7000_0000, 0x8000_0000) is CIE
  Cva6ExtCieOnTop   : 1,
  // Harts
  NumCores          : CheshireNumInternalHarts,
  CoreMaxTxns       : 8,
  CoreMaxTxnsPerId  : 4,
  CoreUserAmoOffs   : 0, // Convention: lower AMO bits for cores, MSB for serial link
  // Interrupt parameters
  NumExtIrqHarts    : CarfieldNumInterruptibleHarts,
  NumExtInIntrs     : CarfieldNumExtIntrs,
  NumExtClicIntrs   : CarfieldNumExtIntrs,
  NumExtOutIntrTgts : CarfieldNumRouterTargets,
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
  TFLenWidth        : 32,
  AxiMaxMstTrans    : 64,
  AxiMaxSlvTrans    : 64,
  AxiUserAmoMsb     : AxiUserAmoMsb, // A0:0001, A1:0011, SF:0101, FP:0111, SL:1XXX, none: '0
  AxiUserAmoLsb     : 0,             // A0:0001, A1:0011, SF:0101, FP:0111, SL:1XXX, none: '0
  AxiUserErrBits    : 1,
  AxiUserErrLsb     : 4,
  RegMaxReadTxns    : 8,
  RegMaxWriteTxns   : 8,
  RegAmoNumCuts     : 1,
  RegAmoPostCut     : 1,
  RegAdaptMemCut    : 1,
  // External AXI ports (at most 8 ports and rules)
  AxiExtNumMst      : CarfieldAxiNumMasters,
  AxiExtNumSlv      : CarfieldAxiNumSlaves,
  AxiExtNumRules    : CarfieldAxiNumSlaves,
  // External AXI region map
  AxiExtRegionIdx   : CarfieldAxiMap.AxiIdx,
  AxiExtRegionStart : CarfieldAxiMap.AxiStart,
  AxiExtRegionEnd   : CarfieldAxiMap.AxiEnd,
  // External reg slaves (at most 8 ports and rules)
  RegExtNumSlv      : NumTotalRegSlv,
  RegExtNumRules    : NumTotalRegSlv,
  // For carfield, PllIdx is the first index of the async reg interfaces. Please add async reg
  // interfaces indices to the left of PllIdx, and sync reg interface indices to its right.
  RegExtRegionIdx   : CarfieldRegBusMap.RegBusIdx,
  RegExtRegionStart : CarfieldRegBusMap.RegBusStart,
  RegExtRegionEnd   : CarfieldRegBusMap.RegBusEnd,
  // RTC
  RtcFreq           : 1000000,
  // Features
  Bootrom           : 1,
  Uart              : 1,
  I2c               : 1,
  SpiHost           : 1,
  Gpio              : 1,
  Dma               : 1,
  SerialLink        : CheshireSerialLinkEnable,
  Vga               : 0,
  AxiRt             : 1,
  Clic              : 1,
  IrqRouter         : 1,
  BusErr            : 1,
  HmrUnit           : 1,
  Cva6DMR           : 1,
  Cva6DMRFixed      : 0,
  RapidRecovery     : 0,
  // Debug
  DbgIdCode         : '{
    version: 4'h1,
    part_num: 16'hca70,
    manufacturer: JtagPulpManufacturer,
    _one: 1
  },
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

// CDC FIFO parameters (FIFO depth).
localparam int unsigned LogDepth   = 3;

/*****************/
/* L2 Parameters */
/*****************/
localparam int unsigned NumL2Ports = (CarfieldIslandsCfg.l2_port1.enable) ? 2 : 1;
localparam int unsigned L2MemSize = CarfieldIslandsCfg.l2_port0.size/2;
localparam int unsigned L2NumRules = 4; // 2 rules per each access mode
                                        // (interleaved, non-interleaved)
localparam doub_bt L2Port0InterlBase = CarfieldIslandsCfg.l2_port0.base;
localparam doub_bt L2Port1InterlBase = CarfieldIslandsCfg.l2_port1.base;
localparam doub_bt L2Port0NonInterlBase = CarfieldIslandsCfg.l2_port0.base + L2MemSize;
localparam doub_bt L2Port1NonInterlBase = CarfieldIslandsCfg.l2_port1.base + L2MemSize;

/******************************/
/* Integer Cluster Parameters */
/******************************/
localparam bit[CarfieldCfgDefault.AddrWidth-1:0] PulpClustPeriphOffs = 'h00200000;
localparam bit[CarfieldCfgDefault.AddrWidth-1:0] PulpClustExtOffs    = 'h00400000;
localparam int unsigned IntClusterNumEoc = 1;
localparam logic [ 5:0] IntClusterIndex = (PulpHartIdOffs >> 5);

/****************************/
/* Spatz Cluster Parameters */
/****************************/
`ifdef SPATZ_ENABLE
  localparam int unsigned SpatzNumIntHarts = spatz_cluster_pkg::NumCores;
  localparam int unsigned SpatzClusterPeriphStartAddr = spatz_cluster_pkg::PeriStartAddr;
  localparam int unsigned SpatzClusterPeripheralBootControlOffset =
  spatz_cluster_peripheral_reg_pkg::SPATZ_CLUSTER_PERIPHERAL_CLUSTER_BOOT_CONTROL_OFFSET;
  localparam int unsigned SpatzClusterPeripheralsEocOffset =
  spatz_cluster_peripheral_reg_pkg::SPATZ_CLUSTER_PERIPHERAL_CLUSTER_EOC_EXIT_OFFSET;
`else
  localparam int unsigned SpatzNumIntHarts = 0;
  localparam int unsigned SpatzClusterPeriphStartAddr = 0;
  localparam int unsigned SpatzClusterPeripheralBootControlOffset = 0;
  localparam int unsigned SpatzClusterPeripheralsEocOffset = 0;
`endif

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

// APB Mapping
localparam int unsigned NumApbMst = 5;

typedef enum int {
  SystemTimerIdx   = 'd0,
  AdvancedTimerIdx = 'd1,
  SystemWdtIdx     = 'd2,
  CanIdx           = 'd3,
  HyperBusIdx      = 'd4
} carfield_peripherals_e;

// Address map of peripheral system
typedef struct packed {
  logic [31:0] idx;
  car_nar_addrw_t start_addr;
  car_nar_addrw_t end_addr;
} carfield_addr_map_rule_t;

localparam carfield_addr_map_rule_t [NumApbMst-1:0] PeriphApbAddrMapRule = '{
   // 0: System Timer
  '{ idx: SystemTimerIdx,   start_addr: SystemTimerBase,
                            end_addr: SystemTimerBase + SystemTimerSize  },
  // 1: Advanced Timer
  '{ idx: AdvancedTimerIdx, start_addr: SystemAdvancedTimerBase,
                            end_addr: SystemAdvancedTimerBase + SystemAdvancedTimerSize },
  // 2: WDT
  '{ idx: SystemWdtIdx,     start_addr: SystemWatchdogBase,
                            end_addr: SystemWatchdogBase + SystemWatchdogSize },
  // 3: Can
  '{ idx: CanIdx,           start_addr: CanBase,
                            end_addr: CanBase + CanSize },
  // 4: Hyperbus
  '{ idx: HyperBusIdx,      start_addr: HyperBusBase,
                            end_addr: HyperBusBase + HyperBusSize }
};

// Narrow reg types
`REG_BUS_TYPEDEF_ALL(carfield_a32_d32_reg, car_nar_addrw_t, car_nar_dataw_t, car_nar_strb_t)


//////////////////////////////
// Debug Signal Port Struct //
//////////////////////////////


// 6 clock gateable Subdomains in Carfield: periph_domain, safety_island, security_isalnd, spatz &
// pulp_cluster, L2 shared memory
localparam int unsigned NumDomains = CarfieldNumDomains;

typedef struct packed {
  logic [NumDomains-1:0] domain_clk;
  logic [NumDomains-1:0] domain_rsts_n;
  logic                  host_pwr_on_rst_n;
} carfield_debug_sigs_t;

endpackage
