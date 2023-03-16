// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Thomas Benz  <tbenz@ethz.ch>

/// Top-level implementation of Carfield
module carfield import cheshire_pkg::*;#(
    parameter cheshire_cfg_t Cfg = '0,
    // AXI and REG types that must match Cheshire configuration
    parameter type axi_ext_mst_req_t  = logic,
    parameter type axi_ext_mst_rsp_t  = logic,
    parameter type axi_llc_mst_req_t  = logic,
    parameter type axi_llc_mst_rsp_t  = logic,
    parameter type axi_ext_slv_req_t  = logic,
    parameter type axi_ext_slv_rsp_t  = logic,
    parameter type reg_req_t          = logic,
    parameter type reg_rsp_t          = logic,
    parameter int unsigned HypNumPhys  = 1,
    parameter int unsigned HypNumChips = 1
) (
    input   logic               clk_i,
    input   logic               rst_ni,

    input   logic               testmode_i,

    // Boot mode selection
    input   logic [1:0]         boot_mode_i,

    // DDR-Link
    input   logic [3:0]         ddr_link_i,
    output  logic [3:0]         ddr_link_o,

    input   logic               ddr_link_clk_i,
    output  logic               ddr_link_clk_o,

    // VGA Controller
    output  logic                           vga_hsync_o,
    output  logic                           vga_vsync_o,
    output  logic [Cfg.VgaRedWidth-1:0]     vga_red_o,
    output  logic [Cfg.VgaGreenWidth-1:0]   vga_green_o,
    output  logic [Cfg.VgaBlueWidth-1:0]    vga_blue_o,

    // JTAG Interface
    input   logic               jtag_tck_i,
    input   logic               jtag_trst_ni,
    input   logic               jtag_tms_i,
    input   logic               jtag_tdi_i,
    output  logic               jtag_tdo_o,

    // UART Interface
    output logic                uart_tx_o,
    input  logic                uart_rx_i,

    // I2C Interface
    output logic                i2c_sda_o,
    input  logic                i2c_sda_i,
    output logic                i2c_sda_en_no,
    output logic                i2c_scl_o,
    input  logic                i2c_scl_i,
    output logic                i2c_scl_en_no,

    // SPI Host Interface
    output logic                spim_sck_o,
    output logic                spim_sck_en_no,
    output logic [ 1:0]         spim_csb_o,
    output logic [ 1:0]         spim_csb_en_no,
    output logic [ 3:0]         spim_sd_o,
    output logic [ 3:0]         spim_sd_en_no,
    input  logic [ 3:0]         spim_sd_i,

    // CLINT
    input  logic                rtc_i,

    // hyperbus clocks
    input  logic                hyp_clk_phy_i,
    input  logic                hyp_rst_phy_ni,

    // hyperbus
    // Physical interace: facing HyperBus
    inout  [HypNumPhys-1:0][HypNumChips-1:0]  pad_hyper_csn,
    inout  [HypNumPhys-1:0]                   pad_hyper_ck,
    inout  [HypNumPhys-1:0]                   pad_hyper_ckn,
    inout  [HypNumPhys-1:0]                   pad_hyper_rwds,
    inout  [HypNumPhys-1:0]                   pad_hyper_reset,
    inout  [HypNumPhys-1:0][7:0]              pad_hyper_dq   
);

  // Generate indices and get maps for all ports
  localparam axi_in_t   AxiIn   = gen_axi_in(Cfg);
  localparam axi_out_t  AxiOut  = gen_axi_out(Cfg);

  // Define needed parameters
  localparam int unsigned AxiStrbWidth  = Cfg.AxiDataWidth / 8;
  localparam int unsigned AxiSlvIdWidth = Cfg.AxiMstIdWidth + $clog2(AxiOut.num_out);

  // Type for address map entries
  typedef struct packed {
    logic [$bits(aw_bt)-1:0] idx;
    logic [Cfg.AddrWidth-1:0] start_addr;
    logic [Cfg.AddrWidth-1:0] end_addr;
  } addr_rule_t;

    // local AXI LLC -> Hyper
    axi_llc_mst_req_t dram_req;
    axi_llc_mst_rsp_t dram_rsp;

    // hyper cfg
    reg_req_t external_reg_req;
    reg_rsp_t external_reg_rsp;

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
        .CheshireCfg(Cfg),
        // AXI and REG types that must match Cheshire configuration
        .axi_ext_mst_req_t ( axi_ext_mst_req_t ),
        .axi_ext_mst_rsp_t ( axi_ext_mst_rsp_t ),
        .axi_llc_mst_req_t ( axi_llc_mst_req_t ),
        .axi_llc_mst_rsp_t ( axi_llc_mst_rsp_t ),
        .axi_ext_slv_req_t ( axi_ext_slv_req_t ),
        .axi_ext_slv_rsp_t ( axi_ext_slv_rsp_t ),
        .reg_req_t         ( reg_req_t         ),
        .reg_rsp_t         ( reg_rsp_t         )
    ) i_cheshire_soc (
        .clk_i,
        .rst_ni,
        .testmode_i,
        .boot_mode_i,
        .boot_addr_i        ( carfield_pkg::carfield_boot_addr ),
        .axi_llc_mst_req_o  ( dram_req                         ),
        .axi_llc_mst_rsp_i  ( dram_resp                        ),
        .ddr_link_i,
        .ddr_link_o,
        .ddr_link_clk_i,
        .ddr_link_clk_o,
        .vga_hsync_o,
        .vga_vsync_o,
        .jtag_tck_i,
        .jtag_trst_ni,
        .jtag_tms_i,
        .jtag_tdi_i,
        .jtag_tdo_o,
        .uart_tx_o,
        .uart_rx_i,
        // I2C interface
        .i2c_sda_o,
        .i2c_sda_i,
        .i2c_sda_en_o       ( i2c_sda_en                    ),
        .i2c_scl_o,
        .i2c_scl_i,
        .i2c_scl_en_o       ( i2c_scl_en                    ),
        // SPI host interface
        .spim_sck_o,
        .spim_sck_en_o      ( spim_sck_en                   ),
        .spim_csb_o,
        .spim_csb_en_o      ( spim_csb_en                   ),
        .spim_sd_o,
        .spim_sd_en_o       ( spim_sd_en                    ),
        .spim_sd_i,
        .rtc_i,
        .clk_locked_i       ( 1'b0                          ), // tied-off
        .external_reg_req_o ( external_reg_req              ),
        .external_reg_rsp_i ( external_reg_rsp              )
    );

    // hyperbus memory
    hyperbus #(
        .NumChips         ( HypNumChips       ),
        .NumPhys          ( HypNumPhys        ),
        .IsClockODelayed  ( 1'b0              ),
        .AxiAddrWidth     ( Cfg.AddrWidth     ),
        .AxiDataWidth     ( Cfg.AxiDataWidth  ),
        .AxiIdWidth       ( AxiSlvIdWidth     ),
        .AxiUserWidth     ( Cfg.AxiUserWidth  ),
        .axi_req_t        ( axi_llc_mst_req_t ),
        .axi_rsp_t        ( axi_llc_mst_rsp_t ),
        .RegAddrWidth     ( Cfg.AddrWidth     ),
        .RegDataWidth     ( 32'd32            ),
        .reg_req_t        ( reg_req_t         ),
        .reg_rsp_t        ( reg_rsp_t         ),
        .axi_rule_t       ( addr_rule_t       ),
        .RxFifoLogDepth   ( 32'd2             ),
        .TxFifoLogDepth   ( 32'd2             ),
        .RstChipBase      ( 'h0               ),
        .RstChipSpace     ( 'h1_0000          ),
        .PhyStartupCycles ( 300 * 200         ),
        .AxiLogDepth      ( 32'd3             )
    ) i_hyperbus (
        .clk_phy_i       ( hyp_clk_phy_i      ),
        .rst_phy_ni      ( hyp_rst_phy_ni     ),
        .clk_sys_i       ( clk_i              ),
        .rst_sys_ni      ( rst_ni             ),
        .test_mode_i     ( testmode_i         ),
        .axi_req_i       ( dram_req           ),
        .axi_rsp_o       ( dram_resp          ),
        .reg_req_i       ( external_reg_req   ),
        .reg_rsp_o       ( external_reg_rsp   ),
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

endmodule
