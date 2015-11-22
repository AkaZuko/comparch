module signExt11to32(input [10:0] offset, output reg [31:0] signExtOffset);
	always@(offset)
	begin
			signExtOffset={{21{offset[7]}},offset[10:0]};
	end
endmodule