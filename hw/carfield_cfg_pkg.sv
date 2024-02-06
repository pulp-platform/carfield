// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Yvan Tortorella <yvan.tortorella@unibo.it>

/// Configuration package
package carfield_cfg_pkg;

import cheshire_pkg::*;
import carfield_configuration::*;

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
  byte_bt pulp;
} carfield_master_idx_t;

// TODO: specify this is for AXI
// Generate the number of AXI slave devices to be connected to the
// crossbar starting from the islands enable structure.
function automatic int unsigned gen_num_slave(islands_cfg_t island_cfg);
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

// TODO: specify this is for AXI
// Generate the IDs for each AXI slave device
function automatic carfield_slave_idx_t carfield_gen_slave_idx(islands_cfg_t island_cfg);
  carfield_slave_idx_t ret = '{default: '0}; // Initialize struct first
  byte_bt i = 0;
  if (island_cfg.l2_port0.enable) begin ret.l2_port0 = i; i++;
    if (island_cfg.l2_port1.enable) begin ret.l2_port1 = i; i++; end
  end else begin
    ret.l2_port0 = MaxExtAxiSlv + i; i++;
    ret.l2_port1 = MaxExtAxiSlv + i;
  end
  if (island_cfg.safed.enable) begin ret.safed = i; i++;
  end else begin ret.safed = MaxExtAxiSlv + i; end
  if (island_cfg.ethernet.enable) begin ret.ethernet = i; i++;
  end else begin ret.ethernet = MaxExtAxiSlv + i; end
  if (island_cfg.periph.enable) begin ret.periph = i; i++;
  end else begin ret.periph = MaxExtAxiSlv + i; end
  if (island_cfg.spatz.enable) begin ret.spatz = i; i++;
  end else begin ret.spatz = MaxExtAxiSlv + i; end
  if (island_cfg.pulp.enable) begin ret.pulp = i; i++;
  end else begin ret.pulp = MaxExtAxiSlv + i; end
  if (island_cfg.mbox.enable) begin ret.mbox = i; i++;
  end else begin ret.mbox = MaxExtAxiSlv + i; end
  return ret;
endfunction

// TODO: specify this is for AXI
// Generate the number of AXI master devices that connect to the
// crossbar starting from the islands enable structure.
function automatic int unsigned gen_num_master(islands_cfg_t island_cfg);
  int unsigned ret = 0; // Number of masters starts from 0
  if (island_cfg.safed.enable  ) begin ret++; end
  if (island_cfg.spatz.enable  ) begin ret++; end
  if (island_cfg.pulp.enable   ) begin ret++; end
  if (island_cfg.secured.enable) begin ret++; end
  // This is a brute-force fix needed to avoid infinte for loop creation.
  // The fault is the PULP cluster.
  if (ret == 0) begin ret++; end
  return ret;
endfunction

// TODO: specify this is for AXI
// Generate the IDs for each AXI master device
localparam int unsigned MaxExtAxiMst = 2**MaxExtAxiMstWidth;
function automatic carfield_master_idx_t carfield_gen_master_idx(islands_cfg_t island_cfg);
  carfield_master_idx_t ret = '{default: '0}; // Initialize struct first
  byte_bt i = 0;
  if (island_cfg.safed.enable) begin ret.safed = i; i++;
  end else begin ret.safed = MaxExtAxiMst + i; end
  if (island_cfg.secured.enable) begin ret.secured = i; i++;
  end else begin ret.secured = MaxExtAxiMst + i; end
  if (island_cfg.spatz.enable) begin ret.spatz = i; i++;
  end else begin ret.spatz = MaxExtAxiMst + i; end
  if (island_cfg.pulp.enable) begin ret.pulp = i; i++;
  end else begin ret.pulp = MaxExtAxiMst + i; end
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
  l2_port0: '{L2Port0Enable, L2Port0Base, L2Port0Size},
  l2_port1: '{L2Port1Enable, L2Port1Base, L2Port1Size},
  safed:    '{SafetyIslandEnable, SafetyIslandBase, SafetyIslandSize},
  ethernet: '{EthernetEnable, EthernetBase, EthernetSize},
  periph:   '{PeriphEnable, PeriphBase, PeriphSize},
  spatz:    '{SpatzClusterEnable, SpatzClusterBase, SpatzClusterSize},
  pulp:     '{PulpClusterEnable, PulpClusterBase, PulpClusterSize},
  secured:  '{SecurityIslandEnable, SecurityIslandBase, SecurityIslandSize},
  mbox:     '{MailboxEnable, MailboxBase, MailboxSize}
};

// TODO: specify this is for AXI
localparam int unsigned CarfieldNumSlaves  = gen_num_slave(CarfieldIslandsCfg);
localparam carfield_slave_idx_t CarfieldSlvIdx = carfield_gen_slave_idx(CarfieldIslandsCfg);
localparam int unsigned CarfieldNumMasters = gen_num_master(CarfieldIslandsCfg);
localparam carfield_master_idx_t CarfieldMstIdx = carfield_gen_master_idx(CarfieldIslandsCfg);

localparam axi_struct_t CarfieldAxiMap = carfield_gen_axi_map(CarfieldNumSlaves ,
                                                              CarfieldIslandsCfg,
                                                              CarfieldSlvIdx    );

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

endpackage
