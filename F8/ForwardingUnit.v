module ForwardingUnit(input [2:0] ID_EX_rm_1,
					 input [2:0] EX_MEM_rd_1, 
					 input MEM_WB_RegWrite1,
					 input [2:0] MEM_WB_rd_1,
					 input [2:0] ID_EX_rd_11,
					 input ID_EX_ALUSrcB,
					 input [2:0] ID_EX_rd_12,
					 input EX_MEM_RegWrite1,
					 input [2:0] ID_EX_rm_2,
					 input [2:0] ID_EX_rd_2,
					 input [2:0] ID_EX_rn_2,
					 input MEM_WB_RegWrite2,
					 input [2:0] MEM_WB_rd_2,
					 input [2:0] EX_MEM_rd_2,
					 input n1,
					 input n2,
					 output reg n_out,
					 output reg [1:0] ForwardA1,
					 output reg [1:0] ForwardA2,
					 output reg [1:0] ForwardB1,
					 output reg [1:0] ForwardB2,
					 output reg [1:0] ForwardC2,
					 output reg ForwardD2);



	always @(ID_EX_rm_1 or
			EX_MEM_rd_1 or
			MEM_WB_RegWrite1 or
			MEM_WB_rd_1 or
			ID_EX_rd_11 or
			ID_EX_ALUSrcB or
			n1 or
			n2 or
			ID_EX_rd_12 or
			EX_MEM_RegWrite1 or
			ID_EX_rm_2 or
			ID_EX_rd_2 or
			ID_EX_rn_2 or
			MEM_WB_RegWrite2 or
			MEM_WB_rd_2 or
			EX_MEM_rd_2)
	begin
		// Start forwarding
		// Forward A1

		if ( EX_MEM_RegWrite1 && (ID_EX_rm_1 == EX_MEM_rd_1) && (EX_MEM_rd_1 != 3'd0) )
			ForwardA1 = 2'b10;
		else if ( !( EX_MEM_RegWrite1 && (ID_EX_rm_1 == EX_MEM_rd_1) && (EX_MEM_rd_1 != 3'd0) ) && MEM_WB_RegWrite1 && (ID_EX_rm_1 == MEM_WB_rd_1) && (MEM_WB_rd_1 != 3'd0) )
			ForwardA1 = 2'b01;
		else if ( MEM_WB_RegWrite2 == 1'b1 && (MEM_WB_rd_2 == ID_EX_rm_1) && MEM_WB_rd_2 != 3'd0)
			ForwardA1 = 2'b11;
		else
			ForwardA1 = 2'b00;
		//Forward A2
		if ( EX_MEM_RegWrite1 && (ID_EX_rm_2 == EX_MEM_rd_1) && (EX_MEM_rd_1 != 3'd0) )
			ForwardA2 = 2'b10;
		else if ( !(EX_MEM_RegWrite1 && (ID_EX_rm_2 == EX_MEM_rd_1) && (EX_MEM_rd_1 != 3'd0)) && (MEM_WB_RegWrite1 && (ID_EX_rm_2 == MEM_WB_rd_1) && (MEM_WB_rd_1==3'd0))  )
			ForwardA2 = 2'b01;
		else if ( (MEM_WB_RegWrite2 == 1'b1) && (MEM_WB_rd_2 == ID_EX_rm_2) && MEM_WB_rd_2 != 3'd0)
			ForwardA2 = 2'b11;
		else
			ForwardA2 = 2'b00;

		// Forward B1
		if ( (EX_MEM_RegWrite1 && (ID_EX_rd_11 == EX_MEM_rd_1) && (ID_EX_ALUSrcB == 1'd0)) || ( EX_MEM_RegWrite1 && (ID_EX_rd_12 == EX_MEM_rd_1) && (ID_EX_ALUSrcB == 1'b1)) && (EX_MEM_rd_1 != 3'd0) ) 	// ?
			ForwardB1 = 2'b10;
		else if ( !((EX_MEM_RegWrite1 && (ID_EX_rd_11 == EX_MEM_rd_1) && (ID_EX_ALUSrcB == 1'b0)) || ( EX_MEM_RegWrite1 && (ID_EX_rd_12 == EX_MEM_rd_1) && (ID_EX_ALUSrcB == 1'b1))  && (EX_MEM_rd_1 != 3'd0)) && MEM_WB_RegWrite1 && ((ID_EX_rd_11 == MEM_WB_rd_1) && (ID_EX_ALUSrcB == 1'b0)) || (MEM_WB_RegWrite1 && (ID_EX_rd_12 == MEM_WB_rd_1) && (ID_EX_ALUSrcB == 1'b1)) && MEM_WB_rd_1 != 3'd0)
			ForwardB1 = 2'b01;
		else if ( (MEM_WB_RegWrite2 == 1'b1) && (((MEM_WB_rd_2 == ID_EX_rd_11) && (ID_EX_ALUSrcB == 1'b0))) || ((MEM_WB_rd_2 == ID_EX_rd_12) && (ID_EX_ALUSrcB == 1'b1)) && (MEM_WB_rd_2 != 3'd0))
			ForwardB1 = 2'b11;
	  else
			ForwardB1 = 2'b00;
	
			// Forward B2
	  if ( !(EX_MEM_RegWrite1 && (ID_EX_rn_2 == EX_MEM_rd_1) && (EX_MEM_rd_1 != 3'd0) ) && MEM_WB_RegWrite1 && (ID_EX_rn_2 == MEM_WB_rd_1) && (MEM_WB_rd_1 != 3'd0))
			ForwardB2 = 2'b01;
		else if ( (MEM_WB_RegWrite2 == 1'b1) && (MEM_WB_rd_2 == ID_EX_rn_2) && (MEM_WB_rd_2 != 3'd0))
			ForwardB2 = 2'b11;
		else if ( EX_MEM_RegWrite1 && (ID_EX_rn_2 == EX_MEM_rd_1) && (EX_MEM_rd_1 != 3'd0))
			ForwardB2 = 2'b10;
		else
			ForwardB2 = 2'b00;

		// Forward C
		if ( !(EX_MEM_RegWrite1 && (ID_EX_rd_2 == EX_MEM_rd_1) && (EX_MEM_rd_1 != 3'd0) ) && MEM_WB_RegWrite1 && (ID_EX_rd_2 == MEM_WB_rd_1) && (MEM_WB_rd_1 != 3'd0) )
			ForwardC2 = 2'b01;
		else if ( EX_MEM_RegWrite1 && (ID_EX_rd_2 == EX_MEM_rd_1) && (MEM_WB_rd_1 != 3'd0) && (ID_EX_rd_2 != 3'd0) )
			ForwardC2 = 2'b10;
		else if((MEM_WB_RegWrite2==1)&& (MEM_WB_rd_2==ID_EX_rd_2)&&(ID_EX_rd_2 != 3'd0) && (MEM_WB_rd_1 != 3'd0))
			ForwardC2= 2'b11;
		else
		begin
			ForwardC2 = 2'b00;
		end

		// Forward D
		if ( (MEM_WB_RegWrite2 == 1'b1) && (MEM_WB_rd_2 != 3'd0) && (MEM_WB_rd_2 == EX_MEM_rd_2) )
			ForwardD2 = 1'b1;
		else
		begin
			ForwardD2 = 1'b0;
		end

		n_out = 1'b0;
		// Forward flag
		if ( MEM_WB_RegWrite2 == 1'b1 )
			n_out = n2;
		else if ( !(MEM_WB_RegWrite2 == 1'b1) &&  (EX_MEM_RegWrite1 == 1'b1) )
			n_out = n1;

		// End forwarding

	end
endmodule