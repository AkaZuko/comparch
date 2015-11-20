module cache_set(input clk, input reset, input regWrite, input[7:0] decOut1b_viv, input[7:0] inp_viv,
				 output[7:0] out_viv,
				 input[23:0] in_tag0, input[23:0] in_tag1, input[23:0] in_tag2, input[23:0] in_tag3,
				 input[23:0] in_tag4, input[23:0] in_tag5, input[23:0] in_tag6, input[23:0] in_tag7,
				 output[23:0] tag0, output[23:0] tag1, output[23:0] tag2, output[23:0] tag3,
				 output[23:0] tag4, output[23:0] tag5, output[23:0] tag6, output[23:0] tag7 );

		valid_invalid_bit VIV_SET0(clk, reset, regWrite, decOut1b_viv[0], inp_viv[0], out_viv[0]);
		valid_invalid_bit VIV_SET1(clk, reset, regWrite, decOut1b_viv[1], inp_viv[1], out_viv[1]);
		valid_invalid_bit VIV_SET2(clk, reset, regWrite, decOut1b_viv[2], inp_viv[2], out_viv[2]);
		valid_invalid_bit VIV_SET3(clk, reset, regWrite, decOut1b_viv[3], inp_viv[3], out_viv[3]);

		valid_invalid_bit VIV_SET4(clk, reset, regWrite, decOut1b_viv[4], inp_viv[4], out_viv[4]);
		valid_invalid_bit VIV_SET5(clk, reset, regWrite, decOut1b_viv[5], inp_viv[5], out_viv[5]);
		valid_invalid_bit VIV_SET6(clk, reset, regWrite, decOut1b_viv[6], inp_viv[6], out_viv[6]);
		valid_invalid_bit VIV_SET7(clk, reset, regWrite, decOut1b_viv[7], inp_viv[7], out_viv[7]);


		tag TAG0(clk, reset, regWrite, decOut1b, inp_tag0, tag0);
		tag TAG1(clk, reset, regWrite, decOut1b, inp_tag1, tag1);
		tag TAG2(clk, reset, regWrite, decOut1b, inp_tag2, tag2);
		tag TAG3(clk, reset, regWrite, decOut1b, inp_tag3, tag3);

		tag TAG4(clk, reset, regWrite, decOut1b, inp_tag4, tag4);
		tag TAG5(clk, reset, regWrite, decOut1b, inp_tag5, tag5);
		tag TAG6(clk, reset, regWrite, decOut1b, inp_tag6, tag6);
		tag TAG7(clk, reset, regWrite, decOut1b, inp_tag7, tag7);

		
endmodule