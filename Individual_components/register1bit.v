module register1bit(input clk, input reset, input regWrite, input decOut1b, input inpData, output outData);
	
	D_ff_normal Reg1bit_0(clk, reset, regWrite, decOut1b, inpData, outData);

endmodule
