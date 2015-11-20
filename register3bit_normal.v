module register3bit_normal(input clk, input reset, input regWrite, input decOut1b, input [2:0] writeData, output  [2:0] outR);
	D_ff_normal reg3bit_0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_normal reg3bit_1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff_normal reg3bit_2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
endmodule