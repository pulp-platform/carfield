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
) i_cheshire_soc       (
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
  .test_mode_i     ( testmode_i         ),
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

for (genvar i = 0 ; i<HypNumPhys; i++) begin: pad_gen
  for (genvar j = 0; j<HypNumChips; j++) begin
    pad_functional_pd padinst_hyper_csno   (.OEN( 1'b0            ), .I( hyper_cs_n_wire[i][j] ), .O(                  ), .PAD( pad_hyper_csn[i][j] ) );
  end
  pad_functional_pd padinst_hyper_ck     (.OEN( 1'b0            ), .I( hyper_ck_wire[i]      ), .O(                  ), .PAD( pad_hyper_ck[i]     ) );
  pad_functional_pd padinst_hyper_ckno   (.OEN( 1'b0            ), .I( hyper_ck_n_wire[i]    ), .O(                  ), .PAD( pad_hyper_ckn[i]    ) );
  pad_functional_pd padinst_hyper_rwds0  (.OEN(~hyper_rwds_oe[i]), .I( hyper_rwds_o[i]       ), .O( hyper_rwds_i[i]  ), .PAD( pad_hyper_rwds[i]   ) );
  pad_functional_pd padinst_hyper_resetn (.OEN( 1'b0            ), .I( hyper_reset_n_wire[i] ), .O(                  ), .PAD( pad_hyper_reset[i]  ) );
  pad_functional_pd padinst_hyper_dqio0  (.OEN(~hyper_dq_oe[i]  ), .I( hyper_dq_o[i][0]      ), .O( hyper_dq_i[i][0] ), .PAD( pad_hyper_dq[i][0]  ) );
  pad_functional_pd padinst_hyper_dqio1  (.OEN(~hyper_dq_oe[i]  ), .I( hyper_dq_o[i][1]      ), .O( hyper_dq_i[i][1] ), .PAD( pad_hyper_dq[i][1]  ) );
  pad_functional_pd padinst_hyper_dqio2  (.OEN(~hyper_dq_oe[i]  ), .I( hyper_dq_o[i][2]      ), .O( hyper_dq_i[i][2] ), .PAD( pad_hyper_dq[i][2]  ) );
  pad_functional_pd padinst_hyper_dqio3  (.OEN(~hyper_dq_oe[i]  ), .I( hyper_dq_o[i][3]      ), .O( hyper_dq_i[i][3] ), .PAD( pad_hyper_dq[i][3]  ) );
  pad_functional_pd padinst_hyper_dqio4  (.OEN(~hyper_dq_oe[i]  ), .I( hyper_dq_o[i][4]      ), .O( hyper_dq_i[i][4] ), .PAD( pad_hyper_dq[i][4]  ) );
  pad_functional_pd padinst_hyper_dqio5  (.OEN(~hyper_dq_oe[i]  ), .I( hyper_dq_o[i][5]      ), .O( hyper_dq_i[i][5] ), .PAD( pad_hyper_dq[i][5]  ) );
  pad_functional_pd padinst_hyper_dqio6  (.OEN(~hyper_dq_oe[i]  ), .I( hyper_dq_o[i][6]      ), .O( hyper_dq_i[i][6] ), .PAD( pad_hyper_dq[i][6]  ) );
  pad_functional_pd padinst_hyper_dqio7  (.OEN(~hyper_dq_oe[i]  ), .I( hyper_dq_o[i][7]      ), .O( hyper_dq_i[i][7] ), .PAD( pad_hyper_dq[i][7]  ) );
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
  '{idx: car_l2_pkg::INTERLEAVE, start_addr: L2Port1Base         , end_addr: L2Port1Base + L2MemSize         },
  '{idx: car_l2_pkg::NONE_INTER, start_addr: L2Port1NonInterlBase, end_addr: L2Port1NonInterlBase + L2MemSize},
  '{idx: car_l2_pkg::INTERLEAVE, start_addr: L2Port2Base         , end_addr: L2Port2Base + L2MemSize         },
  '{idx: car_l2_pkg::NONE_INTER, start_addr: L2Port2NonInterlBase, end_addr: L2Port2NonInterlBase + L2MemSize}
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

endmodule
