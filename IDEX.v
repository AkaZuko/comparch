module ID_EX(input clk, input reset, 
			input regWrite, input decOut1b,
			
			input [31:0] i1_sExtOut, input [2:0] i1_Rd, input [2:0] i1_Rm, input [31:0] i1_regRd, input [31:0] i1_regRm,
			input [31:0] i2_regRd , input [31:0] i2_regRm , input [31:0] i2_regRn , input [2:0] i2_Rd, input [2:0] i2_Rm, input [2:0] i2_Rn,

			output [31:0] p2_i1_sExtOut, output [2:0] p2_i1_Rd, output [2:0] p2_i1_Rm, output [31:0] p2_i1_regRd, output [31:0] p2_i1_regRm,
			output [31:0] p2_i2_regRd , output [31:0] p2_i2_regRm , output [31:0] p2_i2_regRn , output [2:0] p2_i2_Rd, output [2:0] p2_i2_Rm,
			output [2:0] p2_i2_Rn);			
  //cntrl ckt input/output bits?
  
  
	register32bit_normal P1_i1_sextReg( clk, reset, regWrite, decOut1b, i1_sExtOut, OutsExtOut);
	register3bit_normal P1_R3_i1_rd(clk, reset, regWrite, decOut1b, i1_Rd, p2_i1_Rd);
	register3bit_normal P1_R3_i1_rm(clk, reset, regWrite, decOut1b, i1_Rm, p2_i1_Rm);
	register32bit_normal P1_i1_regRd(clk, reset, regWrite, decOut1b, i1_regRd, p2_i1_regRd);
	register32bit_normal P1_i1_regRm(clk, reset, regWrite, decOut1b, i1_regRm, p2_i1_regRm);
  
	
	register32bit_normal P1_i2_regRd(clk, reset, regWrite, decOut1b, i2_regRd, p2_i2_regRd);
	register32bit_normal P1_i2_regRm(clk, reset, regWrite, decOut1b, i2_regRm, p2_i2_regRm);	
	register32bit_normal P1_i2_regRn(clk, reset, regWrite, decOut1b, i2_regRn, p2_i2_regRn);
	register3bit_normal P1_R3_i2_rd(clk, reset, regWrite, decOut1b, i2_Rd, p2_i2_Rd);
	register3bit_normal P1_R3_i2_rm(clk, reset, regWrite, decOut1b, i2_Rm, p2_i2_Rm);
	register3bit_normal P1_R3_i2_rn(clk, reset, regWrite, decOut1b, i2_Rn, p2_i2_Rn);

endmodule
