module mux4to1_32bits(input [31:0] in1, input [31:0] in2, input [31:0] in3,input [31:0] in4, input [1:0] sel, output reg [31:0] muxout);
	 always@(in1 or in2 or in3 or in4 or sel)
	 begin
		case(sel)
			2'b00 : muxout = in1;
			2'b01 : muxout = in2;
			2'b10 : muxout = in3;
			2'b11 : muxout = in4;
		endcase
	 end
endmodule
