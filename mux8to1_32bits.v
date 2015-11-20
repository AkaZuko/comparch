module mux8to1_32bits(	input[31:0] outR0, input[31:0] outR1, input[31:0] outR2, input[31:0] outR3,
						input[31:0] outR4, input[31:0] outR5, input[31:0] outR6, input[31:0] outR7,
						input[2:0] sel, output reg [31:0] muxout);
	
	always@(sel or outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7)
	begin
		case(sel)
		3'b000: muxout = outR0;
		3'b001: muxout = outR1;
		3'b010: muxout = outR2;
		3'b011: muxout = outR3;
		3'b100: muxout = outR4;
		3'b101: muxout = outR5;
		3'b110: muxout = outR6;
		3'b111: muxout = outR7;
		endcase
	end
endmodule