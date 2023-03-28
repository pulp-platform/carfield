// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>

module carfield_soc_fixture;

  `include "cheshire/typedef.svh"
  `include "axi/assign.svh"

  import cheshire_pkg::*;
  import carfield_pkg::*;

  /////////
  // DPI //
  /////////

  import "DPI-C" function byte read_elf(input string filename);
  import "DPI-C" function byte get_entry(output longint entry);
  import "DPI-C" function byte get_section(output longint address, output longint len);
  import "DPI-C" context function byte read_section(input longint address, inout byte buffer[], input longint len);

  /////////////////
  // Parameters  //
  /////////////////

  // localparam cheshire_cfg_t DutCfg = carfield_pkg::CarfieldCfgDefault;
  localparam cheshire_cfg_t DutCfg = cheshire_pkg::DefaultCfg;
  `CHESHIRE_TYPEDEF_ALL(, DutCfg)

  localparam time ClkPeriodSys    = 5ns;
  localparam time ClkPeriodHyp    = 6ns;
  localparam time ClkPeriodJTAG   = 20ns;
  localparam time ClkPeriodRTC    = 100ns;

  localparam int unsigned RstCycles = 5;

  localparam real TA      = 0.1;
  localparam real TT      = 0.9;

  localparam int unsigned UartBaudRate  = 115200;
  localparam int unsigned UartParityEna  = 0;

  // exit
  localparam int ExitSuccess = 0;
  localparam int ExitFail    = 1;
  int exit_status            = ExitFail;  // per default we fail
  logic [63:0] memory[bit [63:0]] = '{default: '0};
  int sections [bit [63:0]];

  ////////////////////
  // Global Signals //
  ////////////////////

  logic clk_sys;
  logic rst_n;
  logic clk_jtag;
  logic clk_rtc;
  logic clk_hyp;

  logic testmode;
  logic [1:0] bootmode;

  logic rtc;

  logic jtag_tck;
  logic jtag_trst_n;
  logic jtag_tms;
  logic jtag_tdi;
  logic jtag_tdo;
  logic jtag_tdo_oe;

  /////////////////////////
  // Clocking and Resets //
  /////////////////////////

  clk_rst_gen #(
    .ClkPeriod    ( ClkPeriodSys  ),
    .RstClkCycles ( RstCycles     )
  ) i_clk_rst_sys (
    .clk_o        ( clk_sys       ),
    .rst_no       (               )
  );

  clk_rst_gen #(
    .ClkPeriod    ( ClkPeriodJTAG ),
    .RstClkCycles ( RstCycles     )
  ) i_clk_rst_jtag (
    .clk_o        ( clk_jtag      ),
    .rst_no       (               )
  );

  clk_rst_gen #(
    .ClkPeriod    ( ClkPeriodRTC  ),
    .RstClkCycles ( RstCycles     )
  ) i_clk_rst_rtc (
    .clk_o        ( clk_rtc       ),
    .rst_no       (               )
  );

  clk_rst_gen #(
    .ClkPeriod    ( ClkPeriodHyp  ),
    .RstClkCycles ( RstCycles     )
  ) i_clk_rst_hyp (
    .clk_o        ( clk_hyp       ),
    .rst_no       (               )
  );
   
  initial begin
    rst_n = 1'b0;

    #(5*ClkPeriodSys);

    rst_n = 1'b1;
  end

  task wait_for_reset;
    @(posedge rst_n);
    @(posedge clk_sys);
  endtask

  task set_bootmode (
    input logic [1:0] mode
  );
    bootmode = mode;
  endtask

  task set_testmode (
    input logic mode
  );
    testmode = mode;
  endtask
  
  ////////////
  //  JTAG  //
  ////////////

  localparam dm::sbcs_t JtagInitSbcs = dm::sbcs_t'{
      sbautoincrement: 1'b1, sbreadondata: 1'b1, sbaccess: 3, default: '0};
 
  // Define test bus and driver
  JTAG_DV jtag(jtag_tck);

  typedef jtag_test::riscv_dbg #(
    .IrLength ( 5                   ),
    .TA       ( ClkPeriodJTAG * TA  ),
    .TT       ( ClkPeriodJTAG * TT  )
  ) riscv_dbg_t;

  riscv_dbg_t::jtag_driver_t  jtag_dv   = new (jtag);
  riscv_dbg_t                 jtag_dbg  = new (jtag_dv);

  // Connect DUT to test bus
  assign jtag_trst_n  = jtag.trst_n;
  assign jtag_tms     = jtag.tms;
  assign jtag_tdi     = jtag.tdi;
  assign jtag.tdo = jtag_tdo;

  task automatic jtag_write(
    input dm::dm_csr_e addr,
    input word_bt data,
    input bit wait_cmd = 0,
    input bit wait_sba = 0
  );
    jtag_dbg.write_dmi(addr, data);
    if (wait_cmd) begin
      dm::abstractcs_t acs;
      do begin
        jtag_dbg.read_dmi_exp_backoff(dm::AbstractCS, acs);
        if (acs.cmderr) $fatal(1, "[JTAG] Abstract command error!");
      end while (acs.busy);
    end
    if (wait_sba) begin
      dm::sbcs_t sbcs;
      do begin
        jtag_dbg.read_dmi_exp_backoff(dm::SBCS, sbcs);
        if (sbcs.sberror | sbcs.sbbusyerror) $fatal(1, "[JTAG] System bus error!");
      end while (sbcs.sbbusy);
    end
  endtask

  task automatic jtag_poll_bit0(input doub_bt addr, output word_bt data);
    // Update SBCS
    automatic dm::sbcs_t sbcs = JtagInitSbcs;
    sbcs.sbautoincrement = 0;
    sbcs.sbaccess = 2;
    jtag_write(dm::SBCS, sbcs);
    // Poll scratch register 0
    jtag_write(dm::SBAddress1, addr[63:32]);
    jtag_write(dm::SBAddress0, addr[31:0]);
    do begin
      jtag_dbg.wait_idle(10);
      jtag_dbg.read_dmi_exp_backoff(dm::SBData0, data);
    end while (~data[0]);
  endtask

  // Initialize the debug module
  task automatic jtag_init;
    jtag_idcode_t idcode;
    dm::dmcontrol_t dmcontrol = '{dmactive: 1, default: '0};
    // Reset debug module
    jtag_dbg.reset_master();
    // Check ID code
    jtag_dbg.get_idcode(idcode);
    if (idcode != DutCfg.DbgIdCode)
        $fatal(1, "[JTAG] Unexpected ID code: expected 0x%h, got 0x%h!", idcode, DutCfg.DbgIdCode);
    // Activate, wait for debug module
    jtag_write(dm::DMControl, dmcontrol);
    do jtag_dbg.read_dmi_exp_backoff(dm::DMControl, dmcontrol);
    while (~dmcontrol.dmactive);
    // Activate, wait for system bus
    jtag_write(dm::SBCS, JtagInitSbcs, 0, 1);
    $display("[JTAG] Initializion success");
  endtask
  
  // Load a binary; this expects precautions to have been taken (e.g. halted hart)
  task automatic jtag_elf_preload(input string binary, output doub_bt entry);
    longint sec_addr, sec_len;
    automatic dm::sbcs_t sbcs = JtagInitSbcs;
    $display("[JTAG] Preloading ELF binary: %s", binary);
    if (read_elf(binary))
      $fatal(1, "[JTAG] Failed to load ELF!");
    while (get_section(sec_addr, sec_len)) begin
      byte bf[] = new [sec_len];
      $display("[JTAG] Preloading section at 0x%h (%0d bytes)", sec_addr, sec_len);
      if (read_section(sec_addr, bf, sec_len)) $fatal(1, "[JTAG] Failed to read ELF section!");
      jtag_write(dm::SBCS, sbcs, 1, 1);
      // Write bootloader as 64-bit doubless
      jtag_write(dm::SBAddress1, sec_addr[63:32]);
      jtag_write(dm::SBAddress0, sec_addr[31:0]);
      for (longint i = 0; i <= sec_len ; i += 8) begin
        bit checkpoint = (i != 0 && i % 512 == 0);
        if (checkpoint)
          $display("   %6d/%6d Bytes (%0d%%)", i, sec_len, i*100/(sec_len>1 ? sec_len-1 : 1));
        jtag_write(dm::SBData1, {bf[i+7], bf[i+6], bf[i+5], bf[i+4]});
        jtag_write(dm::SBData0, {bf[i+3], bf[i+2], bf[i+1], bf[i]}, checkpoint, checkpoint);
      end
    end
    void'(get_entry(entry));
    $display("[JTAG] Preload complete");
  endtask

  // To be removed: start
  // ///////////////
  // // I2C Model //
  // ///////////////
  // 
  // // I2C wires
  // wire i2c_scl, i2c_sda;
  // 
  // // I2C logic SoC lines
  // logic i2c_sda_in, i2c_sda_out, i2c_sda_oe;
  // logic i2c_scl_in, i2c_scl_out, i2c_scl_oe;
  // 
  // // Static pull-ups
  // assign (weak0, weak1) i2c_scl = 1'b1;
  // assign (weak0, weak1) i2c_sda = 1'b1;
  // 
  // // Bidirectional driver emulation
  // assign i2c_sda_in = (~i2c_sda_oe) ? 1'b1 : i2c_sda;
  // assign i2c_scl_in = (~i2c_scl_oe) ? 1'b1 : i2c_scl;
  // 
  // assign i2c_sda = (~i2c_sda_oe) ? i2c_sda_out : 1'bz;
  // assign i2c_scl = (~i2c_scl_oe) ? i2c_scl_out : 1'bz;
  // 
  // M24FC1025 i_i2c_model (
  //   .A0     ( 1'b0    ),
  //   .A1     ( 1'b0    ),
  //   .A2     ( 1'b1    ),
  //   .WP     ( 1'b0    ),
  //   .SDA    ( i2c_sda ),
  //   .SCL    ( i2c_scl ),
  //   .RESET  ( rst_n   )
  // );
  // 
  // // Preload with bootloader
  // initial begin
  //   for (int i = 0; i < $size(i_i2c_model.MemoryBlock); ++i)
  //     i_i2c_model.MemoryBlock[i] = 'h9a;
  //   /*
  //   $readmemh(
  //     "test/bootloader/bootself.memh",
  //     i_M24FC1025.MemoryBlock
  //   );
  //   */
  // /* end
  // 
  // //////////////////
  // // AXI Monitors //
  // //////////////////
  // AXI_BUS_DV #(
  //   .AXI_ADDR_WIDTH ( AxiAddrWidth  ),
  //   .AXI_DATA_WIDTH ( AxiDataWidth  ),
  //   .AXI_ID_WIDTH   ( AxiXbarSlaveIdWidth ),
  //   .AXI_USER_WIDTH ( AxiUserWidth  )
  // ) axi_llc_s_intf_dv (
  //   .clk_i ( clk_sys )
  // );
  // 
  // typedef axi_test::axi_scoreboard #(
  //   .IW( AxiXbarSlaveIdWidth ),
  //   .AW( AxiAddrWidth        ),
  //   .DW( AxiDataWidth        ),
  //   .UW( AxiUserWidth        ),
  //   .TT( TT                  )
  // ) axi_scoreboard_slv_t;
  //  
  // `AXI_ASSIGN_FROM_REQ(axi_llc_s_intf_dv, i_dut_carfield_soc.i_cheshire_soc.i_axi_llc_reg_wrap.slv_req_i)
  // `AXI_ASSIGN_FROM_RESP(axi_llc_s_intf_dv,i_dut_carfield_soc.i_cheshire_soc.i_axi_llc_reg_wrap.slv_resp_o)      
  // 
  // AXI_BUS_DV #(
  //   .AXI_ADDR_WIDTH ( AxiAddrWidth          ),
  //   .AXI_DATA_WIDTH ( AxiDataWidth          ),
  //   .AXI_ID_WIDTH   ( AxiXbarSlaveIdWidth+1 ),
  //   .AXI_USER_WIDTH ( AxiUserWidth          )
  // ) axi_llc_m_intf_dv (
  //   .clk_i ( clk_sys )
  // );
  // 
  // typedef axi_test::axi_scoreboard #(
  //   .IW( AxiXbarSlaveIdWidth+1 ),
  //   .AW( AxiAddrWidth          ),
  //   .DW( AxiDataWidth          ),
  //   .UW( AxiUserWidth          ),
  //   .TT( TT                    )
  // ) axi_scoreboard_dram_t;
  //  
  // `AXI_ASSIGN_FROM_REQ(axi_llc_m_intf_dv,i_dut_carfield_soc.i_cheshire_soc.i_axi_llc_reg_wrap.mst_req_o)
  // `AXI_ASSIGN_FROM_RESP(axi_llc_m_intf_dv,i_dut_carfield_soc.i_cheshire_soc.i_axi_llc_reg_wrap.mst_resp_i)
  // 
  // initial begin : proc_sim_ctrl
  // 
  //   automatic axi_scoreboard_slv_t    mst_scoreboard   = new( axi_llc_s_intf_dv );
  //   automatic axi_scoreboard_dram_t   dram_scoreboard  = new( axi_llc_m_intf_dv );
  // 
  //   mst_scoreboard.reset();
  //   dram_scoreboard.reset();
  //   mst_scoreboard.enable_all_checks();
  //   dram_scoreboard.enable_all_checks();
  //   @(posedge rst_n);
  //   mst_scoreboard.monitor();
  //   dram_scoreboard.monitor();
  // 
  // end
  // To be removed: end

  /////////////////
  // Serial Link //
  /////////////////

  AXI_BUS_DV #(
    .AXI_ADDR_WIDTH ( AxiAddrWidth  ),
    .AXI_DATA_WIDTH ( AxiDataWidth  ),
    .AXI_ID_WIDTH   ( AxiXbarMasterIdWidth ),
    .AXI_USER_WIDTH ( AxiUserWidth  )
  ) axi_bus_sl2tb (
    .clk_i  ( clk_sys )
  );

  AXI_BUS_DV #(
    .AXI_ADDR_WIDTH ( AxiAddrWidth  ),
    .AXI_DATA_WIDTH ( AxiDataWidth  ),
    .AXI_ID_WIDTH   ( AxiXbarMasterIdWidth ),
    .AXI_USER_WIDTH ( AxiUserWidth  )
  ) axi_bus_tb2sl (
    .clk_i  ( clk_sys )
  );

  axi_mst_req_t sl_out_req, sl_in_req;
  axi_mst_rsp_t sl_out_resp, sl_in_resp;

  // From the Serial Link to the Testbench
  `AXI_ASSIGN_FROM_REQ(axi_bus_sl2tb, sl_out_req)
  `AXI_ASSIGN_TO_RESP(sl_out_resp, axi_bus_sl2tb)

  // From the Testbench to the Serial Link
  `AXI_ASSIGN_TO_REQ(sl_in_req, axi_bus_tb2sl)
  `AXI_ASSIGN_FROM_RESP(axi_bus_tb2sl, sl_in_resp)

  logic [3:0]   sl_ddr_data_o, sl_ddr_data_i;
  logic         sl_ddr_clk_o, sl_ddr_clk_i;

  serial_link #(
    .axi_req_t      ( axi_mst_req_t     ),
    .axi_rsp_t      ( axi_mst_rsp_t     ),
    .cfg_req_t      ( reg_req_t ),
    .cfg_rsp_t      ( reg_rsp_t ),
    .aw_chan_t      ( axi_mst_aw_chan_t ),
    .ar_chan_t      ( axi_mst_ar_chan_t ),
    .r_chan_t       ( axi_mst_r_chan_t  ),
    .w_chan_t       ( axi_mst_w_chan_t  ),
    .b_chan_t       ( axi_mst_b_chan_t  ),
    .hw2reg_t       ( serial_link_single_channel_reg_pkg::serial_link_single_channel_hw2reg_t ),
    .reg2hw_t       ( serial_link_single_channel_reg_pkg::serial_link_single_channel_reg2hw_t ),
    .NumChannels    ( 1                                 ),
    .NumLanes       ( 4                                 ),
    .MaxClkDiv      ( CarfieldCfgDefault.SlinkMaxClkDiv )
  ) i_fix_serial_link (
    // There are 3 different clock/resets:
    // 1) clk_i & rst_ni: "always-on" clock & reset coming from the SoC domain. Only config registers are conected to this clock
    // 2) clk_sl_i & rst_sl_ni: Same as 1) but clock is gated and reset is SW synchronized.
    // 3) clk_reg_i & rst_reg_ni: peripheral clock and reset. Only connected to RegBus CDC
    // W/o clock gating, reset synchronization -> tie clk_sl_i to clk_i resp. rst_sl_ni to rst_ni
    .clk_i          ( clk_sys       ),
    .rst_ni         ( rst_n         ),
    .clk_sl_i       ( clk_sys       ),
    .rst_sl_ni      ( rst_n         ),
    .clk_reg_i      ( clk_sys       ),
    .rst_reg_ni     ( rst_n         ),
    .testmode_i     ( testmode      ),
    .axi_in_req_i   ( sl_in_req     ),
    .axi_in_rsp_o   ( sl_in_resp    ),
    .axi_out_req_o  ( sl_out_req    ),
    .axi_out_rsp_i  ( sl_out_resp   ),
    .cfg_req_i      ( '0            ),
    .cfg_rsp_o      (               ),
    .ddr_rcv_clk_i  ( sl_ddr_clk_o  ),
    .ddr_rcv_clk_o  ( sl_ddr_clk_i  ),
    .ddr_i          ( sl_ddr_data_o ),
    .ddr_o          ( sl_ddr_data_i ),
    // AXI isolation signals (in/out), if not used tie to 0
    .isolated_i     ( '0            ),
    .isolate_o      (               ),
    // Clock gate register
    .clk_ena_o      (               ),
    // synch-reset register
    .reset_no       (               )
  );

  // Random slave that keeps written data for the slave side
  axi_test::axi_rand_slave #(
    .AW                   ( AxiAddrWidth                  ),
    .DW                   ( AxiDataWidth                  ),
    .IW                   ( AxiXbarMasterIdWidth          ),
    .UW                   ( AxiUserWidth                  ),
    .MAPPED               ( 1'b1                          ),
    .TA                   ( TA                            ),
    .TT                   ( TT                            ),
    .RAND_RESP            ( 0                             ),
    .AX_MIN_WAIT_CYCLES   ( 0                             ),
    .AX_MAX_WAIT_CYCLES   ( 100                           ),
    .R_MIN_WAIT_CYCLES    ( 0                             ),
    .R_MAX_WAIT_CYCLES    ( 5                             ),
    .RESP_MIN_WAIT_CYCLES ( 0                             ),
    .RESP_MAX_WAIT_CYCLES ( 20                            )
  ) sl_axi_rand_slave = new (axi_bus_sl2tb);

  // Start the rand slave directly from the beginning
  initial begin
    sl_axi_rand_slave.run();
  end

  // An AXI driver for the master side
  typedef axi_test::axi_driver #(
    .AW     ( AxiAddrWidth    ),
    .DW     ( AxiDataWidth    ),
    .IW     ( AxiXbarMasterIdWidth ),
    .UW     ( AxiUserWidth    ),
    .TA     ( TA              ),
    .TT     ( TT              )
  ) sl_axi_driver_t;

  sl_axi_driver_t sl_axi_driver = new (axi_bus_tb2sl);

  initial begin
    @(negedge rst_n);
    sl_axi_driver.reset_master();
  end

  // Write data from queue with given granularity (1, 2, 4 or 8 bytes)
  task automatic sl_write_size(
    input logic [AxiAddrWidth-1:0]  addr,
    input logic [3:0]               size,
    ref logic   [AxiDataWidth-1:0]  data [$]
  );
    automatic sl_axi_driver_t::ax_beat_t ax = new();
    automatic sl_axi_driver_t::w_beat_t w = new();
    automatic sl_axi_driver_t::b_beat_t b;
    automatic int i = 0;
    automatic int size_bytes = (1 << size);

    @(posedge clk_sys);

    sl_axi_driver.reset_master();

    //$display("[SL] Write address: %h, len: %0d", addr, data.size()-1);
    ax.ax_addr  = addr;
    ax.ax_id    = '0;
    ax.ax_len   = data.size() - 1;
    ax.ax_size  = size;
    ax.ax_burst = axi_pkg::BURST_INCR;

    sl_axi_driver.cycle_start();
    sl_axi_driver.cycle_end();

    //$write("[SL] - Sending AW... ");
    sl_axi_driver.send_aw(ax);

    sl_axi_driver.cycle_start();
    sl_axi_driver.cycle_end();

    //$display("OK");
    //$display("[SL] - Writing burst data");

    do begin
      w.w_strb = (~('1 << size_bytes)) << addr[$clog2(AxiDataWidth)-1:0];
      w.w_data = data[i];
      w.w_last = (i == ax.ax_len);

      sl_axi_driver.cycle_start();
      sl_axi_driver.cycle_end();

      sl_axi_driver.send_w(w);

      sl_axi_driver.cycle_start();
      sl_axi_driver.cycle_end();

      i++;
      addr += size_bytes;
      addr &= size_bytes - 1;
    end while (i <= ax.ax_len);

    //$write("[SL] - Waiting for B... ");
    sl_axi_driver.recv_b(b);

    //$display("OK (1)");
  endtask

  task automatic sl_read_size(
    input logic [AxiAddrWidth-1:0]  addr,
    input logic [3:0]               size,
    input logic [7:0]               len,
    ref logic   [AxiDataWidth-1:0]  data [$]
  );
    automatic sl_axi_driver_t::ax_beat_t ax = new();
    automatic sl_axi_driver_t::r_beat_t r;

    @(posedge clk_sys);

    sl_axi_driver.reset_master();

    $display("[SL] Read address: %h, len: %0d", addr, len);
    ax.ax_addr  = addr;
    ax.ax_id    = '0;
    ax.ax_len   = len;
    ax.ax_size  = size;
    ax.ax_burst = axi_pkg::BURST_INCR;

    sl_axi_driver.cycle_start();
    sl_axi_driver.cycle_end();

    $write("[SL] - Sending AR... ");
    sl_axi_driver.send_ar(ax);

    sl_axi_driver.cycle_start();
    sl_axi_driver.cycle_end();

    $display("OK");

    do begin
      $write("[SL] - Receiving R... ");
      sl_axi_driver.recv_r(r);

      $display("OK");
      data.push_back(r.r_data);

    end while (!r.r_last);
  endtask

  // Preload the ELF sections using 64-bit bursts
  task sl_preload;
    logic [AxiDataWidth-1:0] wdata [$];
    int loopcount;

    $display("[SL] Preloading ELF sections");

    foreach (sections[addr]) begin
      $display("[SL] Writing section 0x%x (%0d words)", addr * 8, sections[addr]);

      for (int i = 0; i < sections[addr]/256; i++) begin
        wdata = {};

        // Load the queue for one burst
        for(int k = 0; k < 256; k++) begin
          wdata.push_back(memory[addr + 256*i + k]);
        end

        $display(" - Word %0d/%0d (%0d%%)", i*256, sections[addr], i*256*100/(sections[addr] > 1 ? sections[addr]-1 : 1));
        sl_write_size(((addr + i*256) * 8), 3, wdata);

        loopcount = i+1;
      end

      // Complete the remainder in a shorter burst
      if(loopcount*256 < sections[addr]) begin
        wdata = {};

        for(int k = loopcount*256; k < sections[addr]; k++) begin
          wdata.push_back(memory[addr + k]);
        end

        $display(" - Word %0d/%0d (%0d%%)", loopcount*256, sections[addr], loopcount*256*100/(sections[addr] > 1 ? sections[addr]-1 : 1));
        sl_write_size(((addr + loopcount*256) * 8), 3, wdata);
      end
    end

    $display("[SL] Preload completed");

  endtask


  // Randomize memory contents
  task sl_rand(
    input logic [AxiAddrWidth-1:0]  addr,
    input logic [AxiDataWidth-1:0]  len
  );
    logic [AxiDataWidth-1:0] wdata [$];
    logic [AxiDataWidth-1:0] random_data;
    int loopcount;

    $display("[SL] Randomizing 0x%h -> 0x%h", addr, addr+len);
  endtask

  // Run a binary
  task automatic jtag_elf_run(input string binary);
    dm::dmcontrol_t dmcontrol = '{dmactive: 1, default: '0};
    dm::dmstatus_t status;
    doub_bt entry;
    // Wait until bootrom initialized LLC
    if (DutCfg.LlcNotBypass) begin
      word_bt regval;
      $display("[JTAG] Wait for LLC configuration");
      jtag_poll_bit0(AmLlc + axi_llc_reg_pkg::AXI_LLC_CFG_SPM_LOW_OFFSET, regval);
    end
    // Halt hart 0
    dmcontrol.haltreq = 1;
    jtag_write(dm::DMControl, dmcontrol);
    do jtag_dbg.read_dmi_exp_backoff(dm::DMStatus, status);
    while (~status.allhalted);
    $display("[JTAG] Halted hart 0");
    // Preload binary
    jtag_elf_preload(binary, entry);
    // Repoint execution
    jtag_write(dm::Data1, entry[63:32]);
    jtag_write(dm::Data0, entry[31:0]);
    jtag_write(dm::Command, 32'h0033_07b1, 0, 1);
    // Resume hart 0
    dmcontrol.haltreq = 0;
    dmcontrol.resumereq = 1;
    jtag_write(dm::DMControl, dmcontrol);
    $display("[JTAG] Resumed hart 0 from 0x%h", entry);
  endtask

  task automatic jtag_wait_for_eoc(output word_bt exit_code);
    jtag_poll_bit0(AmRegs + cheshire_reg_pkg::CHESHIRE_SCRATCH_1_OFFSET, exit_code);
    exit_code >>= 1;
    if (exit_code) $error("[JTAG] FAILED: return code %d", exit_code);
    else $display("[JTAG] SUCCESS");
  endtask

  // To be removed: start
  //   for (int i = 0; i < len/(256*8); i++) begin
  //     wdata = {};
  // 
  //     // Load the queue for one burst
  //     for(int k = 0; k < 256; k++) begin
  //       void'(std::randomize(random_data));
  //       wdata.push_back(random_data);
  //     end
  // 
  //     $display(" - Word %0d/%0d (%0d%%)", i*256, len/8, i*256*100/((len/8) > 1 ? (len/8)-1 : 1));
  //     sl_write_size(addr + (i*256 * 8), 3, wdata);
  // 
  //     loopcount = i+1;
  //   end
  // 
  //   // Complete the remainder in a shorter burst
  //   if(loopcount*256*8 < len) begin
  //     wdata = {};
  // 
  //     for(int k = loopcount*256*8; k < len; k++) begin
  //       void'(std::randomize(random_data));
  //       wdata.push_back(random_data);
  //     end
  // 
  //     $display(" - Word %0d/%0d (%0d%%)", loopcount*256, len/8, loopcount*256*100/((len/8) > 1 ? (len/8)-1 : 1));
  //     sl_write_size(addr + (loopcount*256 * 8), 3, wdata);
  //   end
  // endtask
  // To be removed: end
   
  ///////////////
  // SPI Model //
  ///////////////

  wire spi_sck, spi_cs_flash, spi_cs_sd;
  wire spi_miso_sd;
  wire [3:0] spi_io;
  wire spi_reset_n;
  wire spi_wp_n;
  logic spi_sck_soc_out;
  logic spi_sck_en;
  logic [3:0] spi_sd_soc_out, spi_sd_soc_in;
  logic [1:0] spi_cs_soc_out;
  logic [1:0] spi_cs_en;
  logic [3:0] spi_sd_en;

  assign spi_wp_n = 1'b1;
 
  assign spi_sck = (~spi_sck_en) ? spi_sck_soc_out : 1'b0;
  assign spi_cs_sd    = (~spi_cs_en[0]) ? spi_cs_soc_out[0] : 2'b1;
  assign spi_cs_flash = (~spi_cs_en[1]) ? spi_cs_soc_out[1] : 2'b1;

  // Pull-ups
  assign (weak0, weak1) spi_io = 4'b1111;

  assign spi_io[0] = spi_sd_en[0] ? spi_sd_soc_out[0] : 1'bz;
  assign spi_io[1] = spi_sd_en[1] ? spi_sd_soc_out[1] : 1'bz;
  assign spi_io[2] = spi_sd_en[2] ? spi_sd_soc_out[2] : 1'bz;
  assign spi_io[3] = spi_sd_en[3] ? spi_sd_soc_out[3] : 1'bz;

  assign spi_io[1] = spi_cs_sd    ? 1'bz : spi_miso_sd;
    
  assign spi_sd_soc_in = spi_io;
    
  assign spi_reset_n = rst_n;

  s25fs512s i_spi_model (
    // Data IO
    .SI       ( spi_io[0]   ),
    .SO       ( spi_io[1]   ),
    // Controls
    .SCK      ( spi_sck     ),
    .CSNeg    ( spi_cs_flash),
    .WPNeg    ( spi_wp_n    ),
    .RESETNeg ( spi_reset_n )
  );

/*
  spi_sd_model i_sd_model (
    .sclk   ( spi_sck       ),
    .rstn   ( spi_reset_n   ),
    .ncs    ( spi_cs_sd     ),
    .mosi   ( spi_io[0]     ),
    .miso   ( spi_miso_sd   )
  );

  */

  assign spi_miso_sd = 0;

  ///////////////////
  // UART Receiver //
  ///////////////////

  logic uart_tx;

  uart_tb_rx #(
    .BAUD_RATE ( UartBaudRate     ),
    .PARITY_EN ( UartParityEna    )
  ) i_uart_rx_model (
    .rx        ( uart_tx          ),
    .rx_en     ( 1'b1             ),
    .word_done (                  )
  );


  /////////////////////////
  // Regbus Error Slaves //
  /////////////////////////

  reg_req_t external_reg_req;
  reg_rsp_t external_reg_rsp;
   
  reg_err_slv #(
    .DW       ( 32                 ),
    .ERR_VAL  ( 32'hBADCAB1E       ),
    .req_t    ( reg_req_t  ),
    .rsp_t    ( reg_rsp_t  )
  ) i_reg_err_slv_external_reg (
    .req_i    ( external_reg_req   ),
    .rsp_o    ( external_reg_rsp   )
  );

   
  //////////////////
  // Carfield SoC //
  //////////////////
  localparam int NumPhys  = 1;
  localparam int NumChips = 2;
   
  wire  [NumPhys-1:0][NumChips-1:0] hyper_cs_n_wire;
  wire  [NumPhys-1:0]               hyper_ck_wire;
  wire  [NumPhys-1:0]               hyper_ck_n_wire;
  wire  [NumPhys-1:0]               hyper_rwds_wire;
  wire  [NumPhys-1:0][7:0]          hyper_dq_wire;
  wire  [NumPhys-1:0]               hyper_reset_n_wire;

  carfield #(
    .Cfg              ( DutCfg             ), // from Cheshire package
    .HypNumPhys       ( NumPhys            ),
    .HypNumChips      ( NumChips           )
  )i_dut_carfield_soc (
    .clk_i            ( clk_sys            ),
    .rst_ni           ( rst_n              ),
    .test_mode_i      ( testmode           ),
    // Boot mode selection
    .boot_mode_i      ( bootmode           ),
    // CLINT
    .rtc_i            ( clk_rtc            ),
    // JTAG Interface
    .jtag_tck_i       ( jtag_tck           ),
    .jtag_trst_ni     ( jtag_trst_n        ),
    .jtag_tms_i       ( jtag_tms           ),
    .jtag_tdi_i       ( jtag_tdi           ),
    .jtag_tdo_o       ( jtag_tdo           ),
    .jtag_tdo_oe_o    ( jtag_tdo_oe        ),
    // UART Interface
    .uart_tx_o        ( uart_tx            ),
    .uart_rx_i        ( 1'b0               ),
    // UART Modem flow control
    .uart_rts_no      (                    ),
    .uart_dtr_no      (                    ),
    .uart_cts_ni      ( 1'b0               ),
    .uart_dsr_ni      ( 1'b0               ),
    .uart_dcd_ni      ( 1'b0               ),
    .uart_rin_ni      ( 1'b0               ),
    // I2C Interface
    .i2c_sda_o        ( i2c_sda_out        ),
    .i2c_sda_i        ( i2c_sda_in         ),
    .i2c_sda_en_no    ( i2c_sda_oe         ),
    .i2c_scl_o        ( i2c_scl_out        ),
    .i2c_scl_i        ( i2c_scl_in         ),
    .i2c_scl_en_no    ( i2c_scl_oe         ),
    // SPI Host Interface
    .spih_sck_o       ( spi_sck_soc_out    ),
    .spih_sck_en_no   ( spi_sck_en         ),
    .spih_csb_o       ( spi_cs_soc_out     ),
    .spih_csb_en_no   ( spi_cs_en          ),
    .spih_sd_o        ( spi_sd_soc_out     ),
    .spih_sd_en_no    ( spi_sd_en          ),
    .spih_sd_i        ( spi_sd_soc_in      ),
    // GPIO interface
    .gpio_i           ( '0                 ),
    .gpio_o           (                    ),
    .gpio_en_o        (                    ),
    // Serial Link Interface
    .slink_i          ( sl_ddr_data_i      ),
    .slink_o          ( sl_ddr_data_o      ),
    .slink_rcv_clk_i  ( sl_ddr_clk_i       ),
    .slink_rcv_clk_o  ( sl_ddr_clk_o       ),
    // HyperBus Clocks
    .hyp_clk_phy_i    ( clk_sys            ),
    .hyp_rst_phy_ni   ( rst_n              ),
    // Physical interace: facing HyperBus
    .pad_hyper_csn    ( hyper_cs_n_wire    ),
    .pad_hyper_ck     ( hyper_ck_wire      ),
    .pad_hyper_ckn    ( hyper_ck_n_wire    ),
    .pad_hyper_rwds   ( hyper_rwds_wire    ),
    .pad_hyper_reset  ( hyper_reset_n_wire ),
    .pad_hyper_dq     ( hyper_dq_wire      )
   ); 
        
  generate
     for (genvar i=0; i<NumPhys; i++) begin : hyperrams
        for (genvar j=0; j<NumChips; j++) begin : chips

           s27ks0641 #(
             /*.mem_file_name ( "s27ks0641.mem"    ),*/
             .TimingModel   ( "S27KS0641DPBHI020"    )
           ) i_s27ks0641 (
             .DQ7           ( hyper_dq_wire[i][7]      ),
             .DQ6           ( hyper_dq_wire[i][6]      ),
             .DQ5           ( hyper_dq_wire[i][5]      ),
             .DQ4           ( hyper_dq_wire[i][4]      ),
             .DQ3           ( hyper_dq_wire[i][3]      ),
             .DQ2           ( hyper_dq_wire[i][2]      ),
             .DQ1           ( hyper_dq_wire[i][1]      ),
             .DQ0           ( hyper_dq_wire[i][0]      ),
             .RWDS          ( hyper_rwds_wire[i]       ),
             .CSNeg         ( hyper_cs_n_wire[i][j]    ),
             .CK            ( hyper_ck_wire[i]         ),
             .CKNeg         ( hyper_ck_n_wire[i]       ),
             .RESETNeg      ( hyper_reset_n_wire[i]    )
           );

        end // block: chips
     end // block: hyperrams

  endgenerate
   
endmodule
