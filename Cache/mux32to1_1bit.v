module mux8to1_1bit(input  in1, input  in2, input  in3,input  in4,input  in5, input  in6, input  in7,input  in8, input [2:0] sel, output reg muxout);
	 always@(in1 or in2 or in3 or in4 or in5 or in6 or in7 or in7 or sel)
	 begin
		case(sel)
			3'b000 : muxout = in1;
			3'b001 : muxout = in2;
			3'b010 : muxout = in3;
			3'b011 : muxout = in4;
			3'b100 : muxout = in5;
			3'b101 : muxout = in6;
			3'b110 : muxout = in7;
			3'b111 : muxout = in8;
		endcase
	 end
endmodule
