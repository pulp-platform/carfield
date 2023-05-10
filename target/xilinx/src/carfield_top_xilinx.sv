// add template
`include "cheshire/typedef.svh"

module carfield_top_xilinx
  import carfield_pkg::*;
  import cheshire_pkg::*;
 // import safety_island_pkg::*;
(
  input  logic                                        sys_clk_p,
  input  logic                                        sys_clk_n,
  input  logic                                        cpu_resetn
);

  localparam cheshire_cfg_t Cfg = carfield_pkg::CarfieldCfgDefault;

  `CHESHIRE_TYPEDEF_ALL(carfield_, Cfg)

  // Generate indices and get maps for all ports
  localparam axi_in_t     AxiIn       = gen_axi_in(Cfg);
  localparam axi_out_t    AxiOut      = gen_axi_out(Cfg);

  localparam int unsigned HypNumPhys  = 1;
  localparam int unsigned HypNumChips = 1;

  localparam int unsigned LlcIdWidth  = Cfg.AxiMstIdWidth + $clog2(AxiIn.num_in)+ Cfg.LlcNotBypass;
  localparam int unsigned LlcArWidth  = (2**LogDepth)*axi_pkg::ar_width(Cfg.AddrWidth, LlcIdWidth, Cfg.AxiUserWidth);
  localparam int unsigned LlcAwWidth  = (2**LogDepth)*axi_pkg::aw_width(Cfg.AddrWidth, LlcIdWidth, Cfg.AxiUserWidth);
  localparam int unsigned LlcBWidth   = (2**LogDepth)*axi_pkg::b_width(LlcIdWidth, Cfg.AxiUserWidth);
  localparam int unsigned LlcRWidth   = (2**LogDepth)*axi_pkg::r_width(Cfg.AxiDataWidth, LlcIdWidth, Cfg.AxiUserWidth);
  localparam int unsigned LlcWWidth   = (2**LogDepth)*axi_pkg::w_width(Cfg.AxiDataWidth, Cfg.AxiUserWidth );

// config for FPGA mapping

carfield_reg_req_t               dram_req;
carfield_reg_rsp_t               dram_resp;

logic [LlcArWidth-1:0]                     llc_ar_data;
logic [    LogDepth:0]                     llc_ar_wptr;
logic [    LogDepth:0]                     llc_ar_rptr;
logic [LlcAwWidth-1:0]                     llc_aw_data;
logic [    LogDepth:0]                     llc_aw_wptr;
logic [    LogDepth:0]                     llc_aw_rptr;
logic [ LlcBWidth-1:0]                     llc_b_data;
logic [    LogDepth:0]                     llc_b_wptr;
logic [    LogDepth:0]                     llc_b_rptr;
logic [ LlcRWidth-1:0]                     llc_r_data;
logic [    LogDepth:0]                     llc_r_wptr;
logic [    LogDepth:0]                     llc_r_rptr;
logic [ LlcWWidth-1:0]                     llc_w_data;
logic [    LogDepth:0]                     llc_w_wptr;
logic [    LogDepth:0]                     llc_w_rptr;

logic [HypNumPhys-1:0][HypNumChips-1:0]    hyper_cs_n_wire;
logic [HypNumPhys-1:0]                     hyper_ck_wire;
logic [HypNumPhys-1:0]                     hyper_ck_n_wire;
logic [HypNumPhys-1:0]                     hyper_rwds_o;
logic [HypNumPhys-1:0]                     hyper_rwds_i;
logic [HypNumPhys-1:0]                     hyper_rwds_oe;
logic [HypNumPhys-1:0][7:0]                hyper_dq_i;
logic [HypNumPhys-1:0][7:0]                hyper_dq_o;
logic [HypNumPhys-1:0]                     hyper_dq_oe;
logic [HypNumPhys-1:0]                     hyper_reset_n_wire;

  //////////
  // DRAM //
  //////////

// add DRAM instance


  //////////////////
  // Carfield SoC //
  //////////////////

carfield #(
  .Cfg (carfield_pkg::CarfieldCfgDefault),
  .ext_reg_req_t ( carfield_reg_req_t ),
  .ext_reg_rsp_t ( carfield_reg_rsp_t ),
  .LlcIdWidth    ( LlcIdWidth ),
  .LlcArWidth    ( LlcArWidth ),
  .LlcAwWidth    ( LlcAwWidth ),          
  .LlcBWidth     ( LlcBWidth  ),
  .LlcRWidth     ( LlcRWidth  ),
  .LlcWWidth     ( LlcWWidth  ),
  .HypNumPhys  (1),
  .HypNumChips (1)
) i_carfield (
  .clk_i (),
  .rst_ni (),
  .test_mode_i(),
  // Boot mode selection
  .boot_mode_i (),
  // CLINT
  .rtc_i (),
  // Cheshire JTAG Interface
  .jtag_tck_i (),
  .jtag_trst_ni (),
  .jtag_tms_i (),
  .jtag_tdi_i (),
  .jtag_tdo_o (),
  .jtag_tdo_oe_o (),
  // Secure Subsystem JTAG Interface
  .jtag_ot_tck_i (),
  .jtag_ot_trst_ni (),
  .jtag_ot_tms_i (),
  .jtag_ot_tdi_i (),
  .jtag_ot_tdo_o (),
  .jtag_ot_tdo_oe_o (),
  // Safety Island JTAG Interface
  .jtag_safety_island_tck_i (),
  .jtag_safety_island_trst_ni (),
  .jtag_safety_island_tms_i (),
  .jtag_safety_island_tdi_i (),
  .jtag_safety_island_tdo_o (),
  // UART Interface
  .uart_tx_o (),
  .uart_rx_i (),
  // Cheshire UART Interface
  .uart_ot_tx_o (),
  .uart_ot_rx_i (),
  // Controle Flow UART Modem
  .uart_rts_no (),
  .uart_dtr_no (),
  .uart_cts_ni (),
  .uart_dsr_ni (),
  .uart_dcd_ni (),
  .uart_rin_ni (),
  // I2C Interface
  .i2c_sda_o (),
  .i2c_sda_i (),
  .i2c_sda_en_o (),
  .i2c_scl_o (),
  .i2c_scl_i (),
  .i2c_scl_en_o (),
  // SPI Host Interface
  .spih_sck_o (),
  .spih_sck_en_o (),
  .spih_csb_o (),
  .spih_csb_en_o (),
  .spih_sd_o (),
  .spih_sd_en_o (),
  .spih_sd_i (),
  // GPIO interface
  .gpio_i (),
  .gpio_o (),
  .gpio_en_o (),
  // Serial link interface
  .slink_rcv_clk_i (),
  .slink_rcv_clk_o (),
  .slink_i (),
  .slink_o (),

  `ifdef TARGET_FPGA
    // LLC (DRAM) Interace
    .llc_ar_data,
    .llc_ar_wptr,
    .llc_ar_rptr,
    .llc_aw_data,
    .llc_aw_wptr,
    .llc_aw_rptr,
    .llc_b_data,
    .llc_b_wptr,
    .llc_b_rptr,
    .llc_r_data,
    .llc_r_wptr,
    .llc_r_rptr,
    .llc_w_data,
    .llc_w_wptr,
    .llc_w_rptr,
    .ext_reg_req            (dram_req),
    .ext_reg_rsp            (dram_resp),
    .hyper_cs_n_wire,
    .hyper_ck_wire,
    .hyper_ck_n_wire,
    .hyper_rwds_o,
    .hyper_rwds_i,
    .hyper_rwds_oe,
    .hyper_dq_i,
    .hyper_dq_o,
    .hyper_dq_oe,
    .hyper_reset_n_wire             
  `else
    // HyperBus clocks
    .hyp_clk_phy_i (),
    .hyp_rst_phy_ni (),
    // Physical interace: facing HyperBus
    .pad_hyper_csn (),
    .pad_hyper_ck (),
    .pad_hyper_ckn (),
    .pad_hyper_rwds (),
    .pad_hyper_reset (),
    .pad_hyper_dq ()
  `endif
);

    
endmodule