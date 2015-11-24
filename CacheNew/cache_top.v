module cache_top(	input clk, input reset, input [31:0] pcOut, input memWrite, input [7:0] MemOut, input [7:0] Block,
					output[7:0] cacheOutData, output[255:0] cacheBlockData );

	wire hit, stall;	
	// wire [7:0] cacheOutData;
	wire [7:0] dataIn, dataOut;
	wire [31:0] decOutStall;
	// wire[255:0] cacheBlockData;


	stallModule SM(clk,  hit, dataIn, dataOut, decOutStall, stall);
	cacheModule CM(clk, reset, stall, decOutStall, pcOut,  memWrite, MemOut, Block, hit, cacheOutData, cacheBlockData);
endmodule