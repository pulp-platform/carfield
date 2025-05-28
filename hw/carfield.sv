// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Thomas Benz     <tbenz@ethz.ch>
// Luca Valente    <luca.valente@unibo.it>
// Yvan Tortorella <yvan.tortorella@unibo.it>
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>

`include "cheshire/typedef.svh"
`include "axi/typedef.svh"
`include "axi/assign.svh"
`include "apb/typedef.svh"

/// Top-level implementation of Carfield
module carfield
  import carfield_pkg::*;
  import carfield_reg_pkg::*;
  import cheshire_pkg::*;
  import safety_island_pkg::*;
  import tlul_ot_pkg::*;
  import spatz_cluster_pkg::*;
#(
  parameter cheshire_cfg_t Cfg = carfield_pkg::CarfieldCfgDefault,
  parameter int unsigned HypNumPhys  = 2,
  parameter int unsigned HypNumChips = 2,
`ifdef GEN_NO_HYPERBUS // bender-xilinx.mk
  parameter int unsigned LlcIdWidth,
  parameter int unsigned LlcArWidth,
  parameter int unsigned LlcAwWidth,
  parameter int unsigned LlcBWidth,
  parameter int unsigned LlcRWidth,
  parameter int unsigned LlcWWidth,
`endif
  parameter type reg_req_t           = logic,
  parameter type reg_rsp_t           = logic,
  // Having a dedicated synchronous port, the mailbox and iommus are not taken into account
  localparam int unsigned NumSlaveCDCs = Cfg.AxiExtNumSlv - 2
) (
  // host clock
  input   logic                                       host_clk_i,
  // peripheral clock
  input   logic                                       periph_clk_i,
  // accelerator and island clock
  input   logic                                       alt_clk_i,
  // external reference clock for timers (CLINT, islands)
  input   logic                                       rt_clk_i,

  input   logic                                       pwr_on_rst_ni,

  // testmode pin
  input   logic                                       test_mode_i,
  // Cheshire BOOT pins (3 pins)
  input   logic [1:0]                                 boot_mode_i,
  // Cheshire JTAG Interface
  input   logic                                       jtag_tck_i,
  input   logic                                       jtag_trst_ni,
  input   logic                                       jtag_tms_i,
  input   logic                                       jtag_tdi_i,
  output  logic                                       jtag_tdo_o,
  output  logic                                       jtag_tdo_oe_o,
  // Secure Subsystem JTAG Interface
  input   logic                                       jtag_ot_tck_i,
  input   logic                                       jtag_ot_trst_ni,
  input   logic                                       jtag_ot_tms_i,
  input   logic                                       jtag_ot_tdi_i,
  output  logic                                       jtag_ot_tdo_o,
  output  logic                                       jtag_ot_tdo_oe_o,
  // Safety Island JTAG Interface
  input   logic                                       jtag_safety_island_tck_i,
  input   logic                                       jtag_safety_island_trst_ni,
  input   logic                                       jtag_safety_island_tms_i,
  input   logic                                       jtag_safety_island_tdi_i,
  output  logic                                       jtag_safety_island_tdo_o,
  // Secure Subsystem BOOT pins
  input   logic [1:0]                                 bootmode_ot_i,
  // Safety Island BOOT pins
  input   logic [1:0]                                 bootmode_safe_isln_i,
  // Secure Boot Chain mode pin
  input   logic                                       secure_boot_i,
  // Host UART Interface
  output logic                                        uart_tx_o,
  input  logic                                        uart_rx_i,
  // Secure Subsystem UART Interface
  output logic                                        uart_ot_tx_o,
  input  logic                                        uart_ot_rx_i,
  // Host I2C Interface pins
  output logic                                        i2c_sda_o,
  input  logic                                        i2c_sda_i,
  output logic                                        i2c_sda_en_o,
  output logic                                        i2c_scl_o,
  input  logic                                        i2c_scl_i,
  output logic                                        i2c_scl_en_o,
  // Host SPI Master Interface
  output logic                                        spih_sck_o,
  output logic                                        spih_sck_en_o,
  output logic [SpihNumCs-1:0]                        spih_csb_o,
  output logic [SpihNumCs-1:0]                        spih_csb_en_o,
  output logic [ 3:0]                                 spih_sd_o,
  output logic [ 3:0]                                 spih_sd_en_o,
  input  logic [ 3:0]                                 spih_sd_i,
  // Secure Subsystem QSPI Master Interface
  output logic                                        spih_ot_sck_o,
  output logic                                        spih_ot_sck_en_o,
  output logic                                        spih_ot_csb_o,
  output logic                                        spih_ot_csb_en_o,
  output logic [ 3:0]                                 spih_ot_sd_o,
  output logic [ 3:0]                                 spih_ot_sd_en_o,
  input  logic [ 3:0]                                 spih_ot_sd_i,
  // ETHERNET interface
  input  logic                                        eth_rxck_i,
  input  logic                                        eth_rxctl_i,
  input  logic  [ 3:0]                                eth_rxd_i,
  input  logic                                        eth_md_i,
  output logic                                        eth_txck_o,
  output logic                                        eth_txctl_o,
  output logic  [ 3:0]                                eth_txd_o,
  output logic                                        eth_md_o,
  output logic                                        eth_md_oe,
  output logic                                        eth_mdc_o,
  output logic                                        eth_rst_n_o,
  // CAN interface
  input  logic                                        can_rx_i,
  output logic                                        can_tx_o,
  // GPIOs
  input  logic [31:0]                                 gpio_i,
  output logic [31:0]                                 gpio_o,
  output logic [31:0]                                 gpio_en_o,
  // Serial link interface
  input  logic [SlinkNumChan-1:0]                     slink_rcv_clk_i,
  output logic [SlinkNumChan-1:0]                     slink_rcv_clk_o,
  input  logic [SlinkNumChan-1:0][SlinkNumLanes-1:0]  slink_i,
  output logic [SlinkNumChan-1:0][SlinkNumLanes-1:0]  slink_o,
  // HyperBus interface
  output logic [HypNumPhys-1:0][HypNumChips-1:0]      hyper_cs_no,
  output logic [HypNumPhys-1:0]                       hyper_ck_o,
  output logic [HypNumPhys-1:0]                       hyper_ck_no,
  output logic [HypNumPhys-1:0]                       hyper_rwds_o,
  input  logic [HypNumPhys-1:0]                       hyper_rwds_i,
  output logic [HypNumPhys-1:0]                       hyper_rwds_oe_o,
  input  logic [HypNumPhys-1:0][7:0]                  hyper_dq_i,
  output logic [HypNumPhys-1:0][7:0]                  hyper_dq_o,
  output logic [HypNumPhys-1:0]                       hyper_dq_oe_o,
  output logic [HypNumPhys-1:0]                       hyper_reset_no,
`ifdef GEN_NO_HYPERBUS
  // LLC interface
  output logic [LlcArWidth-1:0] llc_ar_data,
  output logic [    LogDepth:0] llc_ar_wptr,
  input  logic [    LogDepth:0] llc_ar_rptr,
  output logic [LlcAwWidth-1:0] llc_aw_data,
  output logic [    LogDepth:0] llc_aw_wptr,
  input  logic [    LogDepth:0] llc_aw_rptr,
  input  logic [ LlcBWidth-1:0] llc_b_data,
  input  logic [    LogDepth:0] llc_b_wptr,
  output logic [    LogDepth:0] llc_b_rptr,
  input  logic [ LlcRWidth-1:0] llc_r_data,
  input  logic [    LogDepth:0] llc_r_wptr,
  output logic [    LogDepth:0] llc_r_rptr,
  output logic [ LlcWWidth-1:0] llc_w_data,
  output logic [    LogDepth:0] llc_w_wptr,
  input  logic [    LogDepth:0] llc_w_rptr,
`endif // GEN_NO_HYPERBUS

  // External reg interface slaves (async)
  // Currently for PLL and Padframe
  output logic     [1:0]                              ext_reg_async_slv_req_o,
  input  logic     [1:0]                              ext_reg_async_slv_ack_i,
  output reg_req_t [1:0]                              ext_reg_async_slv_data_o,
  input  logic     [1:0]                              ext_reg_async_slv_req_i,
  output logic     [1:0]                              ext_reg_async_slv_ack_o,
  input  reg_rsp_t [1:0]                              ext_reg_async_slv_data_i,
  // Debug signals
  output carfield_debug_sigs_t                        debug_signals_o
);

/*********************************
* General parameters and defines *
**********************************/
`CHESHIRE_TYPEDEF_ALL(carfield_, Cfg)

// Clocking and reset strategy
logic    periph_rst_n;
logic    safety_rst_n;
logic    security_rst_n;
logic    pulp_rst_n;
logic    spatz_rst_n;
logic    l2_rst_n;

logic    host_pwr_on_rst_n;
logic    periph_pwr_on_rst_n;
logic    safety_pwr_on_rst_n;
logic    security_pwr_on_rst_n;
logic    pulp_pwr_on_rst_n;
logic    spatz_pwr_on_rst_n;
logic    l2_pwr_on_rst_n;

logic  periph_clk;
logic  safety_clk;
logic  security_clk;
logic  pulp_clk;
logic  spatz_clk;
logic  l2_clk;

// verilog_lint: waive-start line-length
// Peripheral interrupts
logic [Cfg.NumExtOutIntrs-1:0]      chs_intrs_distributed;
logic [Cfg.NumExtIrqHarts-1:0]      chs_mti;
logic [CarfieldNumPeriphsIntrs-1:0] car_periph_intrs;

logic       car_sys_timer_lo_intr, car_sys_timer_hi_intr,  car_sys_timer_lo_intr_sync, car_sys_timer_hi_intr_sync;
logic [3:0] car_adv_timer_intrs, car_adv_timer_events, car_adv_timer_intrs_sync, car_adv_timer_events_sync;
logic [4:0] car_wdt_intrs;
logic       car_can_intr;
logic       car_eth_intr;

// Carfield peripheral interrupts
// Propagate edge-triggered interrupts between periph and host clock domains

// Advanced timer
for (genvar i=0; i < CarfieldNumAdvTimerIntrs; i++) begin : gen_sync_adv_timer_intrs
  edge_propagator i_sync_adv_timer_intrs (
    .clk_tx_i  ( periph_clk                  ),
    .rstn_tx_i ( periph_pwr_on_rst_n         ),
    .edge_i    ( car_adv_timer_intrs[i]      ),
    .clk_rx_i  ( host_clk_i                  ),
    .rstn_rx_i ( host_pwr_on_rst_n           ),
    .edge_o    ( car_adv_timer_intrs_sync[i] )
  );
end

for (genvar i=0; i < CarfieldNumAdvTimerEvents; i++) begin : gen_sync_adv_timer_events
  edge_propagator i_sync_adv_timer_events (
    .clk_tx_i  ( periph_clk                   ),
    .rstn_tx_i ( periph_pwr_on_rst_n          ),
    .edge_i    ( car_adv_timer_events[i]      ),
    .clk_rx_i  ( host_clk_i                   ),
    .rstn_rx_i ( host_pwr_on_rst_n            ),
    .edge_o    ( car_adv_timer_events_sync[i] )
  );
end

// System timer
edge_propagator i_sync_sys_timer_lo_intr (
  .clk_tx_i  ( periph_clk                 ),
  .rstn_tx_i ( periph_pwr_on_rst_n        ),
  .edge_i    ( car_sys_timer_lo_intr      ),
  .clk_rx_i  ( host_clk_i                 ),
  .rstn_rx_i ( host_pwr_on_rst_n          ),
  .edge_o    ( car_sys_timer_lo_intr_sync )
);

edge_propagator i_sync_sys_timer_hi_intr (
  .clk_tx_i  ( periph_clk                 ),
  .rstn_tx_i ( periph_pwr_on_rst_n        ),
  .edge_i    ( car_sys_timer_hi_intr      ),
  .clk_rx_i  ( host_clk_i                 ),
  .rstn_rx_i ( host_pwr_on_rst_n          ),
  .edge_o    ( car_sys_timer_hi_intr_sync )
);

// Collect carfield peripheral interrupts to feed cheshire in the host domain
assign car_periph_intrs = {
  car_eth_intr,               // 1
  car_sys_timer_hi_intr_sync, // 1
  car_sys_timer_lo_intr_sync, // 1
  car_adv_timer_events_sync,  // 4
  car_adv_timer_intrs_sync,   // 4
  car_can_intr,               // 1
  car_wdt_intrs               // 5
};

// Mailbox unit interrupts

localparam int unsigned CheshireNumIntHarts = Cfg.NumCores;
localparam int unsigned SafedNumIntHarts    = 1;
localparam int unsigned SecdNumIntHarts     = 1;

// TODO: Comment these constants: the name is not clear, I personally prefer to have raw numbers
//localparam int unsigned IntClusterNumIrq    = 1;
//localparam int unsigned FPClusterNumIrq     = 1;

// Number of receiving side mailboxes per subsystem
// For Cheshire, 4 mailboxes for each application class processor
localparam int unsigned NumMailboxesHostd      = 4 * CheshireNumIntHarts;
localparam int unsigned NumMailboxesFPCluster  = spatz_cluster_pkg::NumCores * (CheshireNumIntHarts + SafedNumIntHarts);
localparam int unsigned NumMailboxesIntCluster = CheshireNumIntHarts + SafedNumIntHarts;
// For the safety island, consider host domain and security island, and one callback SW interrupt
// from integer and floating point clusters
localparam int unsigned NumMailboxesSafed      = CheshireNumIntHarts + SecdNumIntHarts + 1 + 1; //+ IntClusterNumIrq + FPClusterNumIrq;
localparam int unsigned NumMailboxesSecd       = CheshireNumIntHarts + SafedNumIntHarts;
localparam int unsigned NumMailboxes           = NumMailboxesHostd + NumMailboxesFPCluster + NumMailboxesIntCluster + NumMailboxesSafed + NumMailboxesSecd;
// verilog_lint: waive-stop line-length

// Interrupt lines
logic [NumMailboxes-1:0] snd_mbox_intrs;

// Floating point cluster (Spatz cluster)

// from hostd to spatz cluster
logic [spatz_cluster_pkg::NumCores-1:0][CheshireNumIntHarts-1:0] hostd_spatzcl_mbox_intr;
// from safety island to spatz cluster
logic [spatz_cluster_pkg::NumCores-1:0] safed_spatzcl_mbox_intr;
// Integer cluster (PULP cluster)
logic [CheshireNumIntHarts-1:0] hostd_pulpcl_mbox_intr;  // from hostd to pulp cluster
logic                           safed_pulpcl_mbox_intr;  // from safety island to pulp cluster
// Security island
logic                           safed_secd_mbox_intr;    // from safety island to security island
logic [CheshireNumIntHarts-1:0] hostd_secd_mbox_intr;    // from (dual) cva6 to security island
// Safety island
logic                           spatzcl_safed_mbox_intr; // from spatz cluster to safety island
logic                           pulpcl_safed_mbox_intr;  // from pulp cluster to safety island
logic                           secd_safed_mbox_intr;    // from security island to safety island
logic [CheshireNumIntHarts-1:0] hostd_safed_mbox_intr;   // from hostd to safety island
// Host domain
logic [CheshireNumIntHarts-1:0] spatzcl_hostd_mbox_intr; // from spatz cluster to host domain
logic [CheshireNumIntHarts-1:0] pulpcl_hostd_mbox_intr;  // from pulp cluster to hostd domain
logic [CheshireNumIntHarts-1:0] secd_hostd_mbox_intr;    // from security island to host domain
logic [CheshireNumIntHarts-1:0] safed_hostd_mbox_intr;   // from safety island to host domain

// Integer Cluster
logic [IntClusterNumCores-1:0] pulpcl_dbg_reqs;

// Safety Island
logic [MaxHartId:0] safed_dbg_reqs;
assign pulpcl_dbg_reqs = safed_dbg_reqs[PulpHartIdOffs+:IntClusterNumCores];

// Generate indices and get maps for all ports
localparam axi_in_t   AxiIn   = gen_axi_in(Cfg);
localparam axi_out_t  AxiOut  = gen_axi_out(Cfg);

///////////////////////////////
// Wide Parameters: A48, D32 //
///////////////////////////////

localparam int unsigned AxiSlvIdWidth = Cfg.AxiMstIdWidth + $clog2(AxiIn.num_in);

// Wide AXI types
typedef logic [       Cfg.AddrWidth-1:0] car_addrw_t;
typedef logic [    Cfg.AxiDataWidth-1:0] car_dataw_t;
typedef logic [(Cfg.AxiDataWidth)/8-1:0] car_strb_t;
typedef logic [    Cfg.AxiUserWidth-1:0] car_usr_t;
typedef logic [       AxiSlvIdWidth-1:0] car_slv_id_t;

// Slave CDC parameters
localparam int unsigned CarfieldAxiSlvAwWidth =
                        (2**LogDepth)*axi_pkg::aw_width(Cfg.AddrWidth   ,
                                                        AxiSlvIdWidth   ,
                                                        Cfg.AxiUserWidth);
localparam int unsigned CarfieldAxiSlvWWidth  =
                        (2**LogDepth)*axi_pkg::w_width(Cfg.AxiDataWidth,
                                                       Cfg.AxiUserWidth);
localparam int unsigned CarfieldAxiSlvBWidth  =
                        (2**LogDepth)*axi_pkg::b_width(AxiSlvIdWidth   ,
                                                       Cfg.AxiUserWidth);
localparam int unsigned CarfieldAxiSlvArWidth =
                        (2**LogDepth)*axi_pkg::ar_width(Cfg.AddrWidth   ,
                                                        AxiSlvIdWidth   ,
                                                        Cfg.AxiUserWidth);
localparam int unsigned CarfieldAxiSlvRWidth  =
                        (2**LogDepth)*axi_pkg::r_width(Cfg.AxiDataWidth,
                                                       AxiSlvIdWidth   ,
                                                       Cfg.AxiUserWidth);

// Master CDC parameters
localparam int unsigned CarfieldAxiMstAwWidth =
                        (2**LogDepth)*axi_pkg::aw_width(Cfg.AddrWidth    ,
                                                        Cfg.AxiMstIdWidth,
                                                        Cfg.AxiUserWidth );
localparam int unsigned CarfieldAxiMstWWidth  =
                        (2**LogDepth)*axi_pkg::w_width(Cfg.AxiDataWidth,
                                                       Cfg.AxiUserWidth);
localparam int unsigned CarfieldAxiMstBWidth  =
                        (2**LogDepth)*axi_pkg::b_width(Cfg.AxiMstIdWidth,
                                                      Cfg.AxiUserWidth  );
localparam int unsigned CarfieldAxiMstArWidth =
                        (2**LogDepth)*axi_pkg::ar_width(Cfg.AddrWidth    ,
                                                        Cfg.AxiMstIdWidth,
                                                        Cfg.AxiUserWidth );
localparam int unsigned CarfieldAxiMstRWidth  =
                        (2**LogDepth)*axi_pkg::r_width(Cfg.AxiDataWidth ,
                                                       Cfg.AxiMstIdWidth,
                                                       Cfg.AxiUserWidth );

// External register interface synchronous with Cheshire's clock domain
carfield_reg_req_t [iomsb(NumSyncRegSlv):0] ext_reg_req, ext_reg_req_cut;
carfield_reg_rsp_t [iomsb(NumSyncRegSlv):0] ext_reg_rsp, ext_reg_rsp_cut;

`ifndef GEN_NO_HYPERBUS // bender-xilinx.mk
localparam int unsigned LlcIdWidth = Cfg.AxiMstIdWidth   +
                                     $clog2(AxiIn.num_in)+
                                     Cfg.LlcNotBypass    ;
localparam int unsigned LlcArWidth = (2**LogDepth)*
                                     axi_pkg::ar_width(Cfg.AddrWidth   ,
                                                       LlcIdWidth      ,
                                                       Cfg.AxiUserWidth);
localparam int unsigned LlcAwWidth = (2**LogDepth)*
                                      axi_pkg::aw_width(Cfg.AddrWidth  ,
                                                       LlcIdWidth      ,
                                                       Cfg.AxiUserWidth);
localparam int unsigned LlcBWidth  = (2**LogDepth)*
                                      axi_pkg::b_width(LlcIdWidth     ,
                                                       Cfg.AxiUserWidth);
localparam int unsigned LlcRWidth  = (2**LogDepth)*
                                      axi_pkg::r_width(Cfg.AxiDataWidth,
                                                      LlcIdWidth      ,
                                                      Cfg.AxiUserWidth);
localparam int unsigned LlcWWidth  = (2**LogDepth)*
                                      axi_pkg::w_width(Cfg.AxiDataWidth,
                                                       Cfg.AxiUserWidth );

logic [LlcArWidth-1:0] llc_ar_data;
logic [    LogDepth:0] llc_ar_wptr;
logic [    LogDepth:0] llc_ar_rptr;
logic [LlcAwWidth-1:0] llc_aw_data;
logic [    LogDepth:0] llc_aw_wptr;
logic [    LogDepth:0] llc_aw_rptr;
logic [ LlcBWidth-1:0] llc_b_data;
logic [    LogDepth:0] llc_b_wptr;
logic [    LogDepth:0] llc_b_rptr;
logic [ LlcRWidth-1:0] llc_r_data;
logic [    LogDepth:0] llc_r_wptr;
logic [    LogDepth:0] llc_r_rptr;
logic [ LlcWWidth-1:0] llc_w_data;
logic [    LogDepth:0] llc_w_wptr;
logic [    LogDepth:0] llc_w_rptr;

`endif // GEN_NO_HYPERBUS

logic hyper_isolate_req, hyper_isolated_rsp;
logic security_island_isolate_req;

logic [iomsb(Cfg.AxiExtNumSlv):0] slave_isolate_req, slave_isolated_rsp, slave_isolated;
logic [iomsb(Cfg.AxiExtNumMst):0] master_isolated_rsp;

// All AXI Slaves (the Mailbox)
logic [iomsb(NumSlaveCDCs):0][CarfieldAxiSlvAwWidth-1:0] axi_slv_ext_aw_data;
logic [iomsb(NumSlaveCDCs):0][               LogDepth:0] axi_slv_ext_aw_wptr;
logic [iomsb(NumSlaveCDCs):0][               LogDepth:0] axi_slv_ext_aw_rptr;
logic [iomsb(NumSlaveCDCs):0][ CarfieldAxiSlvWWidth-1:0] axi_slv_ext_w_data ;
logic [iomsb(NumSlaveCDCs):0][               LogDepth:0] axi_slv_ext_w_wptr ;
logic [iomsb(NumSlaveCDCs):0][               LogDepth:0] axi_slv_ext_w_rptr ;
logic [iomsb(NumSlaveCDCs):0][ CarfieldAxiSlvBWidth-1:0] axi_slv_ext_b_data ;
logic [iomsb(NumSlaveCDCs):0][               LogDepth:0] axi_slv_ext_b_wptr ;
logic [iomsb(NumSlaveCDCs):0][               LogDepth:0] axi_slv_ext_b_rptr ;
logic [iomsb(NumSlaveCDCs):0][CarfieldAxiSlvArWidth-1:0] axi_slv_ext_ar_data;
logic [iomsb(NumSlaveCDCs):0][               LogDepth:0] axi_slv_ext_ar_wptr;
logic [iomsb(NumSlaveCDCs):0][               LogDepth:0] axi_slv_ext_ar_rptr;
logic [iomsb(NumSlaveCDCs):0][ CarfieldAxiSlvRWidth-1:0] axi_slv_ext_r_data ;
logic [iomsb(NumSlaveCDCs):0][               LogDepth:0] axi_slv_ext_r_wptr ;
logic [iomsb(NumSlaveCDCs):0][               LogDepth:0] axi_slv_ext_r_rptr ;

// All AXI Masters
logic [iomsb(Cfg.AxiExtNumMst):0][CarfieldAxiMstAwWidth-1:0] axi_mst_ext_aw_data;
logic [iomsb(Cfg.AxiExtNumMst):0][               LogDepth:0] axi_mst_ext_aw_wptr;
logic [iomsb(Cfg.AxiExtNumMst):0][               LogDepth:0] axi_mst_ext_aw_rptr;
logic [iomsb(Cfg.AxiExtNumMst):0][ CarfieldAxiMstWWidth-1:0] axi_mst_ext_w_data ;
logic [iomsb(Cfg.AxiExtNumMst):0][               LogDepth:0] axi_mst_ext_w_wptr ;
logic [iomsb(Cfg.AxiExtNumMst):0][               LogDepth:0] axi_mst_ext_w_rptr ;
logic [iomsb(Cfg.AxiExtNumMst):0][ CarfieldAxiMstBWidth-1:0] axi_mst_ext_b_data ;
logic [iomsb(Cfg.AxiExtNumMst):0][               LogDepth:0] axi_mst_ext_b_wptr ;
logic [iomsb(Cfg.AxiExtNumMst):0][               LogDepth:0] axi_mst_ext_b_rptr ;
logic [iomsb(Cfg.AxiExtNumMst):0][CarfieldAxiMstArWidth-1:0] axi_mst_ext_ar_data;
logic [iomsb(Cfg.AxiExtNumMst):0][               LogDepth:0] axi_mst_ext_ar_wptr;
logic [iomsb(Cfg.AxiExtNumMst):0][               LogDepth:0] axi_mst_ext_ar_rptr;
logic [iomsb(Cfg.AxiExtNumMst):0][ CarfieldAxiMstRWidth-1:0] axi_mst_ext_r_data ;
logic [iomsb(Cfg.AxiExtNumMst):0][               LogDepth:0] axi_mst_ext_r_wptr ;
logic [iomsb(Cfg.AxiExtNumMst):0][               LogDepth:0] axi_mst_ext_r_rptr ;

// soc reg signals
carfield_reg2hw_t car_regs_reg2hw;
carfield_hw2reg_t car_regs_hw2reg;

logic     [NumAsyncRegSlv-1:0] ext_reg_async_slv_req_out;
logic     [NumAsyncRegSlv-1:0] ext_reg_async_slv_ack_in;
reg_req_t [NumAsyncRegSlv-1:0] ext_reg_async_slv_data_out;
logic     [NumAsyncRegSlv-1:0] ext_reg_async_slv_req_in;
logic     [NumAsyncRegSlv-1:0] ext_reg_async_slv_ack_out;
reg_rsp_t [NumAsyncRegSlv-1:0] ext_reg_async_slv_data_in;

// External reg interface slaves (async)
// Currently for PLL and Padframe
for (genvar i = 0; i < 2; i++) begin : gen_ext_reg_assign
  assign ext_reg_async_slv_req_o[i]   = ext_reg_async_slv_req_out[i];
  assign ext_reg_async_slv_ack_in[i]  = ext_reg_async_slv_ack_i[i];
  assign ext_reg_async_slv_data_o[i]  = ext_reg_async_slv_data_out[i];
  assign ext_reg_async_slv_req_in[i]  = ext_reg_async_slv_req_i[i];
  assign ext_reg_async_slv_ack_o[i]   = ext_reg_async_slv_ack_out[i];
  assign ext_reg_async_slv_data_in[i] = ext_reg_async_slv_data_i[i];
end

// Clocking and reset strategy
// We have three clock sources that are multiplexed to 6 domains. The default assignment after
// hard reset is:
// periph (periph_clk_i) and accelerators (alt_clk_i)
//
// The host is statically always assigned to host_clk_i.
//
// Furthermore we have six reset domains:
// host             (contained in host clock domain, POR only, no SW reset)
// periph           (sw reset 0)
// safety           (sw reset 1)
// security         (sw reset 2)
// pulp_cluster     (sw reset 3)
// spatz_cluster    (sw reset 4)
// shared_l2_memory (sw reset 5)

// Clock Multiplexing for each sub block
localparam int unsigned DomainClkDivValueWidth = 24;
typedef logic [DomainClkDivValueWidth-1:0] domain_clk_div_value_t;
logic [NumDomains-1:0] domain_clk;
logic [NumDomains-1:0] domain_clk_en;
logic [NumDomains-1:0] domain_clk_gated;
logic [NumDomains-1:0][1:0] domain_clk_sel;

logic [NumDomains-1:0] domain_clk_div_changed;
logic [NumDomains-1:0] domain_clk_div_decoupled_valid, domain_clk_div_decoupled_ready;
domain_clk_div_value_t [NumDomains-1:0] domain_clk_div_value;
domain_clk_div_value_t [NumDomains-1:0] domain_clk_div_value_decoupled;
logic [NumDomains-1:0] domain_clk_div_valid_synced, domain_clk_div_ready_synced;
domain_clk_div_value_t [NumDomains-1:0] domain_clk_div_value_synced;

// Note that each accelerator has two resets: One for the combined
// software/power-on reset and a power-on reset only
logic [NumDomains-1:0] pwr_on_rsts_n;
logic [NumDomains-1:0] rsts_n;


// Each of the 6 clock gateable domains (periph, safety island, security island, l2, spatz and pulp
// cluster) have the following clock distribution scheme:
// 1. For each domain the user selects one of 3 different clock sources (host clock, alt clock and
//    per clock). Each of these main clocks are either supplied externally, by a dedicated PLL per
//    clock source or by a single PLL that supplies all three clock sources. The configuration of
//    the clock source is handled by the external PLL wrapper configuration registers.
// 2. The selected clock source for the domain is fed into a default-bypassed arbitrary integer
//    clock divider with 50% duty cycle. This allows to use different integer clock divisions for
//    every target domain to use different clock frequencies.
// 3. The internal clock gate of the clock divider is used to provide clock gating for the domain.

for (genvar i = 0; i < NumDomains; i++) begin : gen_domain_clock_mux
  clk_mux_glitch_free #(
    .NUM_INPUTS(3)
  ) i_clk_mux (
    .clks_i       ( {periph_clk_i, alt_clk_i, host_clk_i} ),
    .test_clk_i   ( 1'b0                                  ),
    .test_en_i    ( 1'b0                                  ),
    .async_rstn_i ( host_pwr_on_rst_n                     ),
    .async_sel_i  ( domain_clk_sel[i]                     ),
    .clk_o        ( domain_clk[i]                         )
  );

  // The register file does not support back pressure directly. I.e the hardware side cannot tell
  // the regfile that a reg value cannot be written at the moment. This is a problem since the clk
  // divider input of the clk_int_div module will stall the transaction until it is safe to change
  // the clock division factor. The stream_deposit module converts between these two protocols
  // (write-pulse only protocol <-> ready-valid protocol). See the documentation in the header of
  // the module for more details.
  lossy_valid_to_stream #(
    .T(domain_clk_div_value_t)
  ) i_decouple (
    .clk_i   ( host_clk_i                        ), // Connected to host clock since the soc_ctr
                                                    // regs are clocked with it
    .rst_ni  ( host_pwr_on_rst_n                 ), // See above
    .valid_i ( domain_clk_div_changed[i]         ),
    .data_i  ( domain_clk_div_value[i]           ),
    .valid_o ( domain_clk_div_decoupled_valid[i] ),
    .ready_i ( domain_clk_div_decoupled_ready[i] ),
    .data_o  ( domain_clk_div_value_decoupled[i] ),
    .busy_o  ( )
  );

  // We have to synchronize the division value into the clock domain of the undivided source clock.
  cdc_4phase #(
    .T(domain_clk_div_value_t)
  ) i_cdc (
    .src_rst_ni  ( host_pwr_on_rst_n                 ),
    .src_clk_i   ( host_clk_i                        ),
    .src_data_i  ( domain_clk_div_value_decoupled[i] ),
    .src_valid_i ( domain_clk_div_decoupled_valid[i] ),
    .src_ready_o ( domain_clk_div_decoupled_ready[i] ),
    .dst_rst_ni  ( pwr_on_rsts_n[i]                  ), // Use POR-only on both sides. Partial reset
                                                        // problem for SW-reset is thus not
                                                        // possible.
    .dst_clk_i   ( domain_clk[i]                     ),
    .dst_data_o  ( domain_clk_div_value_synced[i]    ),
    .dst_valid_o ( domain_clk_div_valid_synced[i]    ),
    .dst_ready_i ( domain_clk_div_ready_synced[i]    )
  );

  clk_int_div #(
    .DIV_VALUE_WIDTH(DomainClkDivValueWidth),
    .DEFAULT_DIV_VALUE(CarfieldClkDivValue.clock_div_value[i]),
    .ENABLE_CLOCK_IN_RESET(1)
  ) i_clk_div (
    .clk_i          ( domain_clk[i]                  ),
    .rst_ni         ( pwr_on_rsts_n[i]               ), // Only reset during power-on. Software
                                                        // resets will not affect it.
    .en_i           ( domain_clk_en[i]               ),
    .test_mode_en_i ( test_mode_i                    ),
    .div_i          ( domain_clk_div_value_synced[i] ),
    .div_valid_i    ( domain_clk_div_valid_synced[i] ),
    .div_ready_o    ( domain_clk_div_ready_synced[i] ),
    .clk_o          ( domain_clk_gated[i]            ),
    .cycl_count_o  (                                ) // Not needed
  );
end

// Reset generation for power-on reset for host domain. For the other domain we
// get this from carfield_rstgen
rstgen i_host_rstgen (
  .clk_i  (host_clk_i),
  .rst_ni (pwr_on_rst_ni),
  .test_mode_i,
  .rst_no (host_pwr_on_rst_n),
  .init_no () // TODO: connect ?
);


// Reset generation combining software and power-on reset. These are software
// controllable resets. The matching of clock and reset domain is according to
// the description above
logic [NumDomains-1:0] reset_vector;

carfield_rstgen #(
  .NumRstDomains (NumDomains)
) i_carfield_rstgen (
  .clks_i(domain_clk),
  .pwr_on_rst_ni,
  .sw_rsts_ni(~reset_vector),
  .test_mode_i,
  .rsts_no(rsts_n),
  .pwr_on_rsts_no(pwr_on_rsts_n),
  .inits_no() // TODO: connect ?
);

// Assign vectorized reset and clock signals to friendly-named domain signals and registers

// verilog_lint: waive-start line-length
assign periph_rst_n   = rsts_n[CarfieldDomainIdx.periph];

assign periph_pwr_on_rst_n   = pwr_on_rsts_n[CarfieldDomainIdx.periph];

assign periph_clk   = domain_clk_gated[CarfieldDomainIdx.periph];

assign domain_clk_sel[CarfieldDomainIdx.periph] = car_regs_reg2hw.periph_clk_sel.q;

assign domain_clk_div_value[CarfieldDomainIdx.periph] = car_regs_reg2hw.periph_clk_div_value.q;

assign domain_clk_div_changed[CarfieldDomainIdx.periph] = car_regs_reg2hw.periph_clk_div_value.qe;

assign domain_clk_en[CarfieldDomainIdx.periph] = car_regs_reg2hw.periph_clk_en.q;

// Assign debug signals
assign debug_signals_o.domain_clk    = domain_clk_gated;
assign debug_signals_o.domain_rsts_n = rsts_n;
assign debug_signals_o.host_pwr_on_rst_n = host_pwr_on_rst_n;
// verilog_lint: waive-stop line-length

//
// Carfield Control and Status registers
//

// Cut synchronous register interface
for (genvar i=0; i<NumSyncRegSlv; i++ ) begin : gen_chs_ext_reg_cut
  reg_cut #(
    .req_t ( carfield_reg_req_t ),
    .rsp_t ( carfield_reg_rsp_t )
  ) i_chs_sync_ext_reg_cut (
    .clk_i     ( host_clk_i ),
    .rst_ni    ( host_pwr_on_rst_n ),
    .src_req_i ( ext_reg_req ),
    .src_rsp_o ( ext_reg_rsp ),
    .dst_req_o ( ext_reg_req_cut ),
    .dst_rsp_i ( ext_reg_rsp_cut )
  );
end

// Passsing the `ext_reg_req_cut[CarfieldRegBusSlvIdx.pcrs]` value to the
// reg_req_i/rsp_o buses results in Questa's `Fatal: Unexpected signal: 11.`
// at compile time. Direct casting 'int(CarfieldRegBusSlvIdx.pcrs) also does
// not work resulting in the ext_reg_rsp_cut bus being all X. The localparam
// seems to solve the issue.
localparam int unsigned PcrsIdx = CarfieldRegBusSlvIdx.pcrs;
carfield_reg_top #(
  .reg_req_t(carfield_reg_req_t),
  .reg_rsp_t(carfield_reg_rsp_t)
) i_carfield_reg_top (
  .clk_i (host_clk_i),
  .rst_ni (host_pwr_on_rst_n),
  .reg_req_i(ext_reg_req_cut[PcrsIdx]),
  .reg_rsp_o(ext_reg_rsp_cut[PcrsIdx]),
  .reg2hw (car_regs_reg2hw),
  .hw2reg (car_regs_hw2reg),
  .devmode_i (1'b1)
);

// hyperbus reg req/rsp
carfield_a32_d32_reg_req_t reg_hyper_req;
carfield_a32_d32_reg_rsp_t reg_hyper_rsp;

// wdt reg req/rsp
carfield_a32_d32_reg_req_t reg_wdt_req;
carfield_a32_d32_reg_rsp_t reg_wdt_rsp;

// mailbox
carfield_axi_slv_req_t axi_mbox_req, axi_amo_mbox_req,
  axi_pre_amo_cut_mbox_req, axi_post_amo_cut_mbox_req;
carfield_axi_slv_rsp_t axi_mbox_rsp, axi_amo_mbox_rsp,
  axi_pre_amo_cut_mbox_rsp, axi_post_amo_cut_mbox_rsp;

//////////////////
// Carfield IPs //
//////////////////

// Cheshire SoC
// Host Clock Domain

// Interrupts
logic [CarfieldNumExtIntrs-1:0] chs_ext_intrs;
logic [IntClusterNumEoc-1:0]    pulpcl_eoc;
logic                           l2_ecc_err;

// Edge-triggered interrupts from a different clock domain than cheshire (host clock domain) have
// been synchronized already. Synchronization of level-sensitive interrupts is handled within the
// module, before or inside the interrupt controller.
assign chs_ext_intrs  = {
  // tie unused to 0
  {(CarfieldNumExtIntrs-23){1'b0}},
  // System peripherals
  car_periph_intrs,        // 17
  // L2 ECC
  l2_ecc_err,              // 1
  // Mailboxes
  secd_hostd_mbox_intr,    // 1
  safed_hostd_mbox_intr,   // 1
  spatzcl_hostd_mbox_intr, // 1
  pulpcl_hostd_mbox_intr,  // 1
  pulpcl_eoc               // from integer cluster
};

`ifndef CHS_NETLIST
cheshire_wrap #(
  .Cfg                            ( Cfg                          ),
  .ExtHartinfo                    ( '0                           ),
  .NumExtIntrs                    ( CarfieldNumExtIntrs          ),
  .cheshire_axi_ext_llc_ar_chan_t ( carfield_axi_llc_ar_chan_t   ),
  .cheshire_axi_ext_llc_aw_chan_t ( carfield_axi_llc_aw_chan_t   ),
  .cheshire_axi_ext_llc_b_chan_t  ( carfield_axi_llc_b_chan_t    ),
  .cheshire_axi_ext_llc_r_chan_t  ( carfield_axi_llc_r_chan_t    ),
  .cheshire_axi_ext_llc_w_chan_t  ( carfield_axi_llc_w_chan_t    ),
  .cheshire_axi_ext_llc_req_t     ( carfield_axi_llc_req_t       ),
  .cheshire_axi_ext_llc_rsp_t     ( carfield_axi_llc_rsp_t       ),
  .cheshire_axi_ext_mst_ar_chan_t ( carfield_axi_mst_ar_chan_t   ),
  .cheshire_axi_ext_mst_aw_chan_t ( carfield_axi_mst_aw_chan_t   ),
  .cheshire_axi_ext_mst_b_chan_t  ( carfield_axi_mst_b_chan_t    ),
  .cheshire_axi_ext_mst_r_chan_t  ( carfield_axi_mst_r_chan_t    ),
  .cheshire_axi_ext_mst_w_chan_t  ( carfield_axi_mst_w_chan_t    ),
  .cheshire_axi_ext_mst_req_t     ( carfield_axi_mst_req_t       ),
  .cheshire_axi_ext_mst_rsp_t     ( carfield_axi_mst_rsp_t       ),
  .cheshire_axi_ext_slv_ar_chan_t ( carfield_axi_slv_ar_chan_t   ),
  .cheshire_axi_ext_slv_aw_chan_t ( carfield_axi_slv_aw_chan_t   ),
  .cheshire_axi_ext_slv_b_chan_t  ( carfield_axi_slv_b_chan_t    ),
  .cheshire_axi_ext_slv_r_chan_t  ( carfield_axi_slv_r_chan_t    ),
  .cheshire_axi_ext_slv_w_chan_t  ( carfield_axi_slv_w_chan_t    ),
  .cheshire_axi_ext_slv_req_t     ( carfield_axi_slv_req_t       ),
  .cheshire_axi_ext_slv_rsp_t     ( carfield_axi_slv_rsp_t       ),
  .cheshire_reg_ext_req_t         ( carfield_reg_req_t           ),
  .cheshire_reg_ext_rsp_t         ( carfield_reg_rsp_t           ),
  .LogDepth                       ( LogDepth                     ),
  .CdcSyncStages                  ( SyncStages                   ),
  .NumSlaveCDCs                   ( NumSlaveCDCs                 ),
  .AxiIn                          ( AxiIn                        ),
  .AxiOut                         ( AxiOut                       )
) i_cheshire_wrap                 (
`else
cheshire i_cheshire_wrap                 (
`endif
  .clk_i              ( host_clk_i         ),
  .rst_ni             ( host_pwr_on_rst_n  ),
  .test_mode_i                    ,
  .boot_mode_i                    ,
  .rtc_i              ( rt_clk_i          ),
  // External AXI LLC (DRAM) port
  .axi_llc_isolate_i  ( hyper_isolate_req  ),
  .axi_llc_isolated_o ( hyper_isolated_rsp ),
  .llc_mst_ar_data_o  ( llc_ar_data        ),
  .llc_mst_ar_wptr_o  ( llc_ar_wptr        ),
  .llc_mst_ar_rptr_i  ( llc_ar_rptr        ),
  .llc_mst_aw_data_o  ( llc_aw_data        ),
  .llc_mst_aw_wptr_o  ( llc_aw_wptr        ),
  .llc_mst_aw_rptr_i  ( llc_aw_rptr        ),
  .llc_mst_b_data_i   ( llc_b_data         ),
  .llc_mst_b_wptr_i   ( llc_b_wptr         ),
  .llc_mst_b_rptr_o   ( llc_b_rptr         ),
  .llc_mst_r_data_i   ( llc_r_data         ),
  .llc_mst_r_wptr_i   ( llc_r_wptr         ),
  .llc_mst_r_rptr_o   ( llc_r_rptr         ),
  .llc_mst_w_data_o   ( llc_w_data         ),
  .llc_mst_w_wptr_o   ( llc_w_wptr         ),
  .llc_mst_w_rptr_i   ( llc_w_rptr         ),
  // External AXI slave devices (except the Integer Cluster)
  .axi_ext_slv_isolate_i  ( slave_isolate_req   ),
  .axi_ext_slv_isolated_o ( slave_isolated_rsp  ),
  .axi_ext_slv_ar_data_o  ( axi_slv_ext_ar_data ),
  .axi_ext_slv_ar_wptr_o  ( axi_slv_ext_ar_wptr ),
  .axi_ext_slv_ar_rptr_i  ( axi_slv_ext_ar_rptr ),
  .axi_ext_slv_aw_data_o  ( axi_slv_ext_aw_data ),
  .axi_ext_slv_aw_wptr_o  ( axi_slv_ext_aw_wptr ),
  .axi_ext_slv_aw_rptr_i  ( axi_slv_ext_aw_rptr ),
  .axi_ext_slv_b_data_i   ( axi_slv_ext_b_data  ),
  .axi_ext_slv_b_wptr_i   ( axi_slv_ext_b_wptr  ),
  .axi_ext_slv_b_rptr_o   ( axi_slv_ext_b_rptr  ),
  .axi_ext_slv_r_data_i   ( axi_slv_ext_r_data  ),
  .axi_ext_slv_r_wptr_i   ( axi_slv_ext_r_wptr  ),
  .axi_ext_slv_r_rptr_o   ( axi_slv_ext_r_rptr  ),
  .axi_ext_slv_w_data_o   ( axi_slv_ext_w_data  ),
  .axi_ext_slv_w_wptr_o   ( axi_slv_ext_w_wptr  ),
  .axi_ext_slv_w_rptr_i   ( axi_slv_ext_w_rptr  ),
  // External AXI master devices (except the Integer Cluster)
  .axi_ext_mst_ar_data_i ( axi_mst_ext_ar_data ),
  .axi_ext_mst_ar_wptr_i ( axi_mst_ext_ar_wptr ),
  .axi_ext_mst_ar_rptr_o ( axi_mst_ext_ar_rptr ),
  .axi_ext_mst_aw_data_i ( axi_mst_ext_aw_data ),
  .axi_ext_mst_aw_wptr_i ( axi_mst_ext_aw_wptr ),
  .axi_ext_mst_aw_rptr_o ( axi_mst_ext_aw_rptr ),
  .axi_ext_mst_b_data_o  ( axi_mst_ext_b_data  ),
  .axi_ext_mst_b_wptr_o  ( axi_mst_ext_b_wptr  ),
  .axi_ext_mst_b_rptr_i  ( axi_mst_ext_b_rptr  ),
  .axi_ext_mst_r_data_o  ( axi_mst_ext_r_data  ),
  .axi_ext_mst_r_wptr_o  ( axi_mst_ext_r_wptr  ),
  .axi_ext_mst_r_rptr_i  ( axi_mst_ext_r_rptr  ),
  .axi_ext_mst_w_data_i  ( axi_mst_ext_w_data  ),
  .axi_ext_mst_w_wptr_i  ( axi_mst_ext_w_wptr  ),
  .axi_ext_mst_w_rptr_o  ( axi_mst_ext_w_rptr  ),
  // Mailboxes
  .axi_mbox_slv_req_o ( axi_mbox_req  ),
  .axi_mbox_slv_rsp_i ( axi_mbox_rsp  ),
  // External reg demux slaves Cheshire's clock domain (sync)
  .reg_ext_slv_req_o ( ext_reg_req     ),
  .reg_ext_slv_rsp_i ( ext_reg_rsp     ),
  // External reg interface slaves (async)
  .ext_reg_async_slv_req_o  (ext_reg_async_slv_req_out),
  .ext_reg_async_slv_ack_i  (ext_reg_async_slv_ack_in),
  .ext_reg_async_slv_data_o (ext_reg_async_slv_data_out),
  .ext_reg_async_slv_req_i  (ext_reg_async_slv_req_in),
  .ext_reg_async_slv_ack_o  (ext_reg_async_slv_ack_out),
  .ext_reg_async_slv_data_i (ext_reg_async_slv_data_in),
  // Interrupts from external devices
  .intr_ext_i        ( chs_ext_intrs ),
  .intr_ext_o        ( chs_intrs_distributed ),
  // Interrupts to external harts
  .xeip_ext_o        ( /* Unused */ ),
  .mtip_ext_o        ( chs_mti      ),
  .msip_ext_o        ( /* Unused */ ), // We use mailboxes for this
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
  .uart_rts_no       (            ),
  .uart_dtr_no       (            ),
  .uart_cts_ni       ( '0         ),
  .uart_dsr_ni       ( '0         ),
  .uart_dcd_ni       ( '0         ),
  .uart_rin_ni       ( '0         ),
  // I2C interface
  .i2c_sda_o                      ,
  .i2c_sda_i                      ,
  .i2c_sda_en_o                   ,
  .i2c_scl_o                      ,
  .i2c_scl_i                      ,
  .i2c_scl_en_o                   ,
  // SPI host interface
  .spih_sck_o                     ,
  .spih_sck_en_o                  ,
  .spih_csb_o                     ,
  .spih_csb_en_o                  ,
  .spih_sd_o                      ,
  .spih_sd_en_o                   ,
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

assign hyper_isolate_req = car_regs_reg2hw.periph_isolate.q;

`ifndef GEN_NO_HYPERBUS // bender-xilinx.mk
// Hyperbus
hyperbus_wrap      #(
  .NumChips         ( HypNumChips                           ),
  .NumPhys          ( HypNumPhys                            ),
  .IsClockODelayed  ( 1'b0                                  ),
  .AxiAddrWidth     ( Cfg.AddrWidth                         ),
  .AxiDataWidth     ( Cfg.AxiDataWidth                      ),
  .AxiIdWidth       ( LlcIdWidth                            ),
  .AxiUserWidth     ( Cfg.AxiUserWidth                      ),
  .axi_req_t        ( carfield_axi_llc_req_t                ),
  .axi_rsp_t        ( carfield_axi_llc_rsp_t                ),
  .axi_w_chan_t     ( carfield_axi_llc_w_chan_t             ),
  .axi_b_chan_t     ( carfield_axi_llc_b_chan_t             ),
  .axi_ar_chan_t    ( carfield_axi_llc_ar_chan_t            ),
  .axi_r_chan_t     ( carfield_axi_llc_r_chan_t             ),
  .axi_aw_chan_t    ( carfield_axi_llc_aw_chan_t            ),
  .RegAddrWidth     ( AxiNarrowAddrWidth                    ),
  .RegDataWidth     ( AxiNarrowDataWidth                    ),
  .reg_req_t        ( carfield_a32_d32_reg_req_t            ),
  .reg_rsp_t        ( carfield_a32_d32_reg_rsp_t            ),
  .RxFifoLogDepth   ( 32'd2                                 ),
  .TxFifoLogDepth   ( 32'd2                                 ),
  .RstChipBase      ( Cfg.LlcOutRegionStart                 ),
  .RstChipSpace     ( HypNumPhys * HypNumChips * 'h800_0000 ),
  .PhyStartupCycles ( 300 * 200                             ),
  .AxiLogDepth      ( LogDepth                              ),
  .AxiSlaveArWidth  ( LlcArWidth                            ),
  .AxiSlaveAwWidth  ( LlcAwWidth                            ),
  .AxiSlaveBWidth   ( LlcBWidth                             ),
  .AxiSlaveRWidth   ( LlcRWidth                             ),
  .AxiSlaveWWidth   ( LlcWWidth                             ),
  .AxiMaxTrans      ( Cfg.AxiMaxSlvTrans                    ),
  .CdcSyncStages    ( SyncStages                            )
) i_hyperbus_wrap   (
  .clk_i               ( periph_clk         ),
  .rst_ni              ( periph_rst_n       ),
  .test_mode_i         ( test_mode_i        ),
  .axi_slave_ar_data_i ( llc_ar_data        ),
  .axi_slave_ar_wptr_i ( llc_ar_wptr        ),
  .axi_slave_ar_rptr_o ( llc_ar_rptr        ),
  .axi_slave_aw_data_i ( llc_aw_data        ),
  .axi_slave_aw_wptr_i ( llc_aw_wptr        ),
  .axi_slave_aw_rptr_o ( llc_aw_rptr        ),
  .axi_slave_b_data_o  ( llc_b_data         ),
  .axi_slave_b_wptr_o  ( llc_b_wptr         ),
  .axi_slave_b_rptr_i  ( llc_b_rptr         ),
  .axi_slave_r_data_o  ( llc_r_data         ),
  .axi_slave_r_wptr_o  ( llc_r_wptr         ),
  .axi_slave_r_rptr_i  ( llc_r_rptr         ),
  .axi_slave_w_data_i  ( llc_w_data         ),
  .axi_slave_w_wptr_i  ( llc_w_wptr         ),
  .axi_slave_w_rptr_o  ( llc_w_rptr         ),
  .rbus_req_addr_i     ( reg_hyper_req.addr  ),
  .rbus_req_write_i    ( reg_hyper_req.write ),
  .rbus_req_wdata_i    ( reg_hyper_req.wdata ),
  .rbus_req_wstrb_i    ( reg_hyper_req.wstrb ),
  .rbus_req_valid_i    ( reg_hyper_req.valid ),
  .rbus_rsp_rdata_o    ( reg_hyper_rsp.rdata ),
  .rbus_rsp_ready_o    ( reg_hyper_rsp.ready ),
  .rbus_rsp_error_o    ( reg_hyper_rsp.error ),
  .hyper_cs_no,
  .hyper_ck_o,
  .hyper_ck_no,
  .hyper_rwds_o,
  .hyper_rwds_i,
  .hyper_rwds_oe_o,
  .hyper_dq_i,
  .hyper_dq_o,
  .hyper_dq_oe_o,
  .hyper_reset_no
);
`endif // GEN_NO_HYPERBUS

// Temporary Mailbox parameters (evaluate if we can move everything here).
// The best approach would be to move all these parameters to the package.
localparam int unsigned HostdMboxOffset = (spatz_cluster_pkg::NumCores +
                                           (spatz_cluster_pkg::NumCores *
                                            CheshireNumIntHarts         )
                                           );

localparam int unsigned SpatzMboxOffset = HostdMboxOffset +
                                          3*CheshireNumIntHarts;

localparam int unsigned PulpclMboxOffset = SpatzMboxOffset +
                                           CheshireNumIntHarts + 1;

localparam int unsigned SecdMboxOffset = PulpclMboxOffset +
                                         CheshireNumIntHarts + 1;

localparam int unsigned SafedMboxOffset = SecdMboxOffset +
                                          CheshireNumIntHarts + 1;

// Reconfigurable L2 Memory
// Host Clock Domain

if (CarfieldIslandsCfg.l2_port0.enable) begin: gen_l2
  // Similar to the issue with the regs above. Using a localparam resolves the
  // `Warning (downgraded): (vsim-3053) Illegal output or inout port connection for port`
  // associated with the `l2_ecc_reg_async_mst_ack_o`, `l2_ecc_reg_async_mst_req_o`, and
  // `l2_ecc_reg_async_mst_data_o` ports.
  localparam int unsigned EccAsyncIdx = CarfieldRegBusSlvIdx.l2ecc-NumSyncRegSlv;
  assign l2_rst_n = rsts_n[CarfieldDomainIdx.l2];
  assign l2_pwr_on_rst_n = pwr_on_rsts_n[CarfieldDomainIdx.l2];
  assign l2_clk = domain_clk_gated[CarfieldDomainIdx.l2];
  assign domain_clk_sel[CarfieldDomainIdx.l2] = car_regs_reg2hw.l2_clk_sel.q;
  assign domain_clk_div_value[CarfieldDomainIdx.l2] = car_regs_reg2hw.l2_clk_div_value.q;
  assign domain_clk_div_changed[CarfieldDomainIdx.l2] = car_regs_reg2hw.l2_clk_div_value.qe;
  assign domain_clk_en[CarfieldDomainIdx.l2] = car_regs_reg2hw.l2_clk_en.q;
  assign reset_vector[CarfieldDomainIdx.l2] = car_regs_reg2hw.l2_rst.q;
  assign slave_isolate_req[L2Port0SlvIdx] = car_regs_reg2hw.l2_isolate.q;
  assign slave_isolate_req[L2Port1SlvIdx] = car_regs_reg2hw.l2_isolate.q;
  assign slave_isolated[L2Port0SlvIdx] = slave_isolated_rsp[L2Port0SlvIdx];
  assign slave_isolated[L2Port1SlvIdx] = slave_isolated_rsp[L2Port1SlvIdx];
  assign car_regs_hw2reg.l2_isolate_status.d = slave_isolated[L2Port0SlvIdx] &
                                               slave_isolated[L2Port1SlvIdx];
  assign car_regs_hw2reg.l2_isolate_status.de = 1'b1;

  `ifndef L2_WRAP_NETLIST
  l2_wrap #(
    .Cfg          ( Cfg                    ),
    .NumPort      ( NumL2Ports             ),
    .AxiAddrWidth ( Cfg.AddrWidth          ),
    .AxiDataWidth ( Cfg.AxiDataWidth       ),
    .AxiIdWidth   ( AxiSlvIdWidth          ),
    .AxiUserWidth ( Cfg.AxiUserWidth       ),
    .AxiMaxTrans  ( Cfg.AxiMaxSlvTrans     ),
    .LogDepth     ( LogDepth               ),
    .CdcSyncStages( SyncStages             ),
    .NumRules     ( L2NumRules             ),
    .L2MemSize    ( L2MemSize              ),
    // Atomics
    .L2MaxReadTxns  ( Cfg.LlcMaxReadTxns   ), // TODO: AMO parameters are default
                                              // from the LLC (Cheshire), at the
                                              // moment
    .L2MaxWriteTxns ( Cfg.LlcMaxWriteTxns  ),
    .AxiUserAmoMsb  ( Cfg.AxiUserAmoMsb    ),
    .AxiUserAmoLsb  ( Cfg.AxiUserAmoLsb    ),
    .L2AmoNumCuts   ( Cfg.LlcAmoNumCuts    ),
    .l2_ecc_reg_req_t ( carfield_reg_req_t ),
    .l2_ecc_reg_rsp_t ( carfield_reg_rsp_t )
  ) i_reconfigurable_l2 (
  `else
  l2_wrap i_reconfigurable_l2 (
  `endif
    .clk_i               ( l2_clk                               ),
    .rst_ni              ( l2_rst_n                             ),
    .pwr_on_rst_ni       ( l2_pwr_on_rst_n                      ),
    .slvport_ar_data_i   ( axi_slv_ext_ar_data [NumL2Ports-1:0] ),
    .slvport_ar_wptr_i   ( axi_slv_ext_ar_wptr [NumL2Ports-1:0] ),
    .slvport_ar_rptr_o   ( axi_slv_ext_ar_rptr [NumL2Ports-1:0] ),
    .slvport_aw_data_i   ( axi_slv_ext_aw_data [NumL2Ports-1:0] ),
    .slvport_aw_wptr_i   ( axi_slv_ext_aw_wptr [NumL2Ports-1:0] ),
    .slvport_aw_rptr_o   ( axi_slv_ext_aw_rptr [NumL2Ports-1:0] ),
    .slvport_b_data_o    ( axi_slv_ext_b_data  [NumL2Ports-1:0] ),
    .slvport_b_wptr_o    ( axi_slv_ext_b_wptr  [NumL2Ports-1:0] ),
    .slvport_b_rptr_i    ( axi_slv_ext_b_rptr  [NumL2Ports-1:0] ),
    .slvport_r_data_o    ( axi_slv_ext_r_data  [NumL2Ports-1:0] ),
    .slvport_r_wptr_o    ( axi_slv_ext_r_wptr  [NumL2Ports-1:0] ),
    .slvport_r_rptr_i    ( axi_slv_ext_r_rptr  [NumL2Ports-1:0] ),
    .slvport_w_data_i    ( axi_slv_ext_w_data  [NumL2Ports-1:0] ),
    .slvport_w_wptr_i    ( axi_slv_ext_w_wptr  [NumL2Ports-1:0] ),
    .slvport_w_rptr_o    ( axi_slv_ext_w_rptr  [NumL2Ports-1:0] ),
    // verilog_lint: waive-start line-length
    .l2_ecc_reg_async_mst_req_i  ( ext_reg_async_slv_req_out [EccAsyncIdx] ),
    .l2_ecc_reg_async_mst_ack_o  ( ext_reg_async_slv_ack_in  [EccAsyncIdx] ),
    .l2_ecc_reg_async_mst_data_i ( ext_reg_async_slv_data_out[EccAsyncIdx] ),
    .l2_ecc_reg_async_mst_req_o  ( ext_reg_async_slv_req_in  [EccAsyncIdx] ),
    .l2_ecc_reg_async_mst_ack_i  ( ext_reg_async_slv_ack_out [EccAsyncIdx] ),
    .l2_ecc_reg_async_mst_data_o ( ext_reg_async_slv_data_in [EccAsyncIdx] ),
    // verilog_lint: waive-stop line-length
    .ecc_error_o         ( l2_ecc_err                           )
  );
end else begin: gen_no_l2
  assign l2_rst_n = '0;
  assign l2_pwr_on_rst_n = '0;
  assign l2_clk = '0;
  assign car_regs_hw2reg.l2_isolate_status.d = '0;
  assign car_regs_hw2reg.l2_isolate_status.de = '0;
  assign l2_ecc_err = '0;
end

// Safety Island
logic [SafetyIslandCfg.NumInterrupts-1:0] safed_intrs;

// Safety island interrupts from interrupt router
logic [(NumIntIntrs+CarfieldNumExtIntrs)-1:0] safed_intrs_distributed;
// Safety island edge-triggered interrupts and synchronized edge-triggered interrupts
logic [CarfieldNumTimerIntrs-1:0] safed_edge_triggered_intrs, safed_edge_triggered_intrs_sync;
// Safety island is the only external target for the router in carfield
assign safed_intrs_distributed = chs_intrs_distributed[(NumIntIntrs+CarfieldNumExtIntrs)-1:0];

// verilog_lint: waive-start line-length
localparam int unsigned EdgeTriggeredIntrsOffset = NumIntIntrs+IntClusterNumEoc+NumMailboxesHostd+
                                                   CarfieldNumPeriphsIntrs-CarfieldNumTimerIntrs;
assign safed_edge_triggered_intrs = safed_intrs_distributed[
                                    EdgeTriggeredIntrsOffset+CarfieldNumTimerIntrs-1:
                                    EdgeTriggeredIntrsOffset];

// Propagate edge-triggered interrupts between host and safety_island clock domains. In carfield,
// edge-triggered interrupts come from the system timer peripherals (`CarfieldNumTimerIntrs`
// interrupt lines, see `carfield_pkg.sv`). Other interrupt lines are level-triggered.
for (genvar i = 0; i < CarfieldNumTimerIntrs; i++) begin : gen_sync_safed_edge_triggered_intrs
  edge_propagator i_sync_safed_edge_triggered_intrs (
    .clk_tx_i  ( host_clk_i                         ),
    .rstn_tx_i ( host_pwr_on_rst_n                  ),
    .edge_i    ( safed_edge_triggered_intrs[i]      ),
    .clk_rx_i  ( safety_clk                         ),
    .rstn_rx_i ( safety_pwr_on_rst_n                ),
    .edge_o    ( safed_edge_triggered_intrs_sync[i] )
  );
end

// Collect interrupts for the safety island: private interrupts from mailboxes, shared interrupts
// from the interrupt router.
assign safed_intrs = {
  {(SafetyIslandCfg.NumInterrupts-(NumIntIntrs+CarfieldNumExtIntrs+NumMailboxesSafed)){1'b0}}, // Pad remaining interrupts
  // Shared interrupts (cheshire and carfield's peripherals interrupts)
  safed_intrs_distributed[(NumIntIntrs+CarfieldNumExtIntrs)-1:(EdgeTriggeredIntrsOffset+CarfieldNumTimerIntrs)], // Others up to CarfieldNumExtIntrs
  safed_edge_triggered_intrs_sync, // Timer interrupts
  safed_intrs_distributed[EdgeTriggeredIntrsOffset-1:(NumIntIntrs+IntClusterNumEoc+NumMailboxesHostd)], // CAN, WDT interrupts
  safed_intrs_distributed[(NumIntIntrs+IntClusterNumEoc)-1:0], // cheshire's peripherals, pulp cluster EOC
  // Mailboxes
  spatzcl_safed_mbox_intr, // 1
  pulpcl_safed_mbox_intr,  // 1
  secd_safed_mbox_intr,    // 1
  hostd_safed_mbox_intr    // 1
};
// verilog_lint: waive-stop line-length

if (CarfieldIslandsCfg.safed.enable) begin : gen_safety_island
  assign reset_vector[CarfieldDomainIdx.safed] = car_regs_reg2hw.safety_island_rst.q;
  assign safety_rst_n = rsts_n[CarfieldDomainIdx.safed];
  assign safety_pwr_on_rst_n = pwr_on_rsts_n[CarfieldDomainIdx.safed];
  assign safety_clk = domain_clk_gated[CarfieldDomainIdx.safed];
  assign domain_clk_sel[CarfieldDomainIdx.safed] = car_regs_reg2hw.safety_island_clk_sel.q;
  assign domain_clk_div_value[CarfieldDomainIdx.safed] =
         car_regs_reg2hw.safety_island_clk_div_value.q;
  assign domain_clk_div_changed[CarfieldDomainIdx.safed] =
         car_regs_reg2hw.safety_island_clk_div_value.qe;
  assign domain_clk_en[CarfieldDomainIdx.safed] = car_regs_reg2hw.safety_island_clk_en.q;

  assign slave_isolate_req[SafetyIslandSlvIdx] = car_regs_reg2hw.safety_island_isolate.q;
  assign car_regs_hw2reg.safety_island_isolate_status.d = slave_isolated[SafetyIslandSlvIdx];
  assign car_regs_hw2reg.safety_island_isolate_status.de = 1'b1;
  assign slave_isolated[SafetyIslandSlvIdx] = slave_isolated_rsp[SafetyIslandSlvIdx] &
                                              master_isolated_rsp[SafetyIslandMstIdx];

  for (genvar i = 0; i < CheshireNumIntHarts; i++ ) begin : gen_hostd_mbox_intrs
    assign hostd_safed_mbox_intr [i] = snd_mbox_intrs[HostdMboxOffset + 2*CheshireNumIntHarts + i];
  end

  for (genvar i = 0; i < CheshireNumIntHarts; i++ ) begin : gen_safed_mbox_intr
    assign safed_hostd_mbox_intr [i] = snd_mbox_intrs[SafedMboxOffset + CheshireNumIntHarts + 1];
  end
  assign safed_secd_mbox_intr = snd_mbox_intrs[SafedMboxOffset + CheshireNumIntHarts + 0];


  `ifndef SAFED_NETLIST
    safety_island_synth_wrapper #(
      .SafetyIslandCfg          ( SafetyIslandCfg            ),

      .AxiAddrWidth             ( Cfg.AddrWidth              ),
      .AxiDataWidth             ( Cfg.AxiDataWidth           ),
      .AxiUserWidth             ( Cfg.AxiUserWidth           ),
      .AxiInIdWidth             ( AxiSlvIdWidth              ),
      .AxiOutIdWidth            ( Cfg.AxiMstIdWidth          ),

      .AxiUserAtop              ( 1'b1                       ),
      .AxiUserAtopMsb           ( Cfg.AxiUserAmoMsb          ),
      .AxiUserAtopLsb           ( Cfg.AxiUserAmoLsb          ),
      .AxiUserEccErr            ( Cfg.AxiUserErrBits         ),
      .AxiUserEccErrBit         ( Cfg.AxiUserErrLsb          ),

      .DefaultUser              ( 10'b00000_0_0101           ),
      .LogDepth                 ( LogDepth                   ),
      .CdcSyncStages            ( SyncStages                 ),
      .SyncStages               ( SyncStages                 ),

      .SafetyIslandBaseAddr     ( CarfieldIslandsCfg.safed.base ),
      .SafetyIslandAddrRange    ( CarfieldIslandsCfg.safed.size ),
      .SafetyIslandMemOffset    ( SafetyIslandMemOffset      ),
      .SafetyIslandPeriphOffset ( SafetyIslandPerOffset      ),

      .NumDebug                 ( MaxHartId+1                ),
      .SelectableHarts          ( SafetyIslandExtHarts       ),
      .HartInfo                 ( SafetyIslandExtHartinfo    ),

      .axi_in_aw_chan_t         ( carfield_axi_slv_aw_chan_t ),
      .axi_in_w_chan_t          ( carfield_axi_slv_w_chan_t  ),
      .axi_in_b_chan_t          ( carfield_axi_slv_b_chan_t  ),
      .axi_in_ar_chan_t         ( carfield_axi_slv_ar_chan_t ),
      .axi_in_r_chan_t          ( carfield_axi_slv_r_chan_t  ),
      .axi_in_req_t             ( carfield_axi_slv_req_t     ),
      .axi_in_resp_t            ( carfield_axi_slv_rsp_t     ),

      .axi_out_aw_chan_t        ( carfield_axi_mst_aw_chan_t ),
      .axi_out_w_chan_t         ( carfield_axi_mst_w_chan_t  ),
      .axi_out_b_chan_t         ( carfield_axi_mst_b_chan_t  ),
      .axi_out_ar_chan_t        ( carfield_axi_mst_ar_chan_t ),
      .axi_out_r_chan_t         ( carfield_axi_mst_r_chan_t  ),
      .axi_out_req_t            ( carfield_axi_mst_req_t     ),
      .axi_out_resp_t           ( carfield_axi_mst_rsp_t     ),

      .AsyncAxiInAwWidth        ( CarfieldAxiSlvAwWidth      ),
      .AsyncAxiInWWidth         ( CarfieldAxiSlvWWidth       ),
      .AsyncAxiInBWidth         ( CarfieldAxiSlvBWidth       ),
      .AsyncAxiInArWidth        ( CarfieldAxiSlvArWidth      ),
      .AsyncAxiInRWidth         ( CarfieldAxiSlvRWidth       ),

      .AsyncAxiOutAwWidth       ( CarfieldAxiMstAwWidth      ),
      .AsyncAxiOutWWidth        ( CarfieldAxiMstWWidth       ),
      .AsyncAxiOutBWidth        ( CarfieldAxiMstBWidth       ),
      .AsyncAxiOutArWidth       ( CarfieldAxiMstArWidth      ),
      .AsyncAxiOutRWidth        ( CarfieldAxiMstRWidth       )
    ) i_safety_island_wrap    (
  `else
    safety_island i_safety_island_wrap (
  `endif
      .clk_i                  ( safety_clk                               ),
      .ref_clk_i              ( rt_clk_i                                 ),
      .rst_ni                 ( safety_rst_n                             ),
      .pwr_on_rst_ni          ( safety_pwr_on_rst_n                      ),
      .test_enable_i          ( test_mode_i                              ),
      .bootmode_i             ( bootmode_safe_isln_i                     ),
      .fetch_en_i             ( car_regs_reg2hw.safety_island_fetch_enable ), // To SoC Bus
      .axi_isolate_i          ( slave_isolate_req [SafetyIslandSlvIdx]   ), // To SoC Bus
      .axi_isolated_o         ( master_isolated_rsp [SafetyIslandMstIdx] ),
      .irqs_i                 ( safed_intrs                              ),
      .debug_req_o            ( safed_dbg_reqs                           ),
      .jtag_tck_i             ( jtag_safety_island_tck_i                 ),
      .jtag_trst_ni           ( jtag_safety_island_trst_ni               ),
      .jtag_tms_i             ( jtag_safety_island_tms_i                 ),
      .jtag_tdi_i             ( jtag_safety_island_tdi_i                 ),
      .jtag_tdo_o             ( jtag_safety_island_tdo_o                 ),
      // Slave port
      .async_axi_in_aw_data_i ( axi_slv_ext_aw_data [SafetyIslandSlvIdx] ),
      .async_axi_in_aw_wptr_i ( axi_slv_ext_aw_wptr [SafetyIslandSlvIdx] ),
      .async_axi_in_aw_rptr_o ( axi_slv_ext_aw_rptr [SafetyIslandSlvIdx] ),
      .async_axi_in_w_data_i  ( axi_slv_ext_w_data  [SafetyIslandSlvIdx] ),
      .async_axi_in_w_wptr_i  ( axi_slv_ext_w_wptr  [SafetyIslandSlvIdx] ),
      .async_axi_in_w_rptr_o  ( axi_slv_ext_w_rptr  [SafetyIslandSlvIdx] ),
      .async_axi_in_b_data_o  ( axi_slv_ext_b_data  [SafetyIslandSlvIdx] ),
      .async_axi_in_b_wptr_o  ( axi_slv_ext_b_wptr  [SafetyIslandSlvIdx] ),
      .async_axi_in_b_rptr_i  ( axi_slv_ext_b_rptr  [SafetyIslandSlvIdx] ),
      .async_axi_in_ar_data_i ( axi_slv_ext_ar_data [SafetyIslandSlvIdx] ),
      .async_axi_in_ar_wptr_i ( axi_slv_ext_ar_wptr [SafetyIslandSlvIdx] ),
      .async_axi_in_ar_rptr_o ( axi_slv_ext_ar_rptr [SafetyIslandSlvIdx] ),
      .async_axi_in_r_data_o  ( axi_slv_ext_r_data  [SafetyIslandSlvIdx] ),
      .async_axi_in_r_wptr_o  ( axi_slv_ext_r_wptr  [SafetyIslandSlvIdx] ),
      .async_axi_in_r_rptr_i  ( axi_slv_ext_r_rptr  [SafetyIslandSlvIdx] ),
      // Master port
      .async_axi_out_aw_data_o ( axi_mst_ext_aw_data [SafetyIslandMstIdx] ),
      .async_axi_out_aw_wptr_o ( axi_mst_ext_aw_wptr [SafetyIslandMstIdx] ),
      .async_axi_out_aw_rptr_i ( axi_mst_ext_aw_rptr [SafetyIslandMstIdx] ),
      .async_axi_out_w_data_o  ( axi_mst_ext_w_data  [SafetyIslandMstIdx] ),
      .async_axi_out_w_wptr_o  ( axi_mst_ext_w_wptr  [SafetyIslandMstIdx] ),
      .async_axi_out_w_rptr_i  ( axi_mst_ext_w_rptr  [SafetyIslandMstIdx] ),
      .async_axi_out_b_data_i  ( axi_mst_ext_b_data  [SafetyIslandMstIdx] ),
      .async_axi_out_b_wptr_i  ( axi_mst_ext_b_wptr  [SafetyIslandMstIdx] ),
      .async_axi_out_b_rptr_o  ( axi_mst_ext_b_rptr  [SafetyIslandMstIdx] ),
      .async_axi_out_ar_data_o ( axi_mst_ext_ar_data [SafetyIslandMstIdx] ),
      .async_axi_out_ar_wptr_o ( axi_mst_ext_ar_wptr [SafetyIslandMstIdx] ),
      .async_axi_out_ar_rptr_i ( axi_mst_ext_ar_rptr [SafetyIslandMstIdx] ),
      .async_axi_out_r_data_i  ( axi_mst_ext_r_data  [SafetyIslandMstIdx] ),
      .async_axi_out_r_wptr_i  ( axi_mst_ext_r_wptr  [SafetyIslandMstIdx] ),
      .async_axi_out_r_rptr_o  ( axi_mst_ext_r_rptr  [SafetyIslandMstIdx] )
    );
  end
else begin : gen_no_safety_island
  assign safety_rst_n = '0;
  assign safety_pwr_on_rst_n = '0;
  assign safety_clk = '0;

  assign car_regs_hw2reg.safety_island_isolate_status.d = '0;
  assign car_regs_hw2reg.safety_island_isolate_status.de = '0;

  assign hostd_safed_mbox_intr = '0;
  assign safed_hostd_mbox_intr = '0;
  assign safed_secd_mbox_intr = '0;

  assign safed_dbg_reqs = '0;
  assign jtag_safety_island_tdo_o = jtag_safety_island_tdi_i;
end

// PULP integer cluster

logic pulpcl_mbox_intr;
assign pulpcl_eoc = car_regs_hw2reg.pulp_cluster_eoc.d;

if (CarfieldIslandsCfg.pulp.enable) begin : gen_pulp_cluster
  assign pulp_rst_n = rsts_n[CarfieldDomainIdx.pulp];
  assign pulp_pwr_on_rst_n = pwr_on_rsts_n[CarfieldDomainIdx.pulp];
  assign pulp_clk = domain_clk_gated[CarfieldDomainIdx.pulp];
  assign reset_vector[CarfieldDomainIdx.pulp] = car_regs_reg2hw.pulp_cluster_rst.q;

  assign domain_clk_sel[CarfieldDomainIdx.pulp] =
         car_regs_reg2hw.pulp_cluster_clk_sel.q;
  assign domain_clk_div_value[CarfieldDomainIdx.pulp] =
         car_regs_reg2hw.pulp_cluster_clk_div_value.q;
  assign domain_clk_div_changed[CarfieldDomainIdx.pulp] =
         car_regs_reg2hw.pulp_cluster_clk_div_value.qe;
  assign domain_clk_en[CarfieldDomainIdx.pulp] =
         car_regs_reg2hw.pulp_cluster_clk_en.q;

  assign slave_isolate_req[IntClusterSlvIdx] = car_regs_reg2hw.pulp_cluster_isolate.q;
  assign car_regs_hw2reg.pulp_cluster_eoc.de  = 1'b1;
  assign car_regs_hw2reg.pulp_cluster_busy.de = 1'b1;
  assign car_regs_hw2reg.pulp_cluster_isolate_status.d = slave_isolated[IntClusterSlvIdx];
  assign car_regs_hw2reg.pulp_cluster_isolate_status.de = 1'b1;

  assign slave_isolated[IntClusterSlvIdx] = slave_isolated_rsp[IntClusterSlvIdx] &
                                            master_isolated_rsp[IntClusterMstIdx];

`ifndef INT_CLUSTER_NETLIST
  pulp_cluster #(
    .NB_CORES                       ( IntClusterNumCores           ),
    .NB_HWPE_PORTS                  ( IntClusterNumHwpePorts       ),
    .NB_DMAS                        ( IntClusterNumDmas            ),
    .NB_MPERIPHS                    ( IntClusterNumMstPer          ),
    .NB_SPERIPHS                    ( IntClusterNumSlvPer          ),
    .SynchStages                    ( SyncStages                   ),
    .TCDM_SIZE                      ( IntClusterTcdmSize           ),
    .NB_TCDM_BANKS                  ( IntClusterTcdmBanks          ),
    .HWPE_PRESENT                   ( IntClusterHwpePresent        ),
    .USE_HETEROGENEOUS_INTERCONNECT ( IntClusterUseHci             ),
    .SET_ASSOCIATIVE                ( IntClusterSetAssociative     ),
    .NB_CACHE_BANKS                 ( IntClusterNumCacheBanks      ),
    .CACHE_LINE                     ( IntClusterNumCacheLines      ),
    .CACHE_SIZE                     ( IntClusterCacheSize          ),
    .L0_BUFFER_FEATURE              ( "DISABLED"                   ),
    .MULTICAST_FEATURE              ( "DISABLED"                   ),
    .SHARED_ICACHE                  ( "ENABLED"                    ),
    .DIRECT_MAPPED_FEATURE          ( "DISABLED"                   ),
    .L2_SIZE                        ( L2MemSize                    ),
    .USE_REDUCED_TAG                ( "TRUE"                       ),
    .DEBUG_START_ADDR               ( IntClusterDbgStart           ),
    .ROM_BOOT_ADDR                  ( IntClusterBootAddr           ),
    .BOOT_ADDR                      ( IntClusterBootAddr           ),
    .INSTR_RDATA_WIDTH              ( IntClusterInstrRdataWidth    ),
    .CLUST_FPU                      ( IntClusterFpu                ),
    .CLUST_FP_DIVSQRT               ( IntClusterFpuDivSqrt         ),
    .CLUST_SHARED_FP                ( IntClusterFpu                ),
    .CLUST_SHARED_FP_DIVSQRT        ( IntClusterFpuDivSqrt         ),
    .NumAxiMst                      ( IntClusterNumAxiMst          ),
    .NumAxiSlv                      ( IntClusterNumAxiSlv          ),
    .AXI_ADDR_WIDTH                 ( Cfg.AddrWidth                ),
    .AXI_DATA_C2S_WIDTH             ( Cfg.AxiDataWidth             ),
    .AXI_DATA_S2C_WIDTH             ( Cfg.AxiDataWidth             ),
    .AXI_USER_WIDTH                 ( Cfg.AxiUserWidth             ),
    .AXI_ID_IN_WIDTH                ( AxiSlvIdWidth                ),
    .AXI_ID_OUT_WIDTH               ( Cfg.AxiMstIdWidth            ),
    .AXI_MAX_IN_TRANS               ( Cfg.AxiMaxSlvTrans           ),
    .AXI_MAX_OUT_TRANS              ( Cfg.AxiMaxSlvTrans           ),
    .LOG_DEPTH                      ( LogDepth                     ),
    .BaseAddr                       ( CarfieldIslandsCfg.pulp.base ),
    .CdcSynchStages                 ( SyncStages                   )
  ) i_integer_cluster               (
`else
  int_cluster i_integer_cluster     (
`endif
    .clk_i                       ( pulp_clk                                  ),
    .rst_ni                      ( pulp_rst_n                                ),
    .pwr_on_rst_ni               ( pulp_pwr_on_rst_n                         ),
    .ref_clk_i                   ( rt_clk_i                                  ),
    .pmu_mem_pwdn_i              ( '0                                        ),
    .base_addr_i                 ( CarfieldIslandsCfg.pulp.base[31:28]       ),
    .test_mode_i                 ( test_mode_i                               ),
    .cluster_id_i                ( IntClusterIndex                           ),
    .en_sa_boot_i                ( car_regs_reg2hw.pulp_cluster_boot_enable  ),
    .fetch_en_i                  ( car_regs_reg2hw.pulp_cluster_fetch_enable ),
    .eoc_o                       ( car_regs_hw2reg.pulp_cluster_eoc.d        ),
    .busy_o                      ( car_regs_hw2reg.pulp_cluster_busy.d       ),
    .axi_isolate_i               ( slave_isolate_req [IntClusterSlvIdx]      ),
    .axi_isolated_o              ( master_isolated_rsp [IntClusterMstIdx]    ),
    .dma_pe_evt_ack_i            ( '0                                        ),
    .dma_pe_evt_valid_o          (                                           ),
    .dma_pe_irq_ack_i            ( '1                                        ),
    .dma_pe_irq_valid_o          (                                           ),
    .dbg_irq_valid_i             ( pulpcl_dbg_reqs                           ),
    .mbox_irq_i                  ( pulpcl_mbox_intr                          ),
    .pf_evt_ack_i                ( '1                                        ),
    .pf_evt_valid_o              (                                           ),
    .async_cluster_events_wptr_i ( '0                                        ),
    .async_cluster_events_rptr_o (                                           ),
    .async_cluster_events_data_i ( '0                                        ),
    // AXI4 Slave port
    .async_data_slave_aw_data_i  ( axi_slv_ext_aw_data [IntClusterSlvIdx] ),
    .async_data_slave_aw_wptr_i  ( axi_slv_ext_aw_wptr [IntClusterSlvIdx] ),
    .async_data_slave_aw_rptr_o  ( axi_slv_ext_aw_rptr [IntClusterSlvIdx] ),
    .async_data_slave_ar_data_i  ( axi_slv_ext_ar_data [IntClusterSlvIdx] ),
    .async_data_slave_ar_wptr_i  ( axi_slv_ext_ar_wptr [IntClusterSlvIdx] ),
    .async_data_slave_ar_rptr_o  ( axi_slv_ext_ar_rptr [IntClusterSlvIdx] ),
    .async_data_slave_w_data_i   ( axi_slv_ext_w_data  [IntClusterSlvIdx] ),
    .async_data_slave_w_wptr_i   ( axi_slv_ext_w_wptr  [IntClusterSlvIdx] ),
    .async_data_slave_w_rptr_o   ( axi_slv_ext_w_rptr  [IntClusterSlvIdx] ),
    .async_data_slave_r_data_o   ( axi_slv_ext_r_data  [IntClusterSlvIdx] ),
    .async_data_slave_r_wptr_o   ( axi_slv_ext_r_wptr  [IntClusterSlvIdx] ),
    .async_data_slave_r_rptr_i   ( axi_slv_ext_r_rptr  [IntClusterSlvIdx] ),
    .async_data_slave_b_data_o   ( axi_slv_ext_b_data  [IntClusterSlvIdx] ),
    .async_data_slave_b_wptr_o   ( axi_slv_ext_b_wptr  [IntClusterSlvIdx] ),
    .async_data_slave_b_rptr_i   ( axi_slv_ext_b_rptr  [IntClusterSlvIdx] ),
    // AXI4 Master Port
    .async_data_master_aw_data_o ( axi_mst_ext_aw_data [IntClusterMstIdx] ),
    .async_data_master_aw_wptr_o ( axi_mst_ext_aw_wptr [IntClusterMstIdx] ),
    .async_data_master_aw_rptr_i ( axi_mst_ext_aw_rptr [IntClusterMstIdx] ),
    .async_data_master_ar_data_o ( axi_mst_ext_ar_data [IntClusterMstIdx] ),
    .async_data_master_ar_wptr_o ( axi_mst_ext_ar_wptr [IntClusterMstIdx] ),
    .async_data_master_ar_rptr_i ( axi_mst_ext_ar_rptr [IntClusterMstIdx] ),
    .async_data_master_w_data_o  ( axi_mst_ext_w_data  [IntClusterMstIdx] ),
    .async_data_master_w_wptr_o  ( axi_mst_ext_w_wptr  [IntClusterMstIdx] ),
    .async_data_master_w_rptr_i  ( axi_mst_ext_w_rptr  [IntClusterMstIdx] ),
    .async_data_master_r_data_i  ( axi_mst_ext_r_data  [IntClusterMstIdx] ),
    .async_data_master_r_wptr_i  ( axi_mst_ext_r_wptr  [IntClusterMstIdx] ),
    .async_data_master_r_rptr_o  ( axi_mst_ext_r_rptr  [IntClusterMstIdx] ),
    .async_data_master_b_data_i  ( axi_mst_ext_b_data  [IntClusterMstIdx] ),
    .async_data_master_b_wptr_i  ( axi_mst_ext_b_wptr  [IntClusterMstIdx] ),
    .async_data_master_b_rptr_o  ( axi_mst_ext_b_rptr  [IntClusterMstIdx] )
  );

  for (genvar i = 0; i < CheshireNumIntHarts; i++ ) begin : gen_pulpcl_mbox_intrs
    assign pulpcl_hostd_mbox_intr [i] = snd_mbox_intrs[PulpclMboxOffset + i];
  end
  assign pulpcl_safed_mbox_intr = snd_mbox_intrs[PulpclMboxOffset + CheshireNumIntHarts];

  for (genvar i = 0; i < CheshireNumIntHarts; i++ ) begin : gen_hostd_pulpcl_mbox_intrs
    assign hostd_pulpcl_mbox_intr [i] = snd_mbox_intrs[HostdMboxOffset + 0*CheshireNumIntHarts + i];
  end

  // Integer cluster
  logic hostd_pulpcl_mbox_intr_ored;
  assign hostd_pulpcl_mbox_intr_ored  = |hostd_pulpcl_mbox_intr ;
  assign pulpcl_mbox_intr = hostd_pulpcl_mbox_intr_ored | safed_pulpcl_mbox_intr;

  assign safed_pulpcl_mbox_intr = snd_mbox_intrs[SafedMboxOffset + CheshireNumIntHarts + 1];
end else begin : gen_no_pulp_cluster
  assign pulp_rst_n = '0;
  assign pulp_pwr_on_rst_n = '0;
  assign pulp_clk = '0;
  assign pulpcl_safed_mbox_intr = '0;
  assign pulpcl_hostd_mbox_intr = '0;

  assign hostd_pulpcl_mbox_intr = '0;
  assign hostd_pulpcl_mbox_intr_ored = '0;
  assign pulpcl_mbox_intr = '0;

  assign safed_pulpcl_mbox_intr = '0;

  assign car_regs_hw2reg.pulp_cluster_eoc.d = '0;
  assign car_regs_hw2reg.pulp_cluster_eoc.de  = 1'b0;
  assign car_regs_hw2reg.pulp_cluster_busy.d = '0;
  assign car_regs_hw2reg.pulp_cluster_busy.de = 1'b0;

  assign car_regs_hw2reg.pulp_cluster_isolate_status.d = '0;
  assign car_regs_hw2reg.pulp_cluster_isolate_status.de = '0;

end

// Floating Point Spatz Cluster
// Spatz cluster interrupts
// msi (machine software interrupt): hostd, safed
logic [spatz_cluster_pkg::NumCores-1:0] spatzcl_mbox_intr;
// mti (machine timer interrupt) : hostd (RISC-V clint)
// verilog_lint: waive-start line-length
logic [spatz_cluster_pkg::NumCores-1:0] spatzcl_timer_intr;
if (CarfieldIslandsCfg.spatz.enable) begin : gen_spatz_cluster

  assign reset_vector[CarfieldDomainIdx.spatz] = car_regs_reg2hw.spatz_cluster_rst.q;

  assign domain_clk_sel[CarfieldDomainIdx.spatz] = car_regs_reg2hw.spatz_cluster_clk_sel.q;
  assign spatz_rst_n = rsts_n[CarfieldDomainIdx.spatz];
  assign spatz_pwr_on_rst_n = pwr_on_rsts_n[CarfieldDomainIdx.spatz];
  assign spatz_clk = domain_clk_gated[CarfieldDomainIdx.spatz];
  assign domain_clk_div_value[CarfieldDomainIdx.spatz] = car_regs_reg2hw.spatz_cluster_clk_div_value.q;
  assign domain_clk_div_changed[CarfieldDomainIdx.spatz] = car_regs_reg2hw.spatz_cluster_clk_div_value.qe;
  assign domain_clk_en[CarfieldDomainIdx.spatz] = car_regs_reg2hw.spatz_cluster_clk_en.q;

  assign spatzcl_timer_intr = { chs_mti[FPClusterIntrHart1Idx], chs_mti[FPClusterIntrHart0Idx] };

  assign slave_isolate_req[FPClusterSlvIdx] = car_regs_reg2hw.spatz_cluster_isolate.q;
  assign car_regs_hw2reg.spatz_cluster_isolate_status.d = slave_isolated[FPClusterSlvIdx];
  assign car_regs_hw2reg.spatz_cluster_isolate_status.de = 1'b1;
  assign car_regs_hw2reg.spatz_cluster_busy.de = 1'b1;

  assign slave_isolated[FPClusterSlvIdx] = slave_isolated_rsp[FPClusterSlvIdx] &
                                           master_isolated_rsp[FPClusterMstIdx];

`ifndef FP_CLUSTER_NETLIST
  spatz_cluster_wrapper #(
    .AxiAddrWidth             ( Cfg.AddrWidth           ),
    .AxiDataWidth             ( Cfg.AxiDataWidth        ),
    .AxiUserWidth             ( Cfg.AxiUserWidth        ),
    .AxiInIdWidth             ( AxiSlvIdWidth           ),
    .AxiOutIdWidth            ( Cfg.AxiMstIdWidth       ),
    .IwcAxiIdOutWidth         ( FpClustIwcAxiIdOutWidth ),
    .LogDepth                 ( LogDepth                ),
    .CdcSyncStages            ( SyncStages              ),
    .SyncStages               ( SyncStages              ),
    .AxiMaxOutTrans           ( FpClustAxiMaxOutTrans   ),
    // AXI type IN
    .axi_in_resp_t            ( carfield_axi_slv_rsp_t     ),
    .axi_in_req_t             ( carfield_axi_slv_req_t     ),
    .axi_in_aw_chan_t         ( carfield_axi_slv_aw_chan_t ),
    .axi_in_w_chan_t          ( carfield_axi_slv_w_chan_t  ),
    .axi_in_b_chan_t          ( carfield_axi_slv_b_chan_t  ),
    .axi_in_ar_chan_t         ( carfield_axi_slv_ar_chan_t ),
    .axi_in_r_chan_t          ( carfield_axi_slv_r_chan_t  ),
    // AXI type OUT
    .axi_out_resp_t           ( carfield_axi_mst_rsp_t     ),
    .axi_out_req_t            ( carfield_axi_mst_req_t     ),
    .axi_out_aw_chan_t        ( carfield_axi_mst_aw_chan_t ),
    .axi_out_w_chan_t         ( carfield_axi_mst_w_chan_t  ),
    .axi_out_b_chan_t         ( carfield_axi_mst_b_chan_t  ),
    .axi_out_ar_chan_t        ( carfield_axi_mst_ar_chan_t ),
    .axi_out_r_chan_t         ( carfield_axi_mst_r_chan_t  ),
    //CDC AXI Slv parameters
    .AsyncAxiInAwWidth        ( CarfieldAxiSlvAwWidth  ),
    .AsyncAxiInWWidth         ( CarfieldAxiSlvWWidth   ),
    .AsyncAxiInBWidth         ( CarfieldAxiSlvBWidth   ),
    .AsyncAxiInArWidth        ( CarfieldAxiSlvArWidth  ),
    .AsyncAxiInRWidth         ( CarfieldAxiSlvRWidth   ),
    //CDC AXI Mst parameters
    .AsyncAxiOutAwWidth       ( CarfieldAxiMstAwWidth ),
    .AsyncAxiOutWWidth        ( CarfieldAxiMstWWidth  ),
    .AsyncAxiOutBWidth        ( CarfieldAxiMstBWidth  ),
    .AsyncAxiOutArWidth       ( CarfieldAxiMstArWidth ),
    .AsyncAxiOutRWidth        ( CarfieldAxiMstRWidth  )
    ) i_fp_cluster_wrapper (
`else
  spatz_cluster_wrapper i_fp_cluster_wrapper (
`endif
    .clk_i           ( spatz_clk            ),
    .rst_ni          ( spatz_rst_n          ),
    .pwr_on_rst_ni   ( spatz_pwr_on_rst_n   ),
    .meip_i          ( '0 /* Unconnected */ ),
    .msip_i          ( spatzcl_mbox_intr         ),
    .mtip_i          ( spatzcl_timer_intr        ),
    .debug_req_i     ( car_regs_reg2hw.spatz_cluster_debug_req ),
    //AXI Isolate
    .axi_isolate_i         ( slave_isolate_req [FPClusterSlvIdx]   ),
    .axi_isolated_o        ( master_isolated_rsp [FPClusterMstIdx] ),

    //AXI FP Cluster Slave Port <- Carfield Master Port
    .async_axi_in_aw_data_i ( axi_slv_ext_aw_data [FPClusterSlvIdx] ),
    .async_axi_in_aw_wptr_i ( axi_slv_ext_aw_wptr [FPClusterSlvIdx] ),
    .async_axi_in_aw_rptr_o ( axi_slv_ext_aw_rptr [FPClusterSlvIdx] ),
    .async_axi_in_w_data_i  ( axi_slv_ext_w_data  [FPClusterSlvIdx] ),
    .async_axi_in_w_wptr_i  ( axi_slv_ext_w_wptr  [FPClusterSlvIdx] ),
    .async_axi_in_w_rptr_o  ( axi_slv_ext_w_rptr  [FPClusterSlvIdx] ),
    .async_axi_in_b_data_o  ( axi_slv_ext_b_data  [FPClusterSlvIdx] ),
    .async_axi_in_b_wptr_o  ( axi_slv_ext_b_wptr  [FPClusterSlvIdx] ),
    .async_axi_in_b_rptr_i  ( axi_slv_ext_b_rptr  [FPClusterSlvIdx] ),
    .async_axi_in_ar_data_i ( axi_slv_ext_ar_data [FPClusterSlvIdx] ),
    .async_axi_in_ar_wptr_i ( axi_slv_ext_ar_wptr [FPClusterSlvIdx] ),
    .async_axi_in_ar_rptr_o ( axi_slv_ext_ar_rptr [FPClusterSlvIdx] ),
    .async_axi_in_r_data_o  ( axi_slv_ext_r_data  [FPClusterSlvIdx] ),
    .async_axi_in_r_wptr_o  ( axi_slv_ext_r_wptr  [FPClusterSlvIdx] ),
    .async_axi_in_r_rptr_i  ( axi_slv_ext_r_rptr  [FPClusterSlvIdx] ),
    //AXI FP Cluster Master Port -> Carfield Slave Port
    .async_axi_out_aw_data_o ( axi_mst_ext_aw_data [FPClusterMstIdx] ),
    .async_axi_out_aw_wptr_o ( axi_mst_ext_aw_wptr [FPClusterMstIdx] ),
    .async_axi_out_aw_rptr_i ( axi_mst_ext_aw_rptr [FPClusterMstIdx] ),
    .async_axi_out_w_data_o  ( axi_mst_ext_w_data  [FPClusterMstIdx] ),
    .async_axi_out_w_wptr_o  ( axi_mst_ext_w_wptr  [FPClusterMstIdx] ),
    .async_axi_out_w_rptr_i  ( axi_mst_ext_w_rptr  [FPClusterMstIdx] ),
    .async_axi_out_b_data_i  ( axi_mst_ext_b_data  [FPClusterMstIdx] ),
    .async_axi_out_b_wptr_i  ( axi_mst_ext_b_wptr  [FPClusterMstIdx] ),
    .async_axi_out_b_rptr_o  ( axi_mst_ext_b_rptr  [FPClusterMstIdx] ),
    .async_axi_out_ar_data_o ( axi_mst_ext_ar_data [FPClusterMstIdx] ),
    .async_axi_out_ar_wptr_o ( axi_mst_ext_ar_wptr [FPClusterMstIdx] ),
    .async_axi_out_ar_rptr_i ( axi_mst_ext_ar_rptr [FPClusterMstIdx] ),
    .async_axi_out_r_data_i  ( axi_mst_ext_r_data  [FPClusterMstIdx] ),
    .async_axi_out_r_wptr_i  ( axi_mst_ext_r_wptr  [FPClusterMstIdx] ),
    .async_axi_out_r_rptr_o  ( axi_mst_ext_r_rptr  [FPClusterMstIdx] ),
    .cluster_probe_o         ( car_regs_hw2reg.spatz_cluster_busy.d  )
  );

  for (genvar i = 0; i < spatz_cluster_pkg::NumCores; i++ ) begin : gen_spatzcl_mbox_intrs_spatz_harts
    assign safed_spatzcl_mbox_intr[i] = snd_mbox_intrs[i];
    for (genvar j = 0; j < CheshireNumIntHarts; j++ ) begin :  gen_spatzcl_mbox_intrs_host_harts
      assign hostd_spatzcl_mbox_intr[i][j] = snd_mbox_intrs[spatz_cluster_pkg::NumCores + (spatz_cluster_pkg::NumCores * j) + i];
    end
  end

  for (genvar i = 0; i < CheshireNumIntHarts; i++ ) begin : gen_spatzcl_mbox_intrs
    assign spatzcl_hostd_mbox_intr[i] = snd_mbox_intrs[SpatzMboxOffset + i];
  end
  assign spatzcl_safed_mbox_intr = snd_mbox_intrs[SpatzMboxOffset + CheshireNumIntHarts];

  logic [spatz_cluster_pkg::NumCores-1:0] hostd_spatzcl_mbox_intr_ored;
  // Floating point cluster
  for (genvar i = 0; i < spatz_cluster_pkg::NumCores; i++ ) begin : gen_spatzcl_mbox_intrs_or
    assign hostd_spatzcl_mbox_intr_ored[i] = |hostd_spatzcl_mbox_intr[i];
  end
  // For the spatz FP cluster SW interrupt in machine mode (msi), OR together interrupts coming from the
  // host domain and the safe domain
  assign spatzcl_mbox_intr = hostd_spatzcl_mbox_intr_ored | safed_spatzcl_mbox_intr;
  // verilog_lint: waive-stop line-length
end else begin : gen_no_spatz_cluster
  assign spatzcl_mbox_intr = '0;
  assign spatzcl_timer_intr = '0;
  assign car_regs_hw2reg.spatz_cluster_isolate_status.d = 1'b0;
  assign car_regs_hw2reg.spatz_cluster_isolate_status.de = 1'b0;
  assign car_regs_hw2reg.spatz_cluster_busy.d = '0;
  assign car_regs_hw2reg.spatz_cluster_busy.de = 1'b0;
  assign safed_spatzcl_mbox_intr = '0;
  assign hostd_spatzcl_mbox_intr = '0;
  assign spatzcl_hostd_mbox_intr = '0;
  assign spatzcl_safed_mbox_intr = '0;
  assign spatz_rst_n = '0;
  assign spatz_pwr_on_rst_n = '0;
  assign spatz_clk = '0;
end

// Security Island
logic secd_mbox_intr;
// Logic `or` on interrupts coming from different harts of the host domain
logic hostd_secd_mbox_intr_ored;
if (CarfieldIslandsCfg.secured.enable) begin : gen_secure_subsystem

  assign reset_vector[CarfieldDomainIdx.secured] = car_regs_reg2hw.security_island_rst.q;

  for (genvar i = 0; i < CheshireNumIntHarts; i++ ) begin : gen_hostd_mbox_intrs
    // hostd sender
    assign hostd_secd_mbox_intr [i] = snd_mbox_intrs[HostdMboxOffset + 1*CheshireNumIntHarts + i];
  end

  for (genvar i = 0; i < CheshireNumIntHarts; i++ ) begin : gen_secd_mbox_intrs
    assign secd_hostd_mbox_intr   [i] = snd_mbox_intrs[SecdMboxOffset + i];
  end
  assign secd_safed_mbox_intr    = snd_mbox_intrs[SecdMboxOffset + CheshireNumIntHarts];

  // Security island
  assign hostd_secd_mbox_intr_ored    = |hostd_secd_mbox_intr   ;

  // For the security island. OR together interrupts coming from the host domain and the safe domain
  assign secd_mbox_intr = hostd_secd_mbox_intr_ored | safed_secd_mbox_intr;

  assign security_rst_n = rsts_n[CarfieldDomainIdx.secured];
  assign security_pwr_on_rst_n = pwr_on_rsts_n[CarfieldDomainIdx.secured];
  assign security_clk = domain_clk_gated[CarfieldDomainIdx.secured];
  assign domain_clk_sel[CarfieldDomainIdx.secured] =
         car_regs_reg2hw.security_island_clk_sel.q;
  assign domain_clk_div_value[CarfieldDomainIdx.secured] =
         car_regs_reg2hw.security_island_clk_div_value.q;
  assign domain_clk_div_changed[CarfieldDomainIdx.secured] =
         car_regs_reg2hw.security_island_clk_div_value.qe;
  assign domain_clk_en[CarfieldDomainIdx.secured] = car_regs_reg2hw.security_island_clk_en.q |
                                        secure_boot_i;
  assign security_island_isolate_req  = car_regs_reg2hw.security_island_isolate.q &&
                                        !secure_boot_i;
  assign car_regs_hw2reg.security_island_isolate_status.d =
         master_isolated_rsp[SecurityIslandMstIdx];
  assign car_regs_hw2reg.security_island_isolate_status.de = 1'b1;

  `ifndef SECD_NETLIST
  secure_subsystem_synth_wrap #(
    .HartIdOffs            ( OpnTitHartIdOffs           ),
    .AxiAddrWidth          ( Cfg.AddrWidth              ),
    .AxiDataWidth          ( Cfg.AxiDataWidth           ),
    .AxiUserWidth          ( Cfg.AxiUserWidth           ),
    .AxiOutIdWidth         ( Cfg.AxiMstIdWidth          ),
    .AxiOtAddrWidth        ( Cfg.AddrWidth              ),
    .AxiOtDataWidth        ( AxiNarrowDataWidth         ), // TODO: why is this exposed?
    .AxiOtUserWidth        ( Cfg.AxiUserWidth           ),
    .AxiOtOutIdWidth       ( Cfg.AxiMstIdWidth          ),
    .AsyncAxiOutAwWidth    ( CarfieldAxiMstAwWidth      ),
    .AsyncAxiOutWWidth     ( CarfieldAxiMstWWidth       ),
    .AsyncAxiOutBWidth     ( CarfieldAxiMstBWidth       ),
    .AsyncAxiOutArWidth    ( CarfieldAxiMstArWidth      ),
    .AsyncAxiOutRWidth     ( CarfieldAxiMstRWidth       ),
    .axi_out_aw_chan_t     ( carfield_axi_mst_aw_chan_t ),
    .axi_out_w_chan_t      ( carfield_axi_mst_w_chan_t  ),
    .axi_out_b_chan_t      ( carfield_axi_mst_b_chan_t  ),
    .axi_out_ar_chan_t     ( carfield_axi_mst_ar_chan_t ),
    .axi_out_r_chan_t      ( carfield_axi_mst_r_chan_t  ),
    .axi_out_req_t         ( carfield_axi_mst_req_t     ),
    .axi_out_resp_t        ( carfield_axi_mst_rsp_t     ),
    .axi_ot_out_aw_chan_t  ( carfield_axi_mst_aw_chan_t ),
    .axi_ot_out_w_chan_t   ( carfield_axi_mst_w_chan_t  ),
    .axi_ot_out_b_chan_t   ( carfield_axi_mst_b_chan_t  ),
    .axi_ot_out_ar_chan_t  ( carfield_axi_mst_ar_chan_t ),
    .axi_ot_out_r_chan_t   ( carfield_axi_mst_r_chan_t  ),
    .axi_ot_out_req_t      ( carfield_axi_mst_req_t     ),
    .axi_ot_out_resp_t     ( carfield_axi_mst_rsp_t     ),
    .CdcSyncStages         ( SyncStages                 ),
    .SyncStages            ( SyncStages                 )
  ) i_security_island (
  `else
  security_island i_security_island (
  `endif
    .clk_i            ( security_clk    ),
    .clk_ref_i        ( rt_clk_i        ),
    .rst_ni           ( security_rst_n  ),
    .pwr_on_rst_ni    ( security_pwr_on_rst_n ),
    .fetch_en_i       ( car_regs_reg2hw.security_island_fetch_enable ),
    .bootmode_i       ( bootmode_ot_i   ),
    .test_enable_i    ( test_mode_i     ),
    .irq_ibex_i       ( secd_mbox_intr  ), // from hostd or safed
     // JTAG port
    .jtag_tck_i       ( jtag_ot_tck_i   ),
    .jtag_tms_i       ( jtag_ot_tms_i   ),
    .jtag_trst_n_i    ( jtag_ot_trst_ni ),
    .jtag_tdi_i       ( jtag_ot_tdi_i   ),
    .jtag_tdo_o       ( jtag_ot_tdo_o   ),
    .jtag_tdo_oe_o    ( jtag_ot_tdo_oe_o),
     // Asynch axi port
    .async_axi_out_aw_data_o ( axi_mst_ext_aw_data [SecurityIslandMstIdx] ),
    .async_axi_out_aw_wptr_o ( axi_mst_ext_aw_wptr [SecurityIslandMstIdx] ),
    .async_axi_out_aw_rptr_i ( axi_mst_ext_aw_rptr [SecurityIslandMstIdx] ),
    .async_axi_out_w_data_o  ( axi_mst_ext_w_data  [SecurityIslandMstIdx] ),
    .async_axi_out_w_wptr_o  ( axi_mst_ext_w_wptr  [SecurityIslandMstIdx] ),
    .async_axi_out_w_rptr_i  ( axi_mst_ext_w_rptr  [SecurityIslandMstIdx] ),
    .async_axi_out_b_data_i  ( axi_mst_ext_b_data  [SecurityIslandMstIdx] ),
    .async_axi_out_b_wptr_i  ( axi_mst_ext_b_wptr  [SecurityIslandMstIdx] ),
    .async_axi_out_b_rptr_o  ( axi_mst_ext_b_rptr  [SecurityIslandMstIdx] ),
    .async_axi_out_ar_data_o ( axi_mst_ext_ar_data [SecurityIslandMstIdx] ),
    .async_axi_out_ar_wptr_o ( axi_mst_ext_ar_wptr [SecurityIslandMstIdx] ),
    .async_axi_out_ar_rptr_i ( axi_mst_ext_ar_rptr [SecurityIslandMstIdx] ),
    .async_axi_out_r_data_i  ( axi_mst_ext_r_data  [SecurityIslandMstIdx] ),
    .async_axi_out_r_wptr_i  ( axi_mst_ext_r_wptr  [SecurityIslandMstIdx] ),
    .async_axi_out_r_rptr_o  ( axi_mst_ext_r_rptr  [SecurityIslandMstIdx] ),
    .axi_isolate_i    ( security_island_isolate_req                ),
    .axi_isolated_o   ( master_isolated_rsp[SecurityIslandMstIdx] ),
     // Uart
    .ibex_uart_rx_i   ( uart_ot_rx_i  ),
    .ibex_uart_tx_o   ( uart_ot_tx_o  ),
     // SPI host
    .spi_host_SCK_o   ( spih_ot_sck_o    ),
    .spi_host_SCK_en_o( spih_ot_sck_en_o ),
    .spi_host_CSB_o   ( spih_ot_csb_o    ),
    .spi_host_CSB_en_o( spih_ot_csb_en_o ),
    .spi_host_SD_o    ( spih_ot_sd_o     ),
    .spi_host_SD_i    ( spih_ot_sd_i     ),
    .spi_host_SD_en_o ( spih_ot_sd_en_o  )
  );
end else begin : gen_no_secure_subsystem
  assign hostd_secd_mbox_intr = '0;
  assign secd_hostd_mbox_intr = '0;
  assign secd_safed_mbox_intr = '0;
  assign hostd_secd_mbox_intr_ored = '0;
  assign secd_mbox_intr = '0;

  assign security_rst_n = '0;
  assign security_pwr_on_rst_n = '0;
  assign security_clk = '0;
  assign security_island_isolate_req = '0;
  assign car_regs_hw2reg.security_island_isolate_status.d = '0;
  assign car_regs_hw2reg.security_island_isolate_status.de = '0;

  assign jtag_ot_tdo_o = jtag_ot_tdi_i;
end

// Mailbox unit

// AXI cut
axi_cut #(
  .Bypass     ( 1'b0 ),
  .aw_chan_t  ( carfield_axi_slv_aw_chan_t ),
  .w_chan_t   ( carfield_axi_slv_w_chan_t  ),
  .b_chan_t   ( carfield_axi_slv_b_chan_t  ),
  .ar_chan_t  ( carfield_axi_slv_ar_chan_t ),
  .r_chan_t   ( carfield_axi_slv_r_chan_t  ),
  .axi_req_t  ( carfield_axi_slv_req_t     ),
  .axi_resp_t ( carfield_axi_slv_rsp_t     )
) i_cut_pre_amo_mbox (
  .clk_i      ( host_clk_i ),
  .rst_ni     ( host_pwr_on_rst_n ),
  .slv_req_i  ( axi_mbox_req     ),
  .slv_resp_o ( axi_mbox_rsp     ),
  .mst_req_o  ( axi_pre_amo_cut_mbox_req ),
  .mst_resp_i ( axi_pre_amo_cut_mbox_rsp )
);

// Shim atomics, which are not supported in reg
// TODO: should we use a filter instead here?
axi_riscv_atomics_structs #(
  .AxiAddrWidth     ( Cfg.AddrWidth          ),
  .AxiDataWidth     ( Cfg.AxiDataWidth       ),
  .AxiIdWidth       ( AxiSlvIdWidth          ),
  .AxiUserWidth     ( Cfg.AxiUserWidth       ),
  .AxiMaxReadTxns   ( Cfg.RegMaxReadTxns     ),
  .AxiMaxWriteTxns  ( Cfg.RegMaxWriteTxns    ),
  .AxiUserAsId      ( 1                      ),
  .AxiUserIdMsb     ( Cfg.AxiUserAmoMsb      ),
  .AxiUserIdLsb     ( Cfg.AxiUserAmoLsb      ),
  .RiscvWordWidth   ( 64                     ),
  .NAxiCuts         ( 0                      ),
  .axi_req_t        ( carfield_axi_slv_req_t ),
  .axi_rsp_t        ( carfield_axi_slv_rsp_t )
) i_atomics_mbox (
  .clk_i         ( host_clk_i        ),
  .rst_ni        ( host_pwr_on_rst_n ),
  .axi_slv_req_i ( axi_pre_amo_cut_mbox_req     ),
  .axi_slv_rsp_o ( axi_pre_amo_cut_mbox_rsp     ),
  .axi_mst_req_o ( axi_amo_mbox_req ),
  .axi_mst_rsp_i ( axi_amo_mbox_rsp )
);

// AXI cut
axi_cut #(
  .Bypass     ( ~Cfg.RegAmoPostCut ),
  .aw_chan_t  ( carfield_axi_slv_aw_chan_t ),
  .w_chan_t   ( carfield_axi_slv_w_chan_t  ),
  .b_chan_t   ( carfield_axi_slv_b_chan_t  ),
  .ar_chan_t  ( carfield_axi_slv_ar_chan_t ),
  .r_chan_t   ( carfield_axi_slv_r_chan_t  ),
  .axi_req_t  ( carfield_axi_slv_req_t     ),
  .axi_resp_t ( carfield_axi_slv_rsp_t     )
) i_cut_post_amo_mbox (
  .clk_i      ( host_clk_i ),
  .rst_ni     ( host_pwr_on_rst_n ),
  .slv_req_i  ( axi_amo_mbox_req     ),
  .slv_resp_o ( axi_amo_mbox_rsp     ),
  .mst_req_o  ( axi_post_amo_cut_mbox_req ),
  .mst_resp_i ( axi_post_amo_cut_mbox_rsp )
);

// Convert from AXI to reg protocol
carfield_reg_req_t reg_mbox_req;
carfield_reg_rsp_t reg_mbox_rsp;

axi_to_reg_v2 #(
  .AxiAddrWidth ( Cfg.AddrWidth    ),
  .AxiDataWidth ( Cfg.AxiDataWidth ),
  .AxiIdWidth   ( AxiSlvIdWidth    ),
  .AxiUserWidth ( Cfg.AxiUserWidth ),
  .RegDataWidth ( AxiNarrowDataWidth ), // 32-bit
  .axi_req_t    ( carfield_axi_slv_req_t ),
  .axi_rsp_t    ( carfield_axi_slv_rsp_t ),
  .reg_req_t    ( carfield_reg_req_t ),
  .reg_rsp_t    ( carfield_reg_rsp_t )
) i_axi_to_reg_v2_mbox (
  .clk_i     ( host_clk_i ),
  .rst_ni    ( host_pwr_on_rst_n ),
  .axi_req_i ( axi_post_amo_cut_mbox_req ),
  .axi_rsp_o ( axi_post_amo_cut_mbox_rsp ),
  .reg_req_o ( reg_mbox_req ),
  .reg_rsp_i ( reg_mbox_rsp ),
  .reg_id_o  ( ),
  .busy_o    ( )
);

mailbox_unit #(
  .reg_req_t( carfield_reg_req_t ),
  .reg_rsp_t( carfield_reg_rsp_t ),
  .NumMbox  ( NumMailboxes )
) i_mailbox_unit (
  .clk_i     ( host_clk_i ),
  .rst_ni    ( host_pwr_on_rst_n ),
  .reg_req_i ( reg_mbox_req ),
  .reg_rsp_o ( reg_mbox_rsp ),
  .snd_irq_o ( snd_mbox_intrs ),
  .rcv_irq_o ( )
);

// Carfield peripherals
// Ethernet
// Peripheral Clock Domain
logic ethernet_slave_isolated;
carfield_axi_slv_req_t axi_ethernet_req;
carfield_axi_slv_rsp_t axi_ethernet_rsp;

if (CarfieldIslandsCfg.ethernet.enable) begin : gen_ethernet
  assign ethernet_slave_isolated = slave_isolated[EthernetSlvIdx];
  assign slave_isolated[EthernetSlvIdx] = slave_isolated_rsp[EthernetSlvIdx];
  assign slave_isolate_req[EthernetSlvIdx] = car_regs_reg2hw.periph_isolate.q;
  axi_cdc_dst #(
    .LogDepth   ( LogDepth                   ),
    .SyncStages ( SyncStages                 ),
    .aw_chan_t  ( carfield_axi_slv_aw_chan_t ),
    .w_chan_t   ( carfield_axi_slv_w_chan_t  ),
    .b_chan_t   ( carfield_axi_slv_b_chan_t  ),
    .ar_chan_t  ( carfield_axi_slv_ar_chan_t ),
    .r_chan_t   ( carfield_axi_slv_r_chan_t  ),
    .axi_req_t  ( carfield_axi_slv_req_t     ),
    .axi_resp_t ( carfield_axi_slv_rsp_t     )
  ) i_ethernet_cdc_dst (
    .async_data_slave_aw_data_i ( axi_slv_ext_aw_data [EthernetSlvIdx] ),
    .async_data_slave_aw_wptr_i ( axi_slv_ext_aw_wptr [EthernetSlvIdx] ),
    .async_data_slave_aw_rptr_o ( axi_slv_ext_aw_rptr [EthernetSlvIdx] ),
    .async_data_slave_w_data_i  ( axi_slv_ext_w_data  [EthernetSlvIdx] ),
    .async_data_slave_w_wptr_i  ( axi_slv_ext_w_wptr  [EthernetSlvIdx] ),
    .async_data_slave_w_rptr_o  ( axi_slv_ext_w_rptr  [EthernetSlvIdx] ),
    .async_data_slave_b_data_o  ( axi_slv_ext_b_data  [EthernetSlvIdx] ),
    .async_data_slave_b_wptr_o  ( axi_slv_ext_b_wptr  [EthernetSlvIdx] ),
    .async_data_slave_b_rptr_i  ( axi_slv_ext_b_rptr  [EthernetSlvIdx] ),
    .async_data_slave_ar_data_i ( axi_slv_ext_ar_data [EthernetSlvIdx] ),
    .async_data_slave_ar_wptr_i ( axi_slv_ext_ar_wptr [EthernetSlvIdx] ),
    .async_data_slave_ar_rptr_o ( axi_slv_ext_ar_rptr [EthernetSlvIdx] ),
    .async_data_slave_r_data_o  ( axi_slv_ext_r_data  [EthernetSlvIdx] ),
    .async_data_slave_r_wptr_o  ( axi_slv_ext_r_wptr  [EthernetSlvIdx] ),
    .async_data_slave_r_rptr_i  ( axi_slv_ext_r_rptr  [EthernetSlvIdx] ),
    .dst_clk_i                  ( periph_clk       ),
    .dst_rst_ni                 ( periph_rst_n     ),
    .dst_req_o                  ( axi_ethernet_req ),
    .dst_resp_i                 ( axi_ethernet_rsp )
  );

  AXI_BUS #(
    .AXI_ADDR_WIDTH( Cfg.AddrWidth    ),
    .AXI_DATA_WIDTH( Cfg.AxiDataWidth ),
    .AXI_ID_WIDTH  ( AxiSlvIdWidth    ),
    .AXI_USER_WIDTH( Cfg.AxiUserWidth )
  ) axi_ethernet ();

  `AXI_ASSIGN_FROM_REQ(axi_ethernet, axi_ethernet_req);
  `AXI_ASSIGN_TO_RESP(axi_ethernet_rsp, axi_ethernet);

  // The Ethernet RGMII interfaces mandates a clock of 125MHz (in 1GBit mode) for both TX and RX
  // clocks. We generate a 125MHz clock starting from the `periph_clk`. The (integer) division value
  // is SW-programmable.
  localparam int unsigned EthRgmiiPhyClkDivWidth = 20;
  // We assume a peripheral clock of 250MHz to get the 125MHz clock for the RGMII interface. Hence,
  // the default division value after PoR is 250/125.
  localparam int unsigned EthRgmiiPhyClkDivDefaultValue = 2;
  logic [EthRgmiiPhyClkDivWidth-1:0] eth_rgmii_phy_clk_div_value;
  logic                     eth_rgmii_phy_clk_div_value_valid;
  logic                     eth_rgmii_phy_clk_div_value_ready;
  logic                     eth_rgmii_phy_clk0;

  // The register file does not support back pressure directly. I.e the hardware side cannot tell
  // the regfile that a reg value cannot be written at the moment. This is a problem since the clk
  // divider input of the clk_int_div module will stall the transaction until it is safe to change
  // the clock division factor. The stream_deposit module converts between these two protocols
  // (write-pulse only protocol <-> ready-valid protocol). See the documentation in the header of
  // the module for more details.
  lossy_valid_to_stream #(
    .DATA_WIDTH(EthRgmiiPhyClkDivWidth)
  ) i_eth_rgmii_phy_clk_div_config_decouple (
    .clk_i   ( periph_clk   ),
    .rst_ni  ( periph_rst_n ),
    .valid_i ( car_regs_reg2hw.eth_rgmii_phy_clk_div_value.qe ),
    .data_i  ( car_regs_reg2hw.eth_rgmii_phy_clk_div_value.q ),
    .valid_o ( eth_rgmii_phy_clk_div_value_valid ),
    .ready_i ( eth_rgmii_phy_clk_div_value_ready ),
    .data_o  ( eth_rgmii_phy_clk_div_value       ),
    .busy_o  ( )
  );

  (* no_ungroup *)
  (* no_boundary_optimization *)
  clk_int_div #(
    .DIV_VALUE_WIDTH       ( EthRgmiiPhyClkDivWidth ),
    .DEFAULT_DIV_VALUE     ( EthRgmiiPhyClkDivDefaultValue ),
    .ENABLE_CLOCK_IN_RESET ( 0   )
  ) i_eth_rgmii_phy_clk_int_div (
      .clk_i          ( periph_clk              ),
      .rst_ni         ( periph_rst_n            ),
      .en_i           ( car_regs_reg2hw.eth_rgmii_phy_clk_div_en.q ),
      .test_mode_en_i ( test_mode_i             ),
      .div_i          ( car_regs_reg2hw.eth_rgmii_phy_clk_div_value.q ),
      .div_valid_i    ( eth_rgmii_phy_clk_div_value_valid ),
      .div_ready_o    ( eth_rgmii_phy_clk_div_value_ready ),
      .clk_o          ( eth_rgmii_phy_clk0 ),
      .cycl_count_o   (                   )
  );


  // The Ethernet MDIO interfaces mandates a clock of 2.5MHz. We generate a 2.5MHz clock starting from
  // the `periph_clk`. The (integer) division value is SW-programmable.
  localparam int unsigned EthMdioClkDivWidth = 20;
  // We assume a default peripheral clock of 250 MHz to get the 2.5MHz required for the MDIO
  // interface. Hence, the default division value after PoR is 250/2.5
  localparam int unsigned EthMdioClkDivDefaultValue = 100;
  logic [EthRgmiiPhyClkDivWidth-1:0] eth_mdio_clk_div_value;
  logic                     eth_mdio_clk_div_value_valid;
  logic                     eth_mdio_clk_div_value_ready;
  logic                     eth_mdio_clk;

  lossy_valid_to_stream #(
    .DATA_WIDTH(EthMdioClkDivWidth)
  ) i_eth_mdio_clk_div_config_decouple (
    .clk_i   ( periph_clk   ),
    .rst_ni  ( periph_rst_n ),
    .valid_i ( car_regs_reg2hw.eth_mdio_clk_div_value.qe ),
    .data_i  ( car_regs_reg2hw.eth_mdio_clk_div_value.q ),
    .valid_o ( eth_mdio_clk_div_value_valid ),
    .ready_i ( eth_mdio_clk_div_value_ready ),
    .data_o  ( eth_mdio_clk_div_value       ),
    .busy_o  ( )
  );

  (* no_ungroup *)
  (* no_boundary_optimization *)
  clk_int_div #(
    .DIV_VALUE_WIDTH       ( EthMdioClkDivWidth ),
    .DEFAULT_DIV_VALUE     ( EthMdioClkDivDefaultValue ),
    .ENABLE_CLOCK_IN_RESET ( 0   )
  ) i_eth_mdio_clk_int_div (
      .clk_i          ( periph_clk   ),
      .rst_ni         ( periph_rst_n ),
      .en_i           ( car_regs_reg2hw.eth_mdio_clk_div_en.q ),
      .test_mode_en_i ( test_mode_i ),
      .div_i          ( car_regs_reg2hw.eth_mdio_clk_div_value.q ),
      .div_valid_i    ( eth_mdio_clk_div_value_valid ),
      .div_ready_o    ( eth_mdio_clk_div_value_ready ),
      .clk_o          ( eth_mdio_clk ),
      .cycl_count_o   (              )
  );

  // Ethernet IP
  eth_rgmii #(
    .AXI_ADDR_WIDTH ( Cfg.AddrWidth    ),
    .AXI_DATA_WIDTH ( Cfg.AxiDataWidth ),
    .AXI_ID_WIDTH   ( AxiSlvIdWidth    ),
    .AXI_USER_WIDTH ( Cfg.AxiUserWidth )
  ) i_eth_rgmii (
    .clk_i        ( eth_mdio_clk ),
    /* Clock 200MHz */
    // Only used with FPGA mapping for genesysII
    // in IDELAYCTRL cell's ref clk (see IP)
    .clk_200MHz_i ( '0 ),
    .rst_ni       ( periph_rst_n ),
    /* Ethernet Clock */
    // Quadrature (90deg) clk to `phy_tx_clk_i` -> disabled when
    // `USE_CLK90 == FALSE` in ethernet IP. See `eth_mac_1g_rgmii_fifo`.
    // In carfieldv1, USE_CLK90 == 0, hence changing the clock phase
    // is left to PHY chips on the PCB.
    .eth_clk_i    ( '0 ),

    .ethernet     ( axi_ethernet ),

    .eth_rxck     ( eth_rxck_i  ),
    .eth_rxctl    ( eth_rxctl_i ),
    .eth_rxd      ( eth_rxd_i   ),

    .eth_txck     ( eth_txck_o  ),
    .eth_txctl    ( eth_txctl_o ),
    .eth_txd      ( eth_txd_o   ),

    .eth_rst_n    ( eth_rst_n_o  ),
    .phy_tx_clk_i ( eth_rgmii_phy_clk0 ),  // in phase (0deg) clk

    // MDIO
    .eth_mdio_i    ( eth_md_i   ),
    .eth_mdio_o    ( eth_md_o   ),
    .eth_mdio_oe_o ( eth_md_oe  ),
    .eth_mdc_o     ( eth_mdc_o  ),

    .eth_irq       ( car_eth_intr )
  );

end else begin : gen_no_ethernet

  assign ethernet_slave_isolated = '0;
  assign car_eth_intr            = '0;
  assign eth_md_o                = '0;
  assign eth_md_oe               = '0;
  assign eth_mdc_o               = '0;
  assign eth_rst_n_o             = '0;
  assign eth_txck_o              = '0;
  assign eth_txctl_o             = '0;
  assign eth_txd_o               = '0;

end

// APB peripherals
// Periph Clock Domain
// axi_cdc -> axi_amos -> axi_cut -> axi_to_axilite -> axilite_to_apb -> periph devices
if (CarfieldIslandsCfg.periph.enable) begin: gen_periph // Handle with care...
  assign reset_vector[CarfieldDomainIdx.periph] = car_regs_reg2hw.periph_rst.q;

  assign slave_isolate_req[PeriphsSlvIdx] = car_regs_reg2hw.periph_isolate.q;
  assign slave_isolated[PeriphsSlvIdx] = slave_isolated_rsp[PeriphsSlvIdx];
  assign car_regs_hw2reg.periph_isolate_status.d = slave_isolated[PeriphsSlvIdx] |
                                                   hyper_isolated_rsp            |
                                                   ethernet_slave_isolated;
  assign car_regs_hw2reg.periph_isolate_status.de = 1'b1;

  carfield_axi_slv_req_t axi_d64_a48_peripherals_req;
  carfield_axi_slv_rsp_t axi_d64_a48_peripherals_rsp;

  axi_cdc_dst #(
    .LogDepth   ( LogDepth                   ),
    .SyncStages ( SyncStages                 ),
    .aw_chan_t  ( carfield_axi_slv_aw_chan_t ),
    .w_chan_t   ( carfield_axi_slv_w_chan_t  ),
    .b_chan_t   ( carfield_axi_slv_b_chan_t  ),
    .ar_chan_t  ( carfield_axi_slv_ar_chan_t ),
    .r_chan_t   ( carfield_axi_slv_r_chan_t  ),
    .axi_req_t  ( carfield_axi_slv_req_t     ),
    .axi_resp_t ( carfield_axi_slv_rsp_t     )
  ) i_cdc_dst_peripherals (
    // asynchronous slave port
    .async_data_slave_aw_data_i ( axi_slv_ext_aw_data [PeriphsSlvIdx] ),
    .async_data_slave_aw_wptr_i ( axi_slv_ext_aw_wptr [PeriphsSlvIdx] ),
    .async_data_slave_aw_rptr_o ( axi_slv_ext_aw_rptr [PeriphsSlvIdx] ),
    .async_data_slave_w_data_i  ( axi_slv_ext_w_data  [PeriphsSlvIdx] ),
    .async_data_slave_w_wptr_i  ( axi_slv_ext_w_wptr  [PeriphsSlvIdx] ),
    .async_data_slave_w_rptr_o  ( axi_slv_ext_w_rptr  [PeriphsSlvIdx] ),
    .async_data_slave_b_data_o  ( axi_slv_ext_b_data  [PeriphsSlvIdx] ),
    .async_data_slave_b_wptr_o  ( axi_slv_ext_b_wptr  [PeriphsSlvIdx] ),
    .async_data_slave_b_rptr_i  ( axi_slv_ext_b_rptr  [PeriphsSlvIdx] ),
    .async_data_slave_ar_data_i ( axi_slv_ext_ar_data [PeriphsSlvIdx] ),
    .async_data_slave_ar_wptr_i ( axi_slv_ext_ar_wptr [PeriphsSlvIdx] ),
    .async_data_slave_ar_rptr_o ( axi_slv_ext_ar_rptr [PeriphsSlvIdx] ),
    .async_data_slave_r_data_o  ( axi_slv_ext_r_data  [PeriphsSlvIdx] ),
    .async_data_slave_r_wptr_o  ( axi_slv_ext_r_wptr  [PeriphsSlvIdx] ),
    .async_data_slave_r_rptr_i  ( axi_slv_ext_r_rptr  [PeriphsSlvIdx] ),
    // synchronous master port
    .dst_clk_i                  ( periph_clk                  ),
    .dst_rst_ni                 ( periph_pwr_on_rst_n         ),
    .dst_req_o                  ( axi_d64_a48_peripherals_req ),
    .dst_resp_i                 ( axi_d64_a48_peripherals_rsp )
  );

  carfield_axi_slv_req_t axi_d64_a48_amo_peripherals_req;
  carfield_axi_slv_rsp_t axi_d64_a48_amo_peripherals_rsp;

  // Shim atomics, which are not supported in reg
  // TODO: should we use a filter instead here?
  axi_riscv_atomics_structs #(
    .AxiAddrWidth     ( Cfg.AddrWidth          ),
    .AxiDataWidth     ( Cfg.AxiDataWidth       ),
    .AxiIdWidth       ( AxiSlvIdWidth          ),
    .AxiUserWidth     ( Cfg.AxiUserWidth       ),
    .AxiMaxReadTxns   ( Cfg.RegMaxReadTxns     ),
    .AxiMaxWriteTxns  ( Cfg.RegMaxWriteTxns    ),
    .AxiUserAsId      ( 1                      ),
    .AxiUserIdMsb     ( Cfg.AxiUserAmoMsb      ),
    .AxiUserIdLsb     ( Cfg.AxiUserAmoLsb      ),
    .RiscvWordWidth   ( 64                     ),
    .NAxiCuts         ( Cfg.RegAmoNumCuts      ),
    .axi_req_t        ( carfield_axi_slv_req_t ),
    .axi_rsp_t        ( carfield_axi_slv_rsp_t )
  ) i_atomics_peripherals (
    .clk_i         ( periph_clk                      ),
    .rst_ni        ( periph_pwr_on_rst_n             ),
    .axi_slv_req_i ( axi_d64_a48_peripherals_req     ),
    .axi_slv_rsp_o ( axi_d64_a48_peripherals_rsp     ),
    .axi_mst_req_o ( axi_d64_a48_amo_peripherals_req ),
    .axi_mst_rsp_i ( axi_d64_a48_amo_peripherals_rsp )
  );

  carfield_axi_slv_req_t axi_d64_a48_amo_cut_peripherals_req;
  carfield_axi_slv_rsp_t axi_d64_a48_amo_cut_peripherals_rsp;

  axi_cut #(
    .Bypass     ( ~Cfg.RegAmoPostCut         ),
    .aw_chan_t  ( carfield_axi_slv_aw_chan_t ),
    .w_chan_t   ( carfield_axi_slv_w_chan_t  ),
    .b_chan_t   ( carfield_axi_slv_b_chan_t  ),
    .ar_chan_t  ( carfield_axi_slv_ar_chan_t ),
    .r_chan_t   ( carfield_axi_slv_r_chan_t  ),
    .axi_req_t  ( carfield_axi_slv_req_t     ),
    .axi_resp_t ( carfield_axi_slv_rsp_t     )
  ) i_atomics_cut_peripherals (
    .clk_i      ( periph_clk                          ),
    .rst_ni     ( periph_pwr_on_rst_n                 ),
    .slv_req_i  ( axi_d64_a48_amo_peripherals_req     ),
    .slv_resp_o ( axi_d64_a48_amo_peripherals_rsp     ),
    .mst_req_o  ( axi_d64_a48_amo_cut_peripherals_req ),
    .mst_resp_i ( axi_d64_a48_amo_cut_peripherals_rsp )
  );

  // Convert to d32 a48
  // verilog_lint: waive-start line-length
  `AXI_TYPEDEF_ALL_CT(carfield_axi_d32_a48_slv, carfield_axi_d32_a48_slv_req_t, carfield_axi_d32_a48_slv_rsp_t, car_addrw_t, car_slv_id_t, car_nar_dataw_t, car_nar_strb_t, car_usr_t)
  // verilog_lint: waive-stop line-length

  carfield_axi_d32_a48_slv_req_t axi_d32_a48_peripherals_req;
  carfield_axi_d32_a48_slv_rsp_t axi_d32_a48_peripherals_rsp;

  axi_dw_converter #(
    .AxiSlvPortDataWidth  ( Cfg.AxiDataWidth                  ),
    .AxiMstPortDataWidth  ( AxiNarrowDataWidth                ),
    .AxiAddrWidth         ( Cfg.AddrWidth                     ),
    .AxiIdWidth           ( AxiSlvIdWidth                     ),
    .aw_chan_t            ( carfield_axi_slv_aw_chan_t        ),
    .mst_w_chan_t         ( carfield_axi_d32_a48_slv_w_chan_t ),
    .slv_w_chan_t         ( carfield_axi_slv_w_chan_t         ),
    .b_chan_t             ( carfield_axi_slv_b_chan_t         ),
    .ar_chan_t            ( carfield_axi_slv_ar_chan_t        ),
    .mst_r_chan_t         ( carfield_axi_d32_a48_slv_r_chan_t ),
    .slv_r_chan_t         ( carfield_axi_slv_r_chan_t         ),
    .axi_mst_req_t        ( carfield_axi_d32_a48_slv_req_t    ),
    .axi_mst_resp_t       ( carfield_axi_d32_a48_slv_rsp_t    ),
    .axi_slv_req_t        ( carfield_axi_slv_req_t            ),
    .axi_slv_resp_t       ( carfield_axi_slv_rsp_t            )
  ) i_axi_dw_converter_peripherals (
    .clk_i      ( periph_clk                          ),
    .rst_ni     ( periph_pwr_on_rst_n                 ),
    .slv_req_i  ( axi_d64_a48_amo_cut_peripherals_req ),
    .slv_resp_o ( axi_d64_a48_amo_cut_peripherals_rsp ),
    .mst_req_o  ( axi_d32_a48_peripherals_req         ),
    .mst_resp_i ( axi_d32_a48_peripherals_rsp         )
  );

  // Convert to d32_a32
  // verilog_lint: waive-start line-length
  `AXI_TYPEDEF_ALL_CT(carfield_axi_d32_a32_slv, carfield_axi_d32_a32_slv_req_t, carfield_axi_d32_a32_slv_rsp_t, car_nar_addrw_t, car_slv_id_t, car_nar_dataw_t, car_nar_strb_t, car_usr_t)
  // verilog_lint: waive-stop line-length

  carfield_axi_d32_a32_slv_req_t axi_d32_a32_peripherals_req;
  carfield_axi_d32_a32_slv_rsp_t axi_d32_a32_peripherals_rsp;

  axi_modify_address #(
    .slv_req_t  ( carfield_axi_d32_a48_slv_req_t ),
    .mst_addr_t ( car_nar_addrw_t                ),
    .mst_req_t  ( carfield_axi_d32_a32_slv_req_t ),
    .axi_resp_t ( carfield_axi_d32_a32_slv_rsp_t )
  ) i_axi_modify_addr_peripherals (
    .slv_req_i     ( axi_d32_a48_peripherals_req               ),
    .slv_resp_o    ( axi_d32_a48_peripherals_rsp               ),
    .mst_req_o     ( axi_d32_a32_peripherals_req               ),
    .mst_resp_i    ( axi_d32_a32_peripherals_rsp               ),
    .mst_aw_addr_i ( axi_d32_a48_peripherals_req.aw.addr[31:0] ),
    .mst_ar_addr_i ( axi_d32_a48_peripherals_req.ar.addr[31:0] )
  );

  // AXI to AXI lite conversion
  // verilog_lint: waive-start line-length
  `AXI_LITE_TYPEDEF_ALL_CT(carfield_axi_lite_d32_a32, carfield_axi_lite_d32_a32_slv_req_t, carfield_axi_lite_d32_a32_slv_rsp_t, car_nar_addrw_t, car_nar_dataw_t, car_nar_strb_t)
  // verilog_lint: waive-stop line-length

  carfield_axi_lite_d32_a32_slv_req_t axi_lite_d32_a32_peripherals_req;
  carfield_axi_lite_d32_a32_slv_rsp_t axi_lite_d32_a32_peripherals_rsp;

  axi_to_axi_lite #(
    .AxiAddrWidth   ( AxiNarrowAddrWidth                  ),
    .AxiDataWidth   ( AxiNarrowDataWidth                  ),
    .AxiIdWidth     ( AxiSlvIdWidth                       ),
    .AxiUserWidth   ( Cfg.AxiUserWidth                    ),
    .AxiMaxWriteTxns( 1                                   ),
    .AxiMaxReadTxns ( 1                                   ),
    .FallThrough    ( 1                                   ),
    .full_req_t     ( carfield_axi_d32_a32_slv_req_t      ),
    .full_resp_t    ( carfield_axi_d32_a32_slv_rsp_t      ),
    .lite_req_t     ( carfield_axi_lite_d32_a32_slv_req_t ),
    .lite_resp_t    ( carfield_axi_lite_d32_a32_slv_rsp_t )
  ) i_axi_to_axi_lite_peripherals (
    .clk_i     ( periph_clk                       ),
    .rst_ni    ( periph_pwr_on_rst_n              ),
    .test_i    ( test_mode_i                      ),
    .slv_req_i ( axi_d32_a32_peripherals_req      ),
    .slv_resp_o( axi_d32_a32_peripherals_rsp      ),
    .mst_req_o ( axi_lite_d32_a32_peripherals_req ),
    .mst_resp_i( axi_lite_d32_a32_peripherals_rsp )
  );

  // APB req/rsp
  `APB_TYPEDEF_REQ_T(carfield_apb_req_t, car_nar_addrw_t, car_nar_dataw_t, car_nar_strb_t)
  `APB_TYPEDEF_RESP_T(carfield_apb_rsp_t, car_nar_dataw_t)

  // APB masters
  carfield_apb_req_t [NumApbMst-1:0] apb_mst_req;
  carfield_apb_rsp_t [NumApbMst-1:0] apb_mst_rsp;

  axi_lite_to_apb #(
    .NoApbSlaves     ( NumApbMst                           ),
    .NoRules         ( NumApbMst                           ),
    .AddrWidth       ( AxiNarrowAddrWidth                  ),
    .DataWidth       ( AxiNarrowDataWidth                  ),
    .PipelineRequest ( '0                                  ),
    .PipelineResponse( '0                                  ),
    .axi_lite_req_t  ( carfield_axi_lite_d32_a32_slv_req_t ),
    .axi_lite_resp_t ( carfield_axi_lite_d32_a32_slv_rsp_t ),
    .apb_req_t       ( carfield_apb_req_t                  ),
    .apb_resp_t      ( carfield_apb_rsp_t                  ),
    .rule_t          ( carfield_addr_map_rule_t            )
  ) i_axi_lite_to_apb_peripherals (
    .clk_i          ( periph_clk                           ),
    .rst_ni         ( periph_pwr_on_rst_n                  ),
    .axi_lite_req_i ( axi_lite_d32_a32_peripherals_req     ),
    .axi_lite_resp_o( axi_lite_d32_a32_peripherals_rsp     ),
    .apb_req_o      ( apb_mst_req                          ),
    .apb_resp_i     ( apb_mst_rsp                          ),
    .addr_map_i     ( PeriphApbAddrMapRule                 )
  );

  // System timer
  apb_timer_unit #(
    .APB_ADDR_WIDTH ( AxiNarrowAddrWidth )
  ) i_system_timer (
    .HCLK       ( periph_clk                          ),
    .HRESETn    ( periph_pwr_on_rst_n                 ),
    .PADDR      ( apb_mst_req[SystemTimerIdx].paddr   ),
    .PWDATA     ( apb_mst_req[SystemTimerIdx].pwdata  ),
    .PWRITE     ( apb_mst_req[SystemTimerIdx].pwrite  ),
    .PSEL       ( apb_mst_req[SystemTimerIdx].psel    ),
    .PENABLE    ( apb_mst_req[SystemTimerIdx].penable ),
    .PRDATA     ( apb_mst_rsp[SystemTimerIdx].prdata  ),
    .PREADY     ( apb_mst_rsp[SystemTimerIdx].pready  ),
    .PSLVERR    ( apb_mst_rsp[SystemTimerIdx].pslverr ),
    .ref_clk_i  ( rt_clk_i              ),
    .event_lo_i ( '0                    ),
    .event_hi_i ( '0                    ),
    .irq_lo_o   ( car_sys_timer_lo_intr ),
    .irq_hi_o   ( car_sys_timer_hi_intr ),
    .busy_o     ( /* TODO connect me */ )
  );

  // Advanced Timer
  apb_adv_timer #(
    .APB_ADDR_WIDTH  ( AxiNarrowAddrWidth ),
    .EXTSIG_NUM      ( 64                 )
  ) i_advanced_timer (
    .HCLK            ( periph_clk             ),
    .HRESETn         ( periph_pwr_on_rst_n    ),
    .dft_cg_enable_i ( 1'b0                   ),
    .PADDR           ( apb_mst_req[AdvancedTimerIdx].paddr   ),
    .PWDATA          ( apb_mst_req[AdvancedTimerIdx].pwdata  ),
    .PWRITE          ( apb_mst_req[AdvancedTimerIdx].pwrite  ),
    .PSEL            ( apb_mst_req[AdvancedTimerIdx].psel    ),
    .PENABLE         ( apb_mst_req[AdvancedTimerIdx].penable ),
    .PRDATA          ( apb_mst_rsp[AdvancedTimerIdx].prdata  ),
    .PREADY          ( apb_mst_rsp[AdvancedTimerIdx].pready  ),
    .PSLVERR         ( apb_mst_rsp[AdvancedTimerIdx].pslverr ),
    .low_speed_clk_i ( rt_clk_i              ),
    .ext_sig_i       ( '0 /* TODO connect me */ ),
    .events_o        ( car_adv_timer_events  ),
    .ch_0_o          ( car_adv_timer_intrs   ),
    .ch_1_o          ( ),
    .ch_2_o          ( ),
    .ch_3_o          ( )
  );

  // Watchdog timer
  REG_BUS #(
    .ADDR_WIDTH ( AxiNarrowAddrWidth ),
    .DATA_WIDTH ( AxiNarrowDataWidth )
  ) reg_bus_wdt (periph_clk);

  apb_to_reg i_apb_to_reg_wdt (
    .clk_i     ( periph_clk                        ),
    .rst_ni    ( periph_pwr_on_rst_n               ),
    .penable_i ( apb_mst_req[SystemWdtIdx].penable ),
    .pwrite_i  ( apb_mst_req[SystemWdtIdx].pwrite  ),
    .paddr_i   ( apb_mst_req[SystemWdtIdx].paddr   ),
    .psel_i    ( apb_mst_req[SystemWdtIdx].psel    ),
    .pwdata_i  ( apb_mst_req[SystemWdtIdx].pwdata  ),
    .prdata_o  ( apb_mst_rsp[SystemWdtIdx].prdata  ),
    .pready_o  ( apb_mst_rsp[SystemWdtIdx].pready  ),
    .pslverr_o ( apb_mst_rsp[SystemWdtIdx].pslverr ),
    .reg_o     ( reg_bus_wdt                 )
  );

  // crop the address to 32-bit
  assign reg_wdt_req.addr  = reg_bus_wdt.addr;
  assign reg_wdt_req.write = reg_bus_wdt.write;
  assign reg_wdt_req.wdata = reg_bus_wdt.wdata;
  assign reg_wdt_req.wstrb = reg_bus_wdt.wstrb;
  assign reg_wdt_req.valid = reg_bus_wdt.valid;

  assign reg_bus_wdt.rdata = reg_wdt_rsp.rdata;
  assign reg_bus_wdt.error = reg_wdt_rsp.error;
  assign reg_bus_wdt.ready = reg_wdt_rsp.ready;

  // reg to tilelink
  tlul_ot_pkg::tl_h2d_t tl_wdt_req;
  tlul_ot_pkg::tl_d2h_t tl_wdt_rsp;

  reg_to_tlul #(
    .req_t             ( carfield_a32_d32_reg_req_t     ),
    .rsp_t             ( carfield_a32_d32_reg_rsp_t     ),
    .tl_h2d_t          ( tlul_ot_pkg::tl_h2d_t          ),
    .tl_d2h_t          ( tlul_ot_pkg::tl_d2h_t          ),
    .tl_a_user_t       ( tlul_ot_pkg::tl_a_user_t       ),
    .tl_a_op_e         ( tlul_ot_pkg::tl_a_op_e         ),
    .TL_A_USER_DEFAULT ( tlul_ot_pkg::TL_A_USER_DEFAULT ),
    .PutFullData       ( tlul_ot_pkg::PutFullData       ),
    .Get               ( tlul_ot_pkg::Get               )
  ) i_reg_to_tlul_wdt (
    .tl_o      ( tl_wdt_req  ),
    .tl_i      ( tl_wdt_rsp  ),
    .reg_req_i ( reg_wdt_req ),
    .reg_rsp_o ( reg_wdt_rsp )
  );

  // Wdt
  aon_timer i_watchdog_timer (
    .clk_i                     ( periph_clk            ),
    .rst_ni                    ( periph_pwr_on_rst_n   ),
    .clk_aon_i                 ( rt_clk_i              ),
    .rst_aon_ni                ( periph_pwr_on_rst_n   ),
    .tl_i                      ( tl_wdt_req            ),
    .tl_o                      ( tl_wdt_rsp            ),
    .alert_rx_i                ( '0                    ), // TODO: what are these for?
    .alert_tx_o                ( /* TODO connect me */ ),
    .lc_escalate_en_i          ( '0                    ),
    .intr_wkup_timer_expired_o ( car_wdt_intrs[0] ),
    .intr_wdog_timer_bark_o    ( car_wdt_intrs[1] ),
    .nmi_wdog_timer_bark_o     ( car_wdt_intrs[2] ),
    .wkup_req_o                ( car_wdt_intrs[3] ),
    .aon_timer_rst_req_o       ( car_wdt_intrs[4] ),
    .sleep_mode_i              ( '0                    )
  );

  // Hyperbus
  REG_BUS #(
    .ADDR_WIDTH ( AxiNarrowAddrWidth ),
    .DATA_WIDTH ( AxiNarrowDataWidth )
  ) reg_bus_hyper (periph_clk);

  apb_to_reg i_apb_to_reg_hyper (
    .clk_i     ( periph_clk                       ),
    .rst_ni    ( periph_pwr_on_rst_n              ),
    .penable_i ( apb_mst_req[HyperBusIdx].penable ),
    .pwrite_i  ( apb_mst_req[HyperBusIdx].pwrite  ),
    .paddr_i   ( apb_mst_req[HyperBusIdx].paddr   ),
    .psel_i    ( apb_mst_req[HyperBusIdx].psel    ),
    .pwdata_i  ( apb_mst_req[HyperBusIdx].pwdata  ),
    .prdata_o  ( apb_mst_rsp[HyperBusIdx].prdata  ),
    .pready_o  ( apb_mst_rsp[HyperBusIdx].pready  ),
    .pslverr_o ( apb_mst_rsp[HyperBusIdx].pslverr ),
    .reg_o     ( reg_bus_hyper                    )
  );

  assign reg_hyper_req.addr  = reg_bus_hyper.addr;
  assign reg_hyper_req.write = reg_bus_hyper.write;
  assign reg_hyper_req.wdata = reg_bus_hyper.wdata;
  assign reg_hyper_req.wstrb = reg_bus_hyper.wstrb;
  assign reg_hyper_req.valid = reg_bus_hyper.valid;

  assign reg_bus_hyper.rdata = reg_hyper_rsp.rdata;
  assign reg_bus_hyper.error = reg_hyper_rsp.error;
  assign reg_bus_hyper.ready = reg_hyper_rsp.ready;

  // CAN bus
  logic [63:0] can_timestamp;
  assign can_timestamp = '1;
  if (carfield_configuration::CanEnable) begin: gen_can
    can_top_apb #(
      .rx_buffer_size   ( 32                    ),
      .txt_buffer_count ( 2                     ),
      .target_technology( 0                     ) // 0 for ASIC or 1 for FPGA
    ) i_apb_to_can (
      .aclk             ( periph_clk             ),
      .arstn            ( periph_pwr_on_rst_n    ),
      .scan_enable      ( 1'b0                   ),
      .res_n_out        (                        ),
      .irq              ( car_can_intr           ),
      .CAN_tx           ( can_tx_o               ),
      .CAN_rx           ( can_rx_i               ),
      .timestamp        ( can_timestamp          ),
      .s_apb_paddr      ( apb_mst_req[CanIdx].paddr   ),
      .s_apb_penable    ( apb_mst_req[CanIdx].penable ),
      .s_apb_pprot      ( 3'b000                 ),
      .s_apb_prdata     ( apb_mst_rsp[CanIdx].prdata  ),
      .s_apb_pready     ( apb_mst_rsp[CanIdx].pready  ),
      .s_apb_psel       ( apb_mst_req[CanIdx].psel    ),
      .s_apb_pslverr    ( apb_mst_rsp[CanIdx].pslverr ),
      .s_apb_pstrb      ( 4'b1111                ),
      .s_apb_pwdata     ( apb_mst_req[CanIdx].pwdata  ),
      .s_apb_pwrite     ( apb_mst_req[CanIdx].pwrite  )
    );
  end else begin: gen_no_can
    assign car_can_intr = '0;
    assign can_tx_o = '0;
    assign apb_mst_rsp[CanIdx] = '0;
  end
end else begin: gen_no_periph
  assign car_regs_hw2reg.periph_isolate_status.d = '0;
  assign car_regs_hw2reg.periph_isolate_status.de = '0;
end
endmodule
