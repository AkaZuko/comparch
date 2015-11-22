module mux8to1_1bit(input tag0_set_equal, input tag1_set_equal, input tag2_set_equal, input tag3_set_equal, input tag4_set_equal, 
			input tag5_set_equal, input tag6_set_equal, input tag7_set_equal,
			input [2:0]index,
			output reg set_muxout);

	always@(tag0_set_equal, tag1_set_equal,  tag2_set_equal,  tag3_set_equal,  tag4_set_equal, 
			 tag5_set_equal,  tag6_set_equal,  tag7_set_equal, index)
	begin
		case (index)
		3'd0: set_muxout=tag0_set_equal;
		3'd1: set_muxout=tag1_set_equal;
		3'd2: set_muxout=tag2_set_equal;
		3'd3: set_muxout=tag3_set_equal;
		3'd4: set_muxout=tag4_set_equal;
		3'd5: set_muxout=tag5_set_equal;
		3'd6: set_muxout=tag6_set_equal;
		3'd7: set_muxout=tag7_set_equal;
		endcase
	end
endmodule

module mux2to1_1bit(input inp0, input inp1, input sel, output reg muxOut);

	always@(inp0 or inp0 or sel)
	begin
		case (sel)
			1'b0: muxOut = inp0;
			1'b1: muxOut = inp1;
		endcase
	end
endmodule

module mux64Bto32B(input [255:0] inp0, input [255:0] inp1, input sel, output reg [255:0] outputData);
	always @(inp0 or inp1 or sel)
	begin
		case(sel)
			1'b0 : outputData = inp0;
			1'b1 : outputData = inp1;
		endcase
	end
endmodule

module muxBlockSelect(input [255:0] inputData, input [4:0] selOffset, output reg [7:0] finalDataBlock);
	always @(inputData or selOffset)
	begin
		case(selOffset)
			5'd0 : finalDataBlock = inputData[7:0];
			5'd1 : finalDataBlock = inputData[15:8];
			5'd2 : finalDataBlock = inputData[23:16];
			5'd3 : finalDataBlock = inputData[31:24];
			5'd4 : finalDataBlock = inputData[39:32];
			5'd5 : finalDataBlock = inputData[47:40];
			5'd6 : finalDataBlock = inputData[55:48];
			5'd7 : finalDataBlock = inputData[63:56];
			5'd8 : finalDataBlock = inputData[71:64];
			5'd9 : finalDataBlock = inputData[79:72];
			5'd10 : finalDataBlock = inputData[87:80];
			5'd11 : finalDataBlock = inputData[95:88];
			5'd12 : finalDataBlock = inputData[103:96];
			5'd13 : finalDataBlock = inputData[111:104];
			5'd14 : finalDataBlock = inputData[119:112];
			5'd15 : finalDataBlock = inputData[127:120];
			5'd16 : finalDataBlock = inputData[135:128];
			5'd17 : finalDataBlock = inputData[143:136];
			5'd18 : finalDataBlock = inputData[151:144];
			5'd19 : finalDataBlock = inputData[159:152];
			5'd20 : finalDataBlock = inputData[167:160];
			5'd21 : finalDataBlock = inputData[175:168];
			5'd22 : finalDataBlock = inputData[183:176];
			5'd23 : finalDataBlock = inputData[191:184];
			5'd24 : finalDataBlock = inputData[199:192];
			5'd25 : finalDataBlock = inputData[207:200];
			5'd26 : finalDataBlock = inputData[215:208];
			5'd27 : finalDataBlock = inputData[223:216];
			5'd28 : finalDataBlock = inputData[231:224];
			5'd29 : finalDataBlock = inputData[239:232];
			5'd30 : finalDataBlock = inputData[247:240];
			5'd31 : finalDataBlock = inputData[255:248];
		endcase
	end
endmodule