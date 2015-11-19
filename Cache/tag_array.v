module main_tag_array(input clk, input reset, input regWrite, input decOut1b, input input[3:0] inpMainTag, output[3:0] outMainTag);
	D_ff_normal TAG_MAIN_D0(clk, reset, regWrite, decOut1b, inpMainTag[0], outMainTag[0]);
	D_ff_normal TAG_MAIN_D1(clk, reset, regWrite, decOut1b, inpMainTag[1], outMainTag[1]);
	D_ff_normal TAG_MAIN_D2(clk, reset, regWrite, decOut1b, inpMainTag[2], outMainTag[2]);
	D_ff_normal TAG_MAIN_D3(clk, reset, regWrite, decOut1b, inpMainTag[3], outMainTag[3]);
endmodule 

module halt_tag_array(input clk, input reset, input regWrite, input decOut1b, input input[19:0] inpHaltTag, output[19:0] outHaltTag);
	D_ff_normal TAG_HALT_D0(clk, reset, regWrite, decOut1b, inpHaltTag[0], outHaltTag[0]);
	D_ff_normal TAG_HALT_D1(clk, reset, regWrite, decOut1b, inpHaltTag[1], outHaltTag[1]);
	D_ff_normal TAG_HALT_D2(clk, reset, regWrite, decOut1b, inpHaltTag[2], outHaltTag[2]);
	D_ff_normal TAG_HALT_D3(clk, reset, regWrite, decOut1b, inpHaltTag[3], outHaltTag[3]);

	D_ff_normal TAG_HALT_D4(clk, reset, regWrite, decOut1b, inpHaltTag[4], outHaltTag[4]);
	D_ff_normal TAG_HALT_D5(clk, reset, regWrite, decOut1b, inpHaltTag[5], outHaltTag[5]);
	D_ff_normal TAG_HALT_D6(clk, reset, regWrite, decOut1b, inpHaltTag[6], outHaltTag[6]);
	D_ff_normal TAG_HALT_D7(clk, reset, regWrite, decOut1b, inpHaltTag[7], outHaltTag[7]);

	D_ff_normal TAG_HALT_D8(clk, reset, regWrite, decOut1b, inpHaltTag[8], outHaltTag[8]);
	D_ff_normal TAG_HALT_D9(clk, reset, regWrite, decOut1b, inpHaltTag[9], outHaltTag[9]);
	D_ff_normal TAG_HALT_D10(clk, reset, regWrite, decOut1b, inpHaltTag[10], outHaltTag[10]);
	D_ff_normal TAG_HALT_D11(clk, reset, regWrite, decOut1b, inpHaltTag[11], outHaltTag[11]);

	D_ff_normal TAG_HALT_D12(clk, reset, regWrite, decOut1b, inpHaltTag[12], outHaltTag[12]);
	D_ff_normal TAG_HALT_D13(clk, reset, regWrite, decOut1b, inpHaltTag[13], outHaltTag[13]);
	D_ff_normal TAG_HALT_D14(clk, reset, regWrite, decOut1b, inpHaltTag[14], outHaltTag[14]);
	D_ff_normal TAG_HALT_D15(clk, reset, regWrite, decOut1b, inpHaltTag[15], outHaltTag[15]);

	D_ff_normal TAG_HALT_D16(clk, reset, regWrite, decOut1b, inpHaltTag[16], outHaltTag[16]);
	D_ff_normal TAG_HALT_D17(clk, reset, regWrite, decOut1b, inpHaltTag[17], outHaltTag[17]);
	D_ff_normal TAG_HALT_D18(clk, reset, regWrite, decOut1b, inpHaltTag[18], outHaltTag[18]);
	D_ff_normal TAG_HALT_D19(clk, reset, regWrite, decOut1b, inpHaltTag[19], outHaltTag[19]);

endmodule