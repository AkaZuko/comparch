module ex_mem(input clk, input reset, input regWrite1, input regWrite2, input[2:0] muxout,

              input aluOutNFlag, input aluOutZFlag, input aluOutCFlag, input aluOutVFlag,
              input aluOutNFlag_signal, input aluOutZFlag_signal, input aluOutCFlag_signal, input aluOutVFlag_signal,
              input MemNFlag_signal, input MemZFlag_signal, input MemCFlag_signal, input MemVFlag_signal,

              input[7:0] id_exe_regrd2_out,
              input[2:0] id_exe_rd2_out, input[31:0] aluOutInput, input[31:0] adderOut, input memRd_in, input memWt_in,

              output ex_mem_NFlag, output ex_mem_ZFlag, output ex_mem_CFlag, output ex_mem_VFlag,
              output ex_mem_NFlag_signal, output ex_mem_ZFlag_signal, output ex_mem_CFlag_signal, output ex_mem_VFlag_signal,
              output ex_mem_NFlag2_signal, output ex_mem_ZFlag2_signal, output ex_mem_CFlag2_signal, output ex_mem_VFlag2_signal, 
              
              output[2:0] ex_mem_rd1_out, output[2:0] ex_mem_rd2_out, output[7:0] exe_mem_regrd2_out, output[31:0] exe_mem_aluOutOutput,
              output[31:0] ex_mem_memAddr_out, output memRd_out, output memWt_out, output P3_RegWrite1, output P3_RegWrite2);
  
  register3bit_normal ex_mem_rd1(clk, reset, 1'b1, 1'b1, muxout, ex_mem_rd1_out);
  
  register32bit_normal ex_mem_aluout(clk, reset, 1'b1, 1'b1, aluOutInput, exe_mem_aluOutOutput);
  
  register1bit_normal ex_mem_inst1NFLag(clk, reset, 1'b1, 1'b1, aluOutNFlag, ex_mem_NFlag);
  register1bit_normal ex_mem_inst1ZFlag(clk, reset, 1'b1, 1'b1, aluOutZFlag, ex_mem_ZFlag);
  register1bit_normal ex_mem_inst1CFlag(clk, reset, 1'b1, 1'b1, aluOutCFlag, ex_mem_CFlag);
  register1bit_normal ex_mem_inst1VFlag(clk, reset, 1'b1, 1'b1, aluOutVFlag, ex_mem_VFlag);

  register1bit_normal ex_mem_inst1NFLag_signal(clk, reset, 1'b1, 1'b1, aluOutNFlag_signal, ex_mem_NFlag_signal);
  register1bit_normal ex_mem_inst1ZFlag_signal(clk, reset, 1'b1, 1'b1, aluOutZFlag_signal, ex_mem_ZFlag_signal);
  register1bit_normal ex_mem_inst1CFlag_signal(clk, reset, 1'b1, 1'b1, aluOutCFlag_signal, ex_mem_CFlag_signal);
  register1bit_normal ex_mem_inst1VFlag_signal(clk, reset, 1'b1, 1'b1, aluOutVFlag_signal, ex_mem_VFlag_signal);

  register1bit_normal ex_mem_inst2NFLag_signal(clk, reset, 1'b1, 1'b1, MemNFlag_signal, ex_mem_NFlag2_signal);
  register1bit_normal ex_mem_inst2ZFlag_signal(clk, reset, 1'b1, 1'b1, MemZFlag_signal, ex_mem_ZFlag2_signal);
  register1bit_normal ex_mem_inst2CFlag_signal(clk, reset, 1'b1, 1'b1, MemCFlag_signal, ex_mem_CFlag2_signal);
  register1bit_normal ex_mem_inst2VFlag_signal(clk, reset, 1'b1, 1'b1, MemVFlag_signal, ex_mem_VFlag2_signal); 
  
  register32bit_normal memAddr(clk, reset, 1'b1, 1'b1, adderOut, ex_mem_memAddr_out);
  
  register8bit regrd2(clk, reset, 1'b1, 1'b1, id_exe_regrd2_out, exe_mem_regrd2_out);  
    
  register3bit_normal ex_mem_rd2(clk, reset, 1'b1, 1'b1, id_exe_rd2_out, ex_mem_rd2_out);
  
  register1bit_normal regwr1(clk, reset, 1'b1, 1'b1, regWrite1,P3_RegWrite1);
  register1bit_normal regwr2(clk, reset, 1'b1, 1'b1, regWrite2,P3_RegWrite2);
  
  register1bit_normal memRd(clk, reset, 1'b1, 1'b1, memRd_in, memRd_out);
  register1bit_normal memWt(clk, reset, 1'b1, 1'b1, memWt_in, memWt_out);
endmodule