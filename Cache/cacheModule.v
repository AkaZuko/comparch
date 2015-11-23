module cacheModule(input clk, input reset, input [31:0] pcOut, input  memWrite, input[7:0] MemOut, input[255:0] Block, 
				   output hit, output[7:0] data);
	
	wire setOut;
	wire [7:0] decOut8b;
	// .............................. DECODING THE INDEX
	decoder3to8 dec0(pcOut[7:5],  decOut8b);

	// ........ Cache Set

	// Take the input data ( 32B ) from the memory
	// The input to the tag for the set is same for all
	// We get regWrite8b from the logic
	// viv is valid/invalid

	wire inp_viv_set0, out_viv_set0;
	wire[23:0] in_tag;
	wire[3:0] tag0_set0_H, tag1_set0_H, tag2_set0_H, tag3_set0_H, tag4_set0_H, tag5_set0_H, tag6_set0_H, tag7_set0_H;
	wire[255:0] outData_set0;
	wire[19:0] tag_set0_M;

	// ??? regWrite8b_set0 has to be updated in the cache_set module

	cache_set set0( clk, reset, hit, ~setOut,
					memWrite, pcOut[4:0], MemOut,
					// decOut8b, inp_viv_set0,
					decOut8b, 1'b1,
					Block, pcOut[31:8], out_viv_set0,
					tag0_set0_H, tag1_set0_H, tag2_set0_H, tag3_set0_H, tag4_set0_H, tag5_set0_H, tag6_set0_H, tag7_set0_H,
					tag_set0_M, outData_set0);

	wire  inp_viv_set1, out_viv_set1;
	wire[3:0] tag0_set1_H, tag1_set1_H, tag2_set1_H, tag3_set1_H, tag4_set1_H, tag5_set1_H, tag6_set1_H, tag7_set1_H;
	wire[255:0] outData_set1;
	wire[19:0] tag_set1_M;

	// ??? regWrite8b_set1 has to be updated in the cache_set module
	cache_set set1( clk, reset,  hit, setOut,
					memWrite, pcOut[4:0], MemOut,
					// decOut8b, inp_viv_set1,
					decOut8b, 1'b1,
					Block, pcOut[31:8] , out_viv_set1, 
					tag0_set1_H, tag1_set1_H, tag2_set1_H, tag3_set1_H, tag4_set1_H, tag5_set1_H, tag6_set1_H, tag7_set1_H,
					tag_set1_M, outData_set1);
	
	// .......... Halt_tag Selection

	// or OR_HALT_TAG_MATCHING()

	// ..........Comparators

	wire tag0_set0_equal, tag1_set0_equal, tag2_set0_equal, tag3_set0_equal;
	wire tag4_set0_equal, tag5_set0_equal, tag6_set0_equal, tag7_set0_equal;
	wire tag0_set1_equal, tag1_set1_equal, tag2_set1_equal, tag3_set1_equal;
	wire tag4_set1_equal, tag5_set1_equal, tag6_set1_equal, tag7_set1_equal;
	wire Equal_Indexed_0, Equal_Indexed_1, enablerSignal, wayHit0, wayHit1, Mux101;
	wire [255:0] outputDataLine;
	wire [7:0] finalDataBlock;


	// Set 0
	Comparator C0_set0(pcOut[11:8], tag0_set0_H, tag0_set0_equal);
	Comparator C1_set0(pcOut[11:8], tag1_set0_H, tag1_set0_equal);
	Comparator C2_set0(pcOut[11:8], tag2_set0_H, tag2_set0_equal);
	Comparator C3_set0(pcOut[11:8], tag3_set0_H, tag3_set0_equal);

	Comparator C4_set0(pcOut[11:8], tag4_set0_H, tag4_set0_equal);
	Comparator C5_set0(pcOut[11:8], tag5_set0_H, tag5_set0_equal);
	Comparator C6_set0(pcOut[11:8], tag6_set0_H, tag6_set0_equal);
	Comparator C7_set0(pcOut[11:8], tag7_set0_H, tag7_set0_equal);

	mux8to1_1bit MUX_Comp_Set0(tag0_set0_equal, tag1_set0_equal, tag2_set0_equal, tag3_set0_equal,
				tag4_set0_equal, tag5_set0_equal, tag6_set0_equal, tag7_set0_equal,
				pcOut[7:5],
				Equal_Indexed_0);

	// Set 1
	Comparator C0_set1(pcOut[11:8], tag0_set1_H, tag0_set1_equal);
	Comparator C1_set1(pcOut[11:8], tag1_set1_H, tag1_set1_equal);
	Comparator C2_set1(pcOut[11:8], tag2_set1_H, tag2_set1_equal);
	Comparator C3_set1(pcOut[11:8], tag3_set1_H, tag3_set1_equal);

	Comparator C4_set1(pcOut[11:8], tag4_set1_H, tag4_set1_equal);
	Comparator C5_set1(pcOut[11:8], tag5_set1_H, tag5_set1_equal);
	Comparator C6_set1(pcOut[11:8], tag6_set1_H, tag6_set1_equal);
	Comparator C7_set1(pcOut[11:8], tag7_set1_H, tag7_set1_equal);

	mux8to1_1bit MUX_Comp_Set1(tag0_set1_equal, tag1_set1_equal, tag2_set1_equal, tag3_set1_equal,
				tag4_set1_equal, tag5_set1_equal, tag6_set1_equal, tag7_set1_equal,
				pcOut[7:5],
				Equal_Indexed_1);

	//and enabler_AND(enablerSignal, Equal_Indexed_0, Equal_Indexed_1);

	mainTagChecker mainTagChecker0(pcOut[31:12], tag_set0_M, Equal_Indexed_0, out_viv_set0, wayHit0);
	mainTagChecker mainTagChecker1(pcOut[31:12], tag_set1_M, Equal_Indexed_1, out_viv_set1, wayHit1);
	
	or wayHit_OR(hit, wayHit0, wayHit1);

	and data_AND(Mux101, hit, wayHit1);


	FIFO  fifo_replacement(clk, reset, pcOut[7:5], hit, setOut );

	mux64Bto32B muxDataSelect(outData_set0, outData_set1, Mux101, outputDataLine);

	// mux64Bto32B muxOutputFetchSelect(outputDataLine, fetchData, hit, finalDataOutput);	// ??? we need to get fetchData from MEM

	muxBlockSelect muxDataBlockSelect(outputDataLine, pcOut[4:0], data);


endmodule

module mainTagChecker(input [19:0] mainTag, input [19:0] mainTagFromSet, input enable, input valid_bit, output wayHit);
	
	wire comp_set_out, mux_set_out;
	Comparator20bits comp_set(mainTag, mainTagFromSet, enable, comp_set_out);
	mux2to1_1bit mux_set(1'b0, comp_set_out, enable, mux_set_out);
	and set_AND(wayHit, mux_set_out, valid_bit);
	
endmodule

module testbench;
  reg clk, reset, memWrite;
  reg [7:0] inbyte;
  reg [31:0] pc;
  reg [255:0] dataBlock;
  wire [7:0] cacheOutput;
  wire hit;

  cacheModule uut(clk, reset, pc, memWrite, inbyte, dataBlock, hit, cacheOutput);
  always #5 clk=~clk;
  initial
  begin
    clk=0; reset=1; //memWrite=0;inbyte=8'd9;dataBlock=256'h123456;pc=32'h9876ABC0;
    
    #10  reset=0;   memWrite=1'b0; inbyte=8'd9; dataBlock=256'h123456; pc=32'h00a00062; // read miss,  means : 0110_0010
    

    /*
    #30 memWrite=0;inbyte=8'h77;dataBlock=256'h123456;pc=32'hABCDABC0;       //read miss
    #30 memWrite=1;inbyte=8'hAA;pc=32'hABCDABC0;                             //write hit
    #30 memWrite=1;inbyte=8'hBB;dataBlock=256'h666666;pc=32'h12345678;       //write miss
    
    #40 
    */
    // $finish;
  end
endmodule 