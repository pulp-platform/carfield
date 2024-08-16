// Copyright 2023 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Description: Automatically generated bootrom
//
// Generated by hardware/scripts/generate_bootrom.py

/*
test/bootrom.elf:     file format elf32-littleriscv


Disassembly of section .text.start:

00001000 <_start>:
    1000:	f1402573          	csrr	a0,mhartid
    1004:	30046073          	csrsi	mstatus,8
    1008:	30446073          	csrsi	mie,8
    100c:	00080337          	lui	t1,0x80
    1010:	304322f3          	csrrs	t0,mie,t1
    1014:	00000013          	nop
    1018:	00000013          	nop
    101c:	10500073          	wfi

00001020 <fe>:
    1020:	00000297          	auipc	t0,0x0
    1024:	05c2a283          	lw	t0,92(t0) # 107c <_GLOBAL_OFFSET_TABLE_+0x4>
    1028:	0002a403          	lw	s0,0(t0)
    102c:	00040067          	jr	s0

00001030 <eoc>:
    1030:	10500073          	wfi
    1034:	ffdff06f          	j	1030 <eoc>

00001038 <wait>:
    1038:	10500073          	wfi
    103c:	fe5ff06f          	j	1020 <fe>

Disassembly of section .text.hang:

00001040 <_hang>:
    1040:	f1402573          	csrr	a0,mhartid
    1044:	10500073          	wfi
    1048:	ffdff06f          	j	1044 <_hang+0x4>

Disassembly of section .rodata:

00001050 <BOOTDATA>:
    1050:	1000                	.2byte	0x1000
    1052:	0000                	.2byte	0x0
    1054:	0002                	.2byte	0x2
    1056:	0000                	.2byte	0x0
    1058:	0010                	.2byte	0x10
    105a:	0000                	.2byte	0x0
    105c:	0000                	.2byte	0x0
    105e:	5100                	.2byte	0x5100
    1060:	0000                	.2byte	0x0
    1062:	0002                	.2byte	0x2
    1064:	0000                	.2byte	0x0
    1066:	0000                	.2byte	0x0
    1068:	0000                	.2byte	0x0
    106a:	7800                	.2byte	0x7800
    106c:	0000                	.2byte	0x0
    106e:	0000                	.2byte	0x0
    1070:	0000                	.2byte	0x0
    1072:	7840                	.2byte	0x7840
    1074:	0000                	.2byte	0x0
	...
*/

module snitch_cluster_bootrom #(
  /* Automatically generated. DO NOT CHANGE! */
  parameter int unsigned DataWidth = 512,
  parameter int unsigned AddrWidth = 32
) (
  input  logic                 clk_i,
  input  logic                 req_i,
  input  logic [AddrWidth-1:0] addr_i,
  output logic [DataWidth-1:0] rdata_o
);
  localparam int RomSize = 2;
  localparam int AddrBits = RomSize > 1 ? $clog2(RomSize) : 1;

  const logic [RomSize-1:0][DataWidth-1:0] mem = {
    512'h51000000000000000000000078400000000000007800000000000000000200005100000000000010000000020000100000000000ffdff06f10500073f1402573,
    512'hfe5ff06f10500073ffdff06f10500073000400670002a40305c2a28300000297105000730000001300000013304322f3000803373044607330046073f1402573
  };

  logic [AddrBits-1:0] addr_q;

  always_ff @(posedge clk_i) begin
    if (req_i) begin
      addr_q <= addr_i[AddrBits-1+6:6];
    end
  end

  // this prevents spurious Xes from propagating into
  // the speculative fetch stage of the core
  assign rdata_o = (addr_q < RomSize) ? mem[addr_q] : '0;
endmodule