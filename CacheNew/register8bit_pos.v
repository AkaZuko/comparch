module register8bit_pos(input clk, input reset, input regWrite, input decOut1b, input[7:0] inpData, output[7:0] outData);
	
	D_ff_pos Reg8bit_0(clk, reset, regWrite, decOut1b, inpData[0], outData[0]);
	D_ff_pos Reg8bit_1(clk, reset, regWrite, decOut1b, inpData[1], outData[1]);
	D_ff_pos Reg8bit_2(clk, reset, regWrite, decOut1b, inpData[2], outData[2]);
	D_ff_pos Reg8bit_3(clk, reset, regWrite, decOut1b, inpData[3], outData[3]);
	
	D_ff_pos Reg8bit_4(clk, reset, regWrite, decOut1b, inpData[4], outData[4]);
	D_ff_pos Reg8bit_5(clk, reset, regWrite, decOut1b, inpData[5], outData[5]);
	D_ff_pos Reg8bit_6(clk, reset, regWrite, decOut1b, inpData[6], outData[6]);
	D_ff_pos Reg8bit_7(clk, reset, regWrite, decOut1b, inpData[7], outData[7]);
endmodule