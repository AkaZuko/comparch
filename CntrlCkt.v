module CntrlCkt(input [31:0] opcode, output reg regWrite1,
				output reg regWrite2, output reg [1:0]aluOp,
				output reg memRead, output reg memWrite, output reg aluSrcA,
				output reg branch
				);

always@(opcode)
	begin
		// for the first instruction
		casex({opcode[4:0]})
			5'b01000: 	begin
							regWrite1 = 1'b1;
							aluSrcA = 1'b0;
						end
			5'b00101: 	begin
							regWrite1 = 1'b1;
							aluSrcA = 1'b1; // for offset
						end
		endcase

		// for the second instruction
		casex({opcode[20:16]})
			5'b01010: 	begin 
							regWrite2 = 1'b1;
							memRead = 1'b1;
							memWrite = 1'b0;
							branch = 1'b0;
						end
			5'b01011: 	begin 
							regWrite2 = 1'b0;
							memRead = 1'b0;
							memWrite = 1'b1;
							branch = 1'b0;
						end
		endcase
	end

endmodule