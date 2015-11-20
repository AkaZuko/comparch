module cache_data(input clk, input reset, input regWrite, input decOut1b, input[255:0] inpData, output[255:0] outData);
	
	register8bit CACHE_DATA_0(clk, reset, regWrite, decOut1b, inpData[7:0], outData[7:0]);
	register8bit CACHE_DATA_1(clk, reset, regWrite, decOut1b, inpData[15:8], outData[15:8]);
	register8bit CACHE_DATA_2(clk, reset, regWrite, decOut1b, inpData[23:16], outData[23:16]);
	register8bit CACHE_DATA_3(clk, reset, regWrite, decOut1b, inpData[31:24], outData[31:24]);

	register8bit CACHE_DATA_4(clk, reset, regWrite, decOut1b, inpData[39:32], outData[39:32]);
	register8bit CACHE_DATA_5(clk, reset, regWrite, decOut1b, inpData[47:40], outData[47:40]);
	register8bit CACHE_DATA_6(clk, reset, regWrite, decOut1b, inpData[55:48], outData[55:48]);
	register8bit CACHE_DATA_7(clk, reset, regWrite, decOut1b, inpData[63:56], outData[63:56]);

	register8bit CACHE_DATA_8(clk, reset, regWrite, decOut1b, inpData[71:64], outData[71:64]);
	register8bit CACHE_DATA_9(clk, reset, regWrite, decOut1b, inpData[79:72], outData[79:72]);
	register8bit CACHE_DATA_10(clk, reset, regWrite, decOut1b, inpData[87:80], outData[87:80]);
	register8bit CACHE_DATA_11(clk, reset, regWrite, decOut1b, inpData[95:88], outData[95:88]);

	register8bit CACHE_DATA_12(clk, reset, regWrite, decOut1b, inpData[103:96], outData[103:96]);
	register8bit CACHE_DATA_13(clk, reset, regWrite, decOut1b, inpData[111:104], outData[111:104]);
	register8bit CACHE_DATA_14(clk, reset, regWrite, decOut1b, inpData[119:112], outData[119:112]);
	register8bit CACHE_DATA_15(clk, reset, regWrite, decOut1b, inpData[127:120], outData[127:120]);

	register8bit CACHE_DATA_16(clk, reset, regWrite, decOut1b, inpData[135:128], outData[135:128]);
	register8bit CACHE_DATA_17(clk, reset, regWrite, decOut1b, inpData[143:136], outData[143:136]);
	register8bit CACHE_DATA_18(clk, reset, regWrite, decOut1b, inpData[151:144], outData[151:144]);
	register8bit CACHE_DATA_19(clk, reset, regWrite, decOut1b, inpData[159:152], outData[159:152]);

	register8bit CACHE_DATA_20(clk, reset, regWrite, decOut1b, inpData[167:160], outData[167:160]);
	register8bit CACHE_DATA_21(clk, reset, regWrite, decOut1b, inpData[175:168], outData[175:168]);
	register8bit CACHE_DATA_22(clk, reset, regWrite, decOut1b, inpData[183:176], outData[183:176]);
	register8bit CACHE_DATA_23(clk, reset, regWrite, decOut1b, inpData[191:184], outData[191:184]);

	register8bit CACHE_DATA_24(clk, reset, regWrite, decOut1b, inpData[199:192], outData[199:192]);
	register8bit CACHE_DATA_25(clk, reset, regWrite, decOut1b, inpData[207:200], outData[207:200]);
	register8bit CACHE_DATA_26(clk, reset, regWrite, decOut1b, inpData[215:208], outData[215:208]);
	register8bit CACHE_DATA_27(clk, reset, regWrite, decOut1b, inpData[223:216], outData[223:216]);

	register8bit CACHE_DATA_28(clk, reset, regWrite, decOut1b, inpData[231:224], outData[231:224]);
	register8bit CACHE_DATA_29(clk, reset, regWrite, decOut1b, inpData[239:232], outData[239:232]);
	register8bit CACHE_DATA_30(clk, reset, regWrite, decOut1b, inpData[247:240], outData[247:240]);
	register8bit CACHE_DATA_31(clk, reset, regWrite, decOut1b, inpData[255:248], outData[255:248]);

endmodule