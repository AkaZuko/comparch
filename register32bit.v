module register32bit( 	input clk, input reset, 
						input regWrite1, input regWrite2,
						input decOut1b1, input decOut1b2,
						input [31:0] writeData1, input [31:0] writeData2,
						output  [31:0] outR );
	D_ff d0(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[0], writeData2[0], outR[0]);
	D_ff d1(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[1], writeData2[1], outR[1]);
	D_ff d2(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[2], writeData2[2], outR[2]);
	D_ff d3(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[3], writeData2[3], outR[3]);
	D_ff d4(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[4], writeData2[4], outR[4]);
	D_ff d5(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[5], writeData2[5], outR[5]);
	D_ff d6(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[6], writeData2[6], outR[6]);
	D_ff d7(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[7], writeData2[7], outR[7]);
	D_ff d8(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[8], writeData2[8], outR[8]);
	D_ff d9(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[9], writeData2[9], outR[9]);
	D_ff d10(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[10], writeData2[10], outR[10]);
	D_ff d11(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[11], writeData2[11], outR[11]);
	D_ff d12(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[12], writeData2[12], outR[12]);
	D_ff d13(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[13], writeData2[13], outR[13]);
	D_ff d14(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[14], writeData2[14], outR[14]);
	D_ff d15(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[15], writeData2[15], outR[15]);

	D_ff d16(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[16], writeData2[16], outR[16]);
	D_ff d17(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[17], writeData2[17], outR[17]);
	D_ff d18(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[18], writeData2[18], outR[18]);
	D_ff d19(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[19], writeData2[19], outR[19]);
	D_ff d20(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[20], writeData2[20], outR[20]);
	D_ff d21(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[21], writeData2[21], outR[21]);
	D_ff d22(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[22], writeData2[22], outR[22]);
	D_ff d23(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[23], writeData2[23], outR[23]);
	D_ff d24(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[24], writeData2[24], outR[24]);
	D_ff d25(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[25], writeData2[25], outR[25]);
	D_ff d26(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[26], writeData2[26], outR[26]);
	D_ff d27(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[27], writeData2[27], outR[27]);
	D_ff d28(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[28], writeData2[28], outR[28]);
	D_ff d29(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[29], writeData2[29], outR[29]);
	D_ff d30(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[30], writeData2[30], outR[30]);
	D_ff d31(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[31], writeData2[31], outR[31]);
endmodule