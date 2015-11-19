module cache_data(input clk, input reset, input inpData[255:0]);
	
	register8bit CACHE_DATA_0(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_1(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_2(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_3(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);

	register8bit CACHE_DATA_4(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_5(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_6(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_7(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);

	register8bit CACHE_DATA_8(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_9(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_10(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_11(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);

	register8bit CACHE_DATA_12(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_13(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_14(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_15(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);

	register8bit CACHE_DATA_16(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_17(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_18(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_19(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);

	register8bit CACHE_DATA_20(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_21(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_22(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_23(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);

	register8bit CACHE_DATA_24(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_25(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_26(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_27(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);

	register8bit CACHE_DATA_28(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_29(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_30(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
	register8bit CACHE_DATA_31(clk, reset, regWrite, decOut1b, inpData, output[7:0] outData);
endmodule