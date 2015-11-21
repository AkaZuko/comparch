module CntrlCkt(input [31:0] IR, output reg regWrite1,output reg regWrite2,
				output reg z1Write,output reg n1Write,output reg c1Write, output reg v1Write, output reg z2Write, output reg n2Write,output reg c2Write,output reg v2Write,
				output reg [1:0]aluOp, output reg branch, output reg [1:0] PcSrc,output reg memRead, output reg memWrite, output reg aluSrcA, output reg aluSrcB			
				);

always@(IR)
	begin
		// for the first instruction
		casex({IR[4:0]})
			5'b01000: 	begin
							regWrite1 = 1'b1;
							aluSrcA = 1'b0;
							aluSrcB = 0;
							z1Write=1;
							n1Write=1;
							c1Write=1;
							v1Write=1;
							aluOp=opcode[8:7]
						end
			5'b00101: 	begin
							regWrite1 = 1'b1;
							aluSrcA = 1'b1; // for offset
							aluSrcB = 1;
							z1Write=1;
							n1Write=1;
							c1Write=1;
							v1Write=1;
							aluOp=2'b00;
						end
			5'b00000: 	begin//for nop
							regWrite1 = 0;
							aluSrcA = 0; // for offset
							aluSrcB = 0;
							z1Write=0;
							n1Write=0;
							c1Write=0;
							v1Write=0;
							aluOp=2'b00;
						end
		endcase				
		// for the second instruction
		casex({IR[20:16]})
			5'b01010: 	begin //load
							regWrite2 = 1'b1;
							branch=0;
							PcSrc=2'b00;
							z2Write=1;
							n2Write=1;
							c2Write=0;
							v2Write=0;
							memRead=1;
							memWrite=0;
						end
			5'b01011: 	begin //store
							regWrite2 = 1'b0;
							memRead = 1'b0;
							memWrite = 1'b1;
							branch = 1'b0;
							PcSrc=2'b00;
							z2Write=0;
							n2Write=0;
							c2Write=0;
							v2Write=0;
						end
			5'b11110: 	begin//jump
							regWrite2 = 0;
							branch=0;
							PcSrc=2'b10;
							z2Write=0;
							n2Write=0;
							c2Write=0;
							v2Write=0;
							memRead=0;
							memWrite=0;
						end
			5'b11011:   begin//branch
							regWrite2 = 0;
							branch=1;
							PcSrc=2'b01;
							z2Write=0;
							n2Write=0;
							c2Write=0;
							v2Write=0;
							memRead=0;
							memWrite=0;
						end
			5'b00000: 	begin//for nop
							regWrite2 = 0;
							branch=0;
							PcSrc=2'b00;
							z2Write=0;
							n2Write=0;
							c2Write=0;
							v2Write=0;
							memRead=0;
							memWrite=0;
						end
		endcase
	end
endmodule