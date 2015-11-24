module signExt8to32(input [7:0] offset, output reg [31:0] signExtOffset);
	always@(offset)
	begin
			signExtOffset={{24{offset[7]}},offset[7:0]};
	end
endmodule