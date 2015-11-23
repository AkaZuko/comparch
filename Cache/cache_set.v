module cache_set(input clk, input reset, input hit, input setOut, 
				 input MemWrite, input[4:0] offset, input[7:0] byte_data,
				 input[7:0] decOut1b, input inp_viv, input [255:0] inputData,
				 input[23:0] in_tag,
				 output reg out_viv,
				 output[3:0] outHaltTag0, output[3:0] outHaltTag1, output[3:0] outHaltTag2, output[3:0] outHaltTag3,
				 output[3:0] outHaltTag4, output[3:0] outHaltTag5, output[3:0] outHaltTag6, output[3:0] outHaltTag7,
				 output reg [19:0] outMainTag, output reg [255:0] outData);

		wire [7:0] w_out_viv;

		//and setOut_Hit(tempAndOut, setOut, hit);
		//or newRegWrite(regWrite, tempAndOut, memWrite);
		
		reg byte_w,block_write;
		always@(hit or setOut or MemWrite or inp_viv or offset or byte_data or decOut1b or inputData or in_tag)
		begin
			if(hit == 1'b1 && MemWrite==1'b1)
				begin
					byte_w = 1'b1;
					block_write = 1'b0;
				end
			else
				begin
					byte_w = 1'b0;
				end

			if(hit==1'b0 && setOut==1'b1)
				begin
					block_write = 1'b1;
				end
			else
				begin
					block_write = 1'b0;
				end
		end

		valid_invalid_bit VIV_SET0(clk, reset, block_write, decOut1b[0], inp_viv, w_out_viv[0]);
		valid_invalid_bit VIV_SET1(clk, reset, block_write, decOut1b[1], inp_viv, w_out_viv[1]);
		valid_invalid_bit VIV_SET2(clk, reset, block_write, decOut1b[2], inp_viv, w_out_viv[2]);
		valid_invalid_bit VIV_SET3(clk, reset, block_write, decOut1b[3], inp_viv, w_out_viv[3]);

		valid_invalid_bit VIV_SET4(clk, reset, block_write, decOut1b[4], inp_viv, w_out_viv[4]);
		valid_invalid_bit VIV_SET5(clk, reset, block_write, decOut1b[5], inp_viv, w_out_viv[5]);
		valid_invalid_bit VIV_SET6(clk, reset, block_write, decOut1b[6], inp_viv, w_out_viv[6]);
		valid_invalid_bit VIV_SET7(clk, reset, block_write, decOut1b[7], inp_viv, w_out_viv[7]);

		wire[19:0] outMainTag0, outMainTag1, outMainTag2, outMainTag3, outMainTag4, outMainTag5, outMainTag6, outMainTag7;

		wire[255:0] outData0, outData1, outData2, outData3, outData4, outData5, outData6, outData7;

		halt_tag H_TAG0(clk, reset, block_write, decOut1b[0], in_tag[3:0], outHaltTag0);
		main_tag M_TAG0(clk, reset, block_write, decOut1b[0], in_tag[23:4], outMainTag0);

		halt_tag H_TAG1(clk, reset, block_write, decOut1b[1], in_tag[3:0], outHaltTag1);
		main_tag M_TAG1(clk, reset, block_write, decOut1b[1], in_tag[23:4], outMainTag1);

		halt_tag H_TAG2(clk, reset, block_write, decOut1b[2], in_tag[3:0], outHaltTag2);
		main_tag M_TAG2(clk, reset, block_write, decOut1b[2], in_tag[23:4], outMainTag2);

		halt_tag H_TAG3(clk, reset, block_write, decOut1b[3], in_tag[3:0], outHaltTag3);
		main_tag M_TAG3(clk, reset, block_write, decOut1b[3], in_tag[23:4], outMainTag3);

		halt_tag H_TAG4(clk, reset, block_write, decOut1b[4], in_tag[3:0], outHaltTag4);
		main_tag M_TAG4(clk, reset, block_write, decOut1b[4], in_tag[23:4], outMainTag4);

		halt_tag H_TAG5(clk, reset, block_write, decOut1b[5], in_tag[3:0], outHaltTag5);
		main_tag M_TAG5(clk, reset, block_write, decOut1b[5], in_tag[23:4], outMainTag5);

		halt_tag H_TAG6(clk, reset, block_write, decOut1b[6], in_tag[3:0], outHaltTag6);
		main_tag M_TAG6(clk, reset, block_write, decOut1b[6], in_tag[23:4], outMainTag6);

		halt_tag H_TAG7(clk, reset, block_write, decOut1b[7], in_tag[3:0], outHaltTag7);
		main_tag M_TAG7(clk, reset, block_write, decOut1b[7], in_tag[23:4], outMainTag7);

		
		cache_data DATA_BLOCK_0(clk, reset, block_write|byte_w, decOut1b[0], hit, offset, byte_data, inputData, outData0);
		cache_data DATA_BLOCK_1(clk, reset, block_write|byte_w, decOut1b[1], hit, offset, byte_data, inputData, outData1);
		cache_data DATA_BLOCK_2(clk, reset, block_write|byte_w, decOut1b[2], hit, offset, byte_data, inputData, outData2);
		cache_data DATA_BLOCK_3(clk, reset, block_write|byte_w, decOut1b[3], hit, offset, byte_data, inputData, outData3);
		cache_data DATA_BLOCK_4(clk, reset, block_write|byte_w, decOut1b[4], hit, offset, byte_data, inputData, outData4);
		cache_data DATA_BLOCK_5(clk, reset, block_write|byte_w, decOut1b[5], hit, offset, byte_data, inputData, outData5);
		cache_data DATA_BLOCK_6(clk, reset, block_write|byte_w, decOut1b[6], hit, offset, byte_data, inputData, outData6);
		cache_data DATA_BLOCK_7(clk, reset, block_write|byte_w, decOut1b[7], hit, offset, byte_data, inputData, outData7);

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