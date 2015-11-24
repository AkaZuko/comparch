module MEM_WB(input clk, input reset,input regWrite, input decout,
              input regWrite1, input regWrite2, input [2:0] ex_mem_rd1_out, input [31:0] ex_mem_aluout,

              input ex_mem_NFlag, input ex_mem_ZFlag, input ex_mem_CFlag, input ex_mem_VFlag,
              input ex_mem_NFlag_signal, input ex_mem_ZFlag_signal, input ex_mem_CFlag_signal, input ex_mem_VFlag_signal,
              
              input inst2NFlag,input inst2ZFlag, input inst2CFlag, input inst2VFlag, // Flag2 vl
              input inst2NFlag_signal,input inst2ZFlag_signal, input inst2CFlag_signal, input inst2VFlag_signal, // Flag2 signals

              input[2:0] ex_mem_rd2_out,input[31:0] zext_out, output [2:0] DestReg1, output [31:0] WriteData1,
              
              output inst1NFlagVal, output inst1ZFlagVal, output inst1CFlagVal, output inst1VFlagVal,
              output inst1NFlagVal_signal, output inst1ZFlagVal_signal, output inst1CFlagVal_signal, output inst1VFlagVal_signal,
              
              output inst2NFlagVal, output inst2ZFlagVal, output inst2CFlagVal, output inst2VFlagVal,
              output inst2NFlagVal_signal, output inst2ZFlagVal_signal, output inst2CFlagVal_signal, output inst2VFlagVal_signal,
              
              output[31:0] WriteData2, output[2:0] DestReg2, output P4_regWrite1, output P4_regWrite2);

  register3bit_normal mem_wb_rd1(clk, reset, regWrite, decout, ex_mem_rd1_out, DestReg1);
  
  register32bit_normal aluOutReg(clk, reset,regWrite, decout, ex_mem_aluout, WriteData1);
  
  register1bit_normal mem_wb_inst1NFlag(clk, reset, regWrite, decout, ex_mem_NFlag, inst1NFlagVal);
  register1bit_normal mem_wb_inst1ZFlag(clk, reset, regWrite, decout, ex_mem_ZFlag, inst1ZFlagVal);
  register1bit_normal mem_wb_inst1CFlag(clk, reset, regWrite, decout, ex_mem_CFlag, inst1CFlagVal);
  register1bit_normal mem_wb_inst1VFlag(clk, reset, regWrite, decout, ex_mem_VFlag, inst1VFlagVal);

  register1bit_normal mem_wb_inst1NFlag_signal(clk, reset, regWrite, decout, ex_mem_NFlag_signal, inst1NFlagVal_signal);
  register1bit_normal mem_wb_inst1ZFlag_signal(clk, reset, regWrite, decout, ex_mem_ZFlag_signal, inst1ZFlagVal_signal);
  register1bit_normal mem_wb_inst1CFlag_signal(clk, reset, regWrite, decout, ex_mem_CFlag_signal, inst1CFlagVal_signal);
  register1bit_normal mem_wb_inst1VFlag_signal(clk, reset, regWrite, decout, ex_mem_VFlag_signal, inst1VFlagVal_signal);
  
  register32bit_normal memOut(clk, reset, regWrite, decout, zext_out, WriteData2);
  
  register1bit_normal mem_wb_inst2NFlag(clk, reset, regWrite, decout, inst2NFlag, inst2NFlagVal);
  register1bit_normal mem_wb_inst2ZFlag(clk, reset, regWrite, decout, inst2ZFlag, inst2ZFlagVal);
  register1bit_normal mem_wb_inst2CFlag(clk, reset, regWrite, decout, inst2CFlag, inst2CFlagVal);
  register1bit_normal mem_wb_inst2VFlag(clk, reset, regWrite, decout, inst2VFlag, inst2VFlagVal);

  register1bit_normal mem_wb_inst2NFlagSignal(clk, reset, regWrite, decout, inst2NFlag_signal, inst2NFlagVal_signal);
  register1bit_normal mem_wb_inst2ZFlagSignal(clk, reset, regWrite, decout, inst2ZFlag_signal, inst2ZFlagVal_signal);
  register1bit_normal mem_wb_inst2CFlagSignal(clk, reset, regWrite, decout, inst2CFlag_signal, inst2CFlagVal_signal);
  register1bit_normal mem_wb_inst2VFlagSignal(clk, reset, regWrite, decout, inst2VFlag_signal, inst2VFlagVal_signal);
  
  register1bit_normal regwr1(clk, reset, regWrite, decout, regWrite1, P4_regWrite1);
  register1bit_normal regwr2(clk, reset, regWrite, decout, regWrite2, P4_regWrite2);
  
  register3bit_normal mem_wb_rd2(clk, reset, regWrite, decout, ex_mem_rd2_out, DestReg2);
endmodule