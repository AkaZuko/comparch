`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:09:14 11/16/2015 
// Design Name: 	 registerFile Verilog
// Module Name:    regFile 
// Project Name:   CSF342
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: IM
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module D_ff (input clk, input reset, input regWrite, input decOut1b, input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1'b1)
		q=0;
	else
		if(regWrite == 1'b1 && decOut1b==1'b1) begin q=d; end
	end
endmodule

module register16bit( input clk, input reset, input regWrite, input decOut1b, input [15:0] writeData, output  [15:0] outR );
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
endmodule

module registerSet( input clk, input reset, input regWrite, input [15:0] decOut, input [15:0] writeData,  output [15:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15 );
		register16bit r0 (clk, reset, 1'b0, decOut[0] , writeData , outR0 );
		register16bit r1 (clk, reset, regWrite, decOut[1] , writeData , outR1 );
		register16bit r2 (clk, reset, regWrite, decOut[2] , writeData , outR2 );
		register16bit r3 (clk, reset, regWrite, decOut[3] , writeData , outR3 );
		register16bit r4 (clk, reset, regWrite, decOut[4] , writeData , outR4 );
		register16bit r5 (clk, reset, regWrite, decOut[5] , writeData , outR5 );
		register16bit r6 (clk, reset, regWrite, decOut[6] , writeData , outR6 );
		register16bit r7 (clk, reset, regWrite, decOut[7] , writeData , outR7 );
		register16bit r8 (clk, reset, regWrite, decOut[8] , writeData , outR8 );
		register16bit r9 (clk, reset, regWrite, decOut[9] , writeData , outR9 );
		register16bit r10 (clk, reset, regWrite, decOut[10] , writeData , outR10 );
		register16bit r11(clk, reset, regWrite, decOut[11] , writeData , outR11 );
		register16bit r12 (clk, reset, regWrite, decOut[12] , writeData , outR12 );
		register16bit r13 (clk, reset, regWrite, decOut[13] , writeData , outR13 );
		register16bit r14 (clk, reset, regWrite, decOut[14] , writeData , outR14 );
		register16bit r15 (clk, reset, regWrite, decOut[15] , writeData , outR15 );
endmodule

module registerFile(input clk, input reset, input regWrite1, input regWrite2, input [3:0] srcRegA1, input [3:0] srcRegB1,  input [3:0] destReg1, input [15:0] writeData1, input [3:0] srcRegA2, input [3:0] srcRegB2, input [3:0] destReg2,  input [15:0] writeData2, output [15:0] outBusA1, output [15:0] outBusB1, output [15:0] outBusA2, output [15:0] outBusB2 );
	wire [15:0] decOut_1, decOut_2;
	wire [15:0] outR0_1,outR1_1,outR2_1,outR3_1,outR4_1,outR5_1,outR6_1,outR7_1,outR8_1,outR9_1,outR10_1,outR11_1,outR12_1,outR13_1,outR14_1,outR15_1;
	wire [15:0] outR0_2,outR1_2,outR2_2,outR3_2,outR4_2,outR5_2,outR6_2,outR7_2,outR8_2,outR9_2,outR10_2,outR11_2,outR12_2,outR13_2,outR14_2,outR15_2;
	decoder4to16 d0_1 (destReg1,decOut_1);
	registerSet rSet0_1(clk, reset, regWrite1, decOut_1, writeData1, outR0_1,outR1_1,outR2_1,outR3_1,outR4_1,outR5_1,outR6_1,outR7_1,outR8_1,outR9_1,outR10_1,outR11_1,outR12_1,outR13_1,outR14_1,outR15_1);
	mux16to1 m1_1(outR0_1,outR1_1,outR2_1,outR3_1,outR4_1,outR5_1,outR6_1,outR7_1,outR8_1,outR9_1,outR10_1,outR11_1,outR12_1,outR13_1,outR14_1,outR15_1,srcRegA1,outBusA1);
	mux16to1 m2_1(outR0_1,outR1_1,outR2_1,outR3_1,outR4_1,outR5_1,outR6_1,outR7_1,outR8_1,outR9_1,outR10_1,outR11_1,outR12_1,outR13_1,outR14_1,outR15_1,srcRegB1,outBusB1);
	
	decoder4to16 d0_2 (destReg2,decOut_2);
	registerSet rSet0_2(clk, reset, regWrite2, decOut_2, writeData2, outR0_2,outR1_2,outR2_2,outR3_2,outR4_2,outR5_2,outR6_2,outR7_2,outR8_2,outR9_2,outR10_2,outR11_2,outR12_2,outR13_2,outR14_2,outR15_2);
	mux16to1 m1_2(outR0_2,outR1_2,outR2_2,outR3_2,outR4_2,outR5_2,outR6_2,outR7_2,outR8_2,outR9_2,outR10_2,outR11_2,outR12_2,outR13_2,outR14_2,outR15_2,srcRegA2,outBusA2);
	mux16to1 m2_2(outR0_2,outR1_2,outR2_2,outR3_2,outR4_2,outR5_2,outR6_2,outR7_2,outR8_2,outR9_2,outR10_2,outR11_2,outR12_2,outR13_2,outR14_2,outR15_2,srcRegB2,outBusB2);
endmodule

