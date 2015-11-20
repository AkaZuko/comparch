module valid_invalid_bit(input clk, input reset, input regWrite, input decOut1b, input d, output  q);
	D_ff_normal VIV(clk, reset, regWrite, decOut1b, d, q);
endmodule