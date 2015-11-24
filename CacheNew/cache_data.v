module mux2to1_32bits(input[31:0] inp1, input[31:0] inp2, input sel, output reg [31:0] outData);
	always@(sel or inp1 or inp2)
	begin
		case(sel)
			1'b0: outData = inp1;
			1'b1: outData = inp2;
		endcase
	end
endmodule

module cache_data(input clk, input reset, input memWrite, input regWrite, input decOut1b, input[31:0] decOutStall,
				  input hit, input[4:0] offset, input[7:0] byte_data, 
				  input[7:0] inpData, output[255:0] outData);
	
	wire [31:0] select_reg_temp;
	wire [31:0] select_reg;
	
	decoder5to32 FOR_BYTE_SELECT(offset, select_reg_temp);
	
	mux2to1_32bits MUX_2_1_32( 32'hffffffff , select_reg_temp, hit, select_reg);

	wire[7:0] mout0, mout1, mout2, mout3, mout4, mout5, mout6,mout7;
	wire[7:0] mout8, mout9, mout10, mout11, mout12, mout13, mout14,mout15;
	wire[7:0] mout16, mout17, mout18, mout19, mout20, mout21, mout22,mout23;
	wire[7:0] mout24, mout25, mout26, mout27, mout28, mout29, mout30,mout31;

	mux2to1_8bits MUX_BYTE_SELECT_0(inpData, byte_data, hit | select_reg[0] , mout0);
	mux2to1_8bits MUX_BYTE_SELECT_1(inpData, byte_data, hit | select_reg[1] , mout1);
	mux2to1_8bits MUX_BYTE_SELECT_2(inpData, byte_data, hit | select_reg[2] , mout2);
	mux2to1_8bits MUX_BYTE_SELECT_3(inpData, byte_data, hit | select_reg[3] , mout3);

	mux2to1_8bits MUX_BYTE_SELECT_4(inpData, byte_data, hit | select_reg[4] , mout4);
	mux2to1_8bits MUX_BYTE_SELECT_5(inpData, byte_data, hit | select_reg[5] , mout5);
	mux2to1_8bits MUX_BYTE_SELECT_6(inpData, byte_data, hit | select_reg[6] , mout6);
	mux2to1_8bits MUX_BYTE_SELECT_7(inpData, byte_data, hit | select_reg[7] , mout7);

	mux2to1_8bits MUX_BYTE_SELECT_8(inpData, byte_data, hit | select_reg[8] , mout8);
	mux2to1_8bits MUX_BYTE_SELECT_9(inpData, byte_data, hit | select_reg[9] , mout9);
	mux2to1_8bits MUX_BYTE_SELECT_10(inpData, byte_data, hit | select_reg[10] , mout10);
	mux2to1_8bits MUX_BYTE_SELECT_11(inpData, byte_data, hit | select_reg[11] , mout11);

	mux2to1_8bits MUX_BYTE_SELECT_12(inpData, byte_data, hit | select_reg[12] , mout12);
	mux2to1_8bits MUX_BYTE_SELECT_13(inpData, byte_data, hit | select_reg[13] , mout13);
	mux2to1_8bits MUX_BYTE_SELECT_14(inpData, byte_data, hit | select_reg[14] , mout14);
	mux2to1_8bits MUX_BYTE_SELECT_15(inpData, byte_data, hit | select_reg[15] , mout15);

	mux2to1_8bits MUX_BYTE_SELECT_16(inpData, byte_data, hit | select_reg[16] , mout16);
	mux2to1_8bits MUX_BYTE_SELECT_17(inpData, byte_data, hit | select_reg[17] , mout17);
	mux2to1_8bits MUX_BYTE_SELECT_18(inpData, byte_data, hit | select_reg[18] , mout18);
	mux2to1_8bits MUX_BYTE_SELECT_19(inpData, byte_data, hit | select_reg[19] , mout19);

	mux2to1_8bits MUX_BYTE_SELECT_20(inpData, byte_data, hit | select_reg[20] , mout20);
	mux2to1_8bits MUX_BYTE_SELECT_21(inpData, byte_data, hit | select_reg[21] , mout21);
	mux2to1_8bits MUX_BYTE_SELECT_22(inpData, byte_data, hit | select_reg[22] , mout22);
	mux2to1_8bits MUX_BYTE_SELECT_23(inpData, byte_data, hit | select_reg[23] , mout23);

	mux2to1_8bits MUX_BYTE_SELECT_24(inpData, byte_data, hit | select_reg[24] , mout24);
	mux2to1_8bits MUX_BYTE_SELECT_25(inpData, byte_data, hit | select_reg[25] , mout25);
	mux2to1_8bits MUX_BYTE_SELECT_26(inpData, byte_data, hit | select_reg[26] , mout26);
	mux2to1_8bits MUX_BYTE_SELECT_27(inpData, byte_data, hit | select_reg[27] , mout27);

	mux2to1_8bits MUX_BYTE_SELECT_28(inpData, byte_data, hit | select_reg[28] , mout28);
	mux2to1_8bits MUX_BYTE_SELECT_29(inpData, byte_data, hit | select_reg[29] , mout29);
	mux2to1_8bits MUX_BYTE_SELECT_30(inpData, byte_data, hit | select_reg[30] , mout30);
	mux2to1_8bits MUX_BYTE_SELECT_31(inpData, byte_data, hit | select_reg[31] , mout31);


	register8bit_pos CACHE_DATA_0(clk, reset, regWrite, decOut1b & decOutStall[0] & select_reg[0] , mout0, outData[7:0]);
	register8bit_pos CACHE_DATA_1(clk, reset, regWrite, decOut1b & decOutStall[1] & select_reg[1], mout1, outData[15:8]);
	register8bit_pos CACHE_DATA_2(clk, reset, regWrite, decOut1b & decOutStall[2] & select_reg[2], mout2, outData[23:16]);
	register8bit_pos CACHE_DATA_3(clk, reset, regWrite, decOut1b & decOutStall[3] & select_reg[3], mout3, outData[31:24]);

	register8bit_pos CACHE_DATA_4(clk, reset, regWrite, decOut1b & decOutStall[4] & select_reg[4], mout4, outData[39:32]);
	register8bit_pos CACHE_DATA_5(clk, reset, regWrite, decOut1b & decOutStall[5] & select_reg[5], mout5, outData[47:40]);
	register8bit_pos CACHE_DATA_6(clk, reset, regWrite, decOut1b & decOutStall[6] & select_reg[6], mout6, outData[55:48]);
	register8bit_pos CACHE_DATA_7(clk, reset, regWrite, decOut1b & decOutStall[7] & select_reg[7], mout7, outData[63:56]);

	register8bit_pos CACHE_DATA_8(clk, reset, regWrite, decOut1b & decOutStall[8] & select_reg[8], mout8, outData[71:64]);
	register8bit_pos CACHE_DATA_9(clk, reset, regWrite, decOut1b & decOutStall[9] & select_reg[9], mout9, outData[79:72]);
	register8bit_pos CACHE_DATA_10(clk, reset, regWrite, decOut1b & decOutStall[10] & select_reg[10], mout10, outData[87:80]);
	register8bit_pos CACHE_DATA_11(clk, reset, regWrite, decOut1b & decOutStall[11] & select_reg[11], mout11, outData[95:88]);

	register8bit_pos CACHE_DATA_12(clk, reset, regWrite, decOut1b & decOutStall[12] & select_reg[12], mout12, outData[103:96]);
	register8bit_pos CACHE_DATA_13(clk, reset, regWrite, decOut1b & decOutStall[13] & select_reg[13], mout13, outData[111:104]);
	register8bit_pos CACHE_DATA_14(clk, reset, regWrite, decOut1b & decOutStall[14] & select_reg[14], mout14, outData[119:112]);
	register8bit_pos CACHE_DATA_15(clk, reset, regWrite, decOut1b & decOutStall[15] & select_reg[15], mout15, outData[127:120]);

	register8bit_pos CACHE_DATA_16(clk, reset, regWrite, decOut1b & decOutStall[16] & select_reg[16], mout16, outData[135:128]);
	register8bit_pos CACHE_DATA_17(clk, reset, regWrite, decOut1b & decOutStall[17] & select_reg[17], mout17, outData[143:136]);
	register8bit_pos CACHE_DATA_18(clk, reset, regWrite, decOut1b & decOutStall[18] & select_reg[18], mout18, outData[151:144]);
	register8bit_pos CACHE_DATA_19(clk, reset, regWrite, decOut1b & decOutStall[19] & select_reg[19], mout19, outData[159:152]);

	register8bit_pos CACHE_DATA_20(clk, reset, regWrite, decOut1b & decOutStall[20] & select_reg[20], mout20, outData[167:160]);
	register8bit_pos CACHE_DATA_21(clk, reset, regWrite, decOut1b & decOutStall[21] & select_reg[21], mout21, outData[175:168]);
	register8bit_pos CACHE_DATA_22(clk, reset, regWrite, decOut1b & decOutStall[22] & select_reg[22], mout22, outData[183:176]);
	register8bit_pos CACHE_DATA_23(clk, reset, regWrite, decOut1b & decOutStall[23] & select_reg[23], mout23, outData[191:184]);

	register8bit_pos CACHE_DATA_24(clk, reset, regWrite, decOut1b & decOutStall[24] & select_reg[24], mout24, outData[199:192]);
	register8bit_pos CACHE_DATA_25(clk, reset, regWrite, decOut1b & decOutStall[25] & select_reg[25], mout25, outData[207:200]);
	register8bit_pos CACHE_DATA_26(clk, reset, regWrite, decOut1b & decOutStall[26] & select_reg[26], mout26, outData[215:208]);
	register8bit_pos CACHE_DATA_27(clk, reset, regWrite, decOut1b & decOutStall[27] & select_reg[27], mout27, outData[223:216]);

	register8bit_pos CACHE_DATA_28(clk, reset, regWrite, decOut1b & decOutStall[28] & select_reg[28], mout28, outData[231:224]);
	register8bit_pos CACHE_DATA_29(clk, reset, regWrite, decOut1b & decOutStall[29] & select_reg[29], mout29, outData[239:232]);
	register8bit_pos CACHE_DATA_30(clk, reset, regWrite, decOut1b & decOutStall[30] & select_reg[30], mout30, outData[247:240]);
	register8bit_pos CACHE_DATA_31(clk, reset, regWrite, decOut1b & decOutStall[31] & select_reg[31], mout31, outData[255:248]);

endmodule