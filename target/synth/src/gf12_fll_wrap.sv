// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Victor Isachi     <victor.isachi@unibo.it>

module gf12_fll_wrap (
  // Asynchronous programming interface
  input  logic              ref_clk_cdc_i,
  input  logic              pwr_on_rst_n_cdc_i,
  input  logic              async_req_i,
  output logic              async_ack_o,
  input  carfield_reg_req_t async_data_i,
  output logic              async_req_o,
  input  logic              async_ack_i,
  output carfield_reg_rsp_t async_data_o,
  // FLL signals
  output logic              clk_fll_out_o,
  input  logic              clk_fll_e_i,
  input  logic              clk_fll_ref_i,
  output logic              fll_lock_o,
  input  logic              fll_rst_n_i,
  input  logic              fll_pwd_i,
  input  logic              fll_test_mode_i,
  input  logic              fll_scan_e_i,
  input  logic              fll_scan_in_i,
  output logic              fll_scan_out_o,
  input  logic              fll_scan_jtag_in_i,
  output logic              fll_scan_jtag_out_o
);

  carfield_reg_req_t fll_ref_clk_cfg_reg_req;
  carfield_reg_rsp_t fll_ref_clk_cfg_reg_rsp;
  
  reg_cdc_dst #(
     .CDC_KIND ( "cdc_4phase"       ),
     .req_t    ( carfield_reg_req_t ),
     .rsp_t    ( carfield_reg_rsp_t )
  ) i_reg_cdc_dst_fll (
      .dst_clk_i   ( ref_clk_cdc_i           ),
      .dst_rst_ni  ( pwr_on_rst_n_cdc_i      ),
      .dst_req_o   ( fll_ref_clk_cfg_reg_req ),
      .dst_rsp_i   ( fll_ref_clk_cfg_reg_rsp ),

      .async_req_i,
      .async_ack_o,
      .async_data_i,

      .async_req_o,
      .async_ack_i,
      .async_data_o
  );

  logic[ 1:0] fll_cfg_addr;
  logic       fll_cfg_wen;
  logic[31:0] fll_cfg_data_in;
  logic       fll_cfg_req;
  logic[31:0] fll_cfg_data_out;
  logic       fll_cfg_ack;

  always_comb begin
    fll_cfg_addr = '0;
    case (fll_ref_clk_cfg_reg_req.addr)
       32'h20020000: fll_cfg_addr = 2'h0;
       32'h20020008: fll_cfg_addr = 2'h1;
       32'h20020010: fll_cfg_addr = 2'h2;
       32'h20020018: fll_cfg_addr = 2'h3;
    endcase
  end

  assign fll_cfg_wen     = ~fll_ref_clk_cfg_reg_req.write;
  assign fll_cfg_data_in = fll_ref_clk_cfg_reg_req.wdata;
  assign fll_cfg_req     = fll_ref_clk_cfg_reg_req.valid;

  assign fll_ref_clk_cfg_reg_rsp.rdata = fll_cfg_data_out;
  assign fll_ref_clk_cfg_reg_rsp.error = '0;
  assign fll_ref_clk_cfg_reg_rsp.ready = fll_cfg_ack;

  gf12_FLL i_fll (
    .FLLCLK ( clk_fll_out_o       ), // out - FLL clock out
    .FLLOE  ( clk_fll_e_i         ), // in  - FLL clock output enable (active high)
    .REFCLK ( clk_fll_ref_i       ), // in  - reference clock input
    .LOCK   ( fll_lock_o          ), // out - FLL lock signal (active high)
    .CFGREQ ( fll_cfg_req         ), // in  - configuration port handshake: req
    .CFGACK ( fll_cfg_ack         ), // out - configuration port handshake: ack
    .CFGAD  ( fll_cfg_addr        ), // in  - config address in
    .CFGD   ( fll_cfg_data_in     ), // in  - config data in
    .CFGQ   ( fll_cfg_data_out    ), // out - config data out
    .CFGWEB ( fll_cfg_wen         ), // in  - config reg write enable (active low)
    .RSTB   ( fll_rst_n_i         ), // in  - global async reset (active low)
    .PWD    ( fll_pwd_i           ), // in  - async power down (active high)
    .TM     ( fll_test_mode_i     ), // in  - test mode
    .TE     ( fll_scan_e_i        ), // in  - scan enable
    .TD     ( fll_scan_in_i       ), // in  - scan in
    .TQ     ( fll_scan_out_o      ), // out - scan out
    .JTD    ( fll_scan_jtag_in_i  ), // in  - scan in (jtag)
    .JTQ    ( fll_scan_jtag_out_o )  // out - scan out (jtag)
  );

endmodule: 