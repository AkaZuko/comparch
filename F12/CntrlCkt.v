module CntrlCkt(input [31:0] IR, input N_cntrl, 
				output reg regWrite1,output reg regWrite2,
				output reg z1Write,output reg n1Write,output reg c1Write, output reg v1Write, output reg z2Write, output reg n2Write,output reg c2Write,output reg v2Write,
				output reg [1:0]aluOp, output reg branch,
				//output reg PcWrite, 
				output reg [1:0] PcSrc,output reg memRead, output reg memWrite, output reg aluSrcA, output reg aluSrcB,			
				input O_flag, output reg IF_Flush, output reg ID_Flush, output reg EX_Flush, output reg EPC_write,
				 output reg cause_write);

always@(IR or N_cntrl)
	begin
		// for the first instruction
		if(O_flag == 1'b1)
		begin
							   	regWrite1 = 0;
							   	aluSrcA = 0; // for offset
							   	aluSrcB = 0;
							   	z1Write=0;
							   	n1Write=0;
							   	c1Write=0;
							   	v1Write=0;
							  	aluOp=2'b00;
							    regWrite2 = 1'b0;
							   	branch=0;
						    	z2Write=1'b0;
							   	n2Write=1'b0;
						    	c2Write=1'b0;
						    	v2Write=1'b0;
						    	memRead=1'b0;
							  	memWrite=1'b0;
						     	PcSrc=2'b11;
						     	IF_Flush = 1'b1;
    							ID_Flush = 1'b1;
    							EX_Flush = 1'b1;
    							EPC_write = 1'b1;
    							cause_write = 1'b1;
		end
		else 
		begin
		casex({IR[4:0]})
			5'b01000: 	begin
							   	regWrite1 = 1'b1;
    				      		aluSrcA = 1'b1;
    							aluSrcB = 0;
    							z1Write=1;
    						    n1Write=1;
    						    if(IR[9:5]==5'b00100)	
    						    begin
    							   		c1Write=1'b1;
    									v1Write=1'b1;
    									aluOp = 2'b00;
    									end
    						    if(IR[9:5]==5'b01011)
    						    begin
    							   		c1Write=1'b1;
    									v1Write=1'b0;
    									aluOp = 2'b11;
    									end
    							if(IR[9:5]==5'b01100)
    						    begin
    							   		c1Write=1'b0;
    									v1Write=1'b0;
    									aluOp = 2'b10;
    									end
    							//PcWrite=1;
    							
    							PcSrc=2'b00;
    							IF_Flush = 1'b0;
    							ID_Flush = 1'b0;
    							EX_Flush = 1'b0;
    							EPC_write = 1'b0;
    							cause_write = 1'b0;
    						    end
			5'b00101: 	begin
  							   	regWrite1 = 1'b1;
 							   	aluSrcA = 1'b0; // for offset
  							   	aluSrcB = 1;
  							   	z1Write=1;
  							   	n1Write=1;
  							   	c1Write=1;
  							   	v1Write=1;
  							   	aluOp=2'b01;
						     	// PcWrite=1;
						     	PcSrc=2'b00;
						     	IF_Flush = 1'b0;
    							ID_Flush = 1'b0;
    							EX_Flush = 1'b0;
    							EPC_write = 1'b0;
    							cause_write = 1'b0;
						     end
			5'b00000: 	begin//for nop
								if(IR[15:5] == 11'd0)
								begin
							   regWrite1 = 0;
							   aluSrcA = 0; // for offset
							   aluSrcB = 0;
							   z1Write=0;
							   n1Write=0;
							   c1Write=0;
							   v1Write=0;
							   aluOp=2'b00;
						     // PcWrite=1;
						     PcSrc=2'b00;
						     IF_Flush = 1'b0;
    							ID_Flush = 1'b0;
    							EX_Flush = 1'b0;
    							EPC_write = 1'b0;
    							cause_write = 1'b0;
						     	end
						     	else begin
						     		regWrite1 = 0;
							   aluSrcA = 0; // for offset
							   aluSrcB = 0;
							   z1Write=0;
							   n1Write=0;
							   c1Write=0;
							   v1Write=0;
							   aluOp=2'b00;
						     // PcWrite=1;
						     PcSrc=2'b11;
						     IF_Flush = 1'b1;
    							ID_Flush = 1'b1;
    							EX_Flush = 1'b0;
    							EPC_write = 1'b1;
    							cause_write = 1'b1;
						     	end
						     end
			default:    begin
							   regWrite1 = 0;
							   aluSrcA = 0; // for offset
							   aluSrcB = 0;
							   z1Write=0;
							   n1Write=0;
							   c1Write=0;
							   v1Write=0;
							   aluOp=2'b00;
						     // PcWrite=1;
						     PcSrc=2'b11;
						     IF_Flush = 1'b1;
    							ID_Flush = 1'b1;
    							EX_Flush = 1'b0;
    							EPC_write = 1'b1;
    							cause_write = 1'b1;
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
							   PcSrc=2'b00;
							   IF_Flush = 1'b0;
    							ID_Flush = 1'b0;
    							EX_Flush = 1'b0;
    							EPC_write = 1'b0;
    							cause_write = 1'b0;
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
							   PcSrc=2'b00;
							   IF_Flush = 1'b0;
    							ID_Flush = 1'b0;
    							EX_Flush = 1'b0;
    							EPC_write = 1'b0;
    							cause_write = 1'b0;
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
						    	PcSrc=2'b10;
						    	IF_Flush = 1'b0;
    							ID_Flush = 1'b0;
    							EX_Flush = 1'b0;
    							EPC_write = 1'b0;
    							cause_write = 1'b0;
						     end
			5'b11011:   begin//branch
							    regWrite2 = 0;
							    branch=1;
							    
						     	z2Write=0;
						    	n2Write=0;
							   c2Write=0;
							   v2Write=0;
							   memRead=0;
							   memWrite=0;
							   IF_Flush = 1'b0;
    							ID_Flush = 1'b0;
    							EX_Flush = 1'b0;
    							EPC_write = 1'b0;
    							cause_write = 1'b0;
					       	end
			5'b00000: 	begin//for nop
							   if(IR[31:21] == 11'd0)
								begin
							   regWrite2 = 1'b0;
							   branch=0;
						    	z2Write=1'b0;
							   n2Write=1'b0;
						    	c2Write=1'b0;
						    	v2Write=1'b0;
						    	memRead=1'b0;
							   memWrite=1'b0;
						     // PcWrite=1;
						     PcSrc=2'b00;
						     IF_Flush = 1'b0;
    							ID_Flush = 1'b0;
    							EX_Flush = 1'b0;
    							EPC_write = 1'b0;
    							cause_write = 1'b0;
						     	end
						     	else begin
						     	 regWrite2 = 1'b0;
							   branch=0;
						    	z2Write=1'b0;
							   n2Write=1'b0;
						    	c2Write=1'b0;
						    	v2Write=1'b0;
						    	memRead=1'b0;
							   memWrite=1'b0;
						     // PcWrite=1;
						     PcSrc=2'b11;
						     IF_Flush = 1'b1;
    							ID_Flush = 1'b1;
    							EX_Flush = 1'b0;
    							EPC_write = 1'b1;
    							cause_write = 1'b1;
						     	end
						     end
			default:    begin
							    regWrite2 = 1'b0;
							   branch=0;
						    	z2Write=1'b0;
							   n2Write=1'b0;
						    	c2Write=1'b0;
						    	v2Write=1'b0;
						    	memRead=1'b0;
							   memWrite=1'b0;
						     // PcWrite=1;
						     PcSrc=2'b11;
						     IF_Flush = 1'b1;
    							ID_Flush = 1'b1;
    							EX_Flush = 1'b0;
    							EPC_write = 1'b1;
    							cause_write = 1'b1;
						     end
		endcase
		
		if(IR[20:16]==5'b11011 && N_cntrl==1'b1)
		begin
			PcSrc=2'b01;
		end
	end
	end
endmodule