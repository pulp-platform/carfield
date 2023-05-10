// add template


module tb_carfield_top_xilinx();

  logic sys_clk_p;
  logic sys_clk_n;
  logic cpu_resetn;

carfield_top_xilinx i_carfield_top_xilinx(
  .sys_clk_p(sys_clk_p),
  .sys_clk_n(sys_clk_n),
  .cpu_resetn(cpu_resetn)
);

    
endmodule