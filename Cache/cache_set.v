module cache_set(input clk, input reset, input regWrite, input[7:0] decOut1b, input inp_viv, input [255:0] inputData,
				 input[23:0] in_tag,

				 /*
				 input[23:0] in_tag0, input[23:0] in_tag1, input[23:0] in_tag2, input[23:0] in_tag3,
				 input[23:0] in_tag4, input[23:0] in_tag5, input[23:0] in_tag6, input[23:0] in_tag7,
				 */

				 output out_viv,
				 output[3:0] outHaltTag0, output[3:0] outHaltTag1, output[3:0] outHaltTag2, output[3:0] outHaltTag3,
				 output[3:0] outHaltTag4, output[3:0] outHaltTag5, output[3:0] outHaltTag6, output[3:0] outHaltTag7,
				 output[19:0] reg outMainTag, output[255:0] reg outData);
				 
				 /*
				 output[19:0] outMainTag0, output[19:0] outMainTag1, output[19:0] outMainTag2, output[19:0] outMainTag3,
				 output[19:0] outMainTag4, output[19:0] outMainTag5, output[19:0] outMainTag6, output[19:0] outMainTag7,

				 output[255:0] outData0, output[255:0] outData1, output[255:0] outData2, output[255:0] outData3, 
				 output[255:0] outData4, output[255:0] outData5, output[255:0] outData6, output[255:0] outData7);
				 */

		wire[7:0] w_out_viv;
		valid_invalid_bit VIV_SET0(clk, reset, regWrite, decOut1b[0], inp_viv, w_out_viv[0]);
		valid_invalid_bit VIV_SET1(clk, reset, regWrite, decOut1b[1], inp_viv, w_out_viv[1]);
		valid_invalid_bit VIV_SET2(clk, reset, regWrite, decOut1b[2], inp_viv, w_out_viv[2]);
		valid_invalid_bit VIV_SET3(clk, reset, regWrite, decOut1b[3], inp_viv, w_out_viv[3]);

		valid_invalid_bit VIV_SET4(clk, reset, regWrite, decOut1b[4], inp_viv, w_out_viv[4]);
		valid_invalid_bit VIV_SET5(clk, reset, regWrite, decOut1b[5], inp_viv, w_out_viv[5]);
		valid_invalid_bit VIV_SET6(clk, reset, regWrite, decOut1b[6], inp_viv, w_out_viv[6]);
		valid_invalid_bit VIV_SET7(clk, reset, regWrite, decOut1b[7], inp_viv, w_out_viv[7]);

		wire[19:0] outMainTag0, outMainTag1, outMainTag2, outMainTag3, outMainTag4, outMainTag5, outMainTag6, outMainTag7;

		wire[255:0] outData0, outData1, outData2, outData3, outData4, outData5, outData6, outData7;

		halt_tag H_TAG0(clk, reset, regWrite, decOut1b[0], inp_tag[11:8], outHaltTag0);
		main_tag M_TAG0(clk, reset, regWrite, decOut1b[0], inp_tag[31:12], outMainTag0);

		halt_tag H_TAG1(clk, reset, regWrite, decOut1b[1], inp_tag[11:8], outHaltTag1);
		main_tag M_TAG1(clk, reset, regWrite, decOut1b[1], inp_tag[31:12], outMainTag1);

		halt_tag H_TAG2(clk, reset, regWrite, decOut1b[2], inp_tag[11:8], outHaltTag2);
		main_tag M_TAG2(clk, reset, regWrite, decOut1b[2], inp_tag[31:12], outMainTag2);

		halt_tag H_TAG3(clk, reset, regWrite, decOut1b[3], inp_tag[11:8], outHaltTag3);
		main_tag M_TAG3(clk, reset, regWrite, decOut1b[3], inp_tag[31:12], outMainTag3);

		halt_tag H_TAG4(clk, reset, regWrite, decOut1b[4], inp_tag[11:8], outHaltTag4);
		main_tag M_TAG4(clk, reset, regWrite, decOut1b[4], inp_tag[31:12], outMainTag4);

		halt_tag H_TAG5(clk, reset, regWrite, decOut1b[5], inp_tag[11:8], outHaltTag5);
		main_tag M_TAG5(clk, reset, regWrite, decOut1b[5], inp_tag[31:12], outMainTag5);

		halt_tag H_TAG6(clk, reset, regWrite, decOut1b[6], inp_tag[11:8], outHaltTag6);
		main_tag M_TAG6(clk, reset, regWrite, decOut1b[6], inp_tag[31:12], outMainTag6);

		halt_tag H_TAG7(clk, reset, regWrite, decOut1b[7], inp_tag[11:8], outHaltTag7);
		main_tag M_TAG7(clk, reset, regWrite, decOut1b[7], inp_tag[31:12], outMainTag7);

		
		cache_data DATA_BLOCK_0(clk, reset, regWrite, decOut1b[0], inputData, outData0);
		cache_data DATA_BLOCK_1(clk, reset, regWrite, decOut1b[1], inputData, outData1);
		cache_data DATA_BLOCK_2(clk, reset, regWrite, decOut1b[2], inputData, outData2);
		cache_data DATA_BLOCK_3(clk, reset, regWrite, decOut1b[3], inputData, outData3);
		cache_data DATA_BLOCK_4(clk, reset, regWrite, decOut1b[4], inputData, outData4);
		cache_data DATA_BLOCK_5(clk, reset, regWrite, decOut1b[5], inputData, outData5);
		cache_data DATA_BLOCK_6(clk, reset, regWrite, decOut1b[6], inputData, outData6);
		cache_data DATA_BLOCK_7(clk, reset, regWrite, decOut1b[7], inputData, outData7);

		always@(decOut1b or inp_viv or inputData or in_tag)
		begin
			case(decOut1b)
				8'b00000001:begin
								out_viv    =  w_out_viv[0];
								outMainTag =  outMainTag0;
								outData    =  outData0;
							end
				8'b00000010:begin
								out_viv    =  w_out_viv[1];
								outMainTag =  outMainTag1;
								outData    =  outData1;
							end
				8'b00000100:begin
								out_viv    =  w_out_viv[2];
								outMainTag =  outMainTag2;
								outData    =  outData2;
							end
				8'b00001000:begin
								out_viv    =  w_out_viv[3];
								outMainTag =  outMainTag3;
								outData    =  outData3;
							end
				8'b00010000:begin
								out_viv    =  w_out_viv[4];
								outMainTag =  outMainTag4;
								outData    =  outData4;
							end
				8'b00100000:begin
								out_viv    =  w_out_viv[5];
								outMainTag =  outMainTag5;
								outData    =  outData5;
							end
				8'b01000000:begin
								out_viv    =  w_out_viv[6];
								outMainTag =  outMainTag6;
								outData    =  outData6;
							end
				8'b10000000:begin
								out_viv    =  w_out_viv[7];
								outMainTag =  outMainTag7;
								outData    =  outData7;
							end

			endcase
		end

endmodule