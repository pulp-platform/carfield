// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Yvan Tortorella <yvan.tortorella@unibo.it>

/// Configuration package
package carfield_cfg_pkg;

import cheshire_pkg::*;

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
  carfield_slave_idx_t ret = '{default: '1}; // Initialize struct first
  int unsigned i = 0;
  int unsigned j = 0;
  if (island_cfg.l2_port0.enable) begin ret.l2_port0 = i; i++;
    if (island_cfg.l2_port1.enable) begin ret.l2_port1 = i; i++; end
  end else begin
    ret.l2_port0 = ret.l2_port0 - j; j++;
    ret.l2_port1 = ret.l2_port1 - j; j++;
  end
  if (island_cfg.safed.enable) begin ret.safed = i; i++;
  end else begin j++; ret.safed = ret.safed - j; end
  if (island_cfg.ethernet.enable) begin ret.ethernet = i; i++;
  end else begin j++; ret.ethernet = ret.ethernet - j; end
  if (island_cfg.periph.enable) begin ret.periph = i; i++;
  end else begin j++; ret.periph = ret.periph - j; end
  if (island_cfg.spatz.enable) begin ret.spatz = i; i++;
  end else begin j++; ret.spatz = ret.spatz - j; end
  if (island_cfg.pulp.enable) begin ret.pulp = i; i++;
  end else begin j++; ret.pulp = ret.pulp - j; end
  if (island_cfg.mbox.enable) begin ret.mbox = i; i++;
  end else begin j++; ret.mbox = ret.mbox - j; end
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
  return ret;
endfunction

// TODO: specify this is for AXI
// Generate the IDs for each AXI master device
function automatic carfield_master_idx_t carfield_gen_master_idx(islands_cfg_t island_cfg);
  carfield_master_idx_t ret = '{default: '0}; // Initialize struct first
  int unsigned i = 0;
  int unsigned j = 0;
  if (island_cfg.safed.enable) begin ret.safed = i; i++; end
  else begin j++; ret.safed = ret.safed - j; end
  if (island_cfg.secured.enable) begin ret.secured = i; i++;
  end else begin j++; ret.secured = ret.secured - j; end
  if (island_cfg.spatz.enable) begin ret.spatz = i; i++; end
  else begin j++; ret.spatz = ret.spatz - j; end
  if (island_cfg.pulp.enable) begin ret.pulp = i; i++; end
  else begin j++; ret.pulp = ret.pulp - j; end
  return ret;
endfunction

// verilog_lint: waive-start line-length
function automatic axi_struct_t carfield_gen_axi_map(int unsigned NumSlave, islands_cfg_t island_cfg);
// verilog_lint: waive-stop line-length
  axi_struct_t ret = '0; // Initialize the map first
  int unsigned i = 0;
  if (island_cfg.l2_port0.enable) begin
    ret.AxiIdx[i] = i;
    ret.AxiStart[i] = island_cfg.l2_port0.base;
    ret.AxiEnd[i] = island_cfg.l2_port0.base + island_cfg.l2_port0.size;
    if (i < NumSlave - 1) i++;
    if (island_cfg.l2_port1.enable) begin
      ret.AxiIdx[i] = i;
      ret.AxiStart[i] = island_cfg.l2_port1.base;
      ret.AxiEnd[i] = island_cfg.l2_port1.base + island_cfg.l2_port1.size;
      if (i < NumSlave - 1) i++;
    end
  end
  if (island_cfg.safed.enable) begin
    ret.AxiIdx[i] = i;
    ret.AxiStart[i] = island_cfg.safed.base;
    ret.AxiEnd[i] = island_cfg.safed.base + island_cfg.safed.size;
    if (i < NumSlave - 1) i++;
  end
  if (island_cfg.ethernet.enable) begin
    ret.AxiIdx[i] = i;
    ret.AxiStart[i] = island_cfg.ethernet.base;
    ret.AxiEnd[i] = island_cfg.ethernet.base + island_cfg.ethernet.size;
    if (i < NumSlave - 1) i++;
  end
  if (island_cfg.periph.enable) begin
    ret.AxiIdx[i] = i;
    ret.AxiStart[i] = island_cfg.periph.base;
    ret.AxiEnd[i] = island_cfg.periph.base + island_cfg.periph.size;
    if (i < NumSlave - 1) i++;
  end
  if (island_cfg.spatz.enable) begin
    ret.AxiIdx[i] = i;
    ret.AxiStart[i] = island_cfg.spatz.base;
    ret.AxiEnd[i] = island_cfg.spatz.base + island_cfg.spatz.size;
    if (i < NumSlave - 1) i++;
  end
  if (island_cfg.pulp.enable) begin
    ret.AxiIdx[i] = i;
    ret.AxiStart[i] = island_cfg.pulp.base;
    ret.AxiEnd[i] = island_cfg.pulp.base + island_cfg.pulp.size;
    if (i < NumSlave - 1) i++;
  end
  if (island_cfg.mbox.enable) begin
    ret.AxiIdx[i] = i;
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

// All fields below are in the form: '{enable, base address, address size}.
// The Secure Domain can only be a master of the crossbar. For this reason
// we can only enable it, and provide fake address ranges.
localparam islands_cfg_t CarfieldIslandsCfg = '{
  l2_port0: '{1, 'h78000000, 'h00200000},
  l2_port1: '{1, 'h78200000, 'h00200000},
  safed:    '{1, 'h60000000, 'h00800000},
  ethernet: '{1, 'h20000000, 'h00001000},
  periph:   '{1, 'h20001000, 'h00009000},
  spatz:    '{1, 'h51000000, 'h00800000},
  pulp:     '{1, 'h50000000, 'h00800000},
  secured:  '{1, '0,         '0        },
  mbox:     '{1, 'h40000000, 'h00001000}
};

// TODO: specify this is for AXI
localparam int unsigned CarfieldNumSlaves  = gen_num_slave(CarfieldIslandsCfg);
localparam carfield_slave_idx_t CarfieldSlvIdx = carfield_gen_slave_idx(CarfieldIslandsCfg);
localparam int unsigned CarfieldNumMasters = gen_num_master(CarfieldIslandsCfg);
localparam carfield_master_idx_t CarfieldMstIdx = carfield_gen_master_idx(CarfieldIslandsCfg);

// verilog_lint: waive-start line-length
localparam axi_struct_t CarfieldAxiMap = carfield_gen_axi_map(CarfieldNumSlaves, CarfieldIslandsCfg);
// verilog_lint: waive-stop line-length

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
  if (island_cfg.l2_port0.enable ) begin ret.l2      = i; i++; end
  if (island_cfg.spatz.enable    ) begin ret.spatz   = i; i++; end
  if (island_cfg.pulp.enable     ) begin ret.pulp    = i; i++; end
  if (island_cfg.secured.enable  ) begin ret.secured = i; i++; end
  if (island_cfg.safed.enable    ) begin ret.safed   = i; i++; end
  if (island_cfg.periph.enable   ) begin ret.periph  = i; i++; end
  return ret;
endfunction

localparam carfield_domain_idx_t CarfieldDomainIdx = gen_domain_idx(CarfieldIslandsCfg);

endpackage
