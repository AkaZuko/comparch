module ex_mem(input clk, input reset, input regWrite1, input regWrite2, input muxout,
              input aluOutNFlag, input aluOutZFlag, input aluOutCFlag, input aluOutVFlag,
              input id_exe_regrd2_out,
              input id_exe_rd2_out, input aluOutInput, input adderOut, input memRd_in, input memWt_in,
              output ex_mem_NFlag, output ex_mem_ZFlag, output ex_mem_CFlag, output ex_memVFlag,
              output ex_mem_rd1_out, output ex_mem_rd2_out, output exe_mem_regrd2_out, output exe_mem_aluOutOutput,
              output ex_mem_memAddr_out, output memRd_out, output memWt_out);
  
  register3bit ex_mem_rd1(clk, reset, regWrite1, 1'b1, muxout, ex_mem_rd1_out);
  
  register32bit_normal ex_mem_aluout(clk, reset, 1'b1, 1'b1, aluOutInput, exe_mem_aluOutOutput);
  
  register1bit ex_mem_inst1NFLag(clk, reset, 1'b1, 1'b1, aluOutNFlag, ex_mem_NFlag);
  register1bit ex_mem_inst1ZFlag(clk, reset, 1'b1, 1'b1, aluOutZFlag, ex_mem_ZFlag);
  register1bit ex_mem_inst1CFlag(clk, reset, 1'b1, 1'b1, aluOutCFlag, ex_mem_CFlag);
  register1bit ex_mem_inst1VFlag(clk, reset, 1'b1, 1'b1, aluOutVFlag, ex_mem_VFlag);
  
  register32bit_normal memAddr(clk, reset, 1'b1, 1'b1, adderOut, ex_mem_memAddr_out);
  
  register8bit regrd2(clk, reset, 1'b1, 1'b1, id_exe_regrd2_out, exe_mem_regrd2_out);  
    
  register3bit ex_mem_rd2(clk, reset, regWrite2, 1'b1, id_exe_rd2_out, ex_mem_rd2_out);
  
  register1bit memRd(clk, reset, 1'b1, 1'b1, memRd_in, memRd_out);
  register1bit memWt(clk, reset, 1'b1, 1'b1, memWt_in, memWt_out);
endmodule
