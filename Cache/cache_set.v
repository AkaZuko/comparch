module cache_set(input clk, input reset, input [7:0] regWrite, input[7:0] decOut1b, input [7:0] inp_viv,
				input [255:0] inputData,
				 output[7:0] out_viv,
				 input[23:0] in_tag0, input[23:0] in_tag1, input[23:0] in_tag2, input[23:0] in_tag3,
				 input[23:0] in_tag4, input[23:0] in_tag5, input[23:0] in_tag6, input[23:0] in_tag7,
				 output[23:0] tag0, output[23:0] tag1, output[23:0] tag2, output[23:0] tag3,
				 output[23:0] tag4, output[23:0] tag5, output[23:0] tag6, output[23:0] tag7,
				 output[255:0] outData0, output[255:0] outData1, output[255:0] outData2, output[255:0] outData3, 
				 output[255:0] outData4, output[255:0] outData5, output[255:0] outData6, output[255:0] outData7);

		valid_invalid_bit VIV_SET0(clk, reset, regWrite, decOut1b[0], inp_viv[0], out_viv[0]);
		valid_invalid_bit VIV_SET1(clk, reset, regWrite, decOut1b[1], inp_viv[1], out_viv[1]);
		valid_invalid_bit VIV_SET2(clk, reset, regWrite, decOut1b[2], inp_viv[2], out_viv[2]);
		valid_invalid_bit VIV_SET3(clk, reset, regWrite, decOut1b[3], inp_viv[3], out_viv[3]);

		valid_invalid_bit VIV_SET4(clk, reset, regWrite, decOut1b[4], inp_viv[4], out_viv[4]);
		valid_invalid_bit VIV_SET5(clk, reset, regWrite, decOut1b[5], inp_viv[5], out_viv[5]);
		valid_invalid_bit VIV_SET6(clk, reset, regWrite, decOut1b[6], inp_viv[6], out_viv[6]);
		valid_invalid_bit VIV_SET7(clk, reset, regWrite, decOut1b[7], inp_viv[7], out_viv[7]);


		tag TAG0(clk, reset, regWrite[0], decOut1b[0], inp_tag0, tag0);
		tag TAG1(clk, reset, regWrite[1], decOut1b[1], inp_tag1, tag1);
		tag TAG2(clk, reset, regWrite[2], decOut1b[2], inp_tag2, tag2);
		tag TAG3(clk, reset, regWrite[3], decOut1b[3], inp_tag3, tag3);

		tag TAG4(clk, reset, regWrite[4], decOut1b[4], inp_tag4, tag4);
		tag TAG5(clk, reset, regWrite[5], decOut1b[5], inp_tag5, tag5);
		tag TAG6(clk, reset, regWrite[6], decOut1b[6], inp_tag6, tag6);
		tag TAG7(clk, reset, regWrite[7], decOut1b[7], inp_tag7, tag7);

		cache_data DATA_BLOCK_0(clk, reset, regWrite[0], decOut1b[0], inputData, outData0);
		cache_data DATA_BLOCK_1(clk, reset, regWrite[1], decOut1b[1], inputData, outData1);
		cache_data DATA_BLOCK_2(clk, reset, regWrite[2], decOut1b[2], inputData, outData2);
		cache_data DATA_BLOCK_3(clk, reset, regWrite[3], decOut1b[3], inputData, outData3);
		cache_data DATA_BLOCK_4(clk, reset, regWrite[4], decOut1b[4], inputData, outData4);
		cache_data DATA_BLOCK_5(clk, reset, regWrite[5], decOut1b[5], inputData, outData5);
		cache_data DATA_BLOCK_6(clk, reset, regWrite[6], decOut1b[6], inputData, outData6);
		cache_data DATA_BLOCK_7(clk, reset, regWrite[7], decOut1b[7], inputData, outData7);




endmodule