module halt_tag_array(input clk, input reset, input regWrite, input decOut1b, input input[3:0] inpHaltTag, output[3:0] outHaltTag);
	
	D_ff_normal TAG_Halt_D0(clk, reset, regWrite, decOut1b, inpHaltTag[0], outHaltTag[0]);
	D_ff_normal TAG_Halt_D1(clk, reset, regWrite, decOut1b, inpHaltTag[1], outHaltTag[1]);
	D_ff_normal TAG_Halt_D2(clk, reset, regWrite, decOut1b, inpHaltTag[2], outHaltTag[2]);
	D_ff_normal TAG_Halt_D3(clk, reset, regWrite, decOut1b, inpHaltTag[3], outHaltTag[3]);

endmodule 

module main_tag_array(input clk, input reset, input regWrite, input decOut1b, input input[19:0] inpMainTag, output[19:0] outMainTag);
	
	D_ff_normal TAG_Main_D0(clk, reset, regWrite, decOut1b, inpMainTag[0], outMainTag[0]);
	D_ff_normal TAG_Main_D1(clk, reset, regWrite, decOut1b, inpMainTag[1], outMainTag[1]);
	D_ff_normal TAG_Main_D2(clk, reset, regWrite, decOut1b, inpMainTag[2], outMainTag[2]);
	D_ff_normal TAG_Main_D3(clk, reset, regWrite, decOut1b, inpMainTag[3], outMainTag[3]);

	D_ff_normal TAG_Main_D4(clk, reset, regWrite, decOut1b, inpMainTag[4], outMainTag[4]);
	D_ff_normal TAG_Main_D5(clk, reset, regWrite, decOut1b, inpMainTag[5], outMainTag[5]);
	D_ff_normal TAG_Main_D6(clk, reset, regWrite, decOut1b, inpMainTag[6], outMainTag[6]);
	D_ff_normal TAG_Main_D7(clk, reset, regWrite, decOut1b, inpMainTag[7], outMainTag[7]);

	D_ff_normal TAG_Main_D8(clk, reset, regWrite, decOut1b, inpMainTag[8], outMainTag[8]);
	D_ff_normal TAG_Main_D9(clk, reset, regWrite, decOut1b, inpMainTag[9], outMainTag[9]);
	D_ff_normal TAG_Main_D10(clk, reset, regWrite, decOut1b, inpMainTag[10], outMainTag[10]);
	D_ff_normal TAG_Main_D11(clk, reset, regWrite, decOut1b, inpMainTag[11], outMainTag[11]);

	D_ff_normal TAG_Main_D12(clk, reset, regWrite, decOut1b, inpMainTag[12], outMainTag[12]);
	D_ff_normal TAG_Main_D13(clk, reset, regWrite, decOut1b, inpMainTag[13], outMainTag[13]);
	D_ff_normal TAG_Main_D14(clk, reset, regWrite, decOut1b, inpMainTag[14], outMainTag[14]);
	D_ff_normal TAG_Main_D15(clk, reset, regWrite, decOut1b, inpMainTag[15], outMainTag[15]);

	D_ff_normal TAG_Main_D16(clk, reset, regWrite, decOut1b, inpMainTag[16], outMainTag[16]);
	D_ff_normal TAG_Main_D17(clk, reset, regWrite, decOut1b, inpMainTag[17], outMainTag[17]);
	D_ff_normal TAG_Main_D18(clk, reset, regWrite, decOut1b, inpMainTag[18], outMainTag[18]);
	D_ff_normal TAG_Main_D19(clk, reset, regWrite, decOut1b, inpMainTag[19], outMainTag[19]);

endmodule