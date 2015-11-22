module zeroExt8to32(input [7:0] offset, output reg [31:0] zeroExtOffset);
	always@(offset)
	begin
			zeroExtOffset={24'd0,offset[7:0]};
	end
endmodule