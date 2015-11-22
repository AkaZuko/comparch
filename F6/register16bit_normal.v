
module register16bit_normal(input clk, input reset, input regWrite, input decOut1b, input [15:0] writeData, output  [15:0] outR );
	D_ff_normal dn0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_normal dn1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff_normal dn2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff_normal dn3(clk, reset, regWrite, decOut1b, writeData[3], outR[3]);
	D_ff_normal dn4(clk, reset, regWrite, decOut1b, writeData[4], outR[4]);
	D_ff_normal dn5(clk, reset, regWrite, decOut1b, writeData[5], outR[5]);
	D_ff_normal dn6(clk, reset, regWrite, decOut1b, writeData[6], outR[6]);
	D_ff_normal dn7(clk, reset, regWrite, decOut1b, writeData[7], outR[7]);
	D_ff_normal dn8(clk, reset, regWrite, decOut1b, writeData[8], outR[8]);
	D_ff_normal dn9(clk, reset, regWrite, decOut1b, writeData[9], outR[9]);
	D_ff_normal dn10(clk, reset, regWrite, decOut1b, writeData[10], outR[10]);
	D_ff_normal dn11(clk, reset, regWrite, decOut1b, writeData[11], outR[11]);
	D_ff_normal dn12(clk, reset, regWrite, decOut1b, writeData[12], outR[12]);
	D_ff_normal dn13(clk, reset, regWrite, decOut1b, writeData[13], outR[13]);
	D_ff_normal dn14(clk, reset, regWrite, decOut1b, writeData[14], outR[14]);
	D_ff_normal dn15(clk, reset, regWrite, decOut1b, writeData[15], outR[15]);
endmodule