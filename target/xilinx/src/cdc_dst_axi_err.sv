// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Cyril Koenig <cykoenig@iis.ee.ethz.ch>

module cdc_dst_axi_err #(

  parameter int unsigned AxiInIdWidth  = 1,
  parameter int unsigned LogDepth      = 2,
  parameter int unsigned CdcSyncStages = 2,

  parameter type         axi_in_aw_chan_t   = logic,
  parameter type         axi_in_w_chan_t    = logic,
  parameter type         axi_in_b_chan_t    = logic,
  parameter type         axi_in_ar_chan_t   = logic,
  parameter type         axi_in_r_chan_t    = logic,
  parameter type         axi_in_req_t       = logic,
  parameter type         axi_in_resp_t      = logic,

  parameter int unsigned AsyncAxiInAwWidth  = 1,
  parameter int unsigned AsyncAxiInWWidth   = 1,
  parameter int unsigned AsyncAxiInBWidth   = 1,
  parameter int unsigned AsyncAxiInArWidth  = 1,
  parameter int unsigned AsyncAxiInRWidth   = 1

) (
  input  logic clk_i,
  input  logic rst_ni,
  input  logic pwr_on_rst_ni,

  input  logic [AsyncAxiInAwWidth-1:0] async_axi_in_aw_data_i,
  input  logic            [LogDepth:0] async_axi_in_aw_wptr_i,
  output logic            [LogDepth:0] async_axi_in_aw_rptr_o,
  input  logic [ AsyncAxiInWWidth-1:0] async_axi_in_w_data_i,
  input  logic            [LogDepth:0] async_axi_in_w_wptr_i,
  output logic            [LogDepth:0] async_axi_in_w_rptr_o,
  output logic [ AsyncAxiInBWidth-1:0] async_axi_in_b_data_o,
  output logic            [LogDepth:0] async_axi_in_b_wptr_o,
  input  logic            [LogDepth:0] async_axi_in_b_rptr_i,
  input  logic [AsyncAxiInArWidth-1:0] async_axi_in_ar_data_i,
  input  logic            [LogDepth:0] async_axi_in_ar_wptr_i,
  output logic            [LogDepth:0] async_axi_in_ar_rptr_o,
  output logic [ AsyncAxiInRWidth-1:0] async_axi_in_r_data_o,
  output logic            [LogDepth:0] async_axi_in_r_wptr_o,
  input  logic            [LogDepth:0] async_axi_in_r_rptr_i
);

  axi_in_req_t axi_in_req;
  axi_in_resp_t axi_in_resp;

  axi_cdc_dst #(
    .LogDepth   ( LogDepth         ),
    .SyncStages ( CdcSyncStages    ),
    .aw_chan_t  ( axi_in_aw_chan_t ),
    .w_chan_t   ( axi_in_w_chan_t  ),
    .b_chan_t   ( axi_in_b_chan_t  ),
    .ar_chan_t  ( axi_in_ar_chan_t ),
    .r_chan_t   ( axi_in_r_chan_t  ),
    .axi_req_t  ( axi_in_req_t     ),
    .axi_resp_t ( axi_in_resp_t    )
  ) i_cdc_in (
    .async_data_slave_aw_data_i( async_axi_in_aw_data_i ),
    .async_data_slave_aw_wptr_i( async_axi_in_aw_wptr_i ),
    .async_data_slave_aw_rptr_o( async_axi_in_aw_rptr_o ),
    .async_data_slave_w_data_i ( async_axi_in_w_data_i  ),
    .async_data_slave_w_wptr_i ( async_axi_in_w_wptr_i  ),
    .async_data_slave_w_rptr_o ( async_axi_in_w_rptr_o  ),
    .async_data_slave_b_data_o ( async_axi_in_b_data_o  ),
    .async_data_slave_b_wptr_o ( async_axi_in_b_wptr_o  ),
    .async_data_slave_b_rptr_i ( async_axi_in_b_rptr_i  ),
    .async_data_slave_ar_data_i( async_axi_in_ar_data_i ),
    .async_data_slave_ar_wptr_i( async_axi_in_ar_wptr_i ),
    .async_data_slave_ar_rptr_o( async_axi_in_ar_rptr_o ),
    .async_data_slave_r_data_o ( async_axi_in_r_data_o  ),
    .async_data_slave_r_wptr_o ( async_axi_in_r_wptr_o  ),
    .async_data_slave_r_rptr_i ( async_axi_in_r_rptr_i  ),
    .dst_clk_i                 ( clk_i         ),
    .dst_rst_ni                ( pwr_on_rst_ni ),
    .dst_req_o                 ( axi_in_req    ),
    .dst_resp_i                ( axi_in_resp   )
  );

  axi_err_slv #(
    .AxiIdWidth  ( AxiInIdWidth           ),
    .axi_req_t   ( axi_in_req_t           ),
    .axi_resp_t  ( axi_in_resp_t          ),
    .Resp        ( axi_pkg::RESP_DECERR   ),
    .ATOPs       ( 1'b0                   ),
    .MaxTrans    ( 4                      )
  ) i_axi_err_slv (
    .clk_i      ( clk_i                  ),
    .rst_ni     ( pwr_on_rst_ni          ),
    .test_i     ( '0                     ),
    // slave port
    .slv_req_i  ( axi_in_req             ),
    .slv_resp_o ( axi_in_resp            )
  );


endmodule
