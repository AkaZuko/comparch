module cacheModule(input clk, input reset, input [31:0] pcOut,
				   output hit, output[7:0] data);
	
	wire [7:0] decOut8b;
	decoder3to8 dec0(pcOut[7:5],  decOut8b);

	// ..........Comparators

	wire tag0_set0_equal, tag1_set0_equal, tag2_set0_equal, tag3_set0_equal;
	wire tag4_set0_equal, tag5_set0_equal, tag6_set0_equal, tag7_set0_equal;
	wire tag0_set1_equal, tag1_set1_equal, tag2_set1_equal, tag3_set1_equal;
	wire tag4_set1_equal, tag5_set1_equal, tag6_set1_equal, tag7_set1_equal;

	Comparator C0_set0(pcOut[11:8], tag0_set0_H, tag0_set0_equal);
	Comparator C1_set0(pcOut[11:8], tag1_set0_H, tag1_set0_equal);
	Comparator C2_set0(pcOut[11:8], tag2_set0_H, tag2_set0_equal);
	Comparator C3_set0(pcOut[11:8], tag3_set0_H, tag3_set0_equal);

	Comparator C4_set0(pcOut[11:8], tag4_set0_H, tag4_set0_equal);
	Comparator C5_set0(pcOut[11:8], tag5_set0_H, tag5_set0_equal);
	Comparator C6_set0(pcOut[11:8], tag6_set0_H, tag6_set0_equal);
	Comparator C7_set0(pcOut[11:8], tag7_set0_H, tag7_set0_equal);

	Comparator C0_set1(pcOut[11:8], tag0_set1_H, tag0_set1_equal);
	Comparator C1_set1(pcOut[11:8], tag1_set1_H, tag1_set1_equal);
	Comparator C2_set1(pcOut[11:8], tag2_set1_H, tag2_set1_equal);
	Comparator C3_set1(pcOut[11:8], tag3_set1_H, tag3_set1_equal);

	Comparator C4_set1(pcOut[11:8], tag4_set1_H, tag4_set1_equal);
	Comparator C5_set1(pcOut[11:8], tag5_set1_H, tag5_set1_equal);
	Comparator C6_set1(pcOut[11:8], tag6_set1_H, tag6_set1_equal);
	Comparator C7_set1(pcOut[11:8], tag7_set1_H, tag7_set1_equal);

	// ........ Cache Set

	// Take the input data ( 32B ) from the memory
	// The input to the tag for the set is same for all
	// We get regWrite8b from the logic
	// viv is valid/invalid

	wire regWrite_set0, inp_viv_set0, out_viv_set0;
	wire[23:0] in_tag;
	wire[255:0] inputData;
	wire[3:0] tag0_set0_H, tag1_set0_H, tag2_set0_H, tag3_set0_H, tag4_set0_H, tag5_set0_H, tag6_set0_H, tag7_set0_H;
	wire[255:0] outData_set0;
	wire[19:0] tag_set0_M;

	// ??? regWrite8b_set0 has to be updated in the cache_set module
	cache_set set0( clk, reset, regWrite_set0, decOut8b, inp_viv_set0,
					inputData, out_viv_set0, in_tag,
					tag0_set0_H, tag1_set0_H, tag2_set0_H, tag3_set0_H, tag4_set0_H, tag5_set0_H, tag6_set0_H, tag7_set0_H,
					tag_set0_M, outData_set0);

	wire regWrite_set1, inp_viv_set1, out_viv_set1;
	wire[23:0] in_tag;
	wire[255:0] inputData;
	wire[3:0] tag0_set1_H, tag1_set1_H, tag2_set1_H, tag3_set1_H, tag4_set1_H, tag5_set1_H, tag6_set1_H, tag7_set1_H;
	wire[255:0] outData_set1;
	wire[19:0] tag_set1_M;

	// ??? regWrite8b_set1 has to be updated in the cache_set module
	cache_set set1( clk, reset, regWrite_set1, decOut8b, inp_viv_set1,
					inputData, out_viv_set1, in_tag,
					tag0_set1_H, tag1_set1_H, tag2_set1_H, tag3_set1_H, tag4_set1_H, tag5_set1_H, tag6_set1_H, tag7_set1_H,
					tag_set1_M, outData_set1);
	
	// .......... Halt_tag Selection

	or OR_HALT_TAG_MATCHING()

endmodule