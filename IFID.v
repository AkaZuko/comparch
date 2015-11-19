module IFID(input clk, input reset, input IFIDwrite, input IFflush,
			input [31:0] PCval, input [31:0] IR,
			output [31:0] P1_PCval, input [31:0] P1_IR);

	register32bit_normal P1_PCval_reg(clk, reset, regWrite, decOut1b, PCval, P1_PCval);
	register32bit_normal P1_IR_reg(clk, reset, regWrite, decOut1b, IR, P1_IR);

endmodule