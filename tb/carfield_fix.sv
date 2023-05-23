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

  localparam int unsigned RstCycles = 5;
  localparam real         TAppl     = 0.1;
  localparam real         TTest     = 0.9;

  localparam int NumPhys  = 2;
  localparam int NumChips = 2;

  logic       clk;
  logic       rst_n;
  logic       test_mode;
  logic [1:0] boot_mode;
  logic       rtc;

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
  logic ot_uart_tx;
  logic ot_uart_rx;

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

  wire  [NumPhys-1:0][NumChips-1:0] hyper_cs_n_wire;
  wire  [NumPhys-1:0]               hyper_ck_wire;
  wire  [NumPhys-1:0]               hyper_ck_n_wire;
  wire  [NumPhys-1:0]               hyper_rwds_wire;
  wire  [NumPhys-1:0][7:0]          hyper_dq_wire;
  wire  [NumPhys-1:0]               hyper_reset_n_wire;

  carfield      #(
    .Cfg         ( DutCfg   ),
    .HypNumPhys  ( NumPhys  ),
    .HypNumChips ( NumChips )
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
    .jtag_safety_island_trst_ni ( jtag_trst_n               ), // Temporary
    .jtag_safety_island_tms_i   ( '0                        ), // Temporary
    .jtag_safety_island_tdi_i   ( '0                        ), // Temporary
    .jtag_safety_island_tdo_o   ( jtag_safed_tdo            ),
    .uart_tx_o                  ( uart_tx                   ),
    .uart_rx_i                  ( uart_rx                   ),
    .uart_ot_tx_o               ( ot_uart_tx                ),
    .uart_ot_rx_i               ( ot_uart_rx                ),
    .uart_rts_no                (                           ),
    .uart_dtr_no                (                           ),
    .uart_cts_ni                ( 1'b0                      ),
    .uart_dsr_ni                ( 1'b0                      ),
    .uart_dcd_ni                ( 1'b0                      ),
    .uart_rin_ni                ( 1'b0                      ),
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
    .gpio_i                     ( '0                        ),
    .gpio_o                     (                           ),
    .gpio_en_o                  (                           ),
    .slink_rcv_clk_i            ( slink_rcv_clk_i           ),
    .slink_rcv_clk_o            ( slink_rcv_clk_o           ),
    .slink_i                    ( slink_i                   ),
    .slink_o                    ( slink_o                   ),
    .hyp_clk_phy_i              ( clk                       ),
    .hyp_rst_phy_ni             ( rst_n                     ),
    .pad_hyper_csn              ( hyper_cs_n_wire           ),
    .pad_hyper_ck               ( hyper_ck_wire             ),
    .pad_hyper_ckn              ( hyper_ck_n_wire           ),
    .pad_hyper_rwds             ( hyper_rwds_wire           ),
    .pad_hyper_reset            ( hyper_reset_n_wire        ),
    .pad_hyper_dq               ( hyper_dq_wire             )
  );

  //////////////
  // HyperRam //
  //////////////

  generate
    for (genvar i=0; i<NumPhys; i++) begin : hyperrams
      for (genvar j=0; j<NumChips; j++) begin : chips
        s27ks0641 #(
          /*.mem_file_name ( "s27ks0641.mem"    ),*/
          .TimingModel ( "S27KS0641DPBHI020"    )
        ) dut (
          .DQ7      ( hyper_dq_wire[i][7]      ),
          .DQ6      ( hyper_dq_wire[i][6]      ),
          .DQ5      ( hyper_dq_wire[i][5]      ),
          .DQ4      ( hyper_dq_wire[i][4]      ),
          .DQ3      ( hyper_dq_wire[i][3]      ),
          .DQ2      ( hyper_dq_wire[i][2]      ),
          .DQ1      ( hyper_dq_wire[i][1]      ),
          .DQ0      ( hyper_dq_wire[i][0]      ),
          .RWDS     ( hyper_rwds_wire[i]       ),
          .CSNeg    ( hyper_cs_n_wire[i][j]    ),
          .CK       ( hyper_ck_wire[i]         ),
          .CKNeg    ( hyper_ck_n_wire[i]       ),
          .RESETNeg ( hyper_reset_n_wire[i]    )
        );
      end
    end
  endgenerate

  generate
     for (genvar p=0; p<NumPhys; p++) begin : sdf_annotation
        for (genvar l=0; l<NumChips; l++) begin : sdf_annotation
           initial begin
              automatic string sdf_file_path = "./tb/hyp_vip/s27ks0641_verilog.sdf";
              $sdf_annotate(sdf_file_path, hyperrams[p].chips[l].dut);
              $display("Mem (%d,%d)",p,l);
           end
       end
     end
  endgenerate

  //////////////////
  // Cheshire VIP //
  //////////////////

  // Tristate Adapter
  wire i2c_sda;
  wire i2c_scl;

  wire                 spih_sck;
  wire [SpihNumCs-1:0] spih_csb;
  wire [ 3:0]          spih_sd;

  vip_cheshire_soc_tristate chs_vip_tristate (.*);

  // VIP
  vip_cheshire_soc #(
    .DutCfg            ( DutCfg ),
    .RstCycles         ( RstCycles ),
    .TAppl             ( TAppl ),
    .TTest             ( TTest ),
    .axi_ext_llc_req_t ( axi_llc_req_t ),
    .axi_ext_llc_rsp_t ( axi_llc_rsp_t )
  ) chs_vip (
    // We do not connect to axi_sim_mem, but to HyperRAM
    .axi_llc_mst_req ( '0 ),
    .axi_llc_mst_rsp (    ),
    .*
  );

  ///////////////////////
  // Safety island VIP //
  ///////////////////////

  localparam time    ClkPeriodSafedJtag = 20ns;

  // TODO
  clk_rst_gen #(
    .ClkPeriod    ( ClkPeriodSafedJtag ),
    .RstClkCycles ( RstCycles )
  ) i_clk_safety_island_jtag (
    .clk_o  ( jtag_safed_tck ),
    .rst_no ( )
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
     $info(" JTAG Preloading start time");
     jtag_secd_dbg.wait_idle(300);
     jtag_secd_dbg.get_idcode(idcode);
     // Check Idcode
     $display(" IDCode = %h", idcode);
     // Activate Debug Module
     jtag_secd_dbg.write_dmi(dm_ot::DMControl, 32'h0000_0001);
     do jtag_secd_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
     while (sbcs.sbbusy);

  endtask // debug_module_init

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
     $display("======== Preload data to Secd SRAM ========");
     // Start writing to SRAM
     foreach (secd_sections[addr]) begin
       $display("Writing %h with %0d words", addr << 2, secd_sections[addr]); // word = 8 bytes here
       jtag_secd_dbg.write_dmi(dm_ot::SBAddress0, (addr << 2));
       do jtag_secd_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
       while (sbcs.sbbusy);
       for (int i = 0; i < secd_sections[addr]; i++) begin
         $display(" -- Word %0d/%0d", i, secd_sections[addr]);
         jtag_secd_dbg.write_dmi(dm_ot::SBData0, secd_memory[addr + i]);
         // Wait until SBA is free to write next 32 bits
         do jtag_secd_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
         while (sbcs.sbbusy);
       end
     end
    $display("======== Preloading finished ========");
    // Preloading finished. Can now start executing
    sbcs.sbreadonaddr = 0;
    sbcs.sbreadondata = 0;
    jtag_secd_dbg.write_dmi(dm_ot::SBCS, sbcs);

  endtask // jtag_data_preload

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
    $info("======== Waking up Secd using JTAG ========");
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
    $info("======== Wait for Completion ========");
  endtask // execute_application

  task load_secd_binary;
    input string binary;                   // File name
    logic [31:0] section_addr, section_len;
    byte         buffer[];

    // Read ELF
    void'(read_elf(binary));
    $display("Reading %s", binary);

    while (get_section(section_addr, section_len)) begin
      // Read Sections
      automatic int num_words = (section_len + AxiWideBeWidth_ib - 1)/AxiWideBeWidth_ib;
      $display("Reading section %x with %0d words", section_addr, num_words);

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
