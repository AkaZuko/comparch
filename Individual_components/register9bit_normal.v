
module register9bit_normal(input clk, input reset, input regWrite, input decOut1b, input [8:0] writeData, output [8:0] outR);
	D_ff_normal reg9bit01(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_normal reg9bit02(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff_normal reg9bit03(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff_normal reg9bit04(clk, reset, regWrite, decOut1b, writeData[3], outR[3]);
	D_ff_normal reg9bit05(clk, reset, regWrite, decOut1b, writeData[4], outR[4]);
	D_ff_normal reg9bit06(clk, reset, regWrite, decOut1b, writeData[5], outR[5]);
	D_ff_normal reg9bit07(clk, reset, regWrite, decOut1b, writeData[6], outR[6]);
	D_ff_normal reg9bit08(clk, reset, regWrite, decOut1b, writeData[7], outR[7]);
	D_ff_normal reg9bit09(clk, reset, regWrite, decOut1b, writeData[8], outR[8]);
endmodule