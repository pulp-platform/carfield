// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Thomas Benz     <tbenz@ethz.ch>
// Luca Valente    <luca.valente@unibo.it>
// Yvan Tortorella <yvan.tortorella@unibo.it>

`include "cheshire/typedef.svh"

/// Top-level implementation of Carfield
module carfield
  import carfield_pkg::*;
  import cheshire_pkg::*;
  import safety_island_pkg::*;
#(
  parameter cheshire_cfg_t Cfg = carfield_pkg::CarfieldCfgDefault,
  parameter int unsigned HypNumPhys  = 1,
  parameter int unsigned HypNumChips = 1,
  parameter string RomCtrlBootRomInitFile = "",
  parameter string OtpCtrlMemInitFile     = "",
  parameter string FlashCtrlMemInitFile   = ""
) (
  input   logic                                       clk_i,
  input   logic                                       rst_ni,
  input   logic                                       test_mode_i,
  // Boot mode selection
  input   logic [1:0]                                 boot_mode_i,
  // CLINT
  input   logic                                       rtc_i,
  // JTAG Interfacex Cheshire
  input   logic                                       jtag_tck_i,
  input   logic                                       jtag_trst_ni,
  input   logic                                       jtag_tms_i,
  input   logic                                       jtag_tdi_i,
  output  logic                                       jtag_tdo_o,
  output  logic                                       jtag_tdo_oe_o,
  // JTAG Interfacex Secure Subsystem
  input   logic                                       jtag_ot_tck_i,
  input   logic                                       jtag_ot_trst_ni,
  input   logic                                       jtag_ot_tms_i,
  input   logic                                       jtag_ot_tdi_i,
  output  logic                                       jtag_ot_tdo_o,
  output  logic                                       jtag_ot_tdo_oe_o,
  // UART Interface
  output logic                                        uart_tx_o,
  input  logic                                        uart_rx_i,
  // UART Interface cheshire
  output logic                                        uart_ot_tx_o,
  input  logic                                        uart_ot_rx_i,
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

/*********************************
* General parameters and defines *
**********************************/
`CHESHIRE_TYPEDEF_ALL(carfield_, Cfg)

// Type for address map entries
typedef struct packed {
  logic [$bits(aw_bt)-1:0] idx;
  logic [Cfg.AddrWidth-1:0] start_addr;
  logic [Cfg.AddrWidth-1:0] end_addr;
} addr_rule_t;

// Generate indices and get maps for all ports
localparam axi_in_t   AxiIn   = gen_axi_in(Cfg);
localparam axi_out_t  AxiOut  = gen_axi_out(Cfg);

// Define needed parameters
localparam int unsigned AxiStrbWidth  = Cfg.AxiDataWidth / 8;
localparam int unsigned AxiSlvIdWidth = Cfg.AxiMstIdWidth + $clog2(AxiIn.num_in);

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
// Integer Cluster Slave CDC Parameters
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
// Integer Cluster Master CDC Parameters
localparam int unsigned IntClusterAxiMstAwWidth =
                        (2**LogDepth)*axi_pkg::aw_width(Cfg.AddrWidth          ,
                                                        IntClusterAxiIdOutWidth,
                                                        Cfg.AxiUserWidth       );
localparam int unsigned IntClusterAxiMstWWidth  =
                        (2**LogDepth)*axi_pkg::w_width(Cfg.AxiDataWidth,
                                                       Cfg.AxiUserWidth);
localparam int unsigned IntClusterAxiMstBWidth  =
                        (2**LogDepth)*axi_pkg::b_width(IntClusterAxiIdOutWidth,
                                                      Cfg.AxiUserWidth        );
localparam int unsigned IntClusterAxiMstArWidth =
                        (2**LogDepth)*axi_pkg::ar_width(Cfg.AddrWidth          ,
                                                        IntClusterAxiIdOutWidth,
                                                        Cfg.AxiUserWidth       );
localparam int unsigned IntClusterAxiMstRWidth  =
                        (2**LogDepth)*axi_pkg::r_width(Cfg.AxiDataWidth       ,
                                                       IntClusterAxiIdOutWidth,
                                                       Cfg.AxiUserWidth       );

// Slave Side
`AXI_TYPEDEF_ALL_CT(axi_intcluster_slv                ,
                    axi_intcluster_slv_req_t          ,
                    axi_intcluster_slv_rsp_t          ,
                    logic [Cfg.AddrWidth-1:0]         ,
                    logic [IntClusterAxiIdInWidth-1:0],
                    logic [Cfg.AxiDataWidth-1:0]      ,
                    logic [(Cfg.AxiDataWidth)/8-1:0]  ,
                    logic [Cfg.AxiUserWidth-1:0]      )

// Master side
`AXI_TYPEDEF_ALL_CT(axi_intcluster_mst                 ,
                    axi_intcluster_mst_req_t           ,
                    axi_intcluster_mst_rsp_t           ,
                    logic [Cfg.AddrWidth-1:0]          ,
                    logic [IntClusterAxiIdOutWidth-1:0],
                    logic [Cfg.AxiDataWidth-1:0]       ,
                    logic [(Cfg.AxiDataWidth)/8-1:0]   ,
                    logic [Cfg.AxiUserWidth-1:0]       )

// Local DRAM buses and parameter
carfield_axi_llc_req_t dram_req;
carfield_axi_llc_rsp_t dram_rsp;

carfield_reg_req_t ext_reg_req;
carfield_reg_rsp_t ext_reg_rsp;

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

// All AXI Slaves (except the Integer Cluster)
logic [iomsb(Cfg.AxiExtNumSlv-1):0][CarfieldAxiSlvAwWidth-1:0] axi_slv_ext_aw_data;
logic [iomsb(Cfg.AxiExtNumSlv-1):0][               LogDepth:0] axi_slv_ext_aw_wptr;
logic [iomsb(Cfg.AxiExtNumSlv-1):0][               LogDepth:0] axi_slv_ext_aw_rptr;
logic [iomsb(Cfg.AxiExtNumSlv-1):0][ CarfieldAxiSlvWWidth-1:0] axi_slv_ext_w_data ;
logic [iomsb(Cfg.AxiExtNumSlv-1):0][               LogDepth:0] axi_slv_ext_w_wptr ;
logic [iomsb(Cfg.AxiExtNumSlv-1):0][               LogDepth:0] axi_slv_ext_w_rptr ;
logic [iomsb(Cfg.AxiExtNumSlv-1):0][ CarfieldAxiSlvBWidth-1:0] axi_slv_ext_b_data ;
logic [iomsb(Cfg.AxiExtNumSlv-1):0][               LogDepth:0] axi_slv_ext_b_wptr ;
logic [iomsb(Cfg.AxiExtNumSlv-1):0][               LogDepth:0] axi_slv_ext_b_rptr ;
logic [iomsb(Cfg.AxiExtNumSlv-1):0][CarfieldAxiSlvArWidth-1:0] axi_slv_ext_ar_data;
logic [iomsb(Cfg.AxiExtNumSlv-1):0][               LogDepth:0] axi_slv_ext_ar_wptr;
logic [iomsb(Cfg.AxiExtNumSlv-1):0][               LogDepth:0] axi_slv_ext_ar_rptr;
logic [iomsb(Cfg.AxiExtNumSlv-1):0][ CarfieldAxiSlvRWidth-1:0] axi_slv_ext_r_data ;
logic [iomsb(Cfg.AxiExtNumSlv-1):0][               LogDepth:0] axi_slv_ext_r_wptr ;
logic [iomsb(Cfg.AxiExtNumSlv-1):0][               LogDepth:0] axi_slv_ext_r_rptr ;

// All AXI Slaves (except the Integer Cluster)
logic [iomsb(Cfg.AxiExtNumMst-1):0][CarfieldAxiMstAwWidth-1:0] axi_mst_ext_aw_data;
logic [iomsb(Cfg.AxiExtNumMst-1):0][               LogDepth:0] axi_mst_ext_aw_wptr;
logic [iomsb(Cfg.AxiExtNumMst-1):0][               LogDepth:0] axi_mst_ext_aw_rptr;
logic [iomsb(Cfg.AxiExtNumMst-1):0][ CarfieldAxiMstWWidth-1:0] axi_mst_ext_w_data ;
logic [iomsb(Cfg.AxiExtNumMst-1):0][               LogDepth:0] axi_mst_ext_w_wptr ;
logic [iomsb(Cfg.AxiExtNumMst-1):0][               LogDepth:0] axi_mst_ext_w_rptr ;
logic [iomsb(Cfg.AxiExtNumMst-1):0][ CarfieldAxiMstBWidth-1:0] axi_mst_ext_b_data ;
logic [iomsb(Cfg.AxiExtNumMst-1):0][               LogDepth:0] axi_mst_ext_b_wptr ;
logic [iomsb(Cfg.AxiExtNumMst-1):0][               LogDepth:0] axi_mst_ext_b_rptr ;
logic [iomsb(Cfg.AxiExtNumMst-1):0][CarfieldAxiMstArWidth-1:0] axi_mst_ext_ar_data;
logic [iomsb(Cfg.AxiExtNumMst-1):0][               LogDepth:0] axi_mst_ext_ar_wptr;
logic [iomsb(Cfg.AxiExtNumMst-1):0][               LogDepth:0] axi_mst_ext_ar_rptr;
logic [iomsb(Cfg.AxiExtNumMst-1):0][ CarfieldAxiMstRWidth-1:0] axi_mst_ext_r_data ;
logic [iomsb(Cfg.AxiExtNumMst-1):0][               LogDepth:0] axi_mst_ext_r_wptr ;
logic [iomsb(Cfg.AxiExtNumMst-1):0][               LogDepth:0] axi_mst_ext_r_rptr ;

// Integer Cluster Slave Bus
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

// Integer Cluster Master Bus
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

// local output enable flipped
logic        i2c_sda_en;
logic        i2c_scl_en;
logic        spim_sck_en;
logic [ 1:0] spim_csb_en;
logic [ 3:0] spim_sd_en;

// irq for Secure Subsytem and Cheshire
logic        ibex_mbox_irq;
logic        ches_mbox_irq;

/***************
* Carfield IPs *
***************/
// Cheshire SoC
cheshire_wrap #(
  .Cfg                            ( Cfg                          ),
  .ExtHartinfo                    ( '0                           ),
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
  .axi_intcluster_slv_ar_chan_t   ( axi_intcluster_slv_ar_chan_t ),
  .axi_intcluster_slv_aw_chan_t   ( axi_intcluster_slv_aw_chan_t ),
  .axi_intcluster_slv_b_chan_t    ( axi_intcluster_slv_b_chan_t  ),
  .axi_intcluster_slv_r_chan_t    ( axi_intcluster_slv_r_chan_t  ),
  .axi_intcluster_slv_w_chan_t    ( axi_intcluster_slv_w_chan_t  ),
  .axi_intcluster_slv_req_t       ( axi_intcluster_slv_req_t     ),
  .axi_intcluster_slv_rsp_t       ( axi_intcluster_slv_rsp_t     ),
  .axi_intcluster_mst_ar_chan_t   ( axi_intcluster_mst_ar_chan_t ),
  .axi_intcluster_mst_aw_chan_t   ( axi_intcluster_mst_aw_chan_t ),
  .axi_intcluster_mst_b_chan_t    ( axi_intcluster_mst_b_chan_t  ),
  .axi_intcluster_mst_r_chan_t    ( axi_intcluster_mst_r_chan_t  ),
  .axi_intcluster_mst_w_chan_t    ( axi_intcluster_mst_w_chan_t  ),
  .axi_intcluster_mst_req_t       ( axi_intcluster_mst_req_t     ),
  .axi_intcluster_mst_rsp_t       ( axi_intcluster_mst_rsp_t     ),
  .cheshire_reg_ext_req_t         ( carfield_reg_req_t           ),
  .cheshire_reg_ext_rsp_t         ( carfield_reg_rsp_t           ),
  .LogDepth                       ( LogDepth                     ),
  .AxiIn                          ( AxiIn                        ),
  .AxiOut                         ( AxiOut                       )
) i_cheshire_soc                  (
  .clk_i                          ,
  .rst_ni                         ,
  .test_mode_i                    ,
  .boot_mode_i                    ,
  .rtc_i                          ,
  // External AXI LLC (DRAM) port
  .llc_mst_ar_data_o ( llc_ar_data ),
  .llc_mst_ar_wptr_o ( llc_ar_wptr ),
  .llc_mst_ar_rptr_i ( llc_ar_rptr ),
  .llc_mst_aw_data_o ( llc_aw_data ),
  .llc_mst_aw_wptr_o ( llc_aw_wptr ),
  .llc_mst_aw_rptr_i ( llc_aw_rptr ),
  .llc_mst_b_data_i  ( llc_b_data  ),
  .llc_mst_b_wptr_i  ( llc_b_wptr  ),
  .llc_mst_b_rptr_o  ( llc_b_rptr  ),
  .llc_mst_r_data_i  ( llc_r_data  ),
  .llc_mst_r_wptr_i  ( llc_r_wptr  ),
  .llc_mst_r_rptr_o  ( llc_r_rptr  ),
  .llc_mst_w_data_o  ( llc_w_data  ),
  .llc_mst_w_wptr_o  ( llc_w_wptr  ),
  .llc_mst_w_rptr_i  ( llc_w_rptr  ),
  // External AXI slave devices (except the Integer Cluster)
  .axi_ext_slv_ar_data_o ( axi_slv_ext_ar_data ),
  .axi_ext_slv_ar_wptr_o ( axi_slv_ext_ar_wptr ),
  .axi_ext_slv_ar_rptr_i ( axi_slv_ext_ar_rptr ),
  .axi_ext_slv_aw_data_o ( axi_slv_ext_aw_data ),
  .axi_ext_slv_aw_wptr_o ( axi_slv_ext_aw_wptr ),
  .axi_ext_slv_aw_rptr_i ( axi_slv_ext_aw_rptr ),
  .axi_ext_slv_b_data_i  ( axi_slv_ext_b_data  ),
  .axi_ext_slv_b_wptr_i  ( axi_slv_ext_b_wptr  ),
  .axi_ext_slv_b_rptr_o  ( axi_slv_ext_b_rptr  ),
  .axi_ext_slv_r_data_i  ( axi_slv_ext_r_data  ),
  .axi_ext_slv_r_wptr_i  ( axi_slv_ext_r_wptr  ),
  .axi_ext_slv_r_rptr_o  ( axi_slv_ext_r_rptr  ),
  .axi_ext_slv_w_data_o  ( axi_slv_ext_w_data  ),
  .axi_ext_slv_w_wptr_o  ( axi_slv_ext_w_wptr  ),
  .axi_ext_slv_w_rptr_i  ( axi_slv_ext_w_rptr  ),
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
  // Integer Cluster Slave Port
  .axi_slv_intcluster_aw_data_o ( axi_slv_intcluster_aw_data ),
  .axi_slv_intcluster_aw_wptr_o ( axi_slv_intcluster_aw_wptr ),
  .axi_slv_intcluster_aw_rptr_i ( axi_slv_intcluster_aw_rptr ),
  .axi_slv_intcluster_w_data_o  ( axi_slv_intcluster_w_data  ),
  .axi_slv_intcluster_w_wptr_o  ( axi_slv_intcluster_w_wptr  ),
  .axi_slv_intcluster_w_rptr_i  ( axi_slv_intcluster_w_rptr  ),
  .axi_slv_intcluster_b_data_i  ( axi_slv_intcluster_b_data  ),
  .axi_slv_intcluster_b_wptr_i  ( axi_slv_intcluster_b_wptr  ),
  .axi_slv_intcluster_b_rptr_o  ( axi_slv_intcluster_b_rptr  ),
  .axi_slv_intcluster_ar_data_o ( axi_slv_intcluster_ar_data ),
  .axi_slv_intcluster_ar_wptr_o ( axi_slv_intcluster_ar_wptr ),
  .axi_slv_intcluster_ar_rptr_i ( axi_slv_intcluster_ar_rptr ),
  .axi_slv_intcluster_r_data_i  ( axi_slv_intcluster_r_data  ),
  .axi_slv_intcluster_r_wptr_i  ( axi_slv_intcluster_r_wptr  ),
  .axi_slv_intcluster_r_rptr_o  ( axi_slv_intcluster_r_rptr  ),
  // Integer Cluster Slave Port
  .axi_mst_intcluster_aw_data_i ( axi_mst_intcluster_aw_data ),
  .axi_mst_intcluster_aw_wptr_i ( axi_mst_intcluster_aw_wptr ),
  .axi_mst_intcluster_aw_rptr_o ( axi_mst_intcluster_aw_rptr ),
  .axi_mst_intcluster_w_data_i  ( axi_mst_intcluster_w_data  ),
  .axi_mst_intcluster_w_wptr_i  ( axi_mst_intcluster_w_wptr  ),
  .axi_mst_intcluster_w_rptr_o  ( axi_mst_intcluster_w_rptr  ),
  .axi_mst_intcluster_b_data_o  ( axi_mst_intcluster_b_data  ),
  .axi_mst_intcluster_b_wptr_o  ( axi_mst_intcluster_b_wptr  ),
  .axi_mst_intcluster_b_rptr_i  ( axi_mst_intcluster_b_rptr  ),
  .axi_mst_intcluster_ar_data_i ( axi_mst_intcluster_ar_data ),
  .axi_mst_intcluster_ar_wptr_i ( axi_mst_intcluster_ar_wptr ),
  .axi_mst_intcluster_ar_rptr_o ( axi_mst_intcluster_ar_rptr ),
  .axi_mst_intcluster_r_data_o  ( axi_mst_intcluster_r_data  ),
  .axi_mst_intcluster_r_wptr_o  ( axi_mst_intcluster_r_wptr  ),
  .axi_mst_intcluster_r_rptr_i  ( axi_mst_intcluster_r_rptr  ),
  // External reg demux slaves
  .reg_ext_slv_req_o ( ext_reg_req     ),
  .reg_ext_slv_rsp_i ( ext_reg_rsp     ),
  // Interrupts from external devices
  .intr_ext_i        ( ches_mbox_irq   ),
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
// Hyperbus
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

axi_cdc_dst #(
  .LogDepth   ( LogDepth                   ),
  .aw_chan_t  ( carfield_axi_llc_aw_chan_t ),
  .w_chan_t   ( carfield_axi_llc_w_chan_t  ),
  .b_chan_t   ( carfield_axi_llc_b_chan_t  ),
  .ar_chan_t  ( carfield_axi_llc_ar_chan_t ),
  .r_chan_t   ( carfield_axi_llc_r_chan_t  ),
  .axi_req_t  ( carfield_axi_llc_req_t     ),
  .axi_resp_t ( carfield_axi_llc_rsp_t     )
) i_dram_mst_cdc_dst (
  // asynchronous slave port
  .async_data_slave_aw_data_i ( llc_aw_data ),
  .async_data_slave_aw_wptr_i ( llc_aw_wptr ),
  .async_data_slave_aw_rptr_o ( llc_aw_rptr ),
  .async_data_slave_w_data_i  ( llc_w_data  ),
  .async_data_slave_w_wptr_i  ( llc_w_wptr  ),
  .async_data_slave_w_rptr_o  ( llc_w_rptr  ),
  .async_data_slave_b_data_o  ( llc_b_data  ),
  .async_data_slave_b_wptr_o  ( llc_b_wptr  ),
  .async_data_slave_b_rptr_i  ( llc_b_rptr  ),
  .async_data_slave_ar_data_i ( llc_ar_data ),
  .async_data_slave_ar_wptr_i ( llc_ar_wptr ),
  .async_data_slave_ar_rptr_o ( llc_ar_rptr ),
  .async_data_slave_r_data_o  ( llc_r_data  ),
  .async_data_slave_r_wptr_o  ( llc_r_wptr  ),
  .async_data_slave_r_rptr_i  ( llc_r_rptr  ),
  // synchronous master port
  .dst_clk_i                  ( clk_i    ),
  .dst_rst_ni                 ( rst_ni   ),
  .dst_req_o                  ( dram_req ),
  .dst_resp_i                 ( dram_rsp )
);

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

// Reconfigurable L2 Memory
logic l2_ecc_err;

l2_wrapper #(
  .NumPort      ( NumL2Ports             ),
  .AxiAddrWidth ( Cfg.AddrWidth          ),
  .AxiDataWidth ( Cfg.AxiDataWidth       ),
  .AxiIdWidth   ( AxiSlvIdWidth          ),
  .AxiUserWidth ( Cfg.AxiUserWidth       ),
  .LogDepth     ( LogDepth               ),
  .NumRules     ( L2NumRules             ),
  .L2MemSize    ( L2MemSize              )
) i_reconfigrurable_l2 (
  .clk_i               ( clk_i                                ),
  .rst_ni              ( rst_ni                               ),
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
  .ecc_error_o         ( l2_ecc_err                           )
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

safety_island_synth_wrapper #(
  .AxiAddrWidth             ( Cfg.AddrWidth              ),
  .AxiDataWidth             ( Cfg.AxiDataWidth           ),
  .AxiUserWidth             ( Cfg.AxiUserWidth           ),
  .AxiInIdWidth             ( AxiSlvIdWidth              ),
  .AxiOutIdWidth            ( Cfg.AxiMstIdWidth          ),
  .LogDepth                 ( LogDepth                   ),
  .SafetyIslandBaseAddr     ( SafetyIslandBase           ),
  .SafetyIslandAddrRange    ( SafetyIslandSize           ),
  .SafetyIslandMemOffset    ( SafetyIslandMemOffset      ),
  .SafetyIslandPeriphOffset ( SafetyIslandPerOffset      ),
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
  .clk_i                  ( clk_i                         ),
  .ref_clk_i              ( clk_i                         ),
  .rst_ni                 ( rst_ni                        ),
  .test_enable_i          ( '0                            ),
  .bootmode_i             ( safety_island_bootmode        ),
  .irqs_i                 ( '0                            ),
  .jtag_tck_i             ( safety_jtag_tck               ),
  .jtag_trst_ni           ( safety_jtag_trst              ),
  .jtag_tms_i             ( safety_jtag_tms               ),
  .jtag_tdi_i             ( safety_jtag_tdi               ),
  .jtag_tdo_o             ( safety_jtag_tdo               ),
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
  .AXI_ID_OUT_WIDTH               ( IntClusterAxiIdOutWidth   ),
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

// Security Island

localparam int unsigned SecIslAxiDataWidth = 32;

secure_subsystem_synth_wrap #(
  .RomCtrlBootRomInitFile( RomCtrlBootRomInitFile     ),
  .OtpCtrlMemInitFile    ( OtpCtrlMemInitFile         ),
  .FlashCtrlMemInitFile  ( FlashCtrlMemInitFile       ),
  .AxiAddrWidth          ( Cfg.AddrWidth              ),
  .AxiDataWidth          ( Cfg.AxiDataWidth           ),
  .AxiUserWidth          ( Cfg.AxiUserWidth           ),
  .AxiOutIdWidth         ( Cfg.AxiMstIdWidth          ),
  .AxiOtAddrWidth        ( Cfg.AddrWidth              ),
  .AxiOtDataWidth        ( SecIslAxiDataWidth         ), // TODO: why is this exposed?
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
  .axi_ot_out_resp_t     ( carfield_axi_mst_rsp_t     )
) i_security_island (
  .clk_i            ( clk_i           ),
  .clk_ref_i        ( clk_i           ),
  .rst_ni           ( rst_ni          ),
  .fetch_en_i       ( '1              ),
  .bootmode_i       ( '0              ),
  .test_enable_i    ( '0              ),
  .irq_ibex_i       ( ibex_mbox_irq   ),
   // JTAG port
  .jtag_tck_i       ( jtag_ot_tck_i   ),
  .jtag_tms_i       ( jtag_ot_tms_i   ),
  .jtag_trst_n_i    ( jtag_ot_trst_ni ),
  .jtag_tdi_i       ( jtag_ot_tdi_i   ),
  .jtag_tdo_o       ( jtag_ot_tdo_o   ),
  .jtag_tdo_oe_o    (                 ),
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
   // Uart
  .ibex_uart_rx_i   ( uart_ot_tx_o  ),
  .ibex_uart_tx_o   ( uart_ot_rx_i  ),
   // SPI host
  .spi_host_SCK_o   (               ),
  .spi_host_CSB_o   (               ),
  .spi_host_SD_o    (               ),
  .spi_host_SD_i    ( '0            ),
  .spi_host_SD_en_o (               )
);

// Mailbox Unit

`AXI_TYPEDEF_ALL_CT(axi_mbox                ,
                    axi_mbox_req_t          ,
                    axi_mbox_rsp_t          ,
                    logic [Cfg.AddrWidth-1:0],
                    logic [AxiSlvIdWidth-1:0],
                    logic [Cfg.AxiDataWidth-1:0],
                    logic [AxiStrbWidth-1:0],
                    logic [Cfg.AxiUserWidth-1:0])

axi_mbox_req_t axi_mbox_req;
axi_mbox_rsp_t axi_mbox_rsp;

axi_cdc_dst #(
  .LogDepth   ( LogDepth                   ),
  .aw_chan_t  ( carfield_axi_slv_aw_chan_t ),
  .w_chan_t   ( carfield_axi_slv_w_chan_t  ),
  .b_chan_t   ( carfield_axi_slv_b_chan_t  ),
  .ar_chan_t  ( carfield_axi_slv_ar_chan_t ),
  .r_chan_t   ( carfield_axi_slv_r_chan_t  ),
  .axi_req_t  ( carfield_axi_slv_req_t     ),
  .axi_resp_t ( carfield_axi_slv_rsp_t     )
) i_mailbox_cdc_dst (
  // asynchronous slave port
  .async_data_slave_aw_data_i ( axi_slv_ext_aw_data [MailboxSlvIdx] ),
  .async_data_slave_aw_wptr_i ( axi_slv_ext_aw_wptr [MailboxSlvIdx] ),
  .async_data_slave_aw_rptr_o ( axi_slv_ext_aw_rptr [MailboxSlvIdx] ),
  .async_data_slave_w_data_i  ( axi_slv_ext_w_data  [MailboxSlvIdx] ),
  .async_data_slave_w_wptr_i  ( axi_slv_ext_w_wptr  [MailboxSlvIdx] ),
  .async_data_slave_w_rptr_o  ( axi_slv_ext_w_rptr  [MailboxSlvIdx] ),
  .async_data_slave_b_data_o  ( axi_slv_ext_b_data  [MailboxSlvIdx] ),
  .async_data_slave_b_wptr_o  ( axi_slv_ext_b_wptr  [MailboxSlvIdx] ),
  .async_data_slave_b_rptr_i  ( axi_slv_ext_b_rptr  [MailboxSlvIdx] ),
  .async_data_slave_ar_data_i ( axi_slv_ext_ar_data [MailboxSlvIdx] ),
  .async_data_slave_ar_wptr_i ( axi_slv_ext_ar_wptr [MailboxSlvIdx] ),
  .async_data_slave_ar_rptr_o ( axi_slv_ext_ar_rptr [MailboxSlvIdx] ),
  .async_data_slave_r_data_o  ( axi_slv_ext_r_data  [MailboxSlvIdx] ),
  .async_data_slave_r_wptr_o  ( axi_slv_ext_r_wptr  [MailboxSlvIdx] ),
  .async_data_slave_r_rptr_i  ( axi_slv_ext_r_rptr  [MailboxSlvIdx] ),
  // synchronous master port
  .dst_clk_i                  ( clk_i        ),
  .dst_rst_ni                 ( rst_ni       ),
  .dst_req_o                  ( axi_mbox_req ),
  .dst_resp_i                 ( axi_mbox_rsp )
);

axi_scmi_mailbox #(
  .AXI_ADDR_WIDTH     ( Cfg.AddrWidth          ),
  .AXI_MST_DATA_WIDTH ( Cfg.AxiDataWidth       ),
  .AXI_ID_WIDTH       ( AxiSlvIdWidth          ),
  .AXI_USER_WIDTH     ( Cfg.AxiUserWidth       ),
  .axi_req_t          ( carfield_axi_slv_req_t ),
  .axi_resp_t         ( carfield_axi_slv_rsp_t )
) i_scmi_ot_mailbox   (
  .clk_i              ( clk_i         ),
  .rst_ni             ( rst_ni        ),
  .axi_mbox_req       ( axi_mbox_req  ),
  .axi_mbox_rsp       ( axi_mbox_rsp  ),
  .doorbell_irq_o     ( ibex_mbox_irq ),
  .completion_irq_o   ( ches_mbox_irq )
);

endmodule
