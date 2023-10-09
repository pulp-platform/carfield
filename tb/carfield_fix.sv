// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>
// Paul Scheffler <paulsc@iis.ee.ethz.ch>
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
// Yvan Tortorella <yvan.tortorella@unibo.it>
// Luca Valente <luca.valente@unibo.it>

module carfield_soc_fixture;

  `include "cheshire/typedef.svh"
  `include "axi/assign.svh"

  import cheshire_pkg::*;
  import carfield_pkg::*;
  import safety_island_pkg::*;

  ///////////
  //  DPI  //
  ///////////

  import "DPI-C" function byte read_elf(input string filename);
  import "DPI-C" function byte get_entry(output longint entry);
  import "DPI-C" function byte get_section(output longint address, output longint len);
  import "DPI-C" context function byte read_section(input longint address, inout byte buffer[], input longint len);

  /////////
  // DUT //
  /////////

  localparam cheshire_cfg_t DutCfg = carfield_pkg::CarfieldCfgDefault;
  `CHESHIRE_TYPEDEF_ALL(, DutCfg)

  localparam time         ClkPeriodSys  = 10ns;
  localparam time         ClkPeriodJtag = 40ns;
  localparam time         ClkPeriodRtc  = 1000ns; // 1MHz RTC clock. Note: needs to equal
                                                  // `DutCfg.RTCFreq` for successful autonomous boot
                                                  // (e.g., SPI)
  localparam int unsigned RstCycles     = 5;
  localparam real         TAppl         = 0.1;
  localparam real         TTest         = 0.9;

  localparam int NumPhys  = 2;
  localparam int NumChips = 2;

  logic       clk;
  logic       rst_n;
  logic       test_mode;
  logic [1:0] boot_mode;
  logic       rtc;

  logic [1:0] boot_mode_secd;
  logic [1:0] boot_mode_safed;

  logic jtag_hostd_tck;
  logic jtag_hostd_trst_n;
  logic jtag_hostd_tms;
  logic jtag_hostd_tdi;
  logic jtag_hostd_tdo;

  logic jtag_secd_tck;
  logic jtag_secd_trst_n;
  logic jtag_secd_tms;
  logic jtag_secd_tdi;
  logic jtag_secd_tdo;

  logic jtag_safed_tck;
  logic jtag_safed_trst_n;
  logic jtag_safed_tms;
  logic jtag_safed_tdi;
  logic jtag_safed_tdo;

  logic uart_hostd_tx;
  logic uart_hostd_rx;

  logic secure_boot;

  logic uart_secd_tx;
  logic uart_secd_rx;

  logic i2c_sda_o;
  logic i2c_sda_i;
  logic i2c_sda_en;
  logic i2c_scl_o;
  logic i2c_scl_i;
  logic i2c_scl_en;

  logic                 spih_sck_o;
  logic                 spih_sck_en;
  logic [SpihNumCs-1:0] spih_csb_o;
  logic [SpihNumCs-1:0] spih_csb_en;
  logic [ 3:0]          spih_sd_o;
  logic [ 3:0]          spih_sd_i;
  logic [ 3:0]          spih_sd_en;

  logic                 spi_secd_sck_o;
  logic                 spi_secd_sck_en;
  logic                 spi_secd_csb_o;
  logic                 spi_secd_csb_en;
  logic [ 3:0]          spi_secd_sd_o;
  logic [ 3:0]          spi_secd_sd_i;
  logic [ 3:0]          spi_secd_sd_en;

  logic [SlinkNumChan-1:0]                    slink_rcv_clk_i;
  logic [SlinkNumChan-1:0]                    slink_rcv_clk_o;
  logic [SlinkNumChan-1:0][SlinkNumLanes-1:0] slink_i;
  logic [SlinkNumChan-1:0][SlinkNumLanes-1:0] slink_o;

  logic [NumPhys-1:0][NumChips-1:0] hyper_cs_no;
  logic [NumPhys-1:0]               hyper_ck_i;
  logic [NumPhys-1:0]               hyper_ck_o;
  logic [NumPhys-1:0]               hyper_ck_ni;
  logic [NumPhys-1:0]               hyper_ck_no;
  logic [NumPhys-1:0]               hyper_rwds_o;
  logic [NumPhys-1:0]               hyper_rwds_i;
  logic [NumPhys-1:0]               hyper_rwds_oe_o;
  logic [NumPhys-1:0][7:0]          hyper_dq_i;
  logic [NumPhys-1:0][7:0]          hyper_dq_o;
  logic [NumPhys-1:0]               hyper_dq_oe_o;
  logic [NumPhys-1:0]               hyper_reset_no;

  wire [NumPhys-1:0][NumChips-1:0]  pad_hyper_csn;
  wire [NumPhys-1:0]                pad_hyper_ck;
  wire [NumPhys-1:0]                pad_hyper_ckn;
  wire [NumPhys-1:0]                pad_hyper_rwds;
  wire [NumPhys-1:0]                pad_hyper_resetn;
  wire [NumPhys-1:0][7:0]           pad_hyper_dq;

  carfield      #(
    .Cfg         ( DutCfg    ),
    .HypNumPhys  ( NumPhys   ),
    .HypNumChips ( NumChips  ),
    .reg_req_t   ( reg_req_t ),
    .reg_rsp_t   ( reg_rsp_t )
  ) i_dut                       (
    .host_clk_i                 ( clk                       ),
    .periph_clk_i               ( clk                       ),
    .alt_clk_i                  ( clk                       ),
    .rt_clk_i                   ( rtc                       ),
    .pwr_on_rst_ni              ( rst_n                     ),
    .test_mode_i                ( test_mode                 ),
    .boot_mode_i                ( boot_mode                 ),
    .jtag_tck_i                 ( jtag_hostd_tck            ),
    .jtag_trst_ni               ( jtag_hostd_trst_n         ),
    .jtag_tms_i                 ( jtag_hostd_tms            ),
    .jtag_tdi_i                 ( jtag_hostd_tdi            ),
    .jtag_tdo_o                 ( jtag_hostd_tdo            ),
    .jtag_tdo_oe_o              (                           ),
    .jtag_ot_tck_i              ( jtag_secd_tck             ),
    .jtag_ot_trst_ni            ( jtag_secd_trst_n          ),
    .jtag_ot_tms_i              ( jtag_secd_tms             ),
    .jtag_ot_tdi_i              ( jtag_secd_tdi             ),
    .jtag_ot_tdo_o              ( jtag_secd_tdo             ),
    .jtag_ot_tdo_oe_o           (                           ),
    .jtag_safety_island_tck_i   ( jtag_safed_tck            ),
    .jtag_safety_island_trst_ni ( jtag_safed_trst_n         ),
    .jtag_safety_island_tms_i   ( jtag_safed_tms            ),
    .jtag_safety_island_tdi_i   ( jtag_safed_tdi            ),
    .jtag_safety_island_tdo_o   ( jtag_safed_tdo            ),
    .bootmode_ot_i              ( boot_mode_secd            ),
    .bootmode_safe_isln_i       ( boot_mode_safed           ),
    .secure_boot_i              ( secure_boot               ),
    .uart_tx_o                  ( uart_hostd_tx             ),
    .uart_rx_i                  ( uart_hostd_rx             ),
    .uart_ot_tx_o               ( uart_secd_tx              ),
    .uart_ot_rx_i               ( uart_secd_rx              ),
    .i2c_sda_o                  ( i2c_sda_o                 ),
    .i2c_sda_i                  ( i2c_sda_i                 ),
    .i2c_sda_en_o               ( i2c_sda_en                ),
    .i2c_scl_o                  ( i2c_scl_o                 ),
    .i2c_scl_i                  ( i2c_scl_i                 ),
    .i2c_scl_en_o               ( i2c_scl_en                ),
    .spih_sck_o                 ( spih_sck_o                ),
    .spih_sck_en_o              ( spih_sck_en               ),
    .spih_csb_o                 ( spih_csb_o                ),
    .spih_csb_en_o              ( spih_csb_en               ),
    .spih_sd_o                  ( spih_sd_o                 ),
    .spih_sd_en_o               ( spih_sd_en                ),
    .spih_sd_i                  ( spih_sd_i                 ),
    .spih_ot_sck_o              ( spi_secd_sck_o            ),
    .spih_ot_sck_en_o           ( spi_secd_sck_en           ),
    .spih_ot_csb_o              ( spi_secd_csb_o            ),
    .spih_ot_csb_en_o           ( spi_secd_csb_en           ),
    .spih_ot_sd_o               ( spi_secd_sd_o             ),
    .spih_ot_sd_en_o            ( spi_secd_sd_en            ),
    .spih_ot_sd_i               ( spi_secd_sd_i             ),
    .eth_rxck_i                 ( '0                        ),
    .eth_rxctl_i                ( '0                        ),
    .eth_rxd_i                  ( '0                        ),
    .eth_md_i                   ( '0                        ),
    .eth_txck_o                 ( /* Currently unconnected, tie to 0 */ ),
    .eth_txctl_o                ( /* Currently unconnected, tie to 0 */ ),
    .eth_txd_o                  ( /* Currently unconnected, tie to 0 */ ),
    .eth_md_o                   ( /* Currently unconnected, tie to 0 */ ),
    .eth_md_oe                  ( /* Currently unconnected, tie to 0 */ ),
    .eth_mdc_o                  ( /* Currently unconnected, tie to 0 */ ),
    .eth_rst_n_o                ( /* Currently unconnected, tie to 0 */ ),
    .can_rx_i                   ( '0                        ),
    .can_tx_o                   (                           ),
    .gpio_i                     ( '0                        ),
    .gpio_o                     (                           ),
    .gpio_en_o                  (                           ),
    .slink_rcv_clk_i            ( slink_rcv_clk_i           ),
    .slink_rcv_clk_o            ( slink_rcv_clk_o           ),
    .slink_i                    ( slink_i                   ),
    .slink_o                    ( slink_o                   ),
    .hyper_cs_no                ( hyper_cs_no               ),
    .hyper_ck_o                 ( hyper_ck_o                ),
    .hyper_ck_no                ( hyper_ck_no               ),
    .hyper_rwds_o               ( hyper_rwds_o              ),
    .hyper_rwds_i               ( hyper_rwds_i              ),
    .hyper_rwds_oe_o            ( hyper_rwds_oe_o           ),
    .hyper_dq_i                 ( hyper_dq_i                ),
    .hyper_dq_o                 ( hyper_dq_o                ),
    .hyper_dq_oe_o              ( hyper_dq_oe_o             ),
    .hyper_reset_no             ( hyper_reset_no            ),
    .ext_reg_async_slv_req_i    ( '0                        ),
    .ext_reg_async_slv_ack_o    (                           ),
    .ext_reg_async_slv_data_i   ( '0                        ),
    .ext_reg_async_slv_req_o    (                           ),
    .ext_reg_async_slv_ack_i    ( '0                        ),
    .ext_reg_async_slv_data_o   (                           ),
    .debug_signals_o            (                           )
  );

  //////////////////
  // Carfield VIP //
  //////////////////

  localparam int unsigned SafedNumAxiExtMstPorts   = 1;
  localparam int unsigned PulpClNumAxiExtMstPorts  = 0;
  localparam int unsigned SpatzClNumAxiExtMstPorts = 0;
  localparam int unsigned CarNumAxiExtSlvPorts     = SafedNumAxiExtMstPorts + PulpClNumAxiExtMstPorts + SpatzClNumAxiExtMstPorts;

  axi_mst_req_t [CarNumAxiExtSlvPorts-1:0] ext_to_vip_req;
  axi_mst_rsp_t [CarNumAxiExtSlvPorts-1:0] ext_to_vip_rsp;

  axi_mst_req_t axi_muxed_req;
  axi_mst_rsp_t axi_muxed_rsp;

  // Verification IPs for carfield
  vip_carfield_soc #(
    .DutCfg        ( DutCfg ),
    .ClkPeriodSys  ( ClkPeriodSys ),
    .ClkPeriodJtag ( ClkPeriodJtag ),
    .ClkPeriodRtc  ( ClkPeriodRtc),
    .RstCycles     ( RstCycles ),
    .TAppl         ( TAppl ),
    .TTest         ( TTest ),
    .NumAxiExtSlvPorts ( CarNumAxiExtSlvPorts ),
    .axi_slv_ext_req_t ( axi_mst_req_t ),
    .axi_slv_ext_rsp_t ( axi_mst_rsp_t )
  ) car_vip (
    // We use the clock/reset generated in cheshire VIP
    .clk_vip (),
    .rst_n_vip (),
    // Multiplex incoming AXI req/rsp and convert t
    // hrough serial link
    .axi_slvs_req ( ext_to_vip_req ),
    .axi_slvs_rsp ( ext_to_vip_rsp ),
    .axi_muxed_req ( axi_muxed_req ),
    .axi_muxed_rsp ( axi_muxed_rsp ),
    .*
  );

  // I/O to INOUT behavioral conversion for carfield's peripherals that require it
  vip_carfield_soc_tristate vip_tristate ( .* );

  //////////////////
  // Cheshire VIP //
  //////////////////

  // Tristate Adapter
  wire i2c_sda;
  wire i2c_scl;

  wire                 spih_sck;
  wire [SpihNumCs-1:0] spih_csb;
  wire [ 3:0]          spih_sd;

  // I/O to INOUT behavioral conversion for cheshire's peripherals that require it
  vip_cheshire_soc_tristate chs_vip_tristate (.*);

  // VIP
  vip_cheshire_soc #(
    .DutCfg            ( DutCfg ),
    .axi_ext_llc_req_t ( axi_llc_req_t ),
    .axi_ext_llc_rsp_t ( axi_llc_rsp_t ),
    .axi_ext_mst_req_t ( axi_mst_req_t ),
    .axi_ext_mst_rsp_t ( axi_mst_rsp_t ),
    .ClkPeriodSys      ( ClkPeriodSys  ),
    .ClkPeriodJtag     ( ClkPeriodJtag ),
    .ClkPeriodRtc      ( ClkPeriodRtc  ),
    .RstCycles         ( RstCycles ),
    .TAppl             ( TAppl ),
    .TTest             ( TTest )
  ) chs_vip (
    // We do not connect to axi_sim_mem, but to HyperRAM
    .axi_llc_mst_req ( '0 ),
    .axi_llc_mst_rsp (    ),
    // External AXI port
    .axi_slink_mst_req ( axi_muxed_req ),
    .axi_slink_mst_rsp ( axi_muxed_rsp ),
     // JTAG interface
    .jtag_tck    ( jtag_hostd_tck   ),
    .jtag_trst_n ( jtag_hostd_trst_n ),
    .jtag_tms    ( jtag_hostd_tms   ),
    .jtag_tdi    ( jtag_hostd_tdi   ),
    .jtag_tdo    ( jtag_hostd_tdo   ),
    // UART interface
    .uart_tx ( uart_hostd_tx ),
    .uart_rx ( uart_hostd_rx ),
    .*
  );

  ///////////////////////
  // Safety island VIP //
  ///////////////////////

  localparam time ClkPeriodSafedJtag = 20ns;

  localparam axi_in_t AxiIn = gen_axi_in(DutCfg);
  localparam int unsigned AxiSlvIdWidth = DutCfg.AxiMstIdWidth + $clog2(AxiIn.num_in);

  // VIP
  vip_safety_island_soc #(
    .DutCfg            ( SafetyIslandCfg ),
    .axi_mst_ext_req_t ( axi_mst_req_t ),
    .axi_mst_ext_rsp_t ( axi_mst_rsp_t ),
    .axi_slv_ext_req_t ( axi_mst_req_t ),
    .axi_slv_ext_rsp_t ( axi_mst_rsp_t ),
    .GlobalAddrWidth   ( 32            ),
    .BaseAddr          ( 32'h6000_0000 ),
    .AddrRange         ( SafetyIslandSize      ),
    .MemOffset         ( SafetyIslandMemOffset ),
    .PeriphOffset      ( SafetyIslandPerOffset ),
    .ClkPeriodSys      ( ClkPeriodSys          ),
    .ClkPeriodJtag     ( ClkPeriodSafedJtag    ),
    .ClkPeriodRtc      ( ClkPeriodRtc          ),
    .RstCycles         ( RstCycles             ),
    .AxiDataWidth      ( DutCfg.AxiDataWidth   ),
    .AxiAddrWidth      ( DutCfg.AddrWidth      ),
    .AxiInputIdWidth   ( AxiSlvIdWidth         ),
    .AxiOutputIdWidth  ( DutCfg.AxiMstIdWidth  ),
    .AxiUserWidth      ( DutCfg.AxiUserWidth   ),
    .AxiDebug          ( 0     ),
    .ApplFrac          ( TAppl ),
    .TestFrac          ( TTest )
  ) safed_vip (
    // we use the clock generated in cheshire VIP
    .clk_vip      (),
    .ext_clk_vip  (),
    // we use the reset generated in cheshire VIP
    .rst_n_vip    (),
    .test_mode    (),
    .boot_mode    ( boot_mode_safed ),
    // we use the rtc generated in cheshire VIP
    .rtc          (),
    // Not used in carfield
    .axi_mst_req  ( '0 ),
    .axi_mst_rsp  (    ),
    // Virtual driver to be multiplexed and then serialized through the serial link
    .axi_slv_req  ( ext_to_vip_req[SafedNumAxiExtMstPorts-1:0] ),
    .axi_slv_rsp  ( ext_to_vip_rsp[SafedNumAxiExtMstPorts-1:0] ),
    // JTAG interface
    .jtag_tck     ( jtag_safed_tck    ),
    .jtag_trst_n  ( jtag_safed_trst_n ),
    .jtag_tms     ( jtag_safed_tms    ),
    .jtag_tdi     ( jtag_safed_tdi    ),
    .jtag_tdo     ( jtag_safed_tdo    ),
    // Exit
    .exit_status  ( )
  );

  /////////////////////////
  // Security island VIP //
  /////////////////////////

  localparam time ClkPeriodSecdJtag = 20ns;

  // Tristate adapter
  wire            SPI_D0, SPI_D1, SPI_SCK, SPI_CSB;

  // I/O to INOUT behavioral conversion for security island's peripherals that require it
  vip_security_island_tristate secd_vip_tristate (
    // SPI interface
    .spi_secd_sd_i     ( spi_secd_sd_o    ),
    .spi_secd_sd_o     ( spi_secd_sd_i    ),
    .spi_secd_sd_oe_i  ( spi_secd_sd_en   ),
    .spi_secd_csb_oe_i ( spi_secd_csb_en  ),
    .spi_secd_csb_i    ( spi_secd_csb_o   ),
    .spi_secd_sck_oe_i ( spi_secd_sck_en  ),
    .spi_secd_sck_i    ( spi_secd_sck_o   ),
    .SPI_D0,
    .SPI_D1,
    .SPI_SCK,
    .SPI_CSB
  );

  // VIP
  vip_security_island_soc #(
    .ClkPeriodSys  ( ClkPeriodSys ),
    .ClkPeriodJtag ( ClkPeriodSecdJtag ),
    .RstCycles     ( RstCycles ),
    .TAppl         ( TAppl ),
    .TTest         ( TTest )
  ) secd_vip (
    .clk_vip           (                  ),
    .rst_n_vip         (                  ),
    .bootmode          ( boot_mode_secd   ),
    // UART interface
    .uart_tx           ( uart_secd_tx     ),
    .uart_rx           ( uart_secd_rx     ),
    // JTAG interface
    .jtag_tck          ( jtag_secd_tck    ),
    .jtag_trst_n       ( jtag_secd_trst_n ),
    .jtag_tms          ( jtag_secd_tms    ),
    .jtag_tdi          ( jtag_secd_tdi    ),
    .jtag_tdo          ( jtag_secd_tdo    ),
    .SPI_D0,
    .SPI_D1,
    .SPI_SCK,
    .SPI_CSB
  );

  ///////////////////
  // Generic tasks //
  ///////////////////

  task passthrough_or_wait_for_secd_hw_init();
    if (secure_boot && i_dut.gen_secure_subsystem.i_security_island.u_RoT.u_rv_core_ibex.fetch_enable != lc_ctrl_pkg::On) begin
      $display("Wait for OT to boot...");
      wait (i_dut.gen_secure_subsystem.i_security_island.u_RoT.u_rv_core_ibex.fetch_enable == lc_ctrl_pkg::On);
    end
  endtask

  task set_secure_boot(input logic sb);
    secure_boot = sb;
  endtask

endmodule
