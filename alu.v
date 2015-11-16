module alu(input [31:0] aluIn1, input [31:0] aluIn2, input [1:0] aluOp, output reg [31:0] aluOut, output flag);
  reg [63:0] temp;
  assign flag = -1;
	always@(aluIn1 or aluIn2 or aluOp)
	begin
		case(aluOp)
			2'b00:
			aluOut = aluIn1 + aluIn2;
			2'b01:
			aluOut = aluIn2 - aluIn1; 
			2'b10: 
			aluOut = aluIn1 * aluIn2;  
			2'b11: //for  ror
			begin
			  temp = {aluIn2, aluIn2} >> aluIn1;
			  aluOut = aluIn1[31:0];
			end
		endcase
	end
endmodule   //flag?


module adder(input [31:0] in1, input [31:0] in2, output reg [31:0] adder_out, output flag);
	always@(in1 or in2)
		adder_out = in1 +in2;
		
		//if load then set flag 
endmodule


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
