module D_ff_pos(input clk, input reset, input regWrite, input decOut1b, input d, output reg q);
	always @ (posedge clk)
	begin
	if(reset==1)
		q=0;
	else
		if(regWrite == 1 && decOut1b==1) begin q=d; end
	end
endmodule