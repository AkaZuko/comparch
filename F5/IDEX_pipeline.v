module IDEX_pipeline(input clk, input reset, input regWrite, input decOut1b,
                    input [8:0] Instr1SigOut, input [6:0] Instr2SigOut, 
                     input [31:0] subImmExt, input [2:0] rd1_2, input [2:0] rd1_1, input [2:0] rm1, 
                     input [31:0] Regrm1, input [31:0] Regrd1_1, input [31:0] Regrd1_2, 
                     input [31:0] Regrm2, input [31:0] Regrn2, input [31:0] Regrd2,
                      input [2:0] rm2, input [2:0] rn2, input [2:0] rd2, 
                      output [8:0] P2_Instr1SigOut,output [6:0] P2_Instr2SigOut, output [31:0] P2_subImmExt,
                      output [2:0] P2_rd1_2, output [2:0] P2_rd1_1, output [2:0] P2_rm1,
                      output [31:0] P2_Regrm1, output [31:0] P2_Regrd1_1, output [31:0] P2_Regrd1_2, 
                      output [31:0] P2_Regrm2 , output [31:0] P2_Regrn2, output [31:0] P2_Regrd2,
                      output  [2:0] P2_rm2, output  [2:0] P2_rn2, output [2:0] P2_rd2
                          );

register9bit_normal controlinst1(clk, reset, regWrite, decOut1b, Instr1SigOut ,P2_Instr1SigOut );
D_ff_normal reg1b01(clk, reset, regWrite, decOut1b, Instr2SigOut[0], P2_Instr2SigOut[0]);
D_ff_normal reg1b02(clk, reset, regWrite,decOut1b, Instr2SigOut[1], P2_Instr2SigOut[1]);
D_ff_normal reg1b03(clk, reset, regWrite,decOut1b, Instr2SigOut[2], P2_Instr2SigOut[2]);
D_ff_normal reg1b04(clk, reset, regWrite,decOut1b, Instr2SigOut[3], P2_Instr2SigOut[3]);
D_ff_normal reg1b05(clk, reset, regWrite,decOut1b, Instr2SigOut[4], P2_Instr2SigOut[4]);
D_ff_normal reg1b06(clk, reset, regWrite,decOut1b, Instr2SigOut[5], P2_Instr2SigOut[5]);
D_ff_normal reg1b07(clk, reset, regWrite,decOut1b, Instr2SigOut[6], P2_Instr2SigOut[6]);

register32bit_normal regSubImm01(clk,reset, regWrite,decOut1b,  subImmExt, P2_subImmExt);
register32bit_normal regrm1(clk,reset, regWrite,decOut1b,  Regrm1, P2_Regrm1);
register32bit_normal regrd101(clk,reset, regWrite,decOut1b,  Regrd1_1, P2_Regrd1_1);
register32bit_normal regrd102(clk,reset, regWrite,decOut1b,   Regrd1_2, P2_Regrd1_2);
register32bit_normal regrm2(clk,reset, regWrite,decOut1b,  Regrm2, P2_Regrm2);
register32bit_normal regrn2(clk,reset, regWrite,decOut1b,   Regrn2, P2_Regrn2);
register32bit_normal regrd2(clk,reset, regWrite,decOut1b,  Regrd2, P2_Regrd2);
register3bit_normal rd201(clk, reset, regWrite,decOut1b, rd2, P2_rd2);
register3bit_normal rm201(clk, reset, regWrite,decOut1b, rm2, P2_rm2);
register3bit_normal rn201(clk, reset, regWrite,decOut1b, rn2, P2_rn2);
register3bit_normal rm101(clk, reset, regWrite,decOut1b, rm1, P2_rm1);
register3bit_normal rd101(clk, reset, regWrite ,decOut1b, rd1_1, P2_rd1_1);
register3bit_normal rd102(clk, reset, regWrite,decOut1b, rd1_2, P2_rd1_2);
endmodule