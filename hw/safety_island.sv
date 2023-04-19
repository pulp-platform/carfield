// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Yvan Tortorella <yvan.tortorella@unibo.it>

`include "axi/typedef.svh"

module safety_island
  import safety_island_pkg::*;
#(
  parameter int unsigned AxiAddrWidth  = 48,
  parameter int unsigned AxiDataWidth  = 64,
  parameter int unsigned AxiUserWidth  = 1,
  parameter int unsigned AxiSlvIdWidth = 1,
  parameter int unsigned AxiMstIdWidth = 2,
  parameter int unsigned LogDepth      = 3,

  parameter bit [AxiAddrWidth-1:0] BaseAddr  = 'h6000_0000,
  parameter bit [31:0]             AddrRange = 'h00080_0000,
  parameter bit [31:0]             MemOffset = 'h20_0000,
  parameter bit [31:0]             PerOffset = 'h10_0000,

  parameter type axi_slv_aw_chan_t = logic,
  parameter type axi_slv_w_chan_t  = logic,
  parameter type axi_slv_b_chan_t  = logic,
  parameter type axi_slv_ar_chan_t = logic,
  parameter type axi_slv_r_chan_t  = logic,
  parameter type axi_slv_req_t     = logic,
  parameter type axi_slv_rsp_t     = logic,

  parameter type axi_mst_aw_chan_t = logic,
  parameter type axi_mst_w_chan_t  = logic,
  parameter type axi_mst_b_chan_t  = logic,
  parameter type axi_mst_ar_chan_t = logic,
  parameter type axi_mst_r_chan_t  = logic,
  parameter type axi_mst_req_t     = logic,
  parameter type axi_mst_rsp_t     = logic
)(
  input  logic clk_i                          ,
  input  logic ref_clk_i                      ,
  input  logic rst_ni                         ,
  input  logic test_enable_i                  ,
  input  logic [1:0] bootmode_i               ,
  input  logic [NumLocalInterrupts-1:0] irqs_i,

  input  logic jtag_tck_i  ,
  input  logic jtag_trst_ni,
  input  logic jtag_tms_i  ,
  input  logic jtag_tdi_i  ,
  output logic jtag_tdo_o  ,

  input  axi_slv_req_t axi_slv_req_i,
  output axi_slv_rsp_t axi_slv_rsp_o,
  output axi_mst_req_t axi_mst_req_o,
  input  axi_mst_rsp_t axi_mst_rsp_i
);

// slave parameters
localparam int unsigned AxiSlvAwWidth = (2**LogDepth)*$bits(axi_slv_aw_chan_t);
localparam int unsigned AxiSlvWWidth  = (2**LogDepth)*$bits(axi_slv_w_chan_t);
localparam int unsigned AxiSlvBWidth  = (2**LogDepth)*$bits(axi_slv_b_chan_t);
localparam int unsigned AxiSlvArWidth = (2**LogDepth)*$bits(axi_slv_ar_chan_t);
localparam int unsigned AxiSlvRWidth  = (2**LogDepth)*$bits(axi_slv_r_chan_t);

// Master parameters
localparam int unsigned AxiMstAwWidth = (2**LogDepth)*$bits(axi_mst_aw_chan_t);
localparam int unsigned AxiMstWWidth  = (2**LogDepth)*$bits(axi_mst_w_chan_t);
localparam int unsigned AxiMstBWidth  = (2**LogDepth)*$bits(axi_mst_b_chan_t);
localparam int unsigned AxiMstArWidth = (2**LogDepth)*$bits(axi_mst_ar_chan_t);
localparam int unsigned AxiMstRWidth  = (2**LogDepth)*$bits(axi_mst_r_chan_t);

// Slave side
logic [AxiSlvAwWidth-1:0] axi_slv_aw_data;
logic [       LogDepth:0] axi_slv_aw_wptr;
logic [       LogDepth:0] axi_slv_aw_rptr;
logic [ AxiSlvWWidth-1:0] axi_slv_w_data ;
logic [       LogDepth:0] axi_slv_w_wptr ;
logic [       LogDepth:0] axi_slv_w_rptr ;
logic [ AxiSlvBWidth-1:0] axi_slv_b_data ;
logic [       LogDepth:0] axi_slv_b_wptr ;
logic [       LogDepth:0] axi_slv_b_rptr ;
logic [AxiSlvArWidth-1:0] axi_slv_ar_data;
logic [       LogDepth:0] axi_slv_ar_wptr;
logic [       LogDepth:0] axi_slv_ar_rptr;
logic [ AxiSlvRWidth-1:0] axi_slv_r_data ;
logic [       LogDepth:0] axi_slv_r_wptr ;
logic [       LogDepth:0] axi_slv_r_rptr ;

axi_cdc_src #(
  .LogDepth   ( LogDepth          ),
  .aw_chan_t  ( axi_slv_aw_chan_t ),
  .w_chan_t   ( axi_slv_w_chan_t  ),
  .b_chan_t   ( axi_slv_b_chan_t  ),
  .ar_chan_t  ( axi_slv_ar_chan_t ),
  .r_chan_t   ( axi_slv_r_chan_t  ),
  .axi_req_t  ( axi_slv_req_t     ),
  .axi_resp_t ( axi_slv_rsp_t     )
) i_slv_cdc   (
  // synchronous slave port
  .src_clk_i  ( ref_clk_i     ),
  .src_rst_ni ( rst_ni        ),
  .src_req_i  ( axi_slv_req_i ),
  .src_resp_o ( axi_slv_rsp_o ),
  // asynchronous master port
  .async_data_master_aw_data_o ( axi_slv_aw_data ),
  .async_data_master_aw_wptr_o ( axi_slv_aw_wptr ),
  .async_data_master_aw_rptr_i ( axi_slv_aw_rptr ),
  .async_data_master_w_data_o  ( axi_slv_w_data  ),
  .async_data_master_w_wptr_o  ( axi_slv_w_wptr  ),
  .async_data_master_w_rptr_i  ( axi_slv_w_rptr  ),
  .async_data_master_b_data_i  ( axi_slv_b_data  ),
  .async_data_master_b_wptr_i  ( axi_slv_b_wptr  ),
  .async_data_master_b_rptr_o  ( axi_slv_b_rptr  ),
  .async_data_master_ar_data_o ( axi_slv_ar_data ),
  .async_data_master_ar_wptr_o ( axi_slv_ar_wptr ),
  .async_data_master_ar_rptr_i ( axi_slv_ar_rptr ),
  .async_data_master_r_data_i  ( axi_slv_r_data  ),
  .async_data_master_r_wptr_i  ( axi_slv_r_wptr  ),
  .async_data_master_r_rptr_o  ( axi_slv_r_rptr  )
);

// Master side
logic [AxiMstAwWidth-1:0] axi_mst_aw_data;
logic [       LogDepth:0] axi_mst_aw_wptr;
logic [       LogDepth:0] axi_mst_aw_rptr;
logic [ AxiMstWWidth-1:0] axi_mst_w_data ;
logic [       LogDepth:0] axi_mst_w_wptr ;
logic [       LogDepth:0] axi_mst_w_rptr ;
logic [ AxiMstBWidth-1:0] axi_mst_b_data ;
logic [       LogDepth:0] axi_mst_b_wptr ;
logic [       LogDepth:0] axi_mst_b_rptr ;
logic [AxiMstArWidth-1:0] axi_mst_ar_data;
logic [       LogDepth:0] axi_mst_ar_wptr;
logic [       LogDepth:0] axi_mst_ar_rptr;
logic [ AxiMstRWidth-1:0] axi_mst_r_data ;
logic [       LogDepth:0] axi_mst_r_wptr ;
logic [       LogDepth:0] axi_mst_r_rptr ;

axi_cdc_dst #(
  .LogDepth   ( LogDepth          ),
  .aw_chan_t  ( axi_mst_aw_chan_t ),
  .w_chan_t   ( axi_mst_w_chan_t  ),
  .b_chan_t   ( axi_mst_b_chan_t  ),
  .ar_chan_t  ( axi_mst_ar_chan_t ),
  .r_chan_t   ( axi_mst_r_chan_t  ),
  .axi_req_t  ( axi_mst_req_t     ),
  .axi_resp_t ( axi_mst_rsp_t     )
) i_mst_dst   (
  // asynchronous slave port
  .async_data_slave_aw_data_i ( axi_mst_aw_data ),
  .async_data_slave_aw_wptr_i ( axi_mst_aw_wptr ),
  .async_data_slave_aw_rptr_o ( axi_mst_aw_rptr ),
  .async_data_slave_w_data_i  ( axi_mst_w_data  ),
  .async_data_slave_w_wptr_i  ( axi_mst_w_wptr  ),
  .async_data_slave_w_rptr_o  ( axi_mst_w_rptr  ),
  .async_data_slave_b_data_o  ( axi_mst_b_data  ),
  .async_data_slave_b_wptr_o  ( axi_mst_b_wptr  ),
  .async_data_slave_b_rptr_i  ( axi_mst_b_rptr  ),
  .async_data_slave_ar_data_i ( axi_mst_ar_data ),
  .async_data_slave_ar_wptr_i ( axi_mst_ar_wptr ),
  .async_data_slave_ar_rptr_o ( axi_mst_ar_rptr ),
  .async_data_slave_r_data_o  ( axi_mst_r_data  ),
  .async_data_slave_r_wptr_o  ( axi_mst_r_wptr  ),
  .async_data_slave_r_rptr_i  ( axi_mst_r_rptr  ),
  // synchronous master port
  .dst_clk_i  ( ref_clk_i     ),
  .dst_rst_ni ( rst_ni        ),
  .dst_req_o  ( axi_mst_req_o ),
  .dst_resp_i ( axi_mst_rsp_i )
);

safety_island_synth_wrapper #(
  .AxiAddrWidth  ( AxiAddrWidth  ),
  .AxiDataWidth  ( AxiDataWidth  ),
  .AxiUserWidth  ( AxiUserWidth  ),
  .AxiInIdWidth  ( AxiSlvIdWidth ),
  .AxiOutIdWidth ( AxiMstIdWidth ),
  .LogDepth      ( LogDepth      ),

  .SafetyIslandBaseAddr     ( BaseAddr  ),
  .SafetyIslandAddrRange    ( AddrRange ),
  .SafetyIslandMemOffset    ( MemOffset ),
  .SafetyIslandPeriphOffset ( PerOffset ),

  .axi_in_aw_chan_t  ( axi_slv_aw_chan_t ),
  .axi_in_w_chan_t   ( axi_slv_w_chan_t  ),
  .axi_in_b_chan_t   ( axi_slv_b_chan_t  ),
  .axi_in_ar_chan_t  ( axi_slv_ar_chan_t ),
  .axi_in_r_chan_t   ( axi_slv_r_chan_t  ),
  .axi_in_req_t      ( axi_slv_req_t     ),
  .axi_in_resp_t     ( axi_slv_rsp_t     ),
  .axi_out_aw_chan_t ( axi_mst_aw_chan_t ),
  .axi_out_w_chan_t  ( axi_mst_w_chan_t  ),
  .axi_out_b_chan_t  ( axi_mst_b_chan_t  ),
  .axi_out_ar_chan_t ( axi_mst_ar_chan_t ),
  .axi_out_r_chan_t  ( axi_mst_r_chan_t  ),
  .axi_out_req_t     ( axi_mst_req_t     ),
  .axi_out_resp_t    ( axi_mst_rsp_t     ),

  .AsyncAxiInAwWidth ( AxiSlvAwWidth ),
  .AsyncAxiInWWidth  ( AxiSlvWWidth  ),
  .AsyncAxiInBWidth  ( AxiSlvBWidth  ),
  .AsyncAxiInArWidth ( AxiSlvArWidth ),
  .AsyncAxiInRWidth  ( AxiSlvRWidth  ),

  .AsyncAxiOutAwWidth ( AxiMstAwWidth ),
  .AsyncAxiOutWWidth  ( AxiMstWWidth  ),
  .AsyncAxiOutBWidth  ( AxiMstBWidth  ),
  .AsyncAxiOutArWidth ( AxiMstArWidth ),
  .AsyncAxiOutRWidth  ( AxiMstRWidth  )
) i_safety_island_wrap (
  .clk_i         ( clk_i         ),
  .ref_clk_i     ( ref_clk_i     ),
  .rst_ni        ( rst_ni        ),
  .test_enable_i ( test_enable_i ),
  .bootmode_i    ( bootmode_i    ),
  .irqs_i        ( irqs_i        ),

  .jtag_tck_i    ( jtag_tck_i   ),
  .jtag_trst_ni  ( jtag_trst_ni ),
  .jtag_tms_i    ( jtag_tms_i   ),
  .jtag_tdi_i    ( jtag_tdi_i   ),
  .jtag_tdo_o    ( jtag_tdo_o   ),

  .async_axi_in_aw_data_i ( axi_slv_aw_data ),
  .async_axi_in_aw_wptr_i ( axi_slv_aw_wptr ),
  .async_axi_in_aw_rptr_o ( axi_slv_aw_rptr ),
  .async_axi_in_w_data_i  ( axi_slv_w_data  ),
  .async_axi_in_w_wptr_i  ( axi_slv_w_wptr  ),
  .async_axi_in_w_rptr_o  ( axi_slv_w_rptr  ),
  .async_axi_in_b_data_o  ( axi_slv_b_data  ),
  .async_axi_in_b_wptr_o  ( axi_slv_b_wptr  ),
  .async_axi_in_b_rptr_i  ( axi_slv_b_rptr  ),
  .async_axi_in_ar_data_i ( axi_slv_ar_data ),
  .async_axi_in_ar_wptr_i ( axi_slv_ar_wptr ),
  .async_axi_in_ar_rptr_o ( axi_slv_ar_rptr ),
  .async_axi_in_r_data_o  ( axi_slv_r_data  ),
  .async_axi_in_r_wptr_o  ( axi_slv_r_wptr  ),
  .async_axi_in_r_rptr_i  ( axi_slv_r_rptr  ),

  .async_axi_out_aw_data_o ( axi_mst_aw_data ),
  .async_axi_out_aw_wptr_o ( axi_mst_aw_wptr ),
  .async_axi_out_aw_rptr_i ( axi_mst_aw_rptr ),
  .async_axi_out_w_data_o  ( axi_mst_w_data  ),
  .async_axi_out_w_wptr_o  ( axi_mst_w_wptr  ),
  .async_axi_out_w_rptr_i  ( axi_mst_w_rptr  ),
  .async_axi_out_b_data_i  ( axi_mst_b_data  ),
  .async_axi_out_b_wptr_i  ( axi_mst_b_wptr  ),
  .async_axi_out_b_rptr_o  ( axi_mst_b_rptr  ),
  .async_axi_out_ar_data_o ( axi_mst_ar_data ),
  .async_axi_out_ar_wptr_o ( axi_mst_ar_wptr ),
  .async_axi_out_ar_rptr_i ( axi_mst_ar_rptr ),
  .async_axi_out_r_data_i  ( axi_mst_r_data  ),
  .async_axi_out_r_wptr_i  ( axi_mst_r_wptr  ),
  .async_axi_out_r_rptr_o  ( axi_mst_r_rptr  )
);

endmodule: safety_island
