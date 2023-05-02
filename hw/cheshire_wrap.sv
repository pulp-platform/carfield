// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Luca Valente    <luca.valente@unibo.it>
// Yvan Tortorella <yvan.tortorella@unibo.it>

`include "cheshire/typedef.svh"

module cheshire_wrap
  import axi_pkg::*;
  import carfield_pkg::*;
  import cheshire_pkg::*;
#(
  parameter cheshire_cfg_t Cfg = CarfieldCfgDefault,
  parameter dm::hartinfo_t [iomsb(Cfg.NumExtDbgHarts)-1:0] ExtHartinfo = '0,
  parameter type cheshire_axi_ext_llc_ar_chan_t = logic,
  parameter type cheshire_axi_ext_llc_aw_chan_t = logic,
  parameter type cheshire_axi_ext_llc_b_chan_t  = logic,
  parameter type cheshire_axi_ext_llc_r_chan_t  = logic,
  parameter type cheshire_axi_ext_llc_w_chan_t  = logic,
  parameter type cheshire_axi_ext_llc_req_t     = logic,
  parameter type cheshire_axi_ext_llc_rsp_t     = logic,
  parameter type cheshire_axi_ext_mst_ar_chan_t = logic,
  parameter type cheshire_axi_ext_mst_aw_chan_t = logic,
  parameter type cheshire_axi_ext_mst_b_chan_t  = logic,
  parameter type cheshire_axi_ext_mst_r_chan_t  = logic,
  parameter type cheshire_axi_ext_mst_w_chan_t  = logic,
  parameter type cheshire_axi_ext_mst_req_t     = logic,
  parameter type cheshire_axi_ext_mst_rsp_t     = logic,
  parameter type cheshire_axi_ext_slv_ar_chan_t = logic,
  parameter type cheshire_axi_ext_slv_aw_chan_t = logic,
  parameter type cheshire_axi_ext_slv_b_chan_t  = logic,
  parameter type cheshire_axi_ext_slv_r_chan_t  = logic,
  parameter type cheshire_axi_ext_slv_w_chan_t  = logic,
  parameter type cheshire_axi_ext_slv_req_t     = logic,
  parameter type cheshire_axi_ext_slv_rsp_t     = logic,
  parameter type axi_intcluster_slv_ar_chan_t   = logic,
  parameter type axi_intcluster_slv_aw_chan_t   = logic,
  parameter type axi_intcluster_slv_b_chan_t    = logic,
  parameter type axi_intcluster_slv_r_chan_t    = logic,
  parameter type axi_intcluster_slv_w_chan_t    = logic,
  parameter type axi_intcluster_slv_req_t       = logic,
  parameter type axi_intcluster_slv_rsp_t       = logic,
  parameter type axi_intcluster_mst_ar_chan_t   = logic,
  parameter type axi_intcluster_mst_aw_chan_t   = logic,
  parameter type axi_intcluster_mst_b_chan_t    = logic,
  parameter type axi_intcluster_mst_r_chan_t    = logic,
  parameter type axi_intcluster_mst_w_chan_t    = logic,
  parameter type axi_intcluster_mst_req_t       = logic,
  parameter type axi_intcluster_mst_rsp_t       = logic,
  parameter type cheshire_reg_ext_req_t         = logic,
  parameter type cheshire_reg_ext_rsp_t         = logic,
  parameter int unsigned LogDepth = 3,
  parameter axi_in_t    AxiIn  = gen_axi_in(Cfg) ,
  parameter axi_out_t   AxiOut = gen_axi_out(Cfg),
  // LLC Parameters
  localparam int unsigned LlcIdWidth = Cfg.AxiMstIdWidth   +
                                       $clog2(AxiIn.num_in)+
                                       Cfg.LlcNotBypass    ,
  localparam int unsigned LlcArWidth = (2**LogDepth)*
                                       axi_pkg::ar_width(Cfg.AddrWidth   ,
                                                         LlcIdWidth      ,
                                                         Cfg.AxiUserWidth),
  localparam int unsigned LlcAwWidth = (2**LogDepth)*
                                        axi_pkg::aw_width(Cfg.AddrWidth  ,
                                                         LlcIdWidth      ,
                                                         Cfg.AxiUserWidth),
  localparam int unsigned LlcBWidth  = (2**LogDepth)*
                                        axi_pkg::b_width(LlcIdWidth      ,
                                                         Cfg.AxiUserWidth),
  localparam int unsigned LlcRWidth  = (2**LogDepth)*
                                        axi_pkg::r_width(Cfg.AxiDataWidth,
                                                        LlcIdWidth      ,
                                                        Cfg.AxiUserWidth),
  localparam int unsigned LlcWWidth  = (2**LogDepth)*
                                        axi_pkg::w_width(Cfg.AxiDataWidth,
                                                         Cfg.AxiUserWidth),
  // External Slaves Parameters
  localparam int unsigned ExtSlvIdWidth = Cfg.AxiMstIdWidth   +
                                          $clog2(AxiIn.num_in ),
  localparam int unsigned ExtSlvArWidth = (2**LogDepth)*
                                           axi_pkg::ar_width(Cfg.AddrWidth  ,
                                                            ExtSlvIdWidth   ,
                                                            Cfg.AxiUserWidth),
  localparam int unsigned ExtSlvAwWidth = (2**LogDepth)*
                                           axi_pkg::aw_width(Cfg.AddrWidth  ,
                                                            ExtSlvIdWidth   ,
                                                            Cfg.AxiUserWidth),
  localparam int unsigned ExtSlvBWidth  = (2**LogDepth)*
                                           axi_pkg::b_width(ExtSlvIdWidth   ,
                                                            Cfg.AxiUserWidth),
  localparam int unsigned ExtSlvRWidth  = (2**LogDepth)*
                                          axi_pkg::r_width(Cfg.AxiDataWidth,
                                                           ExtSlvIdWidth   ,
                                                           Cfg.AxiUserWidth),
  localparam int unsigned ExtSlvWWidth  = (2**LogDepth)*
                                           axi_pkg::w_width(Cfg.AxiDataWidth,
                                                            Cfg.AxiUserWidth),
  // External Master Parameters
  localparam int unsigned ExtMstArWidth = (2**LogDepth)*
                                           axi_pkg::ar_width(Cfg.AddrWidth    ,
                                                             Cfg.AxiMstIdWidth,
                                                             Cfg.AxiUserWidth ),
  localparam int unsigned ExtMstAwWidth = (2**LogDepth)*
                                           axi_pkg::aw_width(Cfg.AddrWidth    ,
                                                             Cfg.AxiMstIdWidth,
                                                             Cfg.AxiUserWidth ),
  localparam int unsigned ExtMstBWidth  = (2**LogDepth)*
                                           axi_pkg::b_width(Cfg.AxiMstIdWidth,
                                                            Cfg.AxiUserWidth ),
  localparam int unsigned ExtMstRWidth  = (2**LogDepth)*
                                           axi_pkg::r_width(Cfg.AxiDataWidth ,
                                                            Cfg.AxiMstIdWidth,
                                                            Cfg.AxiUserWidth ),
  localparam int unsigned ExtMstWWidth  = (2**LogDepth)*
                                           axi_pkg::w_width(Cfg.AxiDataWidth,
                                                            Cfg.AxiUserWidth),
  // Integer Cluster slave parameters
  localparam int unsigned IntClusterAxiSlvAwWidth =
                          (2**LogDepth)*axi_pkg::aw_width(Cfg.AddrWidth         ,
                                                          IntClusterAxiIdInWidth,
                                                          Cfg.AxiUserWidth      ),
  localparam int unsigned IntClusterAxiSlvWWidth  =
                          (2**LogDepth)*axi_pkg::w_width(Cfg.AxiDataWidth,
                                                         Cfg.AxiUserWidth),
  localparam int unsigned IntClusterAxiSlvBWidth  =
                          (2**LogDepth)*axi_pkg::b_width(IntClusterAxiIdInWidth,
                                                         Cfg.AxiUserWidth      ),
  localparam int unsigned IntClusterAxiSlvArWidth =
                          (2**LogDepth)*axi_pkg::ar_width(Cfg.AddrWidth         ,
                                                          IntClusterAxiIdInWidth,
                                                          Cfg.AxiUserWidth      ),
  localparam int unsigned IntClusterAxiSlvRWidth  =
                          (2**LogDepth)*axi_pkg::r_width(Cfg.AxiDataWidth      ,
                                                         IntClusterAxiIdInWidth,
                                                         Cfg.AxiUserWidth      ),
  // Integer Cluster Master parameters
  localparam int unsigned IntClusterAxiMstAwWidth =
                          (2**LogDepth)*axi_pkg::aw_width(Cfg.AddrWidth          ,
                                                          IntClusterAxiIdOutWidth,
                                                          Cfg.AxiUserWidth       ),
  localparam int unsigned IntClusterAxiMstWWidth  =
                          (2**LogDepth)*axi_pkg::w_width(Cfg.AxiDataWidth,
                                                         Cfg.AxiUserWidth),
  localparam int unsigned IntClusterAxiMstBWidth  =
                          (2**LogDepth)*axi_pkg::b_width(IntClusterAxiIdOutWidth,
                                                        Cfg.AxiUserWidth        ),
  localparam int unsigned IntClusterAxiMstArWidth =
                          (2**LogDepth)*axi_pkg::ar_width(Cfg.AddrWidth          ,
                                                          IntClusterAxiIdOutWidth,
                                                          Cfg.AxiUserWidth       ),
  localparam int unsigned IntClusterAxiMstRWidth  =
                          (2**LogDepth)*axi_pkg::r_width(Cfg.AxiDataWidth       ,
                                                         IntClusterAxiIdOutWidth,
                                                         Cfg.AxiUserWidth       )
)(
  input  logic        clk_i      ,
  input  logic        rst_ni     ,
  input  logic        test_mode_i,
  input  logic [1:0]  boot_mode_i,
  input  logic        rtc_i      ,
  // External AXI LLC (DRAM) port
  output logic [LlcArWidth-1:0] llc_mst_ar_data_o,
  output logic [    LogDepth:0] llc_mst_ar_wptr_o,
  input  logic [    LogDepth:0] llc_mst_ar_rptr_i,
  output logic [LlcAwWidth-1:0] llc_mst_aw_data_o,
  output logic [    LogDepth:0] llc_mst_aw_wptr_o,
  input  logic [    LogDepth:0] llc_mst_aw_rptr_i,
  input  logic [ LlcBWidth-1:0] llc_mst_b_data_i ,
  input  logic [    LogDepth:0] llc_mst_b_wptr_i ,
  output logic [    LogDepth:0] llc_mst_b_rptr_o ,
  input  logic [ LlcRWidth-1:0] llc_mst_r_data_i ,
  input  logic [    LogDepth:0] llc_mst_r_wptr_i ,
  output logic [    LogDepth:0] llc_mst_r_rptr_o ,
  output logic [ LlcWWidth-1:0] llc_mst_w_data_o ,
  output logic [    LogDepth:0] llc_mst_w_wptr_o ,
  input  logic [    LogDepth:0] llc_mst_w_rptr_i ,
  // External AXI slave devices (except the Integer Cluster)
  output logic [iomsb(Cfg.AxiExtNumSlv-1):0][ExtSlvArWidth-1:0] axi_ext_slv_ar_data_o,
  output logic [iomsb(Cfg.AxiExtNumSlv-1):0][       LogDepth:0] axi_ext_slv_ar_wptr_o,
  input  logic [iomsb(Cfg.AxiExtNumSlv-1):0][       LogDepth:0] axi_ext_slv_ar_rptr_i,
  output logic [iomsb(Cfg.AxiExtNumSlv-1):0][ExtSlvAwWidth-1:0] axi_ext_slv_aw_data_o,
  output logic [iomsb(Cfg.AxiExtNumSlv-1):0][       LogDepth:0] axi_ext_slv_aw_wptr_o,
  input  logic [iomsb(Cfg.AxiExtNumSlv-1):0][       LogDepth:0] axi_ext_slv_aw_rptr_i,
  input  logic [iomsb(Cfg.AxiExtNumSlv-1):0][ ExtSlvBWidth-1:0] axi_ext_slv_b_data_i ,
  input  logic [iomsb(Cfg.AxiExtNumSlv-1):0][       LogDepth:0] axi_ext_slv_b_wptr_i ,
  output logic [iomsb(Cfg.AxiExtNumSlv-1):0][       LogDepth:0] axi_ext_slv_b_rptr_o ,
  input  logic [iomsb(Cfg.AxiExtNumSlv-1):0][ ExtSlvRWidth-1:0] axi_ext_slv_r_data_i ,
  input  logic [iomsb(Cfg.AxiExtNumSlv-1):0][       LogDepth:0] axi_ext_slv_r_wptr_i ,
  output logic [iomsb(Cfg.AxiExtNumSlv-1):0][       LogDepth:0] axi_ext_slv_r_rptr_o ,
  output logic [iomsb(Cfg.AxiExtNumSlv-1):0][ ExtSlvWWidth-1:0] axi_ext_slv_w_data_o ,
  output logic [iomsb(Cfg.AxiExtNumSlv-1):0][       LogDepth:0] axi_ext_slv_w_wptr_o ,
  input  logic [iomsb(Cfg.AxiExtNumSlv-1):0][       LogDepth:0] axi_ext_slv_w_rptr_i ,
  // External AXI master devices (except the Integer Cluster)
  input  logic [iomsb(Cfg.AxiExtNumMst-1):0][ExtMstArWidth-1:0] axi_ext_mst_ar_data_i,
  input  logic [iomsb(Cfg.AxiExtNumMst-1):0][       LogDepth:0] axi_ext_mst_ar_wptr_i,
  output logic [iomsb(Cfg.AxiExtNumMst-1):0][       LogDepth:0] axi_ext_mst_ar_rptr_o,
  input  logic [iomsb(Cfg.AxiExtNumMst-1):0][ExtMstAwWidth-1:0] axi_ext_mst_aw_data_i,
  input  logic [iomsb(Cfg.AxiExtNumMst-1):0][       LogDepth:0] axi_ext_mst_aw_wptr_i,
  output logic [iomsb(Cfg.AxiExtNumMst-1):0][       LogDepth:0] axi_ext_mst_aw_rptr_o,
  output logic [iomsb(Cfg.AxiExtNumMst-1):0][ ExtMstBWidth-1:0] axi_ext_mst_b_data_o ,
  output logic [iomsb(Cfg.AxiExtNumMst-1):0][       LogDepth:0] axi_ext_mst_b_wptr_o ,
  input  logic [iomsb(Cfg.AxiExtNumMst-1):0][       LogDepth:0] axi_ext_mst_b_rptr_i ,
  output logic [iomsb(Cfg.AxiExtNumMst-1):0][ ExtMstRWidth-1:0] axi_ext_mst_r_data_o ,
  output logic [iomsb(Cfg.AxiExtNumMst-1):0][       LogDepth:0] axi_ext_mst_r_wptr_o ,
  input  logic [iomsb(Cfg.AxiExtNumMst-1):0][       LogDepth:0] axi_ext_mst_r_rptr_i ,
  input  logic [iomsb(Cfg.AxiExtNumMst-1):0][ ExtMstWWidth-1:0] axi_ext_mst_w_data_i ,
  input  logic [iomsb(Cfg.AxiExtNumMst-1):0][       LogDepth:0] axi_ext_mst_w_wptr_i ,
  output logic [iomsb(Cfg.AxiExtNumMst-1):0][       LogDepth:0] axi_ext_mst_w_rptr_o ,
  // Integer Cluster Slave Port
  output logic [IntClusterAxiSlvAwWidth-1:0] axi_slv_intcluster_aw_data_o,
  output logic [                 LogDepth:0] axi_slv_intcluster_aw_wptr_o,
  input  logic [                 LogDepth:0] axi_slv_intcluster_aw_rptr_i,
  output logic [ IntClusterAxiSlvWWidth-1:0] axi_slv_intcluster_w_data_o ,
  output logic [                 LogDepth:0] axi_slv_intcluster_w_wptr_o ,
  input  logic [                 LogDepth:0] axi_slv_intcluster_w_rptr_i ,
  input  logic [ IntClusterAxiSlvBWidth-1:0] axi_slv_intcluster_b_data_i ,
  input  logic [                 LogDepth:0] axi_slv_intcluster_b_wptr_i ,
  output logic [                 LogDepth:0] axi_slv_intcluster_b_rptr_o ,
  output logic [IntClusterAxiSlvArWidth-1:0] axi_slv_intcluster_ar_data_o,
  output logic [                 LogDepth:0] axi_slv_intcluster_ar_wptr_o,
  input  logic [                 LogDepth:0] axi_slv_intcluster_ar_rptr_i,
  input  logic [ IntClusterAxiSlvRWidth-1:0] axi_slv_intcluster_r_data_i ,
  input  logic [                 LogDepth:0] axi_slv_intcluster_r_wptr_i ,
  output logic [                 LogDepth:0] axi_slv_intcluster_r_rptr_o ,
  // Integer Cluster Master Port
  input  logic [IntClusterAxiMstAwWidth-1:0] axi_mst_intcluster_aw_data_i,
  input  logic [                 LogDepth:0] axi_mst_intcluster_aw_wptr_i,
  output logic [                 LogDepth:0] axi_mst_intcluster_aw_rptr_o,
  input  logic [ IntClusterAxiMstWWidth-1:0] axi_mst_intcluster_w_data_i ,
  input  logic [                 LogDepth:0] axi_mst_intcluster_w_wptr_i ,
  output logic [                 LogDepth:0] axi_mst_intcluster_w_rptr_o ,
  output logic [ IntClusterAxiMstBWidth-1:0] axi_mst_intcluster_b_data_o ,
  output logic [                 LogDepth:0] axi_mst_intcluster_b_wptr_o ,
  input  logic [                 LogDepth:0] axi_mst_intcluster_b_rptr_i ,
  input  logic [IntClusterAxiMstArWidth-1:0] axi_mst_intcluster_ar_data_i,
  input  logic [                 LogDepth:0] axi_mst_intcluster_ar_wptr_i,
  output logic [                 LogDepth:0] axi_mst_intcluster_ar_rptr_o,
  output logic [ IntClusterAxiMstRWidth-1:0] axi_mst_intcluster_r_data_o ,
  output logic [                 LogDepth:0] axi_mst_intcluster_r_wptr_o ,
  input  logic [                 LogDepth:0] axi_mst_intcluster_r_rptr_i ,
  // External reg demux slaves
  output cheshire_reg_ext_req_t [iomsb(Cfg.RegExtNumSlv):0] reg_ext_slv_req_o,
  input  cheshire_reg_ext_rsp_t [iomsb(Cfg.RegExtNumSlv):0] reg_ext_slv_rsp_i,
  // Interrupts from external devices
  input  logic [iomsb(Cfg.NumExtIntrs):0] intr_ext_i,
  // Interrupts to external harts
  output logic [iomsb(Cfg.NumExtIrqHarts):0] meip_ext_o,
  output logic [iomsb(Cfg.NumExtIrqHarts):0] seip_ext_o,
  output logic [iomsb(Cfg.NumExtIrqHarts):0] mtip_ext_o,
  output logic [iomsb(Cfg.NumExtIrqHarts):0] msip_ext_o,
  // Debug interface to external harts
  output logic                               dbg_active_o,
  output logic [iomsb(Cfg.NumExtDbgHarts):0] dbg_ext_req_o,
  input  logic [iomsb(Cfg.NumExtDbgHarts):0] dbg_ext_unavail_i,
  // JTAG interface
  input  logic jtag_tck_i,
  input  logic jtag_trst_ni,
  input  logic jtag_tms_i,
  input  logic jtag_tdi_i,
  output logic jtag_tdo_o,
  output logic jtag_tdo_oe_o,
  // UART interface
  output logic uart_tx_o,
  input  logic uart_rx_i,
  // UART Modem flow control
  output logic uart_rts_no,
  output logic uart_dtr_no,
  input  logic uart_cts_ni,
  input  logic uart_dsr_ni,
  input  logic uart_dcd_ni,
  input  logic uart_rin_ni,
  // I2C interface
  output logic i2c_sda_o,
  input  logic i2c_sda_i,
  output logic i2c_sda_en_o,
  output logic i2c_scl_o,
  input  logic i2c_scl_i,
  output logic i2c_scl_en_o,
  // SPI host interface
  output logic                 spih_sck_o,
  output logic                 spih_sck_en_o,
  output logic [SpihNumCs-1:0] spih_csb_o,
  output logic [SpihNumCs-1:0] spih_csb_en_o,
  output logic [ 3:0]          spih_sd_o,
  output logic [ 3:0]          spih_sd_en_o,
  input  logic [ 3:0]          spih_sd_i,
  // GPIO interface
  input  logic [31:0] gpio_i,
  output logic [31:0] gpio_o,
  output logic [31:0] gpio_en_o,
  // Serial link interface
  input  logic [SlinkNumChan-1:0]                    slink_rcv_clk_i,
  output logic [SlinkNumChan-1:0]                    slink_rcv_clk_o,
  input  logic [SlinkNumChan-1:0][SlinkNumLanes-1:0] slink_i,
  output logic [SlinkNumChan-1:0][SlinkNumLanes-1:0] slink_o,
  // VGA interface
  output logic                         vga_hsync_o,
  output logic                         vga_vsync_o,
  output logic [Cfg.VgaRedWidth  -1:0] vga_red_o,
  output logic [Cfg.VgaGreenWidth-1:0] vga_green_o,
  output logic [Cfg.VgaBlueWidth -1:0] vga_blue_o
);

// All AXI slave buses (except the Integer Cluster)
cheshire_axi_ext_slv_req_t [Cfg.AxiExtNumSlv-1:0] axi_ext_slv_req;
cheshire_axi_ext_slv_rsp_t [Cfg.AxiExtNumSlv-1:0] axi_ext_slv_rsp;

// All AXI master buses (except the Integer Cluster)
cheshire_axi_ext_mst_req_t [Cfg.AxiExtNumMst-1:0] axi_ext_mst_req;
cheshire_axi_ext_mst_rsp_t [Cfg.AxiExtNumMst-1:0] axi_ext_mst_rsp;

// External LLC (DRAM) bus
cheshire_axi_ext_llc_req_t axi_llc_mst_req;
cheshire_axi_ext_llc_rsp_t axi_llc_mst_rsp;

cheshire_soc #(
  .Cfg               ( Cfg                        ),
  .ExtHartinfo       ( '0                         ),
  .axi_ext_llc_req_t ( cheshire_axi_ext_llc_req_t ),
  .axi_ext_llc_rsp_t ( cheshire_axi_ext_llc_rsp_t ),
  .axi_ext_mst_req_t ( cheshire_axi_ext_mst_req_t ),
  .axi_ext_mst_rsp_t ( cheshire_axi_ext_mst_rsp_t ),
  .axi_ext_slv_req_t ( cheshire_axi_ext_slv_req_t ),
  .axi_ext_slv_rsp_t ( cheshire_axi_ext_slv_rsp_t ),
  .reg_ext_req_t     ( cheshire_reg_ext_req_t     ),
  .reg_ext_rsp_t     ( cheshire_reg_ext_rsp_t     )
) i_cheshire_soc     (
  .clk_i      ,
  .rst_ni     ,
  .test_mode_i,
  .boot_mode_i,
  .rtc_i      ,
  // External AXI LLC (DRAM) port
  .axi_llc_mst_req_o ( axi_llc_mst_req ),
  .axi_llc_mst_rsp_i ( axi_llc_mst_rsp ),
  // External AXI crossbar ports
  .axi_ext_mst_req_i ( axi_ext_mst_req ),
  .axi_ext_mst_rsp_o ( axi_ext_mst_rsp ),
  .axi_ext_slv_req_o ( axi_ext_slv_req ),
  .axi_ext_slv_rsp_i ( axi_ext_slv_rsp ),
  // External reg demux slaves
  .reg_ext_slv_req_o,
  .reg_ext_slv_rsp_i,
  // Interrupts from external devices
  .intr_ext_i,
  // Interrupts to external harts
  .meip_ext_o,
  .seip_ext_o,
  .mtip_ext_o,
  .msip_ext_o,
  // Debug interface to external harts
  .dbg_active_o     ,
  .dbg_ext_req_o    ,
  .dbg_ext_unavail_i,
  // JTAG interface
  .jtag_tck_i   ,
  .jtag_trst_ni ,
  .jtag_tms_i   ,
  .jtag_tdi_i   ,
  .jtag_tdo_o   ,
  .jtag_tdo_oe_o,
  // UART interface
  .uart_tx_o,
  .uart_rx_i,
  // UART Modem flow control
  .uart_rts_no,
  .uart_dtr_no,
  .uart_cts_ni,
  .uart_dsr_ni,
  .uart_dcd_ni,
  .uart_rin_ni,
  // I2C interface
  .i2c_sda_o   ,
  .i2c_sda_i   ,
  .i2c_sda_en_o,
  .i2c_scl_o   ,
  .i2c_scl_i   ,
  .i2c_scl_en_o,
  // SPI host interface
  .spih_sck_o   ,
  .spih_sck_en_o,
  .spih_csb_o   ,
  .spih_csb_en_o,
  .spih_sd_o    ,
  .spih_sd_en_o ,
  .spih_sd_i    ,
  // GPIO interface
  .gpio_i   ,
  .gpio_o   ,
  .gpio_en_o,
  // Serial link interface
  .slink_rcv_clk_i,
  .slink_rcv_clk_o,
  .slink_i        ,
  .slink_o        ,
  // VGA interface
  .vga_hsync_o,
  .vga_vsync_o,
  .vga_red_o  ,
  .vga_green_o,
  .vga_blue_o
);

for (genvar i = 0; i < Cfg.AxiExtNumSlv - 1; i++) begin: gen_ext_slv_src_cdc
  axi_cdc_src #(
    .LogDepth   ( LogDepth                       ),
    .aw_chan_t  ( cheshire_axi_ext_slv_aw_chan_t ),
    .w_chan_t   ( cheshire_axi_ext_slv_w_chan_t  ),
    .b_chan_t   ( cheshire_axi_ext_slv_b_chan_t  ),
    .ar_chan_t  ( cheshire_axi_ext_slv_ar_chan_t ),
    .r_chan_t   ( cheshire_axi_ext_slv_r_chan_t  ),
    .axi_req_t  ( cheshire_axi_ext_slv_req_t     ),
    .axi_resp_t ( cheshire_axi_ext_slv_rsp_t     )
  ) i_cheshire_ext_slv_cdc_src   (
    // synchronous slave port
    .src_clk_i                   ( clk_i               ),
    .src_rst_ni                  ( rst_ni              ),
    .src_req_i                   ( axi_ext_slv_req [i] ),
    .src_resp_o                  ( axi_ext_slv_rsp [i] ),
    // asynchronous master port
    .async_data_master_aw_data_o ( axi_ext_slv_aw_data_o [i] ),
    .async_data_master_aw_wptr_o ( axi_ext_slv_aw_wptr_o [i] ),
    .async_data_master_aw_rptr_i ( axi_ext_slv_aw_rptr_i [i] ),
    .async_data_master_w_data_o  ( axi_ext_slv_w_data_o  [i] ),
    .async_data_master_w_wptr_o  ( axi_ext_slv_w_wptr_o  [i] ),
    .async_data_master_w_rptr_i  ( axi_ext_slv_w_rptr_i  [i] ),
    .async_data_master_b_data_i  ( axi_ext_slv_b_data_i  [i] ),
    .async_data_master_b_wptr_i  ( axi_ext_slv_b_wptr_i  [i] ),
    .async_data_master_b_rptr_o  ( axi_ext_slv_b_rptr_o  [i] ),
    .async_data_master_ar_data_o ( axi_ext_slv_ar_data_o [i] ),
    .async_data_master_ar_wptr_o ( axi_ext_slv_ar_wptr_o [i] ),
    .async_data_master_ar_rptr_i ( axi_ext_slv_ar_rptr_i [i] ),
    .async_data_master_r_data_i  ( axi_ext_slv_r_data_i  [i] ),
    .async_data_master_r_wptr_i  ( axi_ext_slv_r_wptr_i  [i] ),
    .async_data_master_r_rptr_o  ( axi_ext_slv_r_rptr_o  [i] )
  );
end

for (genvar i = 0; i < Cfg.AxiExtNumMst - 1; i++) begin: gen_ext_mst_dst_cdc
  axi_cdc_dst #(
    .LogDepth   ( LogDepth                   ),
    .aw_chan_t  ( cheshire_axi_ext_mst_aw_chan_t ),
    .w_chan_t   ( cheshire_axi_ext_mst_w_chan_t  ),
    .b_chan_t   ( cheshire_axi_ext_mst_b_chan_t  ),
    .ar_chan_t  ( cheshire_axi_ext_mst_ar_chan_t ),
    .r_chan_t   ( cheshire_axi_ext_mst_r_chan_t  ),
    .axi_req_t  ( cheshire_axi_ext_mst_req_t     ),
    .axi_resp_t ( cheshire_axi_ext_mst_rsp_t     )
  ) i_cheshire_ext_mst_cdc_dst  (
    // asynchronous slave port
    .async_data_slave_aw_data_i ( axi_ext_mst_aw_data_i [i] ),
    .async_data_slave_aw_wptr_i ( axi_ext_mst_aw_wptr_i [i] ),
    .async_data_slave_aw_rptr_o ( axi_ext_mst_aw_rptr_o [i] ),
    .async_data_slave_w_data_i  ( axi_ext_mst_w_data_i  [i] ),
    .async_data_slave_w_wptr_i  ( axi_ext_mst_w_wptr_i  [i] ),
    .async_data_slave_w_rptr_o  ( axi_ext_mst_w_rptr_o  [i] ),
    .async_data_slave_b_data_o  ( axi_ext_mst_b_data_o  [i] ),
    .async_data_slave_b_wptr_o  ( axi_ext_mst_b_wptr_o  [i] ),
    .async_data_slave_b_rptr_i  ( axi_ext_mst_b_rptr_i  [i] ),
    .async_data_slave_ar_data_i ( axi_ext_mst_ar_data_i [i] ),
    .async_data_slave_ar_wptr_i ( axi_ext_mst_ar_wptr_i [i] ),
    .async_data_slave_ar_rptr_o ( axi_ext_mst_ar_rptr_o [i] ),
    .async_data_slave_r_data_o  ( axi_ext_mst_r_data_o  [i] ),
    .async_data_slave_r_wptr_o  ( axi_ext_mst_r_wptr_o  [i] ),
    .async_data_slave_r_rptr_i  ( axi_ext_mst_r_rptr_i  [i] ),
    // synchronous master port
    .dst_clk_i                  ( clk_i               ),
    .dst_rst_ni                 ( rst_ni              ),
    .dst_req_o                  ( axi_ext_mst_req [i] ),
    .dst_resp_i                 ( axi_ext_mst_rsp [i] )
  );
end

// CDC for external LLC connection
axi_cdc_src #(
  .LogDepth   ( LogDepth                       ),
  .aw_chan_t  ( cheshire_axi_ext_llc_aw_chan_t ),
  .w_chan_t   ( cheshire_axi_ext_llc_w_chan_t  ),
  .b_chan_t   ( cheshire_axi_ext_llc_b_chan_t  ),
  .ar_chan_t  ( cheshire_axi_ext_llc_ar_chan_t ),
  .r_chan_t   ( cheshire_axi_ext_llc_r_chan_t  ),
  .axi_req_t  ( cheshire_axi_ext_llc_req_t     ),
  .axi_resp_t ( cheshire_axi_ext_llc_rsp_t     )
) i_cheshire_ext_llc_cdc_src   (
  // synchronous slave port
  .src_clk_i                   ( clk_i           ),
  .src_rst_ni                  ( rst_ni          ),
  .src_req_i                   ( axi_llc_mst_req ),
  .src_resp_o                  ( axi_llc_mst_rsp ),
  // asynchronous master port
  .async_data_master_aw_data_o ( llc_mst_aw_data_o ),
  .async_data_master_aw_wptr_o ( llc_mst_aw_wptr_o ),
  .async_data_master_aw_rptr_i ( llc_mst_aw_rptr_i ),
  .async_data_master_w_data_o  ( llc_mst_w_data_o  ),
  .async_data_master_w_wptr_o  ( llc_mst_w_wptr_o  ),
  .async_data_master_w_rptr_i  ( llc_mst_w_rptr_i  ),
  .async_data_master_b_data_i  ( llc_mst_b_data_i  ),
  .async_data_master_b_wptr_i  ( llc_mst_b_wptr_i  ),
  .async_data_master_b_rptr_o  ( llc_mst_b_rptr_o  ),
  .async_data_master_ar_data_o ( llc_mst_ar_data_o ),
  .async_data_master_ar_wptr_o ( llc_mst_ar_wptr_o ),
  .async_data_master_ar_rptr_i ( llc_mst_ar_rptr_i ),
  .async_data_master_r_data_i  ( llc_mst_r_data_i  ),
  .async_data_master_r_wptr_i  ( llc_mst_r_wptr_i  ),
  .async_data_master_r_rptr_o  ( llc_mst_r_rptr_o  )
);

// Integer Cluster slave bus
axi_intcluster_slv_req_t axi_intcluster_ser_slv_req;
axi_intcluster_slv_rsp_t axi_intcluster_ser_slv_rsp;

axi_cdc_src  #(
  .LogDepth   ( LogDepth                     ),
  .aw_chan_t  ( axi_intcluster_slv_aw_chan_t ),
  .w_chan_t   ( axi_intcluster_slv_w_chan_t  ),
  .b_chan_t   ( axi_intcluster_slv_b_chan_t  ),
  .ar_chan_t  ( axi_intcluster_slv_ar_chan_t ),
  .r_chan_t   ( axi_intcluster_slv_r_chan_t  ),
  .axi_req_t  ( axi_intcluster_slv_req_t     ),
  .axi_resp_t ( axi_intcluster_slv_rsp_t     )
) i_intcluster_slv_cdc         (
  // synchronous slave port
  .src_clk_i                   ( clk_i                      ),
  .src_rst_ni                  ( rst_ni                     ),
  .src_req_i                   ( axi_intcluster_ser_slv_req ),
  .src_resp_o                  ( axi_intcluster_ser_slv_rsp ),
  // asynchronous master port
  .async_data_master_aw_data_o ( axi_slv_intcluster_aw_data_o ),
  .async_data_master_aw_wptr_o ( axi_slv_intcluster_aw_wptr_o ),
  .async_data_master_aw_rptr_i ( axi_slv_intcluster_aw_rptr_i ),
  .async_data_master_w_data_o  ( axi_slv_intcluster_w_data_o  ),
  .async_data_master_w_wptr_o  ( axi_slv_intcluster_w_wptr_o  ),
  .async_data_master_w_rptr_i  ( axi_slv_intcluster_w_rptr_i  ),
  .async_data_master_b_data_i  ( axi_slv_intcluster_b_data_i  ),
  .async_data_master_b_wptr_i  ( axi_slv_intcluster_b_wptr_i  ),
  .async_data_master_b_rptr_o  ( axi_slv_intcluster_b_rptr_o  ),
  .async_data_master_ar_data_o ( axi_slv_intcluster_ar_data_o ),
  .async_data_master_ar_wptr_o ( axi_slv_intcluster_ar_wptr_o ),
  .async_data_master_ar_rptr_i ( axi_slv_intcluster_ar_rptr_i ),
  .async_data_master_r_data_i  ( axi_slv_intcluster_r_data_i  ),
  .async_data_master_r_wptr_i  ( axi_slv_intcluster_r_wptr_i  ),
  .async_data_master_r_rptr_o  ( axi_slv_intcluster_r_rptr_o  )
);

axi_id_serialize #(
  .AxiSlvPortIdWidth      ( ExtSlvIdWidth              ),
  .AxiSlvPortMaxTxns      ( Cfg.AxiMaxSlvTrans         ),
  .AxiMstPortIdWidth      ( IntClusterAxiIdInWidth     ),
  .AxiMstPortMaxUniqIds   ( 2**IntClusterAxiIdInWidth  ), // Max value
  .AxiMstPortMaxTxnsPerId ( Cfg.AxiMaxMstTrans         ),
  .AxiAddrWidth           ( Cfg.AddrWidth              ),
  .AxiDataWidth           ( Cfg.AxiDataWidth           ),
  .AxiUserWidth           ( Cfg.AxiUserWidth           ),
  .AtopSupport            ( 0                          ), // Change me if needed
  .slv_req_t              ( cheshire_axi_ext_slv_req_t ),
  .slv_resp_t             ( cheshire_axi_ext_slv_rsp_t ),
  .mst_req_t              ( axi_intcluster_slv_req_t   ),
  .mst_resp_t             ( axi_intcluster_slv_rsp_t   )
) i_integer_cluster_axi_slv_id_serializer          (
  .clk_i       ( clk_i                             ),
  .rst_ni      ( rst_ni                            ),
  .slv_req_i   ( axi_ext_slv_req[IntClusterSlvIdx] ),
  .slv_resp_o  ( axi_ext_slv_rsp[IntClusterSlvIdx] ),
  .mst_req_o   ( axi_intcluster_ser_slv_req        ),
  .mst_resp_i  ( axi_intcluster_ser_slv_rsp        )
);

// Integer Cluster master bus
axi_intcluster_mst_req_t axi_intcluster_ser_mst_req;
axi_intcluster_mst_rsp_t axi_intcluster_ser_mst_rsp;

axi_cdc_dst #(
  .LogDepth   ( LogDepth                     ),
  .aw_chan_t  ( axi_intcluster_mst_aw_chan_t ),
  .w_chan_t   ( axi_intcluster_mst_w_chan_t  ),
  .b_chan_t   ( axi_intcluster_mst_b_chan_t  ),
  .ar_chan_t  ( axi_intcluster_mst_ar_chan_t ),
  .r_chan_t   ( axi_intcluster_mst_r_chan_t  ),
  .axi_req_t  ( axi_intcluster_mst_req_t     ),
  .axi_resp_t ( axi_intcluster_mst_rsp_t     )
) i_intcluster_mst_cdc        (
  // asynchronous slave port
  .async_data_slave_aw_data_i ( axi_mst_intcluster_aw_data_i ),
  .async_data_slave_aw_wptr_i ( axi_mst_intcluster_aw_wptr_i ),
  .async_data_slave_aw_rptr_o ( axi_mst_intcluster_aw_rptr_o ),
  .async_data_slave_w_data_i  ( axi_mst_intcluster_w_data_i  ),
  .async_data_slave_w_wptr_i  ( axi_mst_intcluster_w_wptr_i  ),
  .async_data_slave_w_rptr_o  ( axi_mst_intcluster_w_rptr_o  ),
  .async_data_slave_b_data_o  ( axi_mst_intcluster_b_data_o  ),
  .async_data_slave_b_wptr_o  ( axi_mst_intcluster_b_wptr_o  ),
  .async_data_slave_b_rptr_i  ( axi_mst_intcluster_b_rptr_i  ),
  .async_data_slave_ar_data_i ( axi_mst_intcluster_ar_data_i ),
  .async_data_slave_ar_wptr_i ( axi_mst_intcluster_ar_wptr_i ),
  .async_data_slave_ar_rptr_o ( axi_mst_intcluster_ar_rptr_o ),
  .async_data_slave_r_data_o  ( axi_mst_intcluster_r_data_o  ),
  .async_data_slave_r_wptr_o  ( axi_mst_intcluster_r_wptr_o  ),
  .async_data_slave_r_rptr_i  ( axi_mst_intcluster_r_rptr_i  ),
  // synchronous master port
  .dst_clk_i  ( clk_i                      ),
  .dst_rst_ni ( rst_ni                     ),
  .dst_req_o  ( axi_intcluster_ser_mst_req ),
  .dst_resp_i ( axi_intcluster_ser_mst_rsp )
);

axi_id_serialize #(
  .AxiSlvPortIdWidth      ( IntClusterAxiIdOutWidth    ),
  .AxiSlvPortMaxTxns      ( Cfg.AxiMaxSlvTrans         ),
  .AxiMstPortIdWidth      ( Cfg.AxiMstIdWidth          ),
  .AxiMstPortMaxUniqIds   ( 2**IntClusterAxiIdInWidth  ), // Max value
  .AxiMstPortMaxTxnsPerId ( Cfg.AxiMaxMstTrans         ),
  .AxiAddrWidth           ( Cfg.AddrWidth              ),
  .AxiDataWidth           ( Cfg.AxiDataWidth           ),
  .AxiUserWidth           ( Cfg.AxiUserWidth           ),
  .AtopSupport            ( 0                          ), // Change me if needed
  .slv_req_t              ( axi_intcluster_mst_req_t   ),
  .slv_resp_t             ( axi_intcluster_mst_rsp_t   ),
  .mst_req_t              ( cheshire_axi_ext_mst_req_t ),
  .mst_resp_t             ( cheshire_axi_ext_mst_rsp_t )
) i_integer_cluster_axi_mst_id_serializer          (
  .clk_i       ( clk_i                             ),
  .rst_ni      ( rst_ni                            ),
  .slv_req_i   ( axi_intcluster_ser_mst_req        ),
  .slv_resp_o  ( axi_intcluster_ser_mst_rsp        ),
  .mst_req_o   ( axi_ext_mst_req[IntClusterMstIdx] ),
  .mst_resp_i  ( axi_ext_mst_rsp[IntClusterMstIdx] )
);

endmodule: cheshire_wrap
