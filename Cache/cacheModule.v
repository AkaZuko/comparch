module cacheModule(input clk, input reset, input [31:0] pcOut,
				   output hit, output[7:0] data);
	
	wire [7:0] decOut8b;
	decoder3to8 dec0(pcOut[7:5],  decOut8b);

	// Take the input data from the memory
	// The input to the tag for the set is same for all
	cache_set set0(clk, reset, regWrite8b, decOut8b,input [7:0] inp_viv,
			input [255:0] inputData, output[7:0] out_viv,
			input [23:0] in_tag0,input [23:0] in_tag1,input [23:0] in_tag2,input [23:0] in_tag3,
			input [23:0] in_tag4,input [23:0] in_tag5,input [23:0] in_tag6,input [23:0] in_tag7,
			output[23:0] tag0, output[23:0] tag1, output[23:0] tag2, output[23:0] tag3,
			output[23:0] tag4, output[23:0] tag5, output[23:0] tag6, output[23:0] tag7,
			output[255:0] outData0, output[255:0] outData1, output[255:0] outData2, output[255:0] outData3, 
			output[255:0] outData4, output[255:0] outData5, output[255:0] outData6, output[255:0] outData7);

	cache_set set1(clk, reset, regWrite8b, decOut8b,[7:0] inp_viv,
			input [255:0] inputData, output[7:0] out_viv,
			input [23:0] in_tag0,input [23:0] in_tag1,input [23:0] in_tag2,input [23:0] in_tag3,
			input [23:0] in_tag4,input [23:0] in_tag5,input [23:0] in_tag6,input [23:0] in_tag7,
			output[23:0] tag0, output[23:0] tag1, output[23:0] tag2, output[23:0] tag3,
			output[23:0] tag4, output[23:0] tag5, output[23:0] tag6, output[23:0] tag7,
			output[255:0] outData0, output[255:0] outData1, output[255:0] outData2, output[255:0] outData3, 
			output[255:0] outData4, output[255:0] outData5, output[255:0] outData6, output[255:0] outData7);

endmodule