module ForwardingUnit(input [2:0] ID_EX_rm_1,
					 input [2:0] EX_MEM_rd_1, 
					 input MEM_WB_RegWrite1,
					 input [2:0] MEM_WB_rd_1,
					 input [2:0] ID_EX_rd_11,
					 input [2:0] EX_MEM_rd_11,
					 input ID_EX_ALUSrcB,
					 input [2:0] ID_EX_rd_12,
					 input EX_MEM_RegWrite1,
					 input [2:0] ID_EX_rm_2,
					 input [2:0] ID_EX_rd_2,
					 input [2:0] ID_EX_rn_2,
					 input MEM_WB_RegWrite2,
					 input [2:0] MEM_WB_rd_2,
					 output reg [1:0] ForwardA1,
					 output reg [1:0] ForwardA2,
					 output reg [1:0] ForwardB1,
					 output reg [1:0] ForwardB2,
					 output reg [1:0] ForwardC2);



	always @(ID_EX_rm_1 or
			EX_MEM_rd_1 or
			MEM_WB_RegWrite1 or
			MEM_WB_rd_1 or
			ID_EX_rd_11 or
			EX_MEM_rd_11 or
			ID_EX_ALUSrcB or
			ID_EX_rd_12 or
			EX_MEM_RegWrite1 or
			ID_EX_rm_2 or
			ID_EX_rd_2 or
			ID_EX_rn_2 or
			MEM_WB_RegWrite2 or
			MEM_WB_rd_2)
	begin
		// Start forwarding
		// Forward A

		if ( (ID_EX_rm_1 == EX_MEM_rd_1) && (EX_MEM_rd_1 != 1'b0) )
			ForwardA1 = 2'b10;
		else if ( (ID_EX_rm_1 != EX_MEM_rd_1) && MEM_WB_RegWrite1 && (ID_EX_rm_1 == MEM_WB_rd_1) && (EX_MEM_rd_1 != 1'b0) )
			ForwardA1 = 2'b01;
		else if ( EX_MEM_RegWrite1 && (ID_EX_rm_2 == EX_MEM_rd_1) && (EX_MEM_rd_1 != 1'b0) )
			ForwardA2 = 2'b10;
		else if ( !(EX_MEM_RegWrite1 && (ID_EX_rm_2 == EX_MEM_rd_1)) && (MEM_WB_RegWrite1 && (ID_EX_rm_2 == MEM_WB_rd_1)) && (EX_MEM_rd_1 != 1'b0) )
			ForwardA2 = 2'b01;
		else if ( MEM_WB_RegWrite2 == 1'b1 && (MEM_WB_rd_2 == ID_EX_rm_1) && MEM_WB_rd_2 != 1'b0)
			ForwardA1 = 2'b11;
		else if ( (MEM_WB_RegWrite2 == 1'b1) && (MEM_WB_rd_2 == ID_EX_rm_2) && MEM_WB_rd_2 != 1'b0)
			ForwardA2 = 2'b11;
		else
		begin
			ForwardA1 = 2'b00;
			ForwardA2 = 2'b00;
		end

		// Forward B
		if ( (EX_MEM_RegWrite1 && (ID_EX_rd_11 == EX_MEM_rd_1) && (ID_EX_ALUSrcB == 1'b0)) || ( EX_MEM_RegWrite1 && (ID_EX_rd_12 == EX_MEM_rd_1) && (ID_EX_ALUSrcB == 1'b1)) && (EX_MEM_rd_1 != 1'b0) ) 	// ?
			ForwardB1 = 2'b10;
		else if ( !((EX_MEM_RegWrite1 && (ID_EX_rd_11 == EX_MEM_rd_1) && (ID_EX_ALUSrcB == 1'b0)) || ( EX_MEM_RegWrite1 && (ID_EX_rd_12 == EX_MEM_rd_1) && (ID_EX_ALUSrcB == 1'b1))) && MEM_WB_RegWrite1 && ((ID_EX_rd_11 == MEM_WB_rd_1) && (ID_EX_ALUSrcB == 1'b0)) || (MEM_WB_RegWrite1 && (ID_EX_rd_12 == MEM_WB_rd_1) && (ID_EX_ALUSrcB == 1'b1)) && (EX_MEM_rd_1 != 1'b0) && MEM_WB_rd_1 != 1'b0)
			ForwardB1 = 2'b01;
		else if ( EX_MEM_RegWrite1 && (ID_EX_rn_2 == EX_MEM_rd_1) && (EX_MEM_rd_1 != 1'b0))
			ForwardB2 = 2'b10;
		else if ( !(EX_MEM_RegWrite1 && (ID_EX_rn_2 == EX_MEM_rd_1)) && MEM_WB_RegWrite1 && (ID_EX_rn_2 == MEM_WB_rd_1) && (EX_MEM_rd_1 != 1'b0) && (MEM_WB_rd_1 != 1'b0))
			ForwardB2 = 2'b01;
		else if ( (MEM_WB_RegWrite2 == 1'b1) && (((MEM_WB_rd_2 == ID_EX_rd_11) && (ID_EX_ALUSrcB == 1'b0))) || ((MEM_WB_rd_2 == ID_EX_rd_12) && (ID_EX_ALUSrcB == 1'b1)) && (MEM_WB_rd_2 != 1'b0))
			ForwardB1 = 2'b11;
		else if ( (MEM_WB_RegWrite2 == 1'b1) && (MEM_WB_rd_2 == ID_EX_rm_2) && (MEM_WB_rd_2 != 1'b0))
			ForwardB2 = 2'b11;
		else
		begin
			ForwardB1 = 2'b00;
			ForwardB2 = 2'b00;
		end

		// Forward C
		if ( !(EX_MEM_RegWrite1 && (ID_EX_rd_2 == EX_MEM_rd_1)) && MEM_WB_RegWrite1 && (ID_EX_rd_2 == MEM_WB_rd_1) && (MEM_WB_rd_1 != 1'b0) && (ID_EX_rd_2 != 1'b0) )
			ForwardC2 = 2'b01;
		else if ( EX_MEM_RegWrite1 && (ID_EX_rd_2 == EX_MEM_rd_1) && (MEM_WB_rd_1 != 1'b0) && (ID_EX_rd_2 != 1'b0) )
			ForwardC2 = 2'b10;
		else
		begin
			ForwardC2 = 2'b00;
		end

		// End forwarding

	end
endmodule