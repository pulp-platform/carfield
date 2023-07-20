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

  localparam time         ClkPeriodSys  = 5ns;
  localparam time         ClkPeriodJtag = 20ns;
  localparam time         ClkPeriodRtc  = 30518ns;
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

  logic exit_status_safed;
  logic [1:0] boot_mode_safed;

  logic jtag_tck;
  logic jtag_trst_n;
  logic jtag_tms;
  logic jtag_tdi;
  logic jtag_tdo;

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

  logic uart_tx;
  logic uart_rx;

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
  wire [NumPhys-1:0]                pad_hyper_reset;
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
    .jtag_tck_i                 ( jtag_tck                  ),
    .jtag_trst_ni               ( jtag_trst_n               ),
    .jtag_tms_i                 ( jtag_tms                  ),
    .jtag_tdi_i                 ( jtag_tdi                  ),
    .jtag_tdo_o                 ( jtag_tdo                  ),
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
    .bootmode_ot_i              ( '0                        ),
    .bootmode_safe_isln_i       ( boot_mode_safed           ),
    .uart_tx_o                  ( uart_tx                   ),
    .uart_rx_i                  ( uart_rx                   ),
    .uart_ot_tx_o               (                           ),
    .uart_ot_rx_i               ( '0                        ),
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
    .spih_ot_sck_o              (                           ),
    .spih_ot_sck_en_o           (                           ),
    .spih_ot_csb_o              (                           ),
    .spih_ot_csb_en_o           (                           ),
    .spih_ot_sd_o               (                           ),
    .spih_ot_sd_en_o            (                           ),
    .spih_ot_sd_i               ( '0                        ),
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
    .axi_ext_mst_req ( axi_muxed_req ),
    .axi_ext_mst_rsp ( axi_muxed_rsp ),
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
    .exit_status  ( exit_status_safed )
  );

  /////////////////////////
  // Security island VIP //
  /////////////////////////

  localparam time    ClkPeriodSecdJtag    = 20ns;
  localparam         AxiWideBeWidth_ib    = 4;
  localparam         AxiWideByteOffset_ib = $clog2(AxiWideBeWidth_ib);
  logic [31:0]       secd_memory   [bit [31:0]];
  int                secd_sections [bit [31:0]];

  clk_rst_gen #(
    .ClkPeriod    ( ClkPeriodSecdJtag ),
    .RstClkCycles ( RstCycles )
  ) i_clk_ot_jtag (
    .clk_o  ( jtag_secd_tck ),
    .rst_no ( )
  );

  JTAG_DV jtag_secd(jtag_secd_tck);

  typedef jtag_ot_test::riscv_dbg #(
    .IrLength ( 5 ),
    .TA       ( ClkPeriodSecdJtag * TAppl ),
    .TT       ( ClkPeriodSecdJtag * TTest )
  ) riscv_dbg_ot_t;

  riscv_dbg_ot_t::jtag_driver_t  jtag_secd_dv   = new (jtag_secd);
  riscv_dbg_ot_t                 jtag_secd_dbg  = new (jtag_secd_dv);

  assign jtag_secd_trst_n  = jtag_secd.trst_n;
  assign jtag_secd_tms     = jtag_secd.tms;
  assign jtag_secd_tdi     = jtag_secd.tdi;
  assign jtag_secd.tdo     = jtag_secd_tdo;

  initial begin
    @(negedge rst_n);
    jtag_secd_dbg.reset_master();
  end

  task debug_secd_module_init;
     logic [31:0]  idcode;
     automatic dm_ot::sbcs_t sbcs = '{
       sbautoincrement: 1'b1,
       sbreadondata   : 1'b1,
       sbaccess       : 3'h2,
       default        : 1'b0
     };
     //dm_ot::dtm_op_status_e op;
     automatic int dmi_wait_cycles = 10;
     $display("[JTAG SECD] JTAG Preloading Starting");
     jtag_secd_dbg.wait_idle(300);
     jtag_secd_dbg.get_idcode(idcode);
     // Check Idcode
     $display("[JTAG SECD] IDCode = %h", idcode);
     // Activate Debug Module
     jtag_secd_dbg.write_dmi(dm_ot::DMControl, 32'h0000_0001);
     do jtag_secd_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
     while (sbcs.sbbusy);

  endtask

  task jtag_secd_data_preload;
     logic [31:0] rdata;
     automatic dm_ot::sbcs_t sbcs = '{
       sbautoincrement: 1'b1,
       sbreadondata   : 1'b1,
       sbaccess       : 3'h2,
       default        : 1'b0
     };
     automatic int dmi_wait_cycles = 10;
     debug_secd_module_init();
     jtag_secd_dbg.write_dmi(dm_ot::SBCS, sbcs);
     do jtag_secd_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
     while (sbcs.sbbusy);
     // Start writing to SRAM
     foreach (secd_sections[addr]) begin
       $display("[JTAG SECD] Writing %h with %0d words", addr << 2, secd_sections[addr]); // word = 8 bytes here
       jtag_secd_dbg.write_dmi(dm_ot::SBAddress0, (addr << 2));
       do jtag_secd_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
       while (sbcs.sbbusy);
       for (int i = 0; i < secd_sections[addr]; i++) begin
         if (i%100 == 0)
           $display("[JTAG SECD] loading: %0d/100%%", i*100/secd_sections[addr]);
         jtag_secd_dbg.write_dmi(dm_ot::SBData0, secd_memory[addr + i]);
         // Wait until SBA is free to write next 32 bits
         do jtag_secd_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
         while (sbcs.sbbusy);
       end
       $display("[JTAG SECD] loading: 100/100%%");
     end
    $display("[JTAG SECD] Preloading finished");
    // Preloading finished. Can now start executing
    sbcs.sbreadonaddr = 0;
    sbcs.sbreadondata = 0;
    jtag_secd_dbg.write_dmi(dm_ot::SBCS, sbcs);

  endtask

  task jtag_secd_wakeup;
    input logic [31:0] start_addr;
    logic [31:0] dm_status;

    automatic dm_ot::sbcs_t sbcs = '{
      sbautoincrement: 1'b1,
      sbreadondata   : 1'b1,
      sbaccess       : 3'h2,
      default        : 1'b0
    };
    //dm_ot::dtm_op_status_e op;
    automatic int dmi_wait_cycles = 10;
    $display("[JTAG SECD] Waking up Secd");
    // Initialize the dm module again, otherwise it will not work
    debug_secd_module_init();
    do jtag_secd_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
    while (sbcs.sbbusy);
    // Write PC to Data0 and Data1
    jtag_secd_dbg.write_dmi(dm_ot::Data0, start_addr);
    do jtag_secd_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
    while (sbcs.sbbusy);
    // Halt Req
    jtag_secd_dbg.write_dmi(dm_ot::DMControl, 32'h8000_0001);
    do jtag_secd_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
    while (sbcs.sbbusy);
    // Wait for CVA6 to be halted
    do jtag_secd_dbg.read_dmi(dm_ot::DMStatus, dm_status, dmi_wait_cycles);
    while (!dm_status[8]);
    // Ensure haltreq, resumereq and ackhavereset all equal to 0
    jtag_secd_dbg.write_dmi(dm_ot::DMControl, 32'h0000_0001);
    do jtag_secd_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
    while (sbcs.sbbusy);
    // Register Access Abstract Command
    jtag_secd_dbg.write_dmi(dm_ot::Command, {8'h0,1'b0,3'h2,1'b0,1'b0,1'b1,1'b1,4'h0,dm_ot::CSR_DPC});
    do jtag_secd_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
    while (sbcs.sbbusy);
    // Resume req. Exiting from debug mode Secd CVA6 will jump at the DPC address.
    // Ensure haltreq, resumereq and ackhavereset all equal to 0
    jtag_secd_dbg.write_dmi(dm_ot::DMControl, 32'h4000_0001);
    do jtag_secd_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
    while (sbcs.sbbusy);
    jtag_secd_dbg.write_dmi(dm_ot::DMControl, 32'h0000_0001);
    do jtag_secd_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);

    while (sbcs.sbbusy);
    $display("[JTAG SECD] Wait for Completion");
  endtask

  task load_secd_binary;
    input string binary;                   // File name
    logic [31:0] section_addr, section_len;
    byte         buffer[];

    // Read ELF
    void'(read_elf(binary));
    $display("[JTAG SECD] Reading %s", binary);

    while (get_section(section_addr, section_len)) begin
      // Read Sections
      automatic int num_words = (section_len + AxiWideBeWidth_ib - 1)/AxiWideBeWidth_ib;
      $display("[JTAG SECD] Reading section %x with %0d words", section_addr, num_words);

      secd_sections[section_addr >> AxiWideByteOffset_ib] = num_words;
      buffer = new[num_words * AxiWideBeWidth_ib];
      void'(read_section(section_addr, buffer, section_len));
      for (int i = 0; i < num_words; i++) begin
        automatic logic [AxiWideBeWidth_ib-1:0][7:0] word = '0;
        for (int j = 0; j < AxiWideBeWidth_ib; j++) begin
          word[j] = buffer[i * AxiWideBeWidth_ib + j];
        end
        secd_memory[section_addr/AxiWideBeWidth_ib + i] = word;
      end
    end

  endtask

endmodule
