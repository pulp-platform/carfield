// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Yvan Tortorella <yvan.tortorella@unibo.it>

/// Configuration package
package carfield_cfg_pkg;

import cheshire_pkg::*;

// Structure where each field defines if an island
// is present or not. 1: present; 0: not present.
typedef struct packed {
  bit l2;
  bit l2_dualport;
  bit safed;
  bit ethernet;
  bit periph;
  bit spatz;
  bit pulp;
  bit secured;
} enable_islands_t;

// Structure used to define the address range of each island.
// N.B. island_cfg_t and enable_islands_t structures could be
// packed into a single one.
typedef struct packed {
  doub_bt l2_port0_base;
  doub_bt l2_port1_base;
  doub_bt l2_size;
  doub_bt safed_base;
  doub_bt safed_size;
  doub_bt ethernet_base;
  doub_bt ethernet_size;
  doub_bt periph_base;
  doub_bt periph_size;
  doub_bt spatz_base;
  doub_bt spatz_size;
  doub_bt pulp_base;
  doub_bt pulp_size;
  doub_bt otmbox_base;
  doub_bt otmbox_size;
} island_cfg_t;

// Types are obtained from Cheshire package
// Parameter MaxExtAxiSlvWidth is obtained from Cheshire
// Structure used to create the AXI map to be passed to
// the Cheshire configuration parameter to create the
// AXI crossbar.
typedef struct packed {
  byte_bt [2**MaxExtAxiSlvWidth-1:0] AxiIdx;
  doub_bt [2**MaxExtAxiSlvWidth-1:0] AxiStart;
  doub_bt [2**MaxExtAxiSlvWidth-1:0] AxiEnd;
} axi_struct_t;

typedef struct packed {
  int unsigned l2_port0;
  int unsigned l2_port1;
  int unsigned safed;
  int unsigned ethernet;
  int unsigned periph;
  int unsigned spatz;
  int unsigned pulp;
  int unsigned mbox;
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
function automatic int unsigned gen_num_slave(enable_islands_t en);
  int unsigned ret = 0; // Number of slaves starts from 0
  if (en.l2) begin
    ret++; // If we enable L2, we increase by 1
    if (en.l2_dualport)
      ret++; // If the L2 is dualport, increase again
  end
  if (en.safed   ) begin ret++; end
  if (en.periph  ) begin ret++; end
  if (en.ethernet) begin ret++; end
  if (en.spatz   ) begin ret++; end
  if (en.pulp    ) begin ret++; end
  if (en.secured ) begin ret++; end
  return ret;
endfunction

// TODO: specify this is for AXI
// Generate the IDs for each AXI slave device
// function automatic carfield_slave_idx_t carfield_gen_slave_idx(enable_islands_t en);
//   carfield_slave_idx_t ret = 0; // Initialize struct first
//   int unsigned i = 0;
//   if (en.l2) begin ret.l2_port0 = i; i++;
//     if (en.l2_dualport) begin ret.l2_port1 = i; i++; end
//   end
//   if (en.safed   ) begin ret.safed    = i; i++; end
//   if (en.ethernet) begin ret.ethernet = i; i++; end
//   if (en.periph  ) begin ret.periph   = i; i++; end
//   if (en.spatz   ) begin ret.spatz    = i; i++; end
//   if (en.pulp    ) begin ret.pulp     = i; i++; end
//   if (en.secured ) begin ret.mbox     = i; i++; end
//   return ret;
// endfunction

function automatic carfield_slave_idx_t carfield_gen_slave_idx(enable_islands_t en);
  carfield_slave_idx_t ret = '{default: '1}; // Initialize struct first
  int unsigned i = 0;
  int unsigned j = 0;
  if (en.l2) begin ret.l2_port0 = i; i++;
    if (en.l2_dualport) begin ret.l2_port1 = i; i++; end
  end else begin
    ret.l2_port0 = ret.l2_port0 - j; j++;
    ret.l2_port1 = ret.l2_port1 - j; j++;
  end
  if (en.safed   ) begin ret.safed    = i; i++;
  end else begin j++; ret.safed = ret.safed - j; end
  if (en.ethernet) begin ret.ethernet = i; i++;
  end else begin j++; ret.ethernet = ret.ethernet - j; end
  if (en.periph  ) begin ret.periph   = i; i++;
  end else begin j++; ret.periph = ret.periph - j; end
  if (en.spatz   ) begin ret.spatz    = i; i++;
  end else begin j++; ret.spatz = ret.spatz - j; end
  if (en.pulp    ) begin ret.pulp     = i; i++;
  end else begin j++; ret.pulp = ret.pulp - j; end
  if (en.secured ) begin ret.mbox     = i; i++;
  end else begin j++; ret.mbox = ret.mbox - j; end

  // $info("L2 port 0 index is %d", ret.l2_port0);
  // $info("L2 port 1 index is %d", ret.l2_port1);
  // $info("Safed index is %d", ret.safed);
  // $info("Ethernet index is %d", ret.ethernet);
  // $info("Peripheral index is %d", ret.periph);
  // $info("Spatz index is %d", ret.spatz);
  // $info("PULP index is %d", ret.pulp);
  // $info("Mailbox index is %d", ret.mbox);
  return ret;
endfunction

// TODO: specify this is for AXI
// Generate the number of AXI master devices that connect to the
// crossbar starting from the islands enable structure.
function automatic int unsigned gen_num_master(enable_islands_t en);
  int unsigned ret = 0; // Number of masters starts from 0
  if (en.safed  ) begin ret++; end
  if (en.spatz  ) begin ret++; end
  if (en.pulp   ) begin ret++; end
  if (en.secured) begin ret++; end
  return ret;
endfunction

// TODO: specify this is for AXI
// Generate the IDs for each AXI master device
function automatic carfield_master_idx_t carfield_gen_master_idx(enable_islands_t en);
  carfield_master_idx_t ret = '{default: '0}; // Initialize struct first
  int unsigned i = 0;
  int unsigned j = 0;
  if (en.safed   ) begin ret.safed    = i; i++; end else begin j++; ret.safed = ret.safed - j;     end
  if (en.secured ) begin ret.secured  = i; i++; end else begin j++; ret.secured = ret.secured - j; end
  if (en.spatz   ) begin ret.spatz    = i; i++; end else begin j++; ret.spatz = ret.spatz - j;     end
  if (en.pulp    ) begin ret.pulp     = i; i++; end else begin j++; ret.pulp = ret.pulp - j;       end
  return ret;
endfunction

// Starting from the islands map and the islands enable structures,
// this function will generate structure to be passed for the
// generation or not of AXI crossbar ports for each slave.
function automatic axi_struct_t carfield_gen_axi_map(int unsigned NumSlave, enable_islands_t en_islands, island_cfg_t island_cfg);
  axi_struct_t ret = '0; // Initialize the map first
  int unsigned i = 0;
  if (en_islands.l2) begin
    ret.AxiIdx[i] = i;
    ret.AxiStart[i] = island_cfg.l2_port0_base;
    ret.AxiEnd[i] = island_cfg.l2_port0_base + island_cfg.l2_size;
    if (i < NumSlave - 1) i++;
    if (en_islands.l2_dualport) begin
      ret.AxiIdx[i] = i;
      ret.AxiStart[i] = island_cfg.l2_port1_base;
      ret.AxiEnd[i] = island_cfg.l2_port1_base + island_cfg.l2_size;
      if (i < NumSlave - 1) i++;
    end
  end
  if (en_islands.safed) begin
    ret.AxiIdx[i] = i;
    ret.AxiStart[i] = island_cfg.safed_base;
    ret.AxiEnd[i] = island_cfg.safed_base + island_cfg.safed_size;
    if (i < NumSlave - 1) i++;
  end
  if (en_islands.ethernet) begin
    ret.AxiIdx[i] = i;
    ret.AxiStart[i] = island_cfg.ethernet_base;
    ret.AxiEnd[i] = island_cfg.ethernet_base + island_cfg.ethernet_size;
    if (i < NumSlave - 1) i++;
  end
  if (en_islands.periph) begin
    ret.AxiIdx[i] = i;
    ret.AxiStart[i] = island_cfg.periph_base;
    ret.AxiEnd[i] = island_cfg.periph_base + island_cfg.periph_size;
    if (i < NumSlave - 1) i++;
  end
  if (en_islands.spatz) begin
    ret.AxiIdx[i] = i;
    ret.AxiStart[i] = island_cfg.spatz_base;
    ret.AxiEnd[i] = island_cfg.spatz_base + island_cfg.spatz_size;
    if (i < NumSlave - 1) i++;
  end
  if (en_islands.pulp) begin
    ret.AxiIdx[i] = i;
    ret.AxiStart[i] = island_cfg.pulp_base;
    ret.AxiEnd[i] = island_cfg.pulp_base + island_cfg.pulp_size;
    if (i < NumSlave - 1) i++;
  end
  if (en_islands.secured) begin
    ret.AxiIdx[i] = i;
    ret.AxiStart[i] = island_cfg.otmbox_base;
    ret.AxiEnd[i] = island_cfg.otmbox_base + island_cfg.otmbox_size;
    if (i < NumSlave - 1) i++;
  end
  return ret;
endfunction

// Generate number of existent domains
function automatic int unsigned gen_carfield_domains(enable_islands_t en);
  int unsigned ret = 0; // Number of availale domains starts from 0
  if (en.l2      ) begin ret++; end
  if (en.safed   ) begin ret++; end
  if (en.periph  ) begin ret++; end
  if (en.spatz   ) begin ret++; end
  if (en.pulp    ) begin ret++; end
  if (en.secured ) begin ret++; end
  return ret;
endfunction

localparam enable_islands_t CarfieldEnIslands = '{
  l2:          1,
  l2_dualport: 1,
  safed:       1,
  ethernet:    0,
  periph:      1,
  spatz:       0,
  pulp:        1,
  secured:     1
};

localparam island_cfg_t CarfieldIslandCfg = '{
  l2_port0_base: 'h78000000,
  l2_port1_base: 'h78200000,
  l2_size:       'h00200000,
  safed_base:    'h60000000,
  safed_size:    'h00800000,
  ethernet_base: 'h20000000,
  ethernet_size: 'h00001000,
  periph_base:   'h20001000,
  periph_size:   'h00009000,
  spatz_base:    'h51000000,
  spatz_size:    'h00800000,
  pulp_base:     'h50000000,
  pulp_size:     'h00800000,
  otmbox_base:   'h40000000,
  otmbox_size:   'h00001000
};

// TODO: specify this is for AXI
localparam int unsigned          CarfieldNumSlaves  = gen_num_slave(CarfieldEnIslands);
localparam carfield_slave_idx_t  CarfieldSlvIdx     = carfield_gen_slave_idx(CarfieldEnIslands);
localparam int unsigned          CarfieldNumMasters = gen_num_master(CarfieldEnIslands);
localparam carfield_master_idx_t CarfieldMstIdx     = carfield_gen_master_idx(CarfieldEnIslands);

localparam axi_struct_t CarfieldAxiMap = carfield_gen_axi_map(CarfieldNumSlaves, CarfieldEnIslands, CarfieldIslandCfg);

// localparam int unsigned CarfieldNumDomains = gen_num_domains(CarfieldEnIslands);

localparam int unsigned CarfieldNumDomains = gen_carfield_domains(CarfieldEnIslands);

typedef struct {
  int unsigned clock_div_value[CarfieldNumDomains];
} carfield_clk_div_values_t;

function automatic carfield_clk_div_values_t gen_carfield_clk_div_value(int unsigned num_domains);
  carfield_clk_div_values_t ret = '{default: '0};
  for (int i = 0; i < num_domains; i++) ret.clock_div_value[i] = 1;
  return ret;
endfunction

localparam carfield_clk_div_values_t CarfieldClkDivValue = gen_carfield_clk_div_value(CarfieldNumDomains);

typedef struct packed {
  byte_bt l2;
  byte_bt spatz;
  byte_bt pulp;
  byte_bt secured;
  byte_bt safed;
  byte_bt periph;
} carfield_domain_idx_t;

function automatic carfield_domain_idx_t gen_domain_idx(enable_islands_t en);
  carfield_domain_idx_t ret = '{default: '0};
  int unsigned i = 0;
  if (en.l2      ) begin ret.l2      = i; i++; end
  if (en.spatz   ) begin ret.spatz   = i; i++; end
  if (en.pulp    ) begin ret.pulp    = i; i++; end
  if (en.secured ) begin ret.secured = i; i++; end
  if (en.safed   ) begin ret.safed   = i; i++; end
  if (en.periph  ) begin ret.periph  = i; i++; end
  return ret;
endfunction

localparam carfield_domain_idx_t CarfieldDomainIdx = gen_domain_idx(CarfieldEnIslands);

endpackage
