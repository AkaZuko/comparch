module alu( input [31:0] aluIn1, input [31:0] aluIn2, input carry, input [1:0] aluOp,
			output reg [31:0] aluOut, output reg N, output reg Z, output reg C,
			output reg V);

  	reg [63:0] temp;
  	assign flag = -1;
	
	always@(aluIn1 or aluIn2 or aluOp)
	begin
		case(aluOp)
			2'b00: 	begin
						{C,aluOut} = aluIn1 + aluIn2 + carry;
						
						// overflow flag
						if((aluIn1[31] == 1'b1 && aluIn2[1]==1'b1 && aluOut[31]==1'b0) || (aluIn1[31] == 1'b0 && aluIn2[1]==1'b0 && aluOut[31]==1'b1)) 
							V = 1'b1;
						else
							V = 1'b0;
						
						// negative flag
						if(aluOut<32'd0)
							N = 1'b1;
						else
							N = 1'b0; 
						
						// zero flag
						if(aluOut==32'd0)
							Z = 1'b1;
						else
							Z = 1'b0;

					end

			2'b01: 	begin
						{C,aluOut} = aluIn2 - aluIn1; 
						
						// overflow flag
						if((aluIn1[31] == 1'b0 && aluIn2[1]==1'b1 && aluOut[31]==1'b1) || (aluIn1[31] == 1'b1 && aluIn2[1]==1'b0 && aluOut[31]==1'b0)) 
							V = 1'b1;
						else
							V = 1'b0;
						
						// negative flag
						if(aluOut<32'd0)
							N = 1'b1;
						else
							N = 1'b0; 
						
						// zero flag
						if(aluOut==32'd0)
							Z = 1'b1;
						else
							Z = 1'b0;
					

					end

			2'b10: 	begin
						aluOut = aluIn1&aluIn2;  


						// negative flag
						if(aluOut<32'd0)
							N = 1'b1;
						else
							N = 1'b0; 
						
						// zero flag
						if(aluOut==32'd0)
							Z = 1'b1;
						else
							Z = 1'b0;
					
					end

			2'b11:  //for  ror
					begin
			  			temp = {aluIn2, aluIn2} >> aluIn1;
			  			aluOut = temp[31:0];

			  			// carry flag ???
						if( (temp[32]==1'b1)
							C = 1'b1;
						else
							C = 1'b0;
						
						// negative flag
						if(aluOut<32'd0)
							N = 1'b1;
						else
							N = 1'b0; 
						
						// zero flag
						if(aluOut==32'd0)
							Z = 1'b1;
						else
							Z = 1'b0;

					end
		endcase
	end
endmodule