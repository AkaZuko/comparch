module cache_top(input clk, input reset, input[31:0] pcOut, input [7:0] dataIn, output reg [7:0] dataOut,
					);

cacheModule CacheM1(clk, reset, pcOut, input  memWrite, input[7:0] MemOut, input[255:0] Block, 
				   output reg hit, output[7:0] data);

endmodule