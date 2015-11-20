module MEM_WB(input clk, input reset, input regWrite1, input regWrite2, input ex_mem_rd1_out, input ex_mem_aluout,
              input ex_mem_NFlag, input ex_mem_ZFlag, input ex_mem_CFlag, input ex_mem_VFlag,
              input inst2NFlagSignal,input inst2ZFlagSignal, input inst2CFlagSignal, input inst2VFlagSignal,
              input ex_mem_rd2_out, output DestReg1, output WriteData1,
              output inst1NFlagVal, output inst1ZFlagVal, output inst1CFlagVal, output inst1VFlagVal,
              output inst2NFlagVal, output inst2ZFlagVal, output inst2CFlagVal, output inst2VFlagVal,
              output WriteData2, output DestReg2);
  register3bit mem_wb_rd1(clk, reset, regWrite1, 1'b1, ex_mem_rd1_out, DestReg1);
  
  register32bit_normal aluOutReg(clk, reset, regWrite1, 1'b1, ex_mem_aluout, WriteData1);
  
  register1bit mem_wb_inst1NFlag(clk, reset, 1'b1, 1'b1, ex_mem_NFlag, inst1NFlagVal);
  register1bit mem_wb_inst1ZFlag(clk, reset, 1'b1, 1'b1, ex_mem_ZFlag, inst1ZFlagVal);
  register1bit mem_wb_inst1CFlag(clk, reset, 1'b1, 1'b1, ex_mem_CFlag, inst1CFlagVal);
  register1bit mem_wb_inst1VFlag(clk, reset, 1'b1, 1'b1, ex_mem_NFlag, inst1VFlagVal);
  
  register32bit memOut(clk, reset, regWrite2, 1'b1, zext_out, WriteData2);
  
  register1bit mem_wb_inst2NFlag(clk, reset, 1'b1, 1'b1, inst2NFlagSignal, inst2NFlagVal);
  register1bit mem_wb_inst2ZFlag(clk, reset, 1'b1, 1'b1, inst2ZFlagSignal, inst2NFlagVal);
  register1bit mem_wb_inst2CFlag(clk, reset, 1'b1, 1'b1, inst2CFlagSignal, inst2NFlagVal);
  register1bit mem_wb_inst2VFlag(clk, reset, 1'b1, 1'b1, inst2VFlagSignal, inst2NFlagVal);
  
  register3bit mem_wb_rd2(clk, reset, regWrite2, 1'b1, ex_mem_rd2_out, DestReg2);
endmodule


