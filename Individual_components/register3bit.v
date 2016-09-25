module register3bit(input clk, input reset, input regWrite, input decOut1b, input [2:0] inpData, output [2:0] outData);
	
	D_ff_normal Reg3bit_0(clk, reset, regWrite, decOut1b, inpData[0], outData[0]);
  D_ff_normal Reg3bit_1(clk, reset, regWrite, decOut1b, inpData[1], outData[1]);
  D_ff_normal Reg3bit_2(clk, reset, regWrite, decOut1b, inpData[2], outData[2]);

endmodule
