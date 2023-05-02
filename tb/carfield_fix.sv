// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>
// Paul Scheffler <paulsc@iis.ee.ethz.ch>

module carfield_soc_fixture;

  `include "cheshire/typedef.svh"
  `include "axi/assign.svh"

  import cheshire_pkg::*;
  import carfield_pkg::*;

  /********/
  /* DPI  */
  /********/
  import "DPI-C" function byte read_elf(input string filename);
  import "DPI-C" function byte get_entry(output longint entry);
  import "DPI-C" function byte get_section(output longint address, output longint len);
  import "DPI-C" context function byte read_section(input longint address, inout byte buffer[], input longint len);

  /**********************/
  /* General Parameters */
  /**********************/

  localparam cheshire_cfg_t DutCfg = carfield_pkg::CarfieldCfgDefault;

  localparam RomCtrlBootRomInitFile = "sw/security_island/bootrom/boot_rom.vmem";
  localparam OtpCtrlMemInitFile     = "sw/security_island/otp/otp-img.mem";
  localparam FlashCtrlMemInitFile   = ""; //./security_island/sw/bare-metal/alsaqr/hmac_test/hmac_smoketest.vmem";

  localparam   AxiWideBeWidth_ib    = 4;
  localparam   AxiWideByteOffset_ib = $clog2(AxiWideBeWidth_ib);
  logic [31:0] ibex_memory [bit [31:0]];
  int          ibex_sections [bit [31:0]];

  `CHESHIRE_TYPEDEF_ALL(, DutCfg)
  localparam int unsigned AxiStrbWidth = DutCfg.AxiDataWidth/8;
  localparam int unsigned AxiStrbBits  = $clog2(DutCfg.AxiDataWidth/8);

  localparam time ClkPeriodSys    = 5ns;
  localparam time ClkPeriodJtag   = 20ns;
  localparam time ClkPeriodOtJtag = 20ns;
  localparam time ClkPeriodRtc    = 30518ns;

  localparam int unsigned RstCycles = 5;

  localparam real TAppl   = 0.1;
  localparam real TTest   = 0.9;

  localparam int unsigned UartBaudRate    = 115200;
  localparam int unsigned UartParityEna   = 0;
  localparam int unsigned UartBurstBytes  = 256;
  localparam int unsigned UartWaitCycles  = 50;

  localparam int unsigned SlinkMaxWaitAx    = 100;
  localparam int unsigned SlinkMaxWaitR     = 5;
  localparam int unsigned SlinkMaxWaitResp  = 20;
  localparam int unsigned SlinkBurstBytes   = 1024;
  localparam bit          SlinkAxiDebug     = 0;

  /********************/
  /* Hyper RAM Params */
  /********************/
  localparam int NumPhys  = 1;
  localparam int NumChips = 2;

  /**********/
  /* DUT IO */
  /**********/
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

  logic jtag_ot_tck;
  logic jtag_ot_trst_n;
  logic jtag_ot_tms;
  logic jtag_ot_tdi;
  logic jtag_ot_tdo;

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

  wire  [NumPhys-1:0][NumChips-1:0] hyper_cs_n_wire;
  wire  [NumPhys-1:0]               hyper_ck_wire;
  wire  [NumPhys-1:0]               hyper_ck_n_wire;
  wire  [NumPhys-1:0]               hyper_rwds_wire;
  wire  [NumPhys-1:0][7:0]          hyper_dq_wire;
  wire  [NumPhys-1:0]               hyper_reset_n_wire;

  /*******/
  /* DUT */
  /*******/
  carfield      #(
    .Cfg         ( DutCfg   ),
    .HypNumPhys  ( NumPhys  ),
    .HypNumChips ( NumChips ),
    .RomCtrlBootRomInitFile ( RomCtrlBootRomInitFile ),
    .OtpCtrlMemInitFile     ( OtpCtrlMemInitFile     ),
    .FlashCtrlMemInitFile   ( FlashCtrlMemInitFile   )
  ) i_dut        (
    .clk_i           ( clk                ),
    .rst_ni          ( rst_n              ),
    .test_mode_i     ( test_mode          ),
    .boot_mode_i     ( boot_mode          ),
    .rtc_i           ( rtc                ),
    .jtag_tck_i      ( jtag_tck           ),
    .jtag_trst_ni    ( jtag_trst_n        ),
    .jtag_tms_i      ( jtag_tms           ),
    .jtag_tdi_i      ( jtag_tdi           ),
    .jtag_tdo_o      ( jtag_tdo           ),
    .jtag_tdo_oe_o   (                    ),
    .jtag_ot_tck_i   ( jtag_ot_tck        ),
    .jtag_ot_trst_ni ( jtag_ot_trst_n     ),
    .jtag_ot_tms_i   ( jtag_ot_tms        ),
    .jtag_ot_tdi_i   ( jtag_ot_tdi        ),
    .jtag_ot_tdo_o   ( jtag_ot_tdo        ),
    .jtag_ot_tdo_oe_o(                    ),
    .uart_tx_o       ( uart_tx            ),
    .uart_rx_i       ( uart_rx            ),
    .uart_rts_no     (                    ),
    .uart_dtr_no     (                    ),
    .uart_cts_ni     ( 1'b0               ),
    .uart_dsr_ni     ( 1'b0               ),
    .uart_dcd_ni     ( 1'b0               ),
    .uart_rin_ni     ( 1'b0               ),
    .i2c_sda_o       ( i2c_sda_o          ),
    .i2c_sda_i       ( i2c_sda_i          ),
    .i2c_sda_en_o    ( i2c_sda_en         ),
    .i2c_scl_o       ( i2c_scl_o          ),
    .i2c_scl_i       ( i2c_scl_i          ),
    .i2c_scl_en_o    ( i2c_scl_en         ),
    .spih_sck_o      ( spih_sck_o         ),
    .spih_sck_en_o   ( spih_sck_en        ),
    .spih_csb_o      ( spih_csb_o         ),
    .spih_csb_en_o   ( spih_csb_en        ),
    .spih_sd_o       ( spih_sd_o          ),
    .spih_sd_en_o    ( spih_sd_en         ),
    .spih_sd_i       ( spih_sd_i          ),
    .gpio_i          ( '0                 ),
    .gpio_o          (                    ),
    .gpio_en_o       (                    ),
    .slink_rcv_clk_i ( slink_rcv_clk_i    ),
    .slink_rcv_clk_o ( slink_rcv_clk_o    ),
    .slink_i         ( slink_i            ),
    .slink_o         ( slink_o            ),
    .hyp_clk_phy_i   ( clk                ),
    .hyp_rst_phy_ni  ( rst_n              ),
    .pad_hyper_csn   ( hyper_cs_n_wire    ),
    .pad_hyper_ck    ( hyper_ck_wire      ),
    .pad_hyper_ckn   ( hyper_ck_n_wire    ),
    .pad_hyper_rwds  ( hyper_rwds_wire    ),
    .pad_hyper_reset ( hyper_reset_n_wire ),
    .pad_hyper_dq    ( hyper_dq_wire      )
  );

  /******************/
  /* HyperRam Banks */
  /******************/
  generate
    for (genvar i=0; i<NumPhys; i++) begin : hyperrams
      for (genvar j=0; j<NumChips; j++) begin : chips
        s27ks0641 #(
          /*.mem_file_name ( "s27ks0641.mem"    ),*/
          .TimingModel ( "S27KS0641DPBHI020"    )
        ) i_s27ks0641  (
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

  /***************************/
  /* SoC Clock, Reset, Modes */
  /***************************/
  clk_rst_gen #(
    .ClkPeriod    ( ClkPeriodSys ),
    .RstClkCycles ( RstCycles )
  ) i_clk_rst_sys (
    .clk_o  ( clk   ),
    .rst_no ( rst_n )
  );

  clk_rst_gen #(
    .ClkPeriod    ( ClkPeriodRtc ),
    .RstClkCycles ( RstCycles )
  ) i_clk_rst_rtc (
    .clk_o  ( rtc ),
    .rst_no ( )
  );

  initial begin
    test_mode = '0;
    boot_mode = '0;
  end

  task wait_for_reset;
    @(posedge rst_n);
    @(posedge clk);
  endtask

  task set_test_mode(input logic mode);
    test_mode = mode;
  endtask

  task set_boot_mode(input logic [1:0] mode);
    boot_mode = mode;
  endtask

  /********/
  /* JTAG */
  /********/
  localparam dm::sbcs_t JtagInitSbcs = dm::sbcs_t'{
      sbautoincrement: 1'b1, sbreadondata: 1'b1, sbaccess: 3, default: '0};

  // Generate clock
  clk_rst_gen #(
    .ClkPeriod    ( ClkPeriodJtag ),
    .RstClkCycles ( RstCycles )
  ) i_clk_jtag (
    .clk_o  ( jtag_tck ),
    .rst_no ( )
  );

  clk_rst_gen #(
    .ClkPeriod    ( ClkPeriodOtJtag ),
    .RstClkCycles ( RstCycles )
  ) i_clk_ot_jtag (
    .clk_o  ( jtag_ot_tck ),
    .rst_no ( )
  );

  // Define test bus and driver
  JTAG_DV jtag(jtag_tck);
  JTAG_DV jtag_ot(jtag_tck);

  typedef jtag_test::riscv_dbg #(
    .IrLength ( 5 ),
    .TA       ( ClkPeriodJtag * TAppl ),
    .TT       ( ClkPeriodJtag * TTest )
  ) riscv_dbg_t;

  typedef jtag_ot_test::riscv_dbg #(
    .IrLength ( 5 ),
    .TA       ( ClkPeriodJtag * TAppl ),
    .TT       ( ClkPeriodJtag * TTest )
  ) riscv_dbg_ot_t;

  riscv_dbg_t::jtag_driver_t  jtag_dv   = new (jtag);
  riscv_dbg_t                 jtag_dbg  = new (jtag_dv);

  riscv_dbg_ot_t::jtag_driver_t  jtag_ot_dv   = new (jtag_ot);
  riscv_dbg_ot_t                 jtag_ot_dbg  = new (jtag_ot_dv);

  // Connect DUT to test bus
  assign jtag_trst_n  = jtag.trst_n;
  assign jtag_tms     = jtag.tms;
  assign jtag_tdi     = jtag.tdi;
  assign jtag.tdo     = jtag_tdo;

  assign jtag_ot_trst_n  = jtag_ot.trst_n;
  assign jtag_ot_tms     = jtag_ot.tms;
  assign jtag_ot_tdi     = jtag_ot.tdi;
  assign jtag_ot.tdo     = jtag_ot_tdo;

  initial begin
    @(negedge rst_n);
    jtag_dbg.reset_master();
    jtag_ot_dbg.reset_master();
  end

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

  task automatic jtag_poll_bit0(
    input doub_bt addr,
    output word_bt data,
    input int unsigned idle_cycles
  );
    automatic dm::sbcs_t sbcs = dm::sbcs_t'{sbreadonaddr: 1'b1, sbaccess: 2, default: '0};
    jtag_write(dm::SBCS, sbcs, 0, 1);
    jtag_write(dm::SBAddress1, addr[63:32]);
    do begin
      jtag_write(dm::SBAddress0, addr[31:0]);
      jtag_dbg.wait_idle(idle_cycles);
      jtag_dbg.read_dmi_exp_backoff(dm::SBData0, data);
    end while (~data[0]);
  endtask
  // Initialize the debug module
  task automatic jtag_init;
    jtag_idcode_t idcode;
    dm::dmcontrol_t dmcontrol = '{dmactive: 1, default: '0};
    // Check ID code
    repeat(100) @(posedge jtag_tck);
    jtag_dbg.get_idcode(idcode);
    if (idcode != DutCfg.DbgIdCode)
        $fatal(1, "[JTAG] Unexpected ID code: expected 0x%h, got 0x%h!", DutCfg.DbgIdCode, idcode);
    // Activate, wait for debug module
    jtag_write(dm::DMControl, dmcontrol);
    do jtag_dbg.read_dmi_exp_backoff(dm::DMControl, dmcontrol);
    while (~dmcontrol.dmactive);
    // Activate, wait for system bus
    jtag_write(dm::SBCS, JtagInitSbcs, 0, 1);
    $display("[JTAG] Initialization success");
  endtask

  // Load a binary
  task automatic jtag_elf_preload(input string binary, output doub_bt entry);
    longint sec_addr, sec_len;
    $display("[JTAG] Preloading ELF binary: %s", binary);
    if (read_elf(binary))
      $fatal(1, "[JTAG] Failed to load ELF!");
    while (get_section(sec_addr, sec_len)) begin
      byte bf[] = new [sec_len];
      $display("[JTAG] Preloading section at 0x%h (%0d bytes)", sec_addr, sec_len);
      if (read_section(sec_addr, bf, sec_len)) $fatal(1, "[JTAG] Failed to read ELF section!");
      jtag_write(dm::SBCS, JtagInitSbcs, 1, 1);
      // Write address as 64-bit double
      jtag_write(dm::SBAddress1, sec_addr[63:32]);
      jtag_write(dm::SBAddress0, sec_addr[31:0]);
      for (longint i = 0; i <= sec_len ; i += 8) begin
        bit checkpoint = (i != 0 && i % 512 == 0);
        if (checkpoint)
          $display("[JTAG] - %0d/%0d bytes (%0d%%)", i, sec_len, i*100/(sec_len>1 ? sec_len-1 : 1));
        jtag_write(dm::SBData1, {bf[i+7], bf[i+6], bf[i+5], bf[i+4]});
        jtag_write(dm::SBData0, {bf[i+3], bf[i+2], bf[i+1], bf[i]}, checkpoint, checkpoint);
      end
    end
    void'(get_entry(entry));
    $display("[JTAG] Preload complete");
  endtask

  // Run a binary
  task automatic jtag_elf_run(input string binary);
    dm::dmstatus_t status;
    doub_bt entry;
    // Wait until bootrom initialized LLC
    if (DutCfg.LlcNotBypass) begin
      word_bt regval;
      $display("[JTAG] Wait for LLC configuration");
      jtag_poll_bit0(AmLlc + axi_llc_reg_pkg::AXI_LLC_CFG_SPM_LOW_OFFSET, regval, 20);
    end
    // Halt hart 0
    jtag_write(dm::DMControl, dm::dmcontrol_t'{haltreq: 1, dmactive: 1, default: '0});
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
    jtag_write(dm::DMControl, dm::dmcontrol_t'{resumereq: 1, dmactive: 1, default: '0});
    $display("[JTAG] Resumed hart 0 from 0x%h", entry);
  endtask

  // Wait for termination signal and get return code
  task automatic jtag_wait_for_eoc(output word_bt exit_code);
    jtag_poll_bit0(AmRegs + cheshire_reg_pkg::CHESHIRE_SCRATCH_2_OFFSET, exit_code, 800);
    exit_code >>= 1;
    if (exit_code) $error("[JTAG] FAILED: return code %0d", exit_code);
    else $display("[JTAG] SUCCESS");
  endtask

  /********/
  /* UART */
  /********/
  localparam time UartBaudPeriod = 1000ns*1000*1000/UartBaudRate;

  localparam byte_bt UartDebugCmdRead  = 'h11;
  localparam byte_bt UartDebugCmdWrite = 'h12;
  localparam byte_bt UartDebugCmdExec  = 'h13;
  localparam byte_bt UartDebugAck      = 'h06;
  localparam byte_bt UartDebugEot      = 'h04;
  localparam byte_bt UartDebugEoc      = 'h14;

  byte_bt uart_boot_byte;
  logic   uart_boot_ena;
  logic   uart_boot_eoc;

  initial begin
    uart_rx       = 1;
    uart_boot_eoc = 0;
    uart_boot_ena = 0;
  end

  task automatic uart_read_byte(output byte_bt bite);
    // Start bit
    @(negedge uart_tx);
    #(UartBaudPeriod/2);
    // 8-bit byte
    for (int i = 0; i < 8; i++) begin
      #UartBaudPeriod bite[i] = uart_tx;
    end
    // Parity bit
    if(UartParityEna) begin
      bit parity;
      #UartBaudPeriod parity = uart_tx;
      if(parity ^ (^bite))
        $error("[UART] - Parity error detected!");
    end
    // Stop bit
    #UartBaudPeriod;
  endtask

  task automatic uart_write_byte(input byte_bt bite);
    // Start bit
    uart_rx = 1'b0;
    // 8-bit byte
    for (int i = 0; i < 8; i++)
      #UartBaudPeriod uart_rx = bite[i];
    // Parity bit
    if (UartParityEna)
      #UartBaudPeriod uart_rx = (^bite);
    // Stop bit
    #UartBaudPeriod uart_rx = 1'b1;
    #UartBaudPeriod;
  endtask

  task automatic uart_boot_scoop(output byte_bt bite);
    // Assert our intention to scoop the next received byte
    uart_boot_ena = 1;
    // Wait until read task notifies us a scooped byte is available
    @(negedge uart_boot_ena);
    // Grab scooped byte
    bite = uart_boot_byte;
  endtask

  task automatic uart_boot_scoop_expect(input string name, input byte_bt exp);
    byte_bt bite;
    uart_boot_scoop(bite);
    if (bite != exp)
      $fatal(1, "[UART] Expected %s (%0x) after read command, received %0x", name, exp, bite);
  endtask

  // Continually read characters and print lines
  // TODO: we should be able to support CR properly, but buffers are hard to deal with...
  initial begin
    static byte_bt uart_read_buf [$];
    byte_bt bite;
    wait_for_reset();
    forever begin
      uart_read_byte(bite);
      if (uart_boot_ena) begin
        uart_boot_byte  = bite;
        uart_boot_ena = 0;
      end else if (bite == "\n") begin
        $display("[UART] %s", {>>8{uart_read_buf}});
        uart_read_buf.delete();
      end else if (bite == UartDebugEoc) begin
        uart_boot_eoc = 1;
      end else begin
        uart_read_buf.push_back(bite);
      end
    end
  end

  // A length of zero indcates a write (write lengths are inferred from their queue)
  task automatic uart_debug_rw(doub_bt addr, doub_bt len_or_w, ref byte_bt data [$]);
    byte_bt bite;
    doub_bt len = len_or_w ? len_or_w : data.size();
    // Send command, address, and length
    uart_write_byte(len_or_w ? UartDebugCmdRead : UartDebugCmdWrite);
    for (int i = 0; i < 8; ++i)
      uart_write_byte(addr[8*i +: 8]);
        for (int i = 0; i < 8; ++i)
      uart_write_byte(len[8*i +: 8]);
    // Receive and check ACK
    uart_boot_scoop_expect("ACK", UartDebugAck);
    // Send or receive requested data
    for (int i = 0; i < len; ++i) begin
      if (len_or_w) begin
        uart_boot_scoop(bite);
        data.push_back(bite);
      end else begin
        uart_write_byte(data[i]);
      end
    end
    // Receive and check EOT
    uart_boot_scoop_expect("EOT", UartDebugEot);
  endtask

  // Load a binary
  task automatic uart_debug_elf_preload(input string binary, output doub_bt entry);
    longint sec_addr, sec_len;
    $display("[UART] Preloading ELF binary: %s", binary);
    if (read_elf(binary))
      $fatal(1, "[UART] Failed to load ELF!");
    while (get_section(sec_addr, sec_len)) begin
      byte bf[] = new [sec_len];
      $display("[UART] Preloading section at 0x%h (%0d bytes)", sec_addr, sec_len);
      if (read_section(sec_addr, bf, sec_len)) $fatal(1, "[UART] Failed to read ELF section!");
      // Write section in blocks
      for (longint i = 0; i <= sec_len ; i += UartBurstBytes) begin
        byte_bt bytes [$];
        if (i != 0)
          $display("[UART] - %0d/%0d bytes (%0d%%)", i, sec_len, i*100/(sec_len>1 ? sec_len-1 : 1));
        for (int b = 0; b < UartBurstBytes; b++) begin
          if (i+b >= sec_len) break;
          bytes.push_back(bf [i+b]);
        end
        uart_debug_rw(sec_addr + i, 0, bytes);
      end
    end
    void'(get_entry(entry));
    $display("[UART] Preload complete");
  endtask

  task automatic uart_debug_elf_run_and_wait(input string binary, output word_bt exit_code);
    byte_bt bite;
    doub_bt entry;
    // Wait some time for boot ROM to settle (No way to query this using only UART)
    $display("[UART] Waiting for debug loop to start");
    #(UartWaitCycles*UartBaudPeriod);
    // We send an ACK challenge to the debug server and wait for an ACK response
    $display("[UART] Sending ACK chellenge");
    uart_write_byte(UartDebugAck);
    uart_boot_scoop_expect("ACK", UartDebugAck);
    // Preload
    uart_debug_elf_preload(binary, entry);
  $display("[UART] Sending EXEC command for address %0x", entry);
    // Send exec command and receive ACK
    uart_write_byte(UartDebugCmdExec);
    for (int i = 0; i < 8; ++i)
      uart_write_byte(entry[8*i +: 8]);
    uart_boot_scoop_expect("ACK", UartDebugAck);
    // Wait for EOC and read return code
    wait (uart_boot_eoc == 1);
    $display("[UART] Received EOC signal");
    uart_boot_eoc = 0;
    for (int i = 0; i < 4; ++i)
      uart_boot_scoop(exit_code[8*i +: 8]);
    // Report exit code
    exit_code >>= 1;
    if (exit_code) $error("[UART] FAILED: return code %0d", exit_code);
    else $display("[UART] SUCCESS");
  endtask

  /*******/
  /* I2C */
  /*******/
  // Map IO to wires and pull up
  wire i2c_sda, i2c_scl;
  bufif1 (i2c_sda_i, i2c_sda, ~i2c_sda_en);
  bufif1 (i2c_sda, i2c_sda_o,  i2c_sda_en);
  bufif1 (i2c_scl_i, i2c_scl, ~i2c_scl_en);
  bufif1 (i2c_scl, i2c_scl_o,  i2c_scl_en);
  pullup (i2c_sda);
  pullup (i2c_scl);

  // Write-protect only chip 0
  bit [3:0] i2c_wp = 4'b0001;

  // We connect 2 chips available at different addresses;
  // however, the boot ROM will always boot from chip 0.
  for (genvar i = 0; i < 2; i++) begin : gen_i2c_eeproms
    M24FC1025 i_i2c_eeprom (
      .RESET  ( rst_n ),
      .A0     ( i[0] ),
      .A1     ( 1'b0 ),
      .A2     ( 1'b1 ),
      .WP     ( i2c_wp[i] ),
      .SDA    ( i2c_sda   ),
      .SCL    ( i2c_scl   )
    );
  end

  // Preload function called by testbench
  task automatic i2c_eeprom_preload(string image);
    // We overlay the entire memory with an alternating pattern
    for (int k = 0; k < $size(gen_i2c_eeproms[0].i_i2c_eeprom.MemoryBlock); ++k)
        gen_i2c_eeproms[0].i_i2c_eeprom.MemoryBlock[k] = 'h9a;
    // We load an image into chip 0 only if it exists
    if (image != "")
      $readmemh(image, gen_i2c_eeproms[0].i_i2c_eeprom.MemoryBlock);
  endtask

  /************/
  /* SPI Host */
  /************/
  // Map clock to wire and pull up
  wire spih_sck;
  bufif1 (spih_sck, spih_sck_o, spih_sck_en);
  pullup (spih_sck);

  // Map data IO to wires and pull up
  wire [3:0] spih_sd;
  for (genvar i = 0; i < 4; ++i) begin : gen_spih_sd_io
    bufif1 (spih_sd_i[i], spih_sd[i], ~spih_sd_en[i]);
    bufif1 (spih_sd[i], spih_sd_o[i],  spih_sd_en[i]);
    pullup (spih_sd[i]);
  end

  // Map CS IO to wires and pull up
  wire [SpihNumCs-1:0] spih_csb;
  for (genvar i =0; i < SpihNumCs; ++i) begin : gen_spih_cs_io
    bufif1 (spih_csb[i], spih_csb_o[i], spih_csb_en[i]);
    pullup (spih_csb[i]);
  end

  // We connect one chip at CS1, where we can boot from this flash.
  s25fs512s #(
    .UserPreload ( 0 )
  ) i_spi_norflash (
    .SI       ( spih_sd[0] ),
    .SO       ( spih_sd[1] ),
    .WPNeg    ( spih_sd[2] ),
    .RESETNeg ( spih_sd[3] ),
    .SCK      ( spih_sck ),
    .CSNeg    ( spih_csb[1] )
  );

  // Preload function called by testbench
  task automatic spih_norflash_preload(string image);
    // We overlay the entire memory with an alternating pattern
    for (int k = 0; k < $size(i_spi_norflash.Mem); ++k)
        i_spi_norflash.Mem[k] = 'h9a;
    // We load an image into chip 0 only if it exists
    if (image != "")
      $readmemh(image, i_spi_norflash.Mem);
  endtask

  /***************/
  /* Serial Link */
  /***************/
  axi_mst_req_t slink_axi_mst_req, slink_axi_slv_req;
  axi_mst_rsp_t slink_axi_mst_rsp, slink_axi_slv_rsp;

  AXI_BUS_DV #(
    .AXI_ADDR_WIDTH ( DutCfg.AddrWidth     ),
    .AXI_DATA_WIDTH ( DutCfg.AxiDataWidth  ),
    .AXI_ID_WIDTH   ( DutCfg.AxiMstIdWidth ),
    .AXI_USER_WIDTH ( DutCfg.AxiUserWidth  )
  ) slink_mst (
    .clk_i  ( clk )
  );

  AXI_BUS_DV #(
    .AXI_ADDR_WIDTH ( DutCfg.AddrWidth     ),
    .AXI_DATA_WIDTH ( DutCfg.AxiDataWidth  ),
    .AXI_ID_WIDTH   ( DutCfg.AxiMstIdWidth ),
    .AXI_USER_WIDTH ( DutCfg.AxiUserWidth  )
  ) slink_slv (
    .clk_i  ( clk )
  );

  `AXI_ASSIGN_TO_REQ(slink_axi_mst_req, slink_mst)
  `AXI_ASSIGN_FROM_RESP(slink_mst, slink_axi_mst_rsp)

  `AXI_ASSIGN_FROM_REQ(slink_slv, slink_axi_slv_req)
  `AXI_ASSIGN_TO_RESP(slink_axi_slv_rsp, slink_slv)

  // Mirror instance of serial link, reflecting another chip
  serial_link #(
    .axi_req_t    ( axi_mst_req_t ),
    .axi_rsp_t    ( axi_mst_rsp_t ),
    .cfg_req_t    ( reg_req_t ),
    .cfg_rsp_t    ( reg_rsp_t ),
    .aw_chan_t    ( axi_mst_aw_chan_t ),
    .ar_chan_t    ( axi_mst_ar_chan_t ),
    .r_chan_t     ( axi_mst_r_chan_t  ),
    .w_chan_t     ( axi_mst_w_chan_t  ),
    .b_chan_t     ( axi_mst_b_chan_t  ),
    .hw2reg_t     ( serial_link_single_channel_reg_pkg::serial_link_single_channel_hw2reg_t ),
    .reg2hw_t     ( serial_link_single_channel_reg_pkg::serial_link_single_channel_reg2hw_t ),
    .NumChannels  ( SlinkNumChan   ),
    .NumLanes     ( SlinkNumLanes  ),
    .MaxClkDiv    ( SlinkMaxClkDiv )
  ) i_serial_link (
    .clk_i          ( clk   ),
    .rst_ni         ( rst_n ),
    .clk_sl_i       ( clk   ),
    .rst_sl_ni      ( rst_n ),
    .clk_reg_i      ( clk   ),
    .rst_reg_ni     ( rst_n ),
    .testmode_i     ( test_mode ),
    .axi_in_req_i   ( slink_axi_mst_req ),
    .axi_in_rsp_o   ( slink_axi_mst_rsp ),
    .axi_out_req_o  ( slink_axi_slv_req ),
    .axi_out_rsp_i  ( slink_axi_slv_rsp ),
    .cfg_req_i      ( '0 ),
    .cfg_rsp_o      ( ),
    .ddr_rcv_clk_i  ( slink_rcv_clk_o ),
    .ddr_rcv_clk_o  ( slink_rcv_clk_i ),
    .ddr_i          ( slink_o ),
    .ddr_o          ( slink_i ),
    .isolated_i     ( '0 ),
    .isolate_o      ( ),
    .clk_ena_o      ( ),
    .reset_no       ( )
  );

  // We terminate the slave interface with a random agent
  axi_test::axi_rand_slave #(
    .AW                   ( DutCfg.AddrWidth     ),
    .DW                   ( DutCfg.AxiDataWidth  ),
    .IW                   ( DutCfg.AxiMstIdWidth ),
    .UW                   ( DutCfg.AxiUserWidth  ),
    .MAPPED               ( 1'b1 ),
    .TA                   ( ClkPeriodSys * TAppl ),
    .TT                   ( ClkPeriodSys * TTest ),
    .RAND_RESP            ( 0 ),
    .AX_MIN_WAIT_CYCLES   ( 0 ),
    .AX_MAX_WAIT_CYCLES   ( SlinkMaxWaitAx ),
    .R_MIN_WAIT_CYCLES    ( 0 ),
    .R_MAX_WAIT_CYCLES    ( SlinkMaxWaitR ),
    .RESP_MIN_WAIT_CYCLES ( 0 ),
    .RESP_MAX_WAIT_CYCLES ( SlinkMaxWaitResp )
  ) i_slink_rand_slv = new (slink_slv);

  initial begin
    i_slink_rand_slv.run();
  end

  // We use an AXI driver to inject serial link transfers
  typedef axi_test::axi_driver #(
    .AW ( DutCfg.AddrWidth     ),
    .DW ( DutCfg.AxiDataWidth  ),
    .IW ( DutCfg.AxiMstIdWidth ),
    .UW ( DutCfg.AxiUserWidth  ),
    .TA ( ClkPeriodSys * TAppl ),
    .TT ( ClkPeriodSys * TTest )
  ) slink_axi_driver_t;

  slink_axi_driver_t slink_axi_driver = new (slink_mst);

  initial begin
    @(negedge rst_n);
    slink_axi_driver.reset_master();
  end

  task automatic slink_write_beats(
    input addr_t          addr,
    input axi_pkg::size_t size,
    ref axi_data_t        beats [$]
  );
    slink_axi_driver_t::ax_beat_t ax = new();
    slink_axi_driver_t::w_beat_t w = new();
    slink_axi_driver_t::b_beat_t b;
    int i = 0;
    int size_bytes = (1 << size);
    if (beats.size() == 0)
      $fatal(1, "[SLINK] Zero-length write requested!");
    @(posedge clk);
    if (SlinkAxiDebug) $display("[SLINK] Write to address: %h, len: %0d", addr, beats.size()-1);
    ax.ax_addr  = addr;
    ax.ax_id    = '0;
    ax.ax_len   = beats.size() - 1;
    ax.ax_size  = size;
    ax.ax_burst = axi_pkg::BURST_INCR;
    if (SlinkAxiDebug) $display("[SLINK] - Sending AW ");
    slink_axi_driver.send_aw(ax);
    do begin
      w.w_strb = (~('1 << size_bytes)) << addr[AxiStrbBits-1:0];
      w.w_data = beats[i];
      w.w_last = (i == ax.ax_len);
      if (SlinkAxiDebug) $display("[SLINK] - Sending W (%0d)", i);
      slink_axi_driver.send_w(w);
      addr += size_bytes;
      addr &= size_bytes - 1;
      i++;
    end while (i <= ax.ax_len);
    if (SlinkAxiDebug) $display("[SLINK] - Receiving B");
    slink_axi_driver.recv_b(b);
    if (b.b_resp != axi_pkg::RESP_OKAY)
      $error("[SLINK] - Write error response: %d!", b.b_resp);
    if (SlinkAxiDebug) $display("[SLINK] - Done");
  endtask

  task automatic slink_read_beats(
    input addr_t          addr,
    input axi_pkg::size_t size,
    input axi_pkg::len_t  len,
    ref axi_data_t        beats [$]
  );
    slink_axi_driver_t::ax_beat_t ax = new();
    slink_axi_driver_t::r_beat_t r;
    int i = 0;
    @(posedge clk)
    if (SlinkAxiDebug) $display("[SLINK] Read from address: %h, len: %0d", addr, len);
    ax.ax_addr  = addr;
    ax.ax_id    = '0;
    ax.ax_len   = len;
    ax.ax_size  = size;
    ax.ax_burst = axi_pkg::BURST_INCR;
    if (SlinkAxiDebug) $display("[SLINK] - Sending AR");
    slink_axi_driver.send_ar(ax);
    do begin
      if (SlinkAxiDebug) $display("[SLINK] - Receiving R (%0d)", i);
      slink_axi_driver.recv_r(r);
      beats.push_back(r.r_data);
      addr += (1 << size);
      addr &= (1 << size) - 1;
      i++;
      if (r.r_resp != axi_pkg::RESP_OKAY)
        $error("[SLINK] - Read error response: %d!", r.r_resp);
    end while (!r.r_last);
    if (SlinkAxiDebug) $display("[SLINK] - Done");
  endtask

  task automatic slink_write_32(input addr_t addr, input word_bt data);
    axi_data_t beats [$];
    beats.push_back(data << (8 * addr[AxiStrbBits-1:0]));
    slink_write_beats(addr, 2, beats);
  endtask

  task automatic slink_poll_bit0(
    input doub_bt addr,
    output word_bt data,
    input int unsigned idle_cycles
  );
    do begin
        axi_data_t beats [$];
        #(ClkPeriodSys * idle_cycles);
        slink_read_beats(addr, 2, 0, beats);
        data = beats[0] >> addr[AxiStrbBits-1:0];
    end while (~data[0]);
  endtask

  // Load a binary
  task automatic slink_elf_preload(input string binary, output doub_bt entry);
    longint sec_addr, sec_len;
    $display("[SLINK] Preloading ELF binary: %s", binary);
    if (read_elf(binary))
      $fatal(1, "[SLINK] Failed to load ELF!");
    while (get_section(sec_addr, sec_len)) begin
      byte bf[] = new [sec_len];
      $display("[SLINK] Preloading section at 0x%h (%0d bytes)", sec_addr, sec_len);
      if (read_section(sec_addr, bf, sec_len)) $fatal(1, "[SLINK] Failed to read ELF section!");
      jtag_write(dm::SBCS, JtagInitSbcs, 1, 1);
      // Write address as 64-bit double
      jtag_write(dm::SBAddress1, sec_addr[63:32]);
      jtag_write(dm::SBAddress0, sec_addr[31:0]);
      // Write section as fixed-size bursts
      for (longint i = 0; i <= sec_len ; i += SlinkBurstBytes) begin
        axi_data_t beats [$];
        if (i != 0)
          $display("[SLINK] - %0d/%0d bytes (%0d%%)", i, sec_len, i*100/(sec_len>1 ? sec_len-1 : 1));
        // Assemble beats for current burst from section buffer
        for (int b = 0; b < SlinkBurstBytes; b += AxiStrbWidth) begin
          axi_data_t beat;
          // We handle incomplete bursts, but do assume bus-aligned sections
          if (i+b >= sec_len) break;
          for (int e = 0; e < AxiStrbWidth; ++e)
            beat[8*e +: 8] = bf [i+b+e];
          beats.push_back(beat);
        end
        // Write this burst
        slink_write_beats(sec_addr + i, AxiStrbBits, beats);
      end
    end
    void'(get_entry(entry));
    $display("[SLINK] Preload complete");
  endtask

  // Run a binary
  task automatic slink_elf_run(input string binary);
    dm::dmstatus_t status;
    doub_bt entry;
    // Wait for bootrom to ungate Serial Link
    if (DutCfg.LlcNotBypass) begin
      word_bt regval;
      $display("[SLINK] Wait for LLC configuration");
      slink_poll_bit0(AmLlc + axi_llc_reg_pkg::AXI_LLC_CFG_SPM_LOW_OFFSET, regval, 20);
    end
    // Preload
    slink_elf_preload(binary, entry);
    // Write entry point
    slink_write_32(AmRegs + cheshire_reg_pkg::CHESHIRE_SCRATCH_1_OFFSET, entry[63:32]);
    slink_write_32(AmRegs + cheshire_reg_pkg::CHESHIRE_SCRATCH_0_OFFSET, entry[32:0]);
    // Resume hart 0
    slink_write_32(AmRegs + cheshire_reg_pkg::CHESHIRE_SCRATCH_2_OFFSET, 2);
    $display("[SLINK] Wrote launch signal and entry point 0x%h", entry);
  endtask

  // Wait for termination signal and get return code
  task automatic slink_wait_for_eoc(output word_bt exit_code);
    slink_poll_bit0(AmRegs + cheshire_reg_pkg::CHESHIRE_SCRATCH_2_OFFSET, exit_code, 800);
    exit_code >>= 1;
    if (exit_code) $error("[SLINK] FAILED: return code %0d", exit_code);
    else $display("[SLINK] SUCCESS");
  endtask

  task debug_ibex_module_init;
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
     jtag_ot_dbg.wait_idle(300);
     jtag_ot_dbg.get_idcode(idcode);
     // Check Idcode
     $display(" IDCode = %h", idcode);
     // Activate Debug Module
     jtag_ot_dbg.write_dmi(dm_ot::DMControl, 32'h0000_0001);
     do jtag_ot_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
     while (sbcs.sbbusy);

  endtask // debug_module_init

  task jtag_ibex_data_preload;
     logic [31:0] rdata;
     automatic dm_ot::sbcs_t sbcs = '{
       sbautoincrement: 1'b1,
       sbreadondata   : 1'b1,
       sbaccess       : 3'h2,
       default        : 1'b0
     };
     automatic int dmi_wait_cycles = 10;
     debug_ibex_module_init();
     jtag_ot_dbg.write_dmi(dm_ot::SBCS, sbcs);
     do jtag_ot_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
     while (sbcs.sbbusy);
     $display("======== Preload data to Ibex SRAM ========");
     // Start writing to SRAM
     foreach (ibex_sections[addr]) begin
       $display("Writing %h with %0d words", addr << 2, ibex_sections[addr]); // word = 8 bytes here
       jtag_ot_dbg.write_dmi(dm_ot::SBAddress0, (addr << 2));
       do jtag_ot_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
       while (sbcs.sbbusy);
       for (int i = 0; i < ibex_sections[addr]; i++) begin
         $display(" -- Word %0d/%0d", i, ibex_sections[addr]);
         jtag_ot_dbg.write_dmi(dm_ot::SBData0, ibex_memory[addr + i]);
         // Wait until SBA is free to write next 32 bits
         do jtag_ot_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
         while (sbcs.sbbusy);
       end
     end
    $display("======== Preloading finished ========");
    // Preloading finished. Can now start executing
    sbcs.sbreadonaddr = 0;
    sbcs.sbreadondata = 0;
    jtag_ot_dbg.write_dmi(dm_ot::SBCS, sbcs);

  endtask // jtag_data_preload

  task jtag_ibex_wakeup;
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
    $info("======== Waking up Ibex using JTAG ========");
    // Initialize the dm module again, otherwise it will not work
    debug_ibex_module_init();
    do jtag_ot_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
    while (sbcs.sbbusy);
    // Write PC to Data0 and Data1
    jtag_ot_dbg.write_dmi(dm_ot::Data0, start_addr);
    do jtag_ot_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
    while (sbcs.sbbusy);
    // Halt Req
    jtag_ot_dbg.write_dmi(dm_ot::DMControl, 32'h8000_0001);
    do jtag_ot_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
    while (sbcs.sbbusy);
    // Wait for CVA6 to be halted
    do jtag_ot_dbg.read_dmi(dm_ot::DMStatus, dm_status, dmi_wait_cycles);
    while (!dm_status[8]);
    // Ensure haltreq, resumereq and ackhavereset all equal to 0
    jtag_ot_dbg.write_dmi(dm_ot::DMControl, 32'h0000_0001);
    do jtag_ot_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
    while (sbcs.sbbusy);
    // Register Access Abstract Command
    jtag_ot_dbg.write_dmi(dm_ot::Command, {8'h0,1'b0,3'h2,1'b0,1'b0,1'b1,1'b1,4'h0,dm_ot::CSR_DPC});
    do jtag_ot_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
    while (sbcs.sbbusy);
    // Resume req. Exiting from debug mode Ibex CVA6 will jump at the DPC address.
    // Ensure haltreq, resumereq and ackhavereset all equal to 0
    jtag_ot_dbg.write_dmi(dm_ot::DMControl, 32'h4000_0001);
    do jtag_ot_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);
    while (sbcs.sbbusy);
    jtag_ot_dbg.write_dmi(dm_ot::DMControl, 32'h0000_0001);
    do jtag_ot_dbg.read_dmi(dm_ot::SBCS, sbcs, dmi_wait_cycles);

    while (sbcs.sbbusy);
    $info("======== Wait for Completion ========");
  endtask // execute_application

  task load_ibex_binary;
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

      ibex_sections[section_addr >> AxiWideByteOffset_ib] = num_words;
      buffer = new[num_words * AxiWideBeWidth_ib];
      void'(read_section(section_addr, buffer, section_len));
      for (int i = 0; i < num_words; i++) begin
        automatic logic [AxiWideBeWidth_ib-1:0][7:0] word = '0;
        for (int j = 0; j < AxiWideBeWidth_ib; j++) begin
          word[j] = buffer[i * AxiWideBeWidth_ib + j];
        end
        ibex_memory[section_addr/AxiWideBeWidth_ib + i] = word;
      end
    end

  endtask

endmodule
