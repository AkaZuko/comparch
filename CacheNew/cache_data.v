module mux2to1_32bits(input[31:0] inp1, input[31:0] inp2, input sel, output reg [31:0] outData);
	always@(sel or inp1 or inp2)
	begin
		case(sel)
			1'b0: outData = inp1;
			1'b1: outData = inp2;
		endcase
	end
endmodule

module cache_data(input clk, input reset, input regWrite, input decOut1b,
				  input hit, input[4:0] offset, input[7:0] byte_data, 
				  input[255:0] inpData, output[255:0] outData);
	
	wire [31:0] select_reg_temp;
	wire [31:0] select_reg;
	
	decoder5to32 FOR_BYTE_SELECT(offset, select_reg_temp);
	
	mux2to1_32bits MUX_2_1_32( 32'hffffffff , select_reg_temp, hit, select_reg);

	wire[7:0] mout0, mout1, mout2, mout3, mout4, mout5, mout6,mout7;
	wire[7:0] mout8, mout9, mout10, mout11, mout12, mout13, mout14,mout15;
	wire[7:0] mout16, mout17, mout18, mout19, mout20, mout21, mout22,mout23;
	wire[7:0] mout24, mout25, mout26, mout27, mout28, mout29, mout30,mout31;

	mux2to1_8bits MUX_BYTE_SELECT_0(inpData[7:0], byte_data, hit, mout0);
	mux2to1_8bits MUX_BYTE_SELECT_1(inpData[15:8], byte_data, hit, mout1);
	mux2to1_8bits MUX_BYTE_SELECT_2(inpData[23:16], byte_data, hit, mout2);
	mux2to1_8bits MUX_BYTE_SELECT_3(inpData[31:24], byte_data, hit, mout3);

	mux2to1_8bits MUX_BYTE_SELECT_4(inpData[39:32], byte_data, hit, mout4);
	mux2to1_8bits MUX_BYTE_SELECT_5(inpData[47:40], byte_data, hit, mout5);
	mux2to1_8bits MUX_BYTE_SELECT_6(inpData[55:48], byte_data, hit, mout6);
	mux2to1_8bits MUX_BYTE_SELECT_7(inpData[63:56], byte_data, hit, mout7);

	mux2to1_8bits MUX_BYTE_SELECT_8(inpData[71:64], byte_data, hit, mout8);
	mux2to1_8bits MUX_BYTE_SELECT_9(inpData[79:72], byte_data, hit, mout9);
	mux2to1_8bits MUX_BYTE_SELECT_10(inpData[87:80], byte_data, hit, mout10);
	mux2to1_8bits MUX_BYTE_SELECT_11(inpData[95:88], byte_data, hit, mout11);

	mux2to1_8bits MUX_BYTE_SELECT_12(inpData[103:96], byte_data, hit, mout12);
	mux2to1_8bits MUX_BYTE_SELECT_13(inpData[111:104], byte_data, hit, mout13);
	mux2to1_8bits MUX_BYTE_SELECT_14(inpData[119:112], byte_data, hit, mout14);
	mux2to1_8bits MUX_BYTE_SELECT_15(inpData[127:120], byte_data, hit, mout15);

	mux2to1_8bits MUX_BYTE_SELECT_16(inpData[135:128], byte_data, hit, mout16);
	mux2to1_8bits MUX_BYTE_SELECT_17(inpData[143:136], byte_data, hit, mout17);
	mux2to1_8bits MUX_BYTE_SELECT_18(inpData[151:144], byte_data, hit, mout18);
	mux2to1_8bits MUX_BYTE_SELECT_19(inpData[159:152], byte_data, hit, mout19);

	mux2to1_8bits MUX_BYTE_SELECT_20(inpData[167:160], byte_data, hit, mout20);
	mux2to1_8bits MUX_BYTE_SELECT_21(inpData[175:168], byte_data, hit, mout21);
	mux2to1_8bits MUX_BYTE_SELECT_22(inpData[183:176], byte_data, hit, mout22);
	mux2to1_8bits MUX_BYTE_SELECT_23(inpData[191:184], byte_data, hit, mout23);

	mux2to1_8bits MUX_BYTE_SELECT_24(inpData[199:192], byte_data, hit, mout24);
	mux2to1_8bits MUX_BYTE_SELECT_25(inpData[207:200], byte_data, hit, mout25);
	mux2to1_8bits MUX_BYTE_SELECT_26(inpData[215:208], byte_data, hit, mout26);
	mux2to1_8bits MUX_BYTE_SELECT_27(inpData[223:216], byte_data, hit, mout27);

	mux2to1_8bits MUX_BYTE_SELECT_28(inpData[231:224], byte_data, hit, mout28);
	mux2to1_8bits MUX_BYTE_SELECT_29(inpData[239:232], byte_data, hit, mout29);
	mux2to1_8bits MUX_BYTE_SELECT_30(inpData[247:240], byte_data, hit, mout30);
	mux2to1_8bits MUX_BYTE_SELECT_31(inpData[255:248], byte_data, hit, mout31);


	register8bit_pos CACHE_DATA_0(clk, reset, regWrite, decOut1b & select_reg[0], mout0, outData[7:0]);
	register8bit_pos CACHE_DATA_1(clk, reset, regWrite, decOut1b & select_reg[1], mout1, outData[15:8]);
	register8bit_pos CACHE_DATA_2(clk, reset, regWrite, decOut1b & select_reg[2], mout2, outData[23:16]);
	register8bit_pos CACHE_DATA_3(clk, reset, regWrite, decOut1b & select_reg[3], mout3, outData[31:24]);

	register8bit_pos CACHE_DATA_4(clk, reset, regWrite, decOut1b & select_reg[4], mout4, outData[39:32]);
	register8bit_pos CACHE_DATA_5(clk, reset, regWrite, decOut1b & select_reg[5], mout5, outData[47:40]);
	register8bit_pos CACHE_DATA_6(clk, reset, regWrite, decOut1b & select_reg[6], mout6, outData[55:48]);
	register8bit_pos CACHE_DATA_7(clk, reset, regWrite, decOut1b & select_reg[7], mout7, outData[63:56]);

	register8bit_pos CACHE_DATA_8(clk, reset, regWrite, decOut1b & select_reg[8], mout8, outData[71:64]);
	register8bit_pos CACHE_DATA_9(clk, reset, regWrite, decOut1b & select_reg[9], mout9, outData[79:72]);
	register8bit_pos CACHE_DATA_10(clk, reset, regWrite, decOut1b & select_reg[10], mout10, outData[87:80]);
	register8bit_pos CACHE_DATA_11(clk, reset, regWrite, decOut1b & select_reg[11], mout11, outData[95:88]);

	register8bit_pos CACHE_DATA_12(clk, reset, regWrite, decOut1b & select_reg[12], mout12, outData[103:96]);
	register8bit_pos CACHE_DATA_13(clk, reset, regWrite, decOut1b & select_reg[13], mout13, outData[111:104]);
	register8bit_pos CACHE_DATA_14(clk, reset, regWrite, decOut1b & select_reg[14], mout14, outData[119:112]);
	register8bit_pos CACHE_DATA_15(clk, reset, regWrite, decOut1b & select_reg[15], mout15, outData[127:120]);

	register8bit_pos CACHE_DATA_16(clk, reset, regWrite, decOut1b & select_reg[16], mout16, outData[135:128]);
	register8bit_pos CACHE_DATA_17(clk, reset, regWrite, decOut1b & select_reg[17], mout17, outData[143:136]);
	register8bit_pos CACHE_DATA_18(clk, reset, regWrite, decOut1b & select_reg[18], mout18, outData[151:144]);
	register8bit_pos CACHE_DATA_19(clk, reset, regWrite, decOut1b & select_reg[19], mout19, outData[159:152]);

	register8bit_pos CACHE_DATA_20(clk, reset, regWrite, decOut1b & select_reg[20], mout20, outData[167:160]);
	register8bit_pos CACHE_DATA_21(clk, reset, regWrite, decOut1b & select_reg[21], mout21, outData[175:168]);
	register8bit_pos CACHE_DATA_22(clk, reset, regWrite, decOut1b & select_reg[22], mout22, outData[183:176]);
	register8bit_pos CACHE_DATA_23(clk, reset, regWrite, decOut1b & select_reg[23], mout23, outData[191:184]);

	register8bit_pos CACHE_DATA_24(clk, reset, regWrite, decOut1b & select_reg[24], mout24, outData[199:192]);
	register8bit_pos CACHE_DATA_25(clk, reset, regWrite, decOut1b & select_reg[25], mout25, outData[207:200]);
	register8bit_pos CACHE_DATA_26(clk, reset, regWrite, decOut1b & select_reg[26], mout26, outData[215:208]);
	register8bit_pos CACHE_DATA_27(clk, reset, regWrite, decOut1b & select_reg[27], mout27, outData[223:216]);

	register8bit_pos CACHE_DATA_28(clk, reset, regWrite, decOut1b & select_reg[28], mout28, outData[231:224]);
	register8bit_pos CACHE_DATA_29(clk, reset, regWrite, decOut1b & select_reg[29], mout29, outData[239:232]);
	register8bit_pos CACHE_DATA_30(clk, reset, regWrite, decOut1b & select_reg[30], mout30, outData[247:240]);
	register8bit_pos CACHE_DATA_31(clk, reset, regWrite, decOut1b & select_reg[31], mout31, outData[255:248]);

endmodule