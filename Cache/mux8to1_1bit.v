mux8to1_1bit(input tag0_set_equal, input tag1_set_equal, input tag2_set_equal, input tag3_set_equal, input tag4_set_equal, 
			input tag5_set_equal, input tag6_set_equal, input tag7_set_equal,
			//input tag1_set1_equal, input tag2_set1_equal, input tag3_set1_equal, input tag4_set1_equal, 
			//input tag5_set1_equal, input tag6_set1_equal, input tag7_set1_equal, 
			input [2:0]index,
			output set_muxout //,output set1_muxout
			);

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
