// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Thomas Benz     <tbenz@ethz.ch>
// Luca Valente    <luca.valente@unibo.it>
// Yvan Tortorella <yvan.tortorella@unibo.it>

`include "cheshire/typedef.svh"

/// Top-level implementation of Carfield
module carfield import carfield_pkg::*;
                import cheshire_pkg::*;
                import car_l2_pkg::*;
                import safety_island_pkg::*;
#(
  parameter cheshire_cfg_t Cfg = carfield_pkg::CarfieldCfgDefault, // from Cheshire package
  parameter int unsigned HypNumPhys  = 1,
  parameter int unsigned HypNumChips = 1
) (
  input   logic                                       clk_i,
  input   logic                                       rst_ni,
  input   logic                                       test_mode_i,
  // Boot mode selection
  input   logic [1:0]                                 boot_mode_i,
  // CLINT
  input   logic                                       rtc_i,
  // JTAG Interfacex
  input   logic                                       jtag_tck_i,
  input   logic                                       jtag_trst_ni,
  input   logic                                       jtag_tms_i,
  input   logic                                       jtag_tdi_i,
  output  logic                                       jtag_tdo_o,
  output  logic                                       jtag_tdo_oe_o,
  // UART Interface
  output logic                                        uart_tx_o,
  input  logic                                        uart_rx_i,
  // UART Modem flow control
  output logic                                        uart_rts_no,
  output logic                                        uart_dtr_no,
  input  logic                                        uart_cts_ni,
  input  logic                                        uart_dsr_ni,
  input  logic                                        uart_dcd_ni,
  input  logic                                        uart_rin_ni,
  // I2C Interface
  output logic                                        i2c_sda_o,
  input  logic                                        i2c_sda_i,
  output logic                                        i2c_sda_en_o,
  output logic                                        i2c_scl_o,
  input  logic                                        i2c_scl_i,
  output logic                                        i2c_scl_en_o,
  // SPI Host Interface
  output logic                                        spih_sck_o,
  output logic                                        spih_sck_en_o,
  output logic [SpihNumCs-1:0]                        spih_csb_o,
  output logic [SpihNumCs-1:0]                        spih_csb_en_o,
  output logic [ 3:0]                                 spih_sd_o,
  output logic [ 3:0]                                 spih_sd_en_o,
  input  logic [ 3:0]                                 spih_sd_i,
  // GPIO interface
  input  logic [31:0]                                 gpio_i,
  output logic [31:0]                                 gpio_o,
  output logic [31:0]                                 gpio_en_o,
  // Serial link interface
  input  logic [SlinkNumChan-1:0]                     slink_rcv_clk_i,
  output logic [SlinkNumChan-1:0]                     slink_rcv_clk_o,
  input  logic [SlinkNumChan-1:0][SlinkNumLanes-1:0]  slink_i,
  output logic [SlinkNumChan-1:0][SlinkNumLanes-1:0]  slink_o,
  // HyperBus clocks
  input  logic                                        hyp_clk_phy_i,
  input  logic                                        hyp_rst_phy_ni,
  // Physical interace: facing HyperBus
  inout  [HypNumPhys-1:0][HypNumChips-1:0]            pad_hyper_csn,
  inout  [HypNumPhys-1:0]                             pad_hyper_ck,
  inout  [HypNumPhys-1:0]                             pad_hyper_ckn,
  inout  [HypNumPhys-1:0]                             pad_hyper_rwds,
  inout  [HypNumPhys-1:0]                             pad_hyper_reset,
  inout  [HypNumPhys-1:0][7:0]                        pad_hyper_dq
);

`CHESHIRE_TYPEDEF_ALL(carfield_, Cfg)

// Generate indices and get maps for all ports
localparam axi_in_t   AxiIn   = gen_axi_in(Cfg);
localparam axi_out_t  AxiOut  = gen_axi_out(Cfg);

// Define needed parameters
localparam int unsigned AxiStrbWidth  = Cfg.AxiDataWidth / 8;
localparam int unsigned AxiSlvIdWidth = Cfg.AxiMstIdWidth + $clog2(AxiIn.num_in);

// Type for address map entries
typedef struct packed {
  logic [$bits(aw_bt)-1:0] idx;
  logic [Cfg.AddrWidth-1:0] start_addr;
  logic [Cfg.AddrWidth-1:0] end_addr;
} addr_rule_t;

// All AXI slave buses
carfield_axi_slv_req_t [Cfg.AxiExtNumSlv-1:0] axi_ext_slv_req;
carfield_axi_slv_rsp_t [Cfg.AxiExtNumSlv-1:0] axi_ext_slv_rsp;

// All AXI master buses
carfield_axi_mst_req_t [Cfg.AxiExtNumMst-1:0] axi_ext_mst_req;
carfield_axi_mst_rsp_t [Cfg.AxiExtNumMst-1:0] axi_ext_mst_rsp;

// local AXI LLC -> Hyper
carfield_axi_llc_req_t dram_req;
carfield_axi_llc_rsp_t dram_rsp;

// hyper cfg
carfield_reg_req_t ext_reg_req;
carfield_reg_rsp_t ext_reg_rsp;

// local output enable flipped
logic        i2c_sda_en;
logic        i2c_scl_en;
logic        spim_sck_en;
logic [ 1:0] spim_csb_en;
logic [ 3:0] spim_sd_en;

logic [HypNumPhys-1:0][HypNumChips-1:0] hyper_cs_n_wire;
logic [HypNumPhys-1:0]                  hyper_ck_wire;
logic [HypNumPhys-1:0]                  hyper_ck_n_wire;
logic [HypNumPhys-1:0]                  hyper_rwds_o;
logic [HypNumPhys-1:0]                  hyper_rwds_i;
logic [HypNumPhys-1:0]                  hyper_rwds_oe;
logic [HypNumPhys-1:0][7:0]             hyper_dq_i;
logic [HypNumPhys-1:0][7:0]             hyper_dq_o;
logic [HypNumPhys-1:0]                  hyper_dq_oe;
logic [HypNumPhys-1:0]                  hyper_reset_n_wire;

// the SoC
cheshire_soc #(
  .Cfg               ( Cfg                    ),
  .ExtHartinfo       ( '0                     ),
  .axi_ext_llc_req_t ( carfield_axi_llc_req_t ),
  .axi_ext_llc_rsp_t ( carfield_axi_llc_rsp_t ),
  .axi_ext_mst_req_t ( carfield_axi_mst_req_t ),
  .axi_ext_mst_rsp_t ( carfield_axi_mst_rsp_t ),
  .axi_ext_slv_req_t ( carfield_axi_slv_req_t ),
  .axi_ext_slv_rsp_t ( carfield_axi_slv_rsp_t ),
  .reg_ext_req_t     ( carfield_reg_req_t     ),
  .reg_ext_rsp_t     ( carfield_reg_rsp_t     )
) i_cheshire_soc     (
  .clk_i                          ,
  .rst_ni                         ,
  .test_mode_i                    ,
  .boot_mode_i                    ,
  .rtc_i                          ,
  // External AXI LLC (DRAM) port
  .axi_llc_mst_req_o ( dram_req        ),
  .axi_llc_mst_rsp_i ( dram_rsp        ),
  // External AXI crossbar ports
  .axi_ext_mst_req_i ( '0              ),
  .axi_ext_mst_rsp_o (                 ),
  .axi_ext_slv_req_o ( axi_ext_slv_req ),
  .axi_ext_slv_rsp_i ( axi_ext_slv_rsp ),
  // External reg demux slaves
  .reg_ext_slv_req_o ( ext_reg_req     ),
  .reg_ext_slv_rsp_i ( ext_reg_rsp     ),
  // Interrupts from external devices
  .intr_ext_i        ( '0        ),
  // Interrupts to external harts
  .meip_ext_o        (           ),
  .seip_ext_o        (           ),
  .mtip_ext_o        (           ),
  .msip_ext_o        (           ),
  // Debug interface to external harts
  .dbg_active_o      (           ),
  .dbg_ext_req_o     (           ),
  .dbg_ext_unavail_i ( '0        ),
  // JTAG interface
  .jtag_tck_i                     ,
  .jtag_trst_ni                   ,
  .jtag_tms_i                     ,
  .jtag_tdi_i                     ,
  .jtag_tdo_o                     ,
  .jtag_tdo_oe_o                  ,
  // UART interface
  .uart_tx_o                      ,
  .uart_rx_i                      ,
  // UART Modem flow control
  .uart_rts_no                    ,
  .uart_dtr_no                    ,
  .uart_cts_ni                    ,
  .uart_dsr_ni                    ,
  .uart_dcd_ni                    ,
  .uart_rin_ni                    ,
  // I2C interface
  .i2c_sda_o                      ,
  .i2c_sda_i                      ,
  .i2c_sda_en_o    ( i2c_sda_en  ),
  .i2c_scl_o                      ,
  .i2c_scl_i                      ,
  .i2c_scl_en_o    ( i2c_scl_en  ),
  // SPI host interface
  .spih_sck_o                     ,
  .spih_sck_en_o   ( spim_sck_en ),
  .spih_csb_o                     ,
  .spih_csb_en_o   ( spim_csb_en ),
  .spih_sd_o                      ,
  .spih_sd_en_o    ( spim_sd_en  ),
  .spih_sd_i                      ,
  // GPIO interface
  .gpio_i                         ,
  .gpio_o                         ,
  .gpio_en_o                      ,
  // Serial link interface
  .slink_rcv_clk_i                ,
  .slink_rcv_clk_o                ,
  .slink_i                        ,
  .slink_o                        ,
  // VGA interface
  .vga_hsync_o (                 ),
  .vga_vsync_o (                 ),
  .vga_red_o   (                 ),
  .vga_green_o (                 ),
  .vga_blue_o  (                 )
);

// hyperbus memory
hyperbus #(
  .NumChips         ( HypNumChips            ),
  .NumPhys          ( HypNumPhys             ),
  .IsClockODelayed  ( 1'b0                   ),
  .AxiAddrWidth     ( Cfg.AddrWidth          ),
  .AxiDataWidth     ( Cfg.AxiDataWidth       ),
  .AxiIdWidth       ( AxiSlvIdWidth+1        ),
  .AxiUserWidth     ( Cfg.AxiUserWidth       ),
  .axi_req_t        ( carfield_axi_llc_req_t ),
  .axi_rsp_t        ( carfield_axi_llc_rsp_t ),
  .RegAddrWidth     ( Cfg.AddrWidth          ),
  .RegDataWidth     ( 32'd32                 ),
  .reg_req_t        ( carfield_reg_req_t     ),
  .reg_rsp_t        ( carfield_reg_rsp_t     ),
  .axi_rule_t       ( addr_rule_t            ),
  .RxFifoLogDepth   ( 32'd2                  ),
  .TxFifoLogDepth   ( 32'd2                  ),
  .RstChipBase      ( 'h0                    ),
  .RstChipSpace     ( 'h1_0000               ),
  .PhyStartupCycles ( 300 * 200              ),
  .AxiLogDepth      ( 32'd3                  )
) i_hyperbus (
  .clk_phy_i       ( hyp_clk_phy_i      ),
  .rst_phy_ni      ( hyp_rst_phy_ni     ),
  .clk_sys_i       ( clk_i              ),
  .rst_sys_ni      ( rst_ni             ),
  .test_mode_i     ( test_mode_i        ),
  .axi_req_i       ( dram_req           ),
  .axi_rsp_o       ( dram_rsp           ),
  .reg_req_i       ( ext_reg_req        ),
  .reg_rsp_o       ( ext_reg_rsp        ),
  .hyper_cs_no     ( hyper_cs_n_wire    ),
  .hyper_ck_o      ( hyper_ck_wire      ),
  .hyper_ck_no     ( hyper_ck_n_wire    ),
  .hyper_rwds_o    ( hyper_rwds_o       ),
  .hyper_rwds_i    ( hyper_rwds_i       ),
  .hyper_rwds_oe_o ( hyper_rwds_oe      ),
  .hyper_dq_i      ( hyper_dq_i         ),
  .hyper_dq_o      ( hyper_dq_o         ),
  .hyper_dq_oe_o   ( hyper_dq_oe        ),
  .hyper_reset_no  ( hyper_reset_n_wire )
);

// flip the polarity of the output enables
assign i2c_sda_en_no    = ~i2c_sda_en;
assign i2c_scl_en_no    = ~i2c_scl_en;
assign spim_sck_en_no   = ~spim_sck_en;
assign spim_csb_en_no   = ~spim_csb_en;
assign spim_sd_en_no    = ~spim_sd_en;

for (genvar i = 0 ; i<HypNumPhys; i++) begin : gen_hyper_phy
  for (genvar j = 0; j<HypNumChips; j++) begin : gen_hyper_cs
    pad_functional_pd padinst_hyper_csno (
      .OEN ( 1'b0                  ),
      .I   ( hyper_cs_n_wire[i][j] ),
      .O   (                       ),
      .PAD ( pad_hyper_csn[i][j]   )
    );
  end
  pad_functional_pd padinst_hyper_ck (
    .OEN ( 1'b0             ),
    .I   ( hyper_ck_wire[i] ),
    .O   (                  ),
    .PAD ( pad_hyper_ck[i]  )
  );
  pad_functional_pd padinst_hyper_ckno   (
    .OEN ( 1'b0               ),
    .I   ( hyper_ck_n_wire[i] ),
    .O   (                    ),
    .PAD ( pad_hyper_ckn[i]   )
  );
  pad_functional_pd padinst_hyper_rwds0  (
    .OEN (~hyper_rwds_oe[i]  ),
    .I   ( hyper_rwds_o[i]   ),
    .O   ( hyper_rwds_i[i]   ),
    .PAD ( pad_hyper_rwds[i] )
  );
  pad_functional_pd padinst_hyper_resetn (
    .OEN ( 1'b0                  ),
    .I   ( hyper_reset_n_wire[i] ),
    .O   (                       ),
    .PAD ( pad_hyper_reset[i]    )
  );
  pad_functional_pd padinst_hyper_dqio0  (
    .OEN (~hyper_dq_oe[i]     ),
    .I   ( hyper_dq_o[i][0]   ),
    .O   ( hyper_dq_i[i][0]   ),
    .PAD ( pad_hyper_dq[i][0] )
  );
  pad_functional_pd padinst_hyper_dqio1  (
    .OEN (~hyper_dq_oe[i]     ),
    .I   ( hyper_dq_o[i][1]   ),
    .O   ( hyper_dq_i[i][1]   ),
    .PAD ( pad_hyper_dq[i][1] )
  );
  pad_functional_pd padinst_hyper_dqio2  (
    .OEN (~hyper_dq_oe[i]     ),
    .I   ( hyper_dq_o[i][2]   ),
    .O   ( hyper_dq_i[i][2]   ),
    .PAD ( pad_hyper_dq[i][2] )
  );
  pad_functional_pd padinst_hyper_dqio3  (
    .OEN (~hyper_dq_oe[i]     ),
    .I   ( hyper_dq_o[i][3]   ),
    .O   ( hyper_dq_i[i][3]   ),
    .PAD ( pad_hyper_dq[i][3] )
  );
  pad_functional_pd padinst_hyper_dqio4  (
    .OEN (~hyper_dq_oe[i]     ),
    .I   ( hyper_dq_o[i][4]   ),
    .O   ( hyper_dq_i[i][4]   ),
    .PAD ( pad_hyper_dq[i][4] )
  );
  pad_functional_pd padinst_hyper_dqio5  (
    .OEN (~hyper_dq_oe[i]     ),
    .I   ( hyper_dq_o[i][5]   ),
    .O   ( hyper_dq_i[i][5]   ),
    .PAD ( pad_hyper_dq[i][5] )
  );
  pad_functional_pd padinst_hyper_dqio6  (
    .OEN (~hyper_dq_oe[i]     ),
    .I   ( hyper_dq_o[i][6]   ),
    .O   ( hyper_dq_i[i][6]   ),
    .PAD ( pad_hyper_dq[i][6] )
  );
  pad_functional_pd padinst_hyper_dqio7  (
    .OEN (~hyper_dq_oe[i]     ),
    .I   ( hyper_dq_o[i][7]   ),
    .O   ( hyper_dq_i[i][7]   ),
    .PAD ( pad_hyper_dq[i][7] )
  );
end

// Reconfigurable L2
logic l2_ecc_err;

// L2 connection buses
carfield_axi_slv_req_t [NumL2Ports-1:0] axi_l2_slv_req;
carfield_axi_slv_rsp_t [NumL2Ports-1:0] axi_l2_slv_rsp;

assign axi_l2_slv_req[L2Port1Idx] = axi_ext_slv_req[L2Port1Idx];
assign axi_l2_slv_req[L2Port2Idx] = axi_ext_slv_req[L2Port2Idx];

assign axi_ext_slv_rsp[L2Port1Idx] = axi_l2_slv_rsp[L2Port1Idx];
assign axi_ext_slv_rsp[L2Port2Idx] = axi_l2_slv_rsp[L2Port2Idx];

// L2 mapping
typedef struct packed {
  int unsigned              idx;
  logic [Cfg.AddrWidth-1:0] start_addr;
  logic [Cfg.AddrWidth-1:0] end_addr;
} l2_map_rule_t;

l2_map_rule_t [L2NumRules-1:0] l2_mapping_rules = '{
  '{idx       : car_l2_pkg::INTERLEAVE  ,
    start_addr: L2Port1Base             ,
    end_addr  : L2Port1Base + L2MemSize},
  '{idx       : car_l2_pkg::NONE_INTER           ,
    start_addr: L2Port1NonInterlBase             ,
    end_addr  : L2Port1NonInterlBase + L2MemSize},
  '{idx       : car_l2_pkg::INTERLEAVE ,
    start_addr: L2Port2Base            ,
    end_addr  : L2Port2Base + L2MemSize},
  '{idx       : car_l2_pkg::NONE_INTER          ,
    start_addr: L2Port2NonInterlBase            ,
    end_addr  : L2Port2NonInterlBase + L2MemSize}
};

car_l2_top #(
  .NUM_PORT            ( NumL2Ports             ),
  .AXI_ADDR_WIDTH      ( Cfg.AddrWidth          ),
  .AXI_DATA_WIDTH      ( Cfg.AxiDataWidth       ),
  .AXI_ID_WIDTH        ( AxiSlvIdWidth          ),
  .AXI_USER_WIDTH      ( Cfg.AxiUserWidth       ),
  .NUM_MAP_RULES       ( L2NumRules             ),
  .L2_MEM_SIZE_IN_BYTE ( L2MemSize              ),
  .map_rule_t          ( l2_map_rule_t          ),
  .axi_req_t           ( carfield_axi_slv_req_t ),
  .axi_resp_t          ( carfield_axi_slv_rsp_t )
) i_reconfigrurable_l2 (
  .clk_i               ( clk_i            ),
  .rst_ni              ( rst_ni           ),
  .mapping_rules_i     ( l2_mapping_rules ),
  .axi_req_i           ( axi_l2_slv_req   ),
  .axi_resp_o          ( axi_l2_slv_rsp   ),
  .ecc_error_o         ( l2_ecc_err       )
);

// Safety Island
logic safety_jtag_tck ,
      safety_jtag_tdi ,
      safety_jtag_tdo ,
      safety_jtag_tms ,
      safety_jtag_trst;

assign safety_jtag_tck  = '0;
assign safety_jtag_tdi  = '0;
assign safety_jtag_tms  = '0;
assign safety_jtag_trst = '1;

safety_island_pkg::bootmode_e safety_island_bootmode;
assign safety_island_bootmode = safety_island_pkg::Preloaded;

carfield_axi_slv_req_t axi_safety_island_slv_req;
carfield_axi_slv_rsp_t axi_safety_island_slv_rsp;

carfield_axi_mst_req_t axi_safety_island_mst_req;
carfield_axi_mst_rsp_t axi_safety_island_mst_rsp;

assign axi_safety_island_slv_req = axi_ext_slv_req[SafetyIslandIdx];
assign axi_ext_slv_rsp[SafetyIslandIdx] = axi_safety_island_slv_rsp;

assign axi_safety_island_mst_rsp = '0;

safety_island #(
  .AxiAddrWidth      ( Cfg.AddrWidth              ),
  .AxiDataWidth      ( Cfg.AxiDataWidth           ),
  .AxiUserWidth      ( Cfg.AxiUserWidth           ),
  .AxiSlvIdWidth     ( AxiSlvIdWidth              ),
  .AxiMstIdWidth     ( Cfg.AxiMstIdWidth          ),
  .LogDepth          ( LogDepth                   ),
  .BaseAddr          ( SafetyIslandBase           ),
  .AddrRange         ( SafetyIslandSize           ),
  .MemOffset         ( SafetyIslandMemOffset      ),
  .PerOffset         ( SafetyIslandPerOffset      ),
  .axi_slv_aw_chan_t ( carfield_axi_slv_aw_chan_t ),
  .axi_slv_w_chan_t  ( carfield_axi_slv_w_chan_t  ),
  .axi_slv_b_chan_t  ( carfield_axi_slv_b_chan_t  ),
  .axi_slv_ar_chan_t ( carfield_axi_slv_ar_chan_t ),
  .axi_slv_r_chan_t  ( carfield_axi_slv_r_chan_t  ),
  .axi_slv_req_t     ( carfield_axi_slv_req_t     ),
  .axi_slv_rsp_t     ( carfield_axi_slv_rsp_t     ),
  .axi_mst_aw_chan_t ( carfield_axi_mst_aw_chan_t ),
  .axi_mst_w_chan_t  ( carfield_axi_mst_w_chan_t  ),
  .axi_mst_b_chan_t  ( carfield_axi_mst_b_chan_t  ),
  .axi_mst_ar_chan_t ( carfield_axi_mst_ar_chan_t ),
  .axi_mst_r_chan_t  ( carfield_axi_mst_r_chan_t  ),
  .axi_mst_req_t     ( carfield_axi_mst_req_t     ),
  .axi_mst_rsp_t     ( carfield_axi_mst_rsp_t     )
) i_safety_island    (
  .clk_i         ( clk_i                     ),
  .rst_ni        ( rst_ni                    ),
  .ref_clk_i     ( clk_i                     ),
  .test_enable_i ( '0                        ),
  .irqs_i        ( '0                        ),
  .jtag_tck_i    ( safety_jtag_tck           ),
  .jtag_tdi_i    ( safety_jtag_tdi           ),
  .jtag_tdo_o    ( safety_jtag_tdo           ),
  .jtag_tms_i    ( safety_jtag_tms           ),
  .jtag_trst_ni  ( safety_jtag_trst          ),
  .bootmode_i    ( safety_island_bootmode    ),
  .axi_slv_req_i ( axi_safety_island_slv_req ),
  .axi_slv_rsp_o ( axi_safety_island_slv_rsp ),
  .axi_mst_req_o ( axi_safety_island_mst_req ),
  .axi_mst_rsp_i ( axi_safety_island_mst_rsp )
);

// Integer Cluster
// CDC Parameters
// Integer Cluster slave parameters
localparam int unsigned IntClusterAxiSlvAwWidth =
                        (2**LogDepth)*axi_pkg::aw_width(Cfg.AddrWidth         ,
                                                        IntClusterAxiIdInWidth,
                                                        Cfg.AxiUserWidth      );
localparam int unsigned IntClusterAxiSlvWWidth  =
                        (2**LogDepth)*axi_pkg::w_width(Cfg.AxiDataWidth,
                                                       Cfg.AxiUserWidth);
localparam int unsigned IntClusterAxiSlvBWidth  =
                        (2**LogDepth)*axi_pkg::b_width(IntClusterAxiIdInWidth,
                                                       Cfg.AxiUserWidth      );
localparam int unsigned IntClusterAxiSlvArWidth =
                        (2**LogDepth)*axi_pkg::ar_width(Cfg.AddrWidth         ,
                                                        IntClusterAxiIdInWidth,
                                                        Cfg.AxiUserWidth      );
localparam int unsigned IntClusterAxiSlvRWidth  =
                        (2**LogDepth)*axi_pkg::r_width(Cfg.AxiDataWidth      ,
                                                       IntClusterAxiIdInWidth,
                                                       Cfg.AxiUserWidth      );

// Integer Cluster Master parameters
localparam int unsigned IntClusterAxiMstAwWidth =
                        (2**LogDepth)*axi_pkg::aw_width(Cfg.AddrWidth    ,
                                                        Cfg.AxiMstIdWidth,
                                                        Cfg.AxiUserWidth );
localparam int unsigned IntClusterAxiMstWWidth  =
                        (2**LogDepth)*axi_pkg::w_width(Cfg.AxiDataWidth,
                                                       Cfg.AxiUserWidth);
localparam int unsigned IntClusterAxiMstBWidth  =
                        (2**LogDepth)*axi_pkg::b_width(Cfg.AxiMstIdWidth,
                                                      Cfg.AxiUserWidth );
localparam int unsigned IntClusterAxiMstArWidth =
                        (2**LogDepth)*axi_pkg::ar_width(Cfg.AddrWidth    ,
                                                        Cfg.AxiMstIdWidth,
                                                        Cfg.AxiUserWidth );
localparam int unsigned IntClusterAxiMstRWidth  =
                        (2**LogDepth)*axi_pkg::r_width(Cfg.AxiDataWidth ,
                                                       Cfg.AxiMstIdWidth,
                                                       Cfg.AxiUserWidth );

// Integer Cluster connection buses
// Slave side
`AXI_TYPEDEF_ALL_CT(axi_intcluster_slv                ,
                    axi_intcluster_slv_req_t          ,
                    axi_intcluster_slv_rsp_t          ,
                    logic [Cfg.AddrWidth-1:0]         ,
                    logic [IntClusterAxiIdInWidth-1:0],
                    logic [Cfg.AxiDataWidth-1:0]      ,
                    logic [(Cfg.AxiDataWidth)/8-1:0]  ,
                    logic [Cfg.AxiUserWidth-1:0]      )

carfield_axi_slv_req_t axi_intcluster_slv_req;
carfield_axi_slv_rsp_t axi_intcluster_slv_rsp;
axi_intcluster_slv_req_t axi_intcluster_ser_slv_req;
axi_intcluster_slv_rsp_t axi_intcluster_ser_slv_rsp;

assign axi_intcluster_slv_req = axi_ext_slv_req[IntClusterIdx];
assign axi_ext_slv_rsp[IntClusterIdx] = axi_intcluster_slv_rsp;

logic [IntClusterAxiSlvAwWidth-1:0] axi_slv_intcluster_aw_data;
logic [                 LogDepth:0] axi_slv_intcluster_aw_wptr;
logic [                 LogDepth:0] axi_slv_intcluster_aw_rptr;
logic [ IntClusterAxiSlvWWidth-1:0] axi_slv_intcluster_w_data ;
logic [                 LogDepth:0] axi_slv_intcluster_w_wptr ;
logic [                 LogDepth:0] axi_slv_intcluster_w_rptr ;
logic [ IntClusterAxiSlvBWidth-1:0] axi_slv_intcluster_b_data ;
logic [                 LogDepth:0] axi_slv_intcluster_b_wptr ;
logic [                 LogDepth:0] axi_slv_intcluster_b_rptr ;
logic [IntClusterAxiSlvArWidth-1:0] axi_slv_intcluster_ar_data;
logic [                 LogDepth:0] axi_slv_intcluster_ar_wptr;
logic [                 LogDepth:0] axi_slv_intcluster_ar_rptr;
logic [ IntClusterAxiSlvRWidth-1:0] axi_slv_intcluster_r_data ;
logic [                 LogDepth:0] axi_slv_intcluster_r_wptr ;
logic [                 LogDepth:0] axi_slv_intcluster_r_rptr ;

axi_id_serialize #(
  .AxiSlvPortIdWidth      ( AxiSlvIdWidth             ),
  .AxiSlvPortMaxTxns      ( Cfg.AxiMaxSlvTrans        ),
  .AxiMstPortIdWidth      ( IntClusterAxiIdInWidth    ),
  .AxiMstPortMaxUniqIds   ( 2**IntClusterAxiIdInWidth ), // Max value
  .AxiMstPortMaxTxnsPerId ( Cfg.AxiMaxMstTrans        ),
  .AxiAddrWidth           ( Cfg.AddrWidth             ),
  .AxiDataWidth           ( Cfg.AxiDataWidth          ),
  .AxiUserWidth           ( Cfg.AxiUserWidth          ),
  .AtopSupport            ( 0                         ), // Change me if needed
  .slv_req_t              ( carfield_axi_slv_req_t    ),
  .slv_resp_t             ( carfield_axi_slv_rsp_t    ),
  .mst_req_t              ( axi_intcluster_slv_req_t  ),
  .mst_resp_t             ( axi_intcluster_slv_rsp_t  )
) i_integer_cluster_axi_id_serializer (
  .clk_i       ( clk_i                      ),
  .rst_ni      ( rst_ni                     ),
  .slv_req_i   ( axi_intcluster_slv_req     ),
  .slv_resp_o  ( axi_intcluster_slv_rsp     ),
  .mst_req_o   ( axi_intcluster_ser_slv_req ),
  .mst_resp_i  ( axi_intcluster_ser_slv_rsp )
);

axi_cdc_src  #(
  .LogDepth   ( LogDepth                   ),
  .aw_chan_t  ( axi_intcluster_slv_aw_chan_t ),
  .w_chan_t   ( axi_intcluster_slv_w_chan_t  ),
  .b_chan_t   ( axi_intcluster_slv_b_chan_t  ),
  .ar_chan_t  ( axi_intcluster_slv_ar_chan_t ),
  .r_chan_t   ( axi_intcluster_slv_r_chan_t  ),
  .axi_req_t  ( axi_intcluster_slv_req_t     ),
  .axi_resp_t ( axi_intcluster_slv_rsp_t     )
) i_intcluster_slv_cdc         (
  // synchronous slave port
  .src_clk_i                   ( clk_i                      ),
  .src_rst_ni                  ( rst_ni                     ),
  .src_req_i                   ( axi_intcluster_ser_slv_req ),
  .src_resp_o                  ( axi_intcluster_ser_slv_rsp ),
  // asynchronous master port
  .async_data_master_aw_data_o ( axi_slv_intcluster_aw_data ),
  .async_data_master_aw_wptr_o ( axi_slv_intcluster_aw_wptr ),
  .async_data_master_aw_rptr_i ( axi_slv_intcluster_aw_rptr ),
  .async_data_master_w_data_o  ( axi_slv_intcluster_w_data  ),
  .async_data_master_w_wptr_o  ( axi_slv_intcluster_w_wptr  ),
  .async_data_master_w_rptr_i  ( axi_slv_intcluster_w_rptr  ),
  .async_data_master_b_data_i  ( axi_slv_intcluster_b_data  ),
  .async_data_master_b_wptr_i  ( axi_slv_intcluster_b_wptr  ),
  .async_data_master_b_rptr_o  ( axi_slv_intcluster_b_rptr  ),
  .async_data_master_ar_data_o ( axi_slv_intcluster_ar_data ),
  .async_data_master_ar_wptr_o ( axi_slv_intcluster_ar_wptr ),
  .async_data_master_ar_rptr_i ( axi_slv_intcluster_ar_rptr ),
  .async_data_master_r_data_i  ( axi_slv_intcluster_r_data  ),
  .async_data_master_r_wptr_i  ( axi_slv_intcluster_r_wptr  ),
  .async_data_master_r_rptr_o  ( axi_slv_intcluster_r_rptr  )
);

// Master side
carfield_axi_mst_req_t axi_intcluster_mst_req;
carfield_axi_mst_rsp_t axi_intcluster_mst_rsp;

// assign axi_ext_mst_req[IntClusterIdx] = axi_intcluster_mst_req;
// assign axi_intcluster_slv_rsp = axi_ext_mst_rsp[IntClusterIdx];

logic [IntClusterAxiMstAwWidth-1:0] axi_mst_intcluster_aw_data;
logic [                 LogDepth:0] axi_mst_intcluster_aw_wptr;
logic [                 LogDepth:0] axi_mst_intcluster_aw_rptr;
logic [ IntClusterAxiMstWWidth-1:0] axi_mst_intcluster_w_data ;
logic [                 LogDepth:0] axi_mst_intcluster_w_wptr ;
logic [                 LogDepth:0] axi_mst_intcluster_w_rptr ;
logic [ IntClusterAxiMstBWidth-1:0] axi_mst_intcluster_b_data ;
logic [                 LogDepth:0] axi_mst_intcluster_b_wptr ;
logic [                 LogDepth:0] axi_mst_intcluster_b_rptr ;
logic [IntClusterAxiMstArWidth-1:0] axi_mst_intcluster_ar_data;
logic [                 LogDepth:0] axi_mst_intcluster_ar_wptr;
logic [                 LogDepth:0] axi_mst_intcluster_ar_rptr;
logic [ IntClusterAxiMstRWidth-1:0] axi_mst_intcluster_r_data ;
logic [                 LogDepth:0] axi_mst_intcluster_r_wptr ;
logic [                 LogDepth:0] axi_mst_intcluster_r_rptr ;

axi_cdc_dst #(
  .LogDepth   ( LogDepth                   ),
  .aw_chan_t  ( carfield_axi_mst_aw_chan_t ),
  .w_chan_t   ( carfield_axi_mst_w_chan_t  ),
  .b_chan_t   ( carfield_axi_mst_b_chan_t  ),
  .ar_chan_t  ( carfield_axi_mst_ar_chan_t ),
  .r_chan_t   ( carfield_axi_mst_r_chan_t  ),
  .axi_req_t  ( carfield_axi_mst_req_t     ),
  .axi_resp_t ( carfield_axi_mst_rsp_t     )
) i_intcluster_mst_cdc        (
  // asynchronous slave port
  .async_data_slave_aw_data_i ( axi_mst_intcluster_aw_data ),
  .async_data_slave_aw_wptr_i ( axi_mst_intcluster_aw_wptr ),
  .async_data_slave_aw_rptr_o ( axi_mst_intcluster_aw_rptr ),
  .async_data_slave_w_data_i  ( axi_mst_intcluster_w_data  ),
  .async_data_slave_w_wptr_i  ( axi_mst_intcluster_w_wptr  ),
  .async_data_slave_w_rptr_o  ( axi_mst_intcluster_w_rptr  ),
  .async_data_slave_b_data_o  ( axi_mst_intcluster_b_data  ),
  .async_data_slave_b_wptr_o  ( axi_mst_intcluster_b_wptr  ),
  .async_data_slave_b_rptr_i  ( axi_mst_intcluster_b_rptr  ),
  .async_data_slave_ar_data_i ( axi_mst_intcluster_ar_data ),
  .async_data_slave_ar_wptr_i ( axi_mst_intcluster_ar_wptr ),
  .async_data_slave_ar_rptr_o ( axi_mst_intcluster_ar_rptr ),
  .async_data_slave_r_data_o  ( axi_mst_intcluster_r_data  ),
  .async_data_slave_r_wptr_o  ( axi_mst_intcluster_r_wptr  ),
  .async_data_slave_r_rptr_i  ( axi_mst_intcluster_r_rptr  ),
  // synchronous master port
  .dst_clk_i  ( clk_i                  ),
  .dst_rst_ni ( rst_ni                 ),
  .dst_req_o  ( axi_intcluster_mst_req ),
  .dst_resp_i ( axi_intcluster_mst_rsp )
);

pulp_cluster #(
  .NB_CORES                       ( IntClusterNumCores        ),
  .NB_HWPE_PORTS                  ( IntClusterNumHwpePorts    ),
  .NB_DMAS                        ( IntClusterNumDmas         ),
  .NB_MPERIPHS                    ( IntClusterNumMstPer       ),
  .NB_SPERIPHS                    ( IntClusterNumSlvPer       ),
  .CLUSTER_ALIAS                  ( IntClusterAlias           ),
  .CLUSTER_ALIAS_BASE             ( IntClusterAliasBase       ),
  .TCDM_SIZE                      ( IntClusterTcdmSize        ),
  .NB_TCDM_BANKS                  ( IntClusterTcdmBanks       ),
  .HWPE_PRESENT                   ( IntClusterHwpePresent     ),
  .USE_HETEROGENEOUS_INTERCONNECT ( IntClusterUseHci          ),
  .SET_ASSOCIATIVE                ( IntClusterSetAssociative  ),
  .NB_CACHE_BANKS                 ( IntClusterNumCacheBanks   ),
  .CACHE_LINE                     ( IntClusterNumCacheLines   ),
  .CACHE_SIZE                     ( IntClusterCacheSize       ),
  .L0_BUFFER_FEATURE              ( "DISABLED"                ),
  .MULTICAST_FEATURE              ( "DISABLED"                ),
  .SHARED_ICACHE                  ( "ENABLED"                 ),
  .DIRECT_MAPPED_FEATURE          ( "DISABLED"                ),
  .L2_SIZE                        ( L2MemSize                 ),
  .USE_REDUCED_TAG                ( "TRUE"                    ),
  .DEBUG_START_ADDR               ( IntClusterDbgStart        ),
  .ROM_BOOT_ADDR                  ( IntClusterRomBoot         ),
  .BOOT_ADDR                      ( IntClusterBootAddr        ),
  .INSTR_RDATA_WIDTH              ( IntClusterInstrRdataWidth ),
  .CLUST_FPU                      ( IntClusterFpu             ),
  .CLUST_FP_DIVSQRT               ( IntClusterFpuDivSqrt      ),
  .CLUST_SHARED_FP                ( IntClusterFpu             ),
  .CLUST_SHARED_FP_DIVSQRT        ( IntClusterFpuDivSqrt      ),
  .NumAxiMst                      ( IntClusterNumAxiMst       ),
  .NumAxiSlv                      ( IntClusterNumAxiSlv       ),
  .AXI_ADDR_WIDTH                 ( Cfg.AddrWidth             ),
  .AXI_DATA_C2S_WIDTH             ( Cfg.AxiDataWidth          ),
  .AXI_DATA_S2C_WIDTH             ( Cfg.AxiDataWidth          ),
  .AXI_USER_WIDTH                 ( Cfg.AxiUserWidth          ),
  .AXI_ID_IN_WIDTH                ( IntClusterAxiIdInWidth    ),
  .AXI_ID_OUT_WIDTH               ( Cfg.AxiMstIdWidth         ),
  .LOG_DEPTH                      ( LogDepth                  ),
  .BaseAddr                       ( IntClusterBase            )
) i_integer_cluster            (
  .clk_i                       ( clk_i                         ),
  .rst_ni                      ( rst_ni                        ),
  .ref_clk_i                   ( clk_i                         ),
  .pmu_mem_pwdn_i              ( '0                            ),
  .base_addr_i                 ( '0                            ),
  .test_mode_i                 ( test_mode_i                   ),
  .cluster_id_i                ( IntClusterIndex               ),
  .en_sa_boot_i                ( '0                            ), // To Soc Control
  .fetch_en_i                  ( '0                            ), // To Soc Control
  .eoc_o                       (                               ), // To Soc Control
  .busy_o                      (                               ), // To Soc Control
  .dma_pe_evt_ack_i            ( '0                            ), // To edge propagator
  .dma_pe_evt_valid_o          (                               ), // To edge propagator
  .dma_pe_irq_ack_i            ( '1                            ), // To edge propagator (?)
  .dma_pe_irq_valid_o          (                               ), // To edge propagator (?)
  .dbg_irq_valid_i             ( '0                            ), // To edge propagator (?)
  .pf_evt_ack_i                ( '1                            ), // To edge propagator (?)
  .pf_evt_valid_o              (                               ), // To edge propagator (?)
  .async_cluster_events_wptr_i ( '0                            ), // To edge propagator (?)
  .async_cluster_events_rptr_o (                               ), // To edge propagator (?)
  .async_cluster_events_data_i ( '0                            ), // To edge propagator (?)
  // AXI4 Slave port
  .async_data_slave_aw_data_i  ( axi_slv_intcluster_aw_data ),
  .async_data_slave_aw_wptr_i  ( axi_slv_intcluster_aw_wptr ),
  .async_data_slave_aw_rptr_o  ( axi_slv_intcluster_aw_rptr ),
  .async_data_slave_ar_data_i  ( axi_slv_intcluster_ar_data ),
  .async_data_slave_ar_wptr_i  ( axi_slv_intcluster_ar_wptr ),
  .async_data_slave_ar_rptr_o  ( axi_slv_intcluster_ar_rptr ),
  .async_data_slave_w_data_i   ( axi_slv_intcluster_w_data  ),
  .async_data_slave_w_wptr_i   ( axi_slv_intcluster_w_wptr  ),
  .async_data_slave_w_rptr_o   ( axi_slv_intcluster_w_rptr  ),
  .async_data_slave_r_data_o   ( axi_slv_intcluster_r_data  ),
  .async_data_slave_r_wptr_o   ( axi_slv_intcluster_r_wptr  ),
  .async_data_slave_r_rptr_i   ( axi_slv_intcluster_r_rptr  ),
  .async_data_slave_b_data_o   ( axi_slv_intcluster_b_data  ),
  .async_data_slave_b_wptr_o   ( axi_slv_intcluster_b_wptr  ),
  .async_data_slave_b_rptr_i   ( axi_slv_intcluster_b_rptr  ),
  // AXI4 Master Port
  .async_data_master_aw_data_o ( axi_mst_intcluster_aw_data ),
  .async_data_master_aw_wptr_o ( axi_mst_intcluster_aw_wptr ),
  .async_data_master_aw_rptr_i ( axi_mst_intcluster_aw_rptr ),
  .async_data_master_ar_data_o ( axi_mst_intcluster_ar_data ),
  .async_data_master_ar_wptr_o ( axi_mst_intcluster_ar_wptr ),
  .async_data_master_ar_rptr_i ( axi_mst_intcluster_ar_rptr ),
  .async_data_master_w_data_o  ( axi_mst_intcluster_w_data  ),
  .async_data_master_w_wptr_o  ( axi_mst_intcluster_w_wptr  ),
  .async_data_master_w_rptr_i  ( axi_mst_intcluster_w_rptr  ),
  .async_data_master_r_data_i  ( axi_mst_intcluster_r_data  ),
  .async_data_master_r_wptr_i  ( axi_mst_intcluster_r_wptr  ),
  .async_data_master_r_rptr_o  ( axi_mst_intcluster_r_rptr  ),
  .async_data_master_b_data_i  ( axi_mst_intcluster_b_data  ),
  .async_data_master_b_wptr_i  ( axi_mst_intcluster_b_wptr  ),
  .async_data_master_b_rptr_o  ( axi_mst_intcluster_b_rptr  )
);

endmodule
