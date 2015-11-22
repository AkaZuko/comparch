
module register1bit_normal(input clk, input reset, input regWrite, input decOut1b, input writeData, output  outR);
	D_ff_normal reg1bit01(clk, reset, regWrite, decOut1b, writeData, outR);
endmodule