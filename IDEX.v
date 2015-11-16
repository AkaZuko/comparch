module D_ff (input clk, input reset, input regWrite, input decOut1b, input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1'b1)
		q=0;
	else
		if(regWrite == 1'b1 && decOut1b==1'b1) begin q=d; end
	end
endmodule



module register3bit( input clk, input reset, input regWrite, input decOut1b, input [2:0]writeData, output [2:0] outR );
	D_ff d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff d2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
endmodule


module register32bit( input clk, input reset, input regWrite, input decOut1b, input [31:0] writeData, output  [31:0] outR );
	D_ff d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff d2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff d3(clk, reset, regWrite, decOut1b, writeData[3], outR[3]);
	D_ff d4(clk, reset, regWrite, decOut1b, writeData[4], outR[4]);
	D_ff d5(clk, reset, regWrite, decOut1b, writeData[5], outR[5]);
	D_ff d6(clk, reset, regWrite, decOut1b, writeData[6], outR[6]);
	D_ff d7(clk, reset, regWrite, decOut1b, writeData[7], outR[7]);
	D_ff d8(clk, reset, regWrite, decOut1b, writeData[8], outR[8]);
	D_ff d9(clk, reset, regWrite, decOut1b, writeData[9], outR[9]);
	D_ff d10(clk, reset, regWrite, decOut1b, writeData[10], outR[10]);
	D_ff d11(clk, reset, regWrite, decOut1b, writeData[11], outR[11]);
	D_ff d12(clk, reset, regWrite, decOut1b, writeData[12], outR[12]);
	D_ff d13(clk, reset, regWrite, decOut1b, writeData[13], outR[13]);
	D_ff d14(clk, reset, regWrite, decOut1b, writeData[14], outR[14]);
	D_ff d15(clk, reset, regWrite, decOut1b, writeData[15], outR[15]);
	D_ff d16(clk, reset, regWrite, decOut1b, writeData[16], outR[16]);
	D_ff d17(clk, reset, regWrite, decOut1b, writeData[17], outR[17]);
	D_ff d18(clk, reset, regWrite, decOut1b, writeData[18], outR[18]);
	D_ff d19(clk, reset, regWrite, decOut1b, writeData[19], outR[19]);
	D_ff d20(clk, reset, regWrite, decOut1b, writeData[20], outR[20]);
	D_ff d21(clk, reset, regWrite, decOut1b, writeData[21], outR[21]);
	D_ff d22(clk, reset, regWrite, decOut1b, writeData[22], outR[22]);
	D_ff d23(clk, reset, regWrite, decOut1b, writeData[23], outR[23]);
	D_ff d24(clk, reset, regWrite, decOut1b, writeData[24], outR[24]);
	D_ff d25(clk, reset, regWrite, decOut1b, writeData[25], outR[25]);
	D_ff d26(clk, reset, regWrite, decOut1b, writeData[26], outR[26]);
	D_ff d27(clk, reset, regWrite, decOut1b, writeData[27], outR[27]);
	D_ff d28(clk, reset, regWrite, decOut1b, writeData[28], outR[28]);
	D_ff d29(clk, reset, regWrite, decOut1b, writeData[29], outR[29]);
	D_ff d30(clk, reset, regWrite, decOut1b, writeData[30], outR[30]);
	D_ff d31(clk, reset, regWrite, decOut1b, writeData[31], outR[31]);
endmodule


  
module ID_EX(input clk, input reset, input regWrite, input decOut1b, input [31:0] sExtOut, input [2:0] inst_Rd,input [2:0] inst_Rm, input [31:0] i1_regRd, input [31:0] i1_regRm, input [31:0] i2_regRd , input [31:0] i2_regRm , input [31:0] i2_regRn , input [2:0] i2_dstReg, output [31:0] OutsExtOut, output [2:0] Outinst_Rd,output [2:0] Outinst_Rm, output [31:0] Outi1_regRd, output [31:0] Outi1_regRm, output [31:0] Outi2_regRd , output [31:0] Outi2_regRm , output [31:0] Outi2_regRn , output [2:0] uti2_dstReg);
  //cntrl ckt input/output bits?
  
  
  register32bit sextReg( clk, reset, regWrite, decOut1b, sExtOut, OutsExtOut);
  register32bit regRd1( clk, reset, regWrite, decOut1b, i1_regRd, Outi1_regRd);
  register32bit regRm1( clk, reset, regWrite, decOut1b, i1_regRm, Outi1_regRm);
  
  register32bit regRd2( clk, reset, regWrite, decOut1b, i2_regRd, Outi2_regRd);
  register32bit regRm2( clk, reset, regWrite, decOut1b, i2_regRm, Outi2_regRm);
  register32bit regRn2( clk, reset, regWrite, decOut1b, i2_regRn, Outi2_regRn);
  
  
  register3bit instRdReg( clk, reset, regWrite, decOut1b, inst_Rd, Outinst_Rd);
  register3bit instRmReg( clk, reset, regWrite, decOut1b, inst_Rm, Outinst_Rm);
  
  register3bit instDstReg2( clk, reset, regWrite, decOut1b, i2_dstReg, Outi2_dstReg);
  
endmodule
