// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//

`ifndef CARFIELD_TYPEDEF_SVH_
`define CARFIELD_TYPEDEF_SVH_

`include "axi/typedef.svh"
`include "register_interface/typedef.svh"

`define AXI_TYPEDEF_IOMMU_AW_CHAN_T(__name, addr_t, id_t, user_t, sid_t, ssidv_t, ssid_t )  \
  typedef struct packed {                                       \
   id_t              id;                                        \
   addr_t            addr;                                      \
   axi_pkg::len_t    len;                                       \
   axi_pkg::size_t   size;                                      \
   axi_pkg::burst_t  burst;                                     \
   logic             lock;                                      \
   axi_pkg::cache_t  cache;                                     \
   axi_pkg::prot_t   prot;                                      \
   axi_pkg::qos_t    qos;                                       \
   axi_pkg::region_t region;                                    \
   axi_pkg::atop_t   atop;                                      \
   user_t            user;                                      \
   sid_t             stream_id;                                 \
   ssidv_t           ss_id_valid;                               \
   ssid_t            substream_id;                              \
  } __name;

`define AXI_TYPEDEF_IOMMU_AR_CHAN_T(__name, addr_t, id_t, user_t, sid_t, ssidv_t, ssid_t )  \
  typedef struct packed {                                       \
    id_t              id;                                       \
    addr_t            addr;                                     \
    axi_pkg::len_t    len;                                      \
    axi_pkg::size_t   size;                                     \
    axi_pkg::burst_t  burst;                                    \
    logic             lock;                                     \
    axi_pkg::cache_t  cache;                                    \
    axi_pkg::prot_t   prot;                                     \
    axi_pkg::qos_t    qos;                                      \
    axi_pkg::region_t region;                                   \
    user_t            user;                                     \
    sid_t             stream_id;                                \
    ssidv_t           ss_id_valid;                              \
    ssid_t            substream_id;                             \
   } __name;

`define CARFIELD_TYPEDEF_IOMMU(__name, __cfg)                             \
  localparam type __name``_user_t    = logic [__cfg.AxiUserWidth   -1:0]; \
  localparam type __name``_id_t      = logic [__cfg.AxiMstIdWidth  -1:0]; \
  localparam type __name``_data_t    = logic [__cfg.AxiDataWidth   -1:0]; \
  localparam type __name``_strb_t    = logic [__cfg.AxiDataWidth/8 -1:0]; \
  localparam type iommu_sid_t        = logic [23:0];                      \
  localparam type iommu_ssidv_t      = logic ;                            \
  localparam type iommu_ssid_t       = logic [19:0];                      \
  localparam type __addr_t           = logic [55:0];                      \
  `AXI_TYPEDEF_IOMMU_AW_CHAN_T(__name``_aw_chan_t, __addr_t, __name``_id_t, __name``_user_t,    \
                               iommu_sid_t, iommu_ssidv_t, iommu_ssid_t )                       \
  `AXI_TYPEDEF_IOMMU_AR_CHAN_T(__name``_ar_chan_t, __addr_t, __name``_id_t, __name``_user_t,    \
                               iommu_sid_t, iommu_ssidv_t, iommu_ssid_t )                       \
  `AXI_TYPEDEF_W_CHAN_T(__name``_w_chan_t, __name``_data_t, __name``_strb_t, __name``_user_t)   \
  `AXI_TYPEDEF_B_CHAN_T(__name``_b_chan_t, __name``_id_t,  __name``_user_t)                     \
  `AXI_TYPEDEF_R_CHAN_T(__name``_r_chan_t, __name``_data_t, __name``_id_t, __name``_user_t)     \
  `AXI_TYPEDEF_REQ_T(__name``_req_t, __name``_aw_chan_t, __name``_w_chan_t, __name``_ar_chan_t) \
  `AXI_TYPEDEF_RESP_T(__name``_rsp_t, __name``_b_chan_t, __name``_r_chan_t)

`endif
