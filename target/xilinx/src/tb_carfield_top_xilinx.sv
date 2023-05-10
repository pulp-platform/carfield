// add template


module tb_carfield_top_xilinx();

  logic sys_clk_p;
  logic sys_clk_n;
  logic cpu_resetn;
  logic jtag_safety_island_tck_i;
  logic jtag_safety_island_trst_ni;
  logic jtag_safety_island_tms_i;
  logic jtag_safety_island_tdi_i;
  logic jtag_safety_island_tdo_o;

carfield_top_xilinx i_carfield_top_xilinx(
  .sys_clk_p(sys_clk_p),
  .sys_clk_n(sys_clk_n),
  .cpu_resetn(cpu_resetn),
  .jtag_safety_island_tck_i,
  .jtag_safety_island_trst_ni,
  .jtag_safety_island_tms_i,
  .jtag_safety_island_tdi_i,
  .jtag_safety_island_tdo_o
);

    
endmodule