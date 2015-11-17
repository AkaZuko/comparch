module D_ff (input clk, input reset, input regWrite1, input regWrite2, input decOut1b1, input decOut1b2, input d1, input d2, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1)
		q=0;
	else
		if(regWrite1 == 1 && decOut1b1==1) begin q=d1; end
		if(regWrite2 == 1 && decOut1b2==1) begin q=d2; end
	end
endmodule