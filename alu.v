module alu(input [31:0] aluIn1, input [31:0] aluIn2, input [1:0] aluOp, output reg [31:0] aluOut, output reg N, output reg Z, output reg C,
output reg V);

  	reg [63:0] temp;
  	assign flag = -1;
	
	always@(aluIn1 or aluIn2 or aluOp)
	begin
		case(aluOp)
			2'b00: 	begin
						aluOut = aluIn1 + aluIn2;
					end

			2'b01: 	begin
						aluOut = aluIn2 - aluIn1; 
					end

			2'b10: 	begin
						aluOut = aluIn1 * aluIn2;  
					end

			2'b11:  //for  ror
					begin
			  			temp = {aluIn2, aluIn2} >> aluIn1;
			  			aluOut = temp[31:0];
					end
		endcase
	end
endmodule   //flag?