module D_ff_normal (input clk, input reset, input regWrite, input decOut1b, input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1)
		q=0;
	else
		if(regWrite == 1 && decOut1b==1) begin q=d; end
	end
endmodule

module D_ff (input clk, input reset, input regWrite1, input regWrite2, input decOut1b1, input decOut1b2, input d1, input d2, output reg q);
	always @ (posedge clk)
	begin
	if(reset==1)
		q=0;
	else
		begin
			if(regWrite1 == 1 && decOut1b1==1) begin q=d1; end
			if(regWrite2 == 1 && decOut1b2==1) begin q=d2; end
		end
	end
endmodule

module register32bit(input clk, input reset, input regWrite1, input regWrite2,input decOut1b1, input decOut1b2, input [31:0] writeData1, input [31:0] writeData2,output  [31:0] outR );
	D_ff d0(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[0], writeData2[0], outR[0]);
	D_ff d1(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[1], writeData2[1], outR[1]);
	D_ff d2(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[2], writeData2[2], outR[2]);
	D_ff d3(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[3], writeData2[3], outR[3]);
	D_ff d4(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[4], writeData2[4], outR[4]);
	D_ff d5(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[5], writeData2[5], outR[5]);
	D_ff d6(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[6], writeData2[6], outR[6]);
	D_ff d7(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[7], writeData2[7], outR[7]);
	D_ff d8(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[8], writeData2[8], outR[8]);
	D_ff d9(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[9], writeData2[9], outR[9]);
	D_ff d10(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[10], writeData2[10], outR[10]);
	D_ff d11(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[11], writeData2[11], outR[11]);
	D_ff d12(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[12], writeData2[12], outR[12]);
	D_ff d13(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[13], writeData2[13], outR[13]);
	D_ff d14(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[14], writeData2[14], outR[14]);
	D_ff d15(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[15], writeData2[15], outR[15]);

	D_ff d16(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[16], writeData2[16], outR[16]);
	D_ff d17(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[17], writeData2[17], outR[17]);
	D_ff d18(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[18], writeData2[18], outR[18]);
	D_ff d19(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[19], writeData2[19], outR[19]);
	D_ff d20(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[20], writeData2[20], outR[20]);
	D_ff d21(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[21], writeData2[21], outR[21]);
	D_ff d22(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[22], writeData2[22], outR[22]);
	D_ff d23(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[23], writeData2[23], outR[23]);
	D_ff d24(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[24], writeData2[24], outR[24]);
	D_ff d25(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[25], writeData2[25], outR[25]);
	D_ff d26(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[26], writeData2[26], outR[26]);
	D_ff d27(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[27], writeData2[27], outR[27]);
	D_ff d28(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[28], writeData2[28], outR[28]);
	D_ff d29(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[29], writeData2[29], outR[29]);
	D_ff d30(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[30], writeData2[30], outR[30]);
	D_ff d31(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2, writeData1[31], writeData2[31], outR[31]);
endmodule

module register32bit_normal(input clk, input reset, input regWrite, input decOut1b, input [31:0] writeData, output  [31:0] outR );
	D_ff_normal d0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_normal d1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff_normal d2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff_normal d3(clk, reset, regWrite, decOut1b, writeData[3], outR[3]);
	D_ff_normal d4(clk, reset, regWrite, decOut1b, writeData[4], outR[4]);
	D_ff_normal d5(clk, reset, regWrite, decOut1b, writeData[5], outR[5]);
	D_ff_normal d6(clk, reset, regWrite, decOut1b, writeData[6], outR[6]);
	D_ff_normal d7(clk, reset, regWrite, decOut1b, writeData[7], outR[7]);
	D_ff_normal d8(clk, reset, regWrite, decOut1b, writeData[8], outR[8]);
	D_ff_normal d9(clk, reset, regWrite, decOut1b, writeData[9], outR[9]);
	D_ff_normal d10(clk, reset, regWrite, decOut1b, writeData[10], outR[10]);
	D_ff_normal d11(clk, reset, regWrite, decOut1b, writeData[11], outR[11]);
	D_ff_normal d12(clk, reset, regWrite, decOut1b, writeData[12], outR[12]);
	D_ff_normal d13(clk, reset, regWrite, decOut1b, writeData[13], outR[13]);
	D_ff_normal d14(clk, reset, regWrite, decOut1b, writeData[14], outR[14]);
	D_ff_normal d15(clk, reset, regWrite, decOut1b, writeData[15], outR[15]);

	D_ff_normal d16(clk, reset, regWrite, decOut1b, writeData[16], outR[16]);
	D_ff_normal d17(clk, reset, regWrite, decOut1b, writeData[17], outR[17]);
	D_ff_normal d18(clk, reset, regWrite, decOut1b, writeData[18], outR[18]);
	D_ff_normal d19(clk, reset, regWrite, decOut1b, writeData[19], outR[19]);
	D_ff_normal d20(clk, reset, regWrite, decOut1b, writeData[20], outR[20]);
	D_ff_normal d21(clk, reset, regWrite, decOut1b, writeData[21], outR[21]);
	D_ff_normal d22(clk, reset, regWrite, decOut1b, writeData[22], outR[22]);
	D_ff_normal d23(clk, reset, regWrite, decOut1b, writeData[23], outR[23]);
	D_ff_normal d24(clk, reset, regWrite, decOut1b, writeData[24], outR[24]);
	D_ff_normal d25(clk, reset, regWrite, decOut1b, writeData[25], outR[25]);
	D_ff_normal d26(clk, reset, regWrite, decOut1b, writeData[26], outR[26]);
	D_ff_normal d27(clk, reset, regWrite, decOut1b, writeData[27], outR[27]);
	D_ff_normal d28(clk, reset, regWrite, decOut1b, writeData[28], outR[28]);
	D_ff_normal d29(clk, reset, regWrite, decOut1b, writeData[29], outR[29]);
	D_ff_normal d30(clk, reset, regWrite, decOut1b, writeData[30], outR[30]);
	D_ff_normal d31(clk, reset, regWrite, decOut1b, writeData[31], outR[31]);
endmodule

//IM starts here
module D_ff_Mem (input clk, input reset, input regWrite, input decOut1b,input init, input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1)
		q=init;
	else
		if(regWrite == 1 && decOut1b==1) begin q=d; end
	end
endmodule

module register_IM_Mem(input clk,input reset,input regWrite,input decOut1b,input [31:0] init, input [31:0] d_in, output [31:0] q_out);
	D_ff_Mem dMem0 (clk,reset,regWrite,decOut1b,init[0],d_in[0],q_out[0]);
	D_ff_Mem dMem1 (clk,reset,regWrite,decOut1b,init[1],d_in[1],q_out[1]);
	D_ff_Mem dMem2 (clk,reset,regWrite,decOut1b,init[2],d_in[2],q_out[2]);
	D_ff_Mem dMem3 (clk,reset,regWrite,decOut1b,init[3],d_in[3],q_out[3]);

	D_ff_Mem dMem4 (clk,reset,regWrite,decOut1b,init[4],d_in[4],q_out[4]);
	D_ff_Mem dMem5 (clk,reset,regWrite,decOut1b,init[5],d_in[5],q_out[5]);
	D_ff_Mem dMem6 (clk,reset,regWrite,decOut1b,init[6],d_in[6],q_out[6]);
	D_ff_Mem dMem7 (clk,reset,regWrite,decOut1b,init[7],d_in[7],q_out[7]);

	D_ff_Mem dMem8 (clk,reset,regWrite,decOut1b,init[8],d_in[8],q_out[8]);
	D_ff_Mem dMem9 (clk,reset,regWrite,decOut1b,init[9],d_in[9],q_out[9]);
	D_ff_Mem dMem10 (clk,reset,regWrite,decOut1b,init[10],d_in[10],q_out[10]);
	D_ff_Mem dMem11 (clk,reset,regWrite,decOut1b,init[11],d_in[11],q_out[11]);

	D_ff_Mem dMem12 (clk,reset,regWrite,decOut1b,init[12],d_in[12],q_out[12]);
	D_ff_Mem dMem13 (clk,reset,regWrite,decOut1b,init[13],d_in[13],q_out[13]);
	D_ff_Mem dMem14 (clk,reset,regWrite,decOut1b,init[14],d_in[14],q_out[14]);
	D_ff_Mem dMem15 (clk,reset,regWrite,decOut1b,init[15],d_in[15],q_out[15]);

	D_ff_Mem dMem16 (clk,reset,regWrite,decOut1b,init[16],d_in[16],q_out[16]);
	D_ff_Mem dMem17 (clk,reset,regWrite,decOut1b,init[17],d_in[17],q_out[17]);
	D_ff_Mem dMem18 (clk,reset,regWrite,decOut1b,init[18],d_in[18],q_out[18]);
	D_ff_Mem dMem19 (clk,reset,regWrite,decOut1b,init[19],d_in[19],q_out[19]);

	D_ff_Mem dMem20 (clk,reset,regWrite,decOut1b,init[20],d_in[20],q_out[20]);
	D_ff_Mem dMem21 (clk,reset,regWrite,decOut1b,init[21],d_in[21],q_out[21]);
	D_ff_Mem dMem22 (clk,reset,regWrite,decOut1b,init[22],d_in[22],q_out[22]);
	D_ff_Mem dMem23 (clk,reset,regWrite,decOut1b,init[23],d_in[23],q_out[23]);

	D_ff_Mem dMem24 (clk,reset,regWrite,decOut1b,init[24],d_in[24],q_out[24]);
	D_ff_Mem dMem25 (clk,reset,regWrite,decOut1b,init[25],d_in[25],q_out[25]);
	D_ff_Mem dMem26 (clk,reset,regWrite,decOut1b,init[26],d_in[26],q_out[26]);
	D_ff_Mem dMem27 (clk,reset,regWrite,decOut1b,init[27],d_in[27],q_out[27]);

	D_ff_Mem dMem28 (clk,reset,regWrite,decOut1b,init[28],d_in[28],q_out[28]);
	D_ff_Mem dMem29 (clk,reset,regWrite,decOut1b,init[29],d_in[29],q_out[29]);
	D_ff_Mem dMem30 (clk,reset,regWrite,decOut1b,init[30],d_in[30],q_out[30]);
	D_ff_Mem dMem31 (clk,reset,regWrite,decOut1b,init[31],d_in[31],q_out[31]);

endmodule

module IM_Mem(input clk, input reset,input memWrite,input memRead, input [31:0] pc, input [31:0] dataIn, output [31:0] IR);
	wire [31:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7, Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15;
	wire [15:0] decOut;

	decoder4to16 dec0( pc[4:1], decOut);

	register_IM_Mem r0(clk,reset,memWrite,decOut[0],32'b011_001_111_1101010_010_110_0010001000,dataIn,Qout0); //add $r6, $r2 | lw $r7, $r3, $r1

	mux16to1_IM mMem (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,pc[4:1],IR);
endmodule

module mux16to1_IM( input [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15, input [3:0] Sel, output reg [31:0] outBus );
	always@(outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or outR12 or outR13 or outR14 or outR15 or Sel)
	case (Sel)
				4'b0000: outBus=outR0;
				4'b0001: outBus=outR1;
				4'b0010: outBus=outR2;
				4'b0011: outBus=outR3;
				4'b0100: outBus=outR4;
				4'b0101: outBus=outR5;
				4'b0110: outBus=outR6;
				4'b0111: outBus=outR7;
				4'b1000: outBus=outR8;
				4'b1001: outBus=outR9;
				4'b1010: outBus=outR10;
				4'b1011: outBus=outR11;
				4'b1100: outBus=outR12;
				4'b1101: outBus=outR13;
				4'b1110: outBus=outR14;
				4'b1111: outBus=outR15;
	endcase
endmodule
//IM ends here

//DATA MEMORY
module register_Mem(input clk,input reset,input regWrite,input decOut1b,input [15:0]init, input [7:0] d_in, output [7:0] q_out);
	D_ff_Mem dMem0 (clk,reset,regWrite,decOut1b,init[0],d_in[0],q_out[0]);
	D_ff_Mem dMem1 (clk,reset,regWrite,decOut1b,init[1],d_in[1],q_out[1]);
	D_ff_Mem dMem2 (clk,reset,regWrite,decOut1b,init[2],d_in[2],q_out[2]);
	D_ff_Mem dMem3 (clk,reset,regWrite,decOut1b,init[3],d_in[3],q_out[3]);
	
	D_ff_Mem dMem4 (clk,reset,regWrite,decOut1b,init[4],d_in[4],q_out[4]);
	D_ff_Mem dMem5 (clk,reset,regWrite,decOut1b,init[5],d_in[5],q_out[5]);
	D_ff_Mem dMem6 (clk,reset,regWrite,decOut1b,init[6],d_in[6],q_out[6]);
	D_ff_Mem dMem7 (clk,reset,regWrite,decOut1b,init[7],d_in[7],q_out[7]);

	
	
endmodule

module Mem(input clk, input reset,input memWrite,input memRead, input [31:0] aluOut, input [7:0] dataIn,output [7:0] dataMemOut );
	wire [7:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7,
					Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15;
	wire[15:0] decOut;
	
	decoder4to16 dec0( aluOut[3:0], decOut);
	
	//init should be 8 bits?? 
	
	register_Mem r0(clk,reset,memWrite,decOut[0],8'b00000001,dataIn,Qout0); //1
	register_Mem r1(clk,reset,memWrite,decOut[1],8'b00000010,dataIn,Qout1); //2
	register_Mem r2(clk,reset,memWrite,decOut[2],8'b00000011,dataIn,Qout2); //3
	register_Mem r3(clk,reset,memWrite,decOut[3],8'b00000100,dataIn,Qout3); //4
	
	register_Mem r4(clk,reset,memWrite,decOut[4],8'b00000101,dataIn,Qout4); //5
	register_Mem r5(clk,reset,memWrite,decOut[5],8'b00000110,dataIn,Qout5); //6
	register_Mem r6(clk,reset,memWrite,decOut[6],8'b00000111,dataIn,Qout6); //7
	register_Mem r7(clk,reset,memWrite,decOut[7],8'b00001000,dataIn,Qout7);  //8
	
	register_Mem r8(clk,reset,memWrite,decOut[8],8'b00001001,dataIn,Qout8); //9
	register_Mem r9(clk,reset,memWrite,decOut[9],8'b00001010,dataIn,Qout9); //10
	register_Mem r10(clk,reset,memWrite,decOut[10],8'b00001011,dataIn,Qout10); //11
	register_Mem r11(clk,reset,memWrite,decOut[11],8'b00001100,dataIn,Qout11); //12
	
	register_Mem r12(clk,reset,memWrite,decOut[12],8'b00001101,dataIn,Qout12);	//13
	register_Mem r13(clk,reset,memWrite,decOut[13],8'b00001110,dataIn,Qout13); //14
	register_Mem r14(clk,reset,memWrite,decOut[14],8'b00001111,dataIn,Qout14); //15
	register_Mem r15(clk,reset,memWrite,decOut[15],8'b00010000,dataIn,Qout15); //16
	
	mux16to1 mMem (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,aluOut[3:0],dataMemOut);
endmodule




module decoder4to16( input [3:0] destReg, output reg [15:0] decOut);
	always@(destReg)
	case(destReg)
			4'b0000: decOut=16'b0000000000000001; 
			4'b0001: decOut=16'b0000000000000010;
			4'b0010: decOut=16'b0000000000000100;
			4'b0010: decOut=16'b0000000000000100;
			4'b0011: decOut=16'b0000000000001000;
			4'b0100: decOut=16'b0000000000010000;
			4'b0101: decOut=16'b0000000000100000;
			4'b0110: decOut=16'b0000000001000000;
			4'b0111: decOut=16'b0000000010000000;
			4'b1000: decOut=16'b0000000100000000; 

			4'b0011: decOut=16'b0000000000001000;
			4'b0100: decOut=16'b0000000000010000;
			4'b0101: decOut=16'b0000000000100000;
			4'b0110: decOut=16'b0000000001000000;
			4'b0111: decOut=16'b0000000010000000;
			4'b1000: decOut=16'b0000000100000000; 
			4'b1001: decOut=16'b0000001000000000;
			4'b1010: decOut=16'b0000010000000000;
			4'b1011: decOut=16'b0000100000000000;
			4'b1100: decOut=16'b0001000000000000;
			4'b1101: decOut=16'b0010000000000000;
			4'b1110: decOut=16'b0100000000000000;
			4'b1111: decOut=16'b1000000000000000;
	endcase
endmodule


module mux16to1( input [7:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15, input [3:0] Sel, output reg [7:0] outBus );
	always@(outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or outR12 or outR13 or outR14 or outR15 or Sel)
	case (Sel)
				4'b0000: outBus=outR0;
				4'b0001: outBus=outR1;
				4'b0010: outBus=outR2;
				4'b0011: outBus=outR3;
				4'b0100: outBus=outR4;
				4'b0101: outBus=outR5;
				4'b0110: outBus=outR6;
				4'b0111: outBus=outR7;
				4'b1000: outBus=outR8;
				4'b1001: outBus=outR9;
				4'b1010: outBus=outR10;
				4'b1011: outBus=outR11;
				4'b1100: outBus=outR12;
				4'b1101: outBus=outR13;
				4'b1110: outBus=outR14;
				4'b1111: outBus=outR15;
	endcase
endmodule
///DATA MEMORY ENDS

module register16bit_normal(input clk, input reset, input regWrite, input decOut1b, input [15:0] writeData, output  [15:0] outR );
	D_ff_normal dn0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_normal dn1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff_normal dn2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
	D_ff_normal dn3(clk, reset, regWrite, decOut1b, writeData[3], outR[3]);
	D_ff_normal dn4(clk, reset, regWrite, decOut1b, writeData[4], outR[4]);
	D_ff_normal dn5(clk, reset, regWrite, decOut1b, writeData[5], outR[5]);
	D_ff_normal dn6(clk, reset, regWrite, decOut1b, writeData[6], outR[6]);
	D_ff_normal dn7(clk, reset, regWrite, decOut1b, writeData[7], outR[7]);
	D_ff_normal dn8(clk, reset, regWrite, decOut1b, writeData[8], outR[8]);
	D_ff_normal dn9(clk, reset, regWrite, decOut1b, writeData[9], outR[9]);
	D_ff_normal dn10(clk, reset, regWrite, decOut1b, writeData[10], outR[10]);
	D_ff_normal dn11(clk, reset, regWrite, decOut1b, writeData[11], outR[11]);
	D_ff_normal dn12(clk, reset, regWrite, decOut1b, writeData[12], outR[12]);
	D_ff_normal dn13(clk, reset, regWrite, decOut1b, writeData[13], outR[13]);
	D_ff_normal dn14(clk, reset, regWrite, decOut1b, writeData[14], outR[14]);
	D_ff_normal dn15(clk, reset, regWrite, decOut1b, writeData[15], outR[15]);
endmodule

module register32bit_abnormal( input clk, input reset, input regWrite, input decOut1b, input [31:0] writeData, output  [15:0] outR1, output [15:0] outR2 );
  //assuming inst1 is in MSW
  register16bit_normal r16bn01(clk, reset, regWrite,decOut1b, writeData[31:16], outR1);
  register16bit_normal r16bn02(clk, reset, regWrite, decOut1b, writeData[15:0], outR2 );
endmodule

module register1bit_normal(input clk, input reset, input regWrite, input decOut1b, input writeData, output  outR);
	D_ff_normal reg1bit01(clk, reset, regWrite, decOut1b, writeData, outR);
endmodule

module register9bit_normal(input clk, input reset, input regWrite, input decOut1b, input [8:0] writeData, output [8:0] outR);
	D_ff_normal reg9bit01(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
  D_ff_normal reg9bit02(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
  D_ff_normal reg9bit03(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
  D_ff_normal reg9bit04(clk, reset, regWrite, decOut1b, writeData[3], outR[3]);
  D_ff_normal reg9bit05(clk, reset, regWrite, decOut1b, writeData[4], outR[4]);
  D_ff_normal reg9bit06(clk, reset, regWrite, decOut1b, writeData[5], outR[5]);
  D_ff_normal reg9bit07(clk, reset, regWrite, decOut1b, writeData[6], outR[6]);
  D_ff_normal reg9bit08(clk, reset, regWrite, decOut1b, writeData[7], outR[7]);
  D_ff_normal reg9bit09(clk, reset, regWrite, decOut1b, writeData[8], outR[8]);
endmodule

module registerSet(input clk, input reset,
					input regWrite1, input regWrite2,
					input [7:0] decOut1, input [7:0] decOut2,
					input [31:0] writeData1, input [31:0] writeData2,
					output [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7);

	register32bit R320( clk, reset, 1'b0, 1'b0, decOut1[0], decOut2[0], writeData1, writeData2, outR0 );
	register32bit R321( clk, reset, regWrite1, regWrite2, decOut1[1], decOut2[1], writeData1, writeData2, outR1 );
	register32bit R322( clk, reset, regWrite1, regWrite2, decOut1[2], decOut2[2], writeData1, writeData2, outR2 );
	register32bit R323( clk, reset, regWrite1, regWrite2, decOut1[3], decOut2[3], writeData1, writeData2, outR3 );

	register32bit R324( clk, reset, regWrite1, regWrite2, decOut1[4], decOut2[4], writeData1, writeData2, outR4 );
	register32bit R325( clk, reset, regWrite1, regWrite2, decOut1[5], decOut2[5], writeData1, writeData2, outR5 );
	register32bit R326( clk, reset, regWrite1, regWrite2, decOut1[6], decOut2[6], writeData1, writeData2, outR6 );
	register32bit R327( clk, reset, regWrite1, regWrite2, decOut1[7], decOut2[7], writeData1, writeData2, outR7 );

endmodule

module registerFile(input clk, input reset,
					input [2:0] rm1, input [2:0] rd1_1, input [2:0] rd1_2,
					input [2:0] rm2, input [2:0] rn2, input [2:0] rd2,
					input regWrite1, input regWrite2,
					input [2:0] destReg1, input [2:0] destReg2,
					input [31:0] writeData1,input [31:0] writeData2,
					output [31:0] Regrm1, Regrd1_1, Regrd1_2, Regrm2, Regrn2, Regrd2);

	wire [7:0] decOut1, decOut2;
	wire [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7;

	registerSet REGSET( clk, reset, regWrite1, regWrite2, decOut1, decOut2, writeData1, writeData2, outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7);

	decoder3to8 Decoder1(destReg1, decOut1);
	decoder3to8 Decoder2(destReg2, decOut2);

	mux8to1_32bits MUX00(outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, rm1, Regrm1);
	mux8to1_32bits MUX01(outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, rd1_1, Regrd1_1);
	mux8to1_32bits MUX02(outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, rd1_2, Regrd1_2);

	mux8to1_32bits MUX10(outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, rm2, Regrm2);
	mux8to1_32bits MUX11(outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, rn2, Regrn2);
	mux8to1_32bits MUX12(outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, rd2, Regrd2);
	
endmodule

module register3bit(input clk, input reset, input regWrite, input decOut1b, input [2:0] inpData, output [2:0] outData);
	
	D_ff_normal Reg3bit_0(clk, reset, regWrite, decOut1b, inpData[0], outData[0]);
  D_ff_normal Reg3bit_1(clk, reset, regWrite, decOut1b, inpData[1], outData[1]);
  D_ff_normal Reg3bit_2(clk, reset, regWrite, decOut1b, inpData[2], outData[2]);

endmodule

module register8bit(input clk, input reset, input regWrite, input decOut1b, input[7:0] inpData, output[7:0] outData);
	
	D_ff_normal Reg8bit_0(clk, reset, regWrite, decOut1b, inpData[0], outData[0]);
	D_ff_normal Reg8bit_1(clk, reset, regWrite, decOut1b, inpData[1], outData[1]);
	D_ff_normal Reg8bit_2(clk, reset, regWrite, decOut1b, inpData[2], outData[2]);
	D_ff_normal Reg8bit_3(clk, reset, regWrite, decOut1b, inpData[3], outData[3]);
	
	D_ff_normal Reg8bit_4(clk, reset, regWrite, decOut1b, inpData[4], outData[4]);
	D_ff_normal Reg8bit_5(clk, reset, regWrite, decOut1b, inpData[5], outData[5]);
	D_ff_normal Reg8bit_6(clk, reset, regWrite, decOut1b, inpData[6], outData[6]);
	D_ff_normal Reg8bit_7(clk, reset, regWrite, decOut1b, inpData[7], outData[7]);
endmodule

module register3bit_normal(input clk, input reset, input regWrite, input decOut1b, input [2:0] writeData, output  [2:0] outR);
	D_ff_normal reg3bit_0(clk, reset, regWrite, decOut1b, writeData[0], outR[0]);
	D_ff_normal reg3bit_1(clk, reset, regWrite, decOut1b, writeData[1], outR[1]);
	D_ff_normal reg3bit_2(clk, reset, regWrite, decOut1b, writeData[2], outR[2]);
endmodule

module adder(input [31:0] in1, input [31:0] in2, output reg [31:0] adder_out);
	always@(in1 or in2)
		adder_out = in1 +in2;
endmodule

module mux4to1_32bits(input [31:0] in1, input [31:0] in2, input [31:0] in3,input [31:0] in4, input [1:0] sel, output reg [31:0] muxout);
	 always@(in1 or in2 or in3 or in4 or sel)
	 begin
		case(sel)
			2'b00 : muxout = in1;
			2'b01 : muxout = in2;
			2'b10 : muxout = in3;
			2'b11 : muxout = in4;
		endcase
	 end
endmodule

module mux2to1_3bits(input [2:0] in1, input [2:0] in2,input sel, output reg [2:0] mout);
 always@(in1, in2)
    begin
      case(sel)
        1'b0: mout=in1;
        1'b1: mout=in2;
      endcase
  end
endmodule  

module mux2to1_32bits(input [31:0] in1, input [31:0] in2,input sel, output reg [31:0] mout);
 always@(in1, in2)
    begin
      case(sel)
        1'b0: mout=in1;
        1'b1: mout=in2;
      endcase
  end
endmodule  


module mux2to1_9bits(input [8:0] in1, input [8:0] in2,input sel, output reg [8:0] mout);
  always@(in1, in2)
    begin
      case(sel)
        1'b0: mout=in1;
        1'b1: mout=in2;
      endcase
  end
endmodule  

module mux2to1_8bits(input [7:0] in1, input [7:0] in2,input sel, output reg [7:0] mout);
  always@(in1, in2)
    begin
      case(sel)
        1'b0: mout=in1;
        1'b1: mout=in2;
      endcase
  end
endmodule      


module mux2to1_7bits(input [6:0] in1, input [6:0] in2,input sel, output reg [6:0] mout);
  always@(in1, in2)
    begin
      case(sel)
        1'b0: mout=in1;
        1'b1: mout=in2;
      endcase
  end
endmodule      

module zeroExt8to32(input [7:0] offset, output reg [31:0] zeroExtOffset);
	always@(offset)
	begin
			zeroExtOffset={24'd0,offset[7:0]};
	end
endmodule

module signExt8to32(input [7:0] offset, output reg [31:0] signExtOffset);
	always@(offset)
	begin
			signExtOffset={{24{offset[7]}},offset[7:0]};
	end
endmodule

module signExt11to32(input [10:0] offset, output reg [31:0] signExtOffset);
	always@(offset)
	begin
			signExtOffset={{20{offset[7]}},offset[10:0]};
	end
endmodule

module leftshiftby1(input [31:0] offset, output reg[31:0] shiftedValue);
  always@(offset)
  begin
    shiftedValue=offset<<1;
  end
endmodule

module HazardDetectionUnit(input Branch, input ID_EX_RegWrite, output reg IF_ID_Write, output reg PCWrite, output reg CntrlSel,
                           input ID_EX_RegWrite2, input EX_MEM_RegWrite2,
                           input ID_EX_MemRead, input [2:0] ID_EX_Rd2, input [2:0] IF_ID_inst1_Rm,
                           input AluSrcB, input [2:0] IF_ID_inst1_Rn, input [2:0] IF_ID_inst1_Rd,
                           input [2:0] IF_ID_inst2_Rm, input [2:0] IF_ID_inst2_Rn, input [2:0] IF_ID_inst2_Rd, input EX_MEM_MemRead);
  // THE ASSUMPTION IS THAT A CHANGE IN THE SENSITIVITY LIST WILL ALWAYS BE THERE
  always@(Branch, ID_EX_RegWrite, ID_EX_RegWrite2, EX_MEM_RegWrite2, ID_EX_MemRead, ID_EX_Rd2, IF_ID_inst1_Rm, AluSrcB, IF_ID_inst1_Rn, IF_ID_inst1_Rd, IF_ID_inst2_Rm, IF_ID_inst2_Rn, IF_ID_inst2_Rd, EX_MEM_MemRead)
  begin 
    IF_ID_Write = 1'b1;
    PCWrite = 1'b1;
    CntrlSel=1'b0;
    
    /*First*/
    if(Branch == 1'b1 && ID_EX_RegWrite == 1'b1)
    begin
      IF_ID_Write = 1'b0;
      PCWrite = 1'b0;
      CntrlSel = 1'b1;
    end
    
    /*Second*/
    if(Branch == 1'b1 && ID_EX_RegWrite2 == 1'b1)
    begin
      IF_ID_Write = 1'b0;
      PCWrite = 1'b0;
      CntrlSel = 1'b1;
    end
    if(Branch == 1'b1 && EX_MEM_RegWrite2 == 1'b1)
    begin
      IF_ID_Write = 1'b0;
      PCWrite = 1'b0;
      CntrlSel = 1'b1;
    end
    
    /*Third*/
    if(ID_EX_MemRead == 1'b1 && ID_EX_Rd2 == IF_ID_inst1_Rm)
    begin
      IF_ID_Write = 1'b0;
      PCWrite = 1'b0;
      CntrlSel = 1'b1;
    end
    
    /*Fourth*/
    if(ID_EX_MemRead == 1'b1 && AluSrcB == 1'b0 && ID_EX_Rd2 == IF_ID_inst1_Rn)
    begin
      IF_ID_Write = 1'b0;
      PCWrite = 1'b0;
      CntrlSel = 1'b1;
    end
    if(ID_EX_MemRead == 1'b1 && AluSrcB == 1'b1 && ID_EX_Rd2 == IF_ID_inst1_Rd)
    begin
      IF_ID_Write = 1'b0;
      PCWrite = 1'b0;
      CntrlSel = 1'b1;
    end
    
    /*Fifth*/
    if(ID_EX_MemRead == 1'b1 && (ID_EX_Rd2 == IF_ID_inst2_Rm || ID_EX_Rd2 == IF_ID_inst2_Rn || ID_EX_Rd2 == IF_ID_inst2_Rd))
    begin
      IF_ID_Write = 1'b0;
      PCWrite = 1'b0;
      CntrlSel = 1'b1;
    end
    
    /*Sixth*/
    if(Branch == 1'b1 && EX_MEM_MemRead == 1'b1)
    begin
      IF_ID_Write = 1'b0;
      PCWrite = 1'b0;
      CntrlSel = 1'b1;
    end
  end
endmodule

module alu( input [31:0] aluIn1, input [31:0] aluIn2, input carry, input [1:0] aluOp,
			output reg [31:0] aluOut, output reg N, output reg Z, output reg C,
			output reg V);

  	reg [63:0] temp;
  	assign flag = -1;

	always@(aluIn1 or aluIn2 or aluOp)
	begin
		case(aluOp)
			2'b00: 	begin
						{C,aluOut} = aluIn1 + aluIn2 + carry;

						// overflow flag
						if((aluIn1[31] == 1'b1 && aluIn2[1]==1'b1 && aluOut[31]==1'b0) || (aluIn1[31] == 1'b0 && aluIn2[1]==1'b0 && aluOut[31]==1'b1))
							V = 1'b1;
						else
							V = 1'b0;

						// negative flag
						if(aluOut<32'd0)
							N = 1'b1;
						else
							N = 1'b0;

						// zero flag
						if(aluOut==32'd0)
							Z = 1'b1;
						else
							Z = 1'b0;

					end

			2'b01: 	begin
						{C,aluOut} = aluIn2 - aluIn1;

						// overflow flag
						if((aluIn1[31] == 1'b0 && aluIn2[1]==1'b1 && aluOut[31]==1'b1) || (aluIn1[31] == 1'b1 && aluIn2[1]==1'b0 && aluOut[31]==1'b0))
							V = 1'b1;
						else
							V = 1'b0;

						// negative flag
						if(aluOut<32'd0)
							N = 1'b1;
						else
							N = 1'b0;

						// zero flag
						if(aluOut==32'd0)
							Z = 1'b1;
						else
							Z = 1'b0;


					end

			2'b10: 	begin
						aluOut = aluIn1&aluIn2;


						// negative flag
						if(aluOut<32'd0)
							N = 1'b1;
						else
							N = 1'b0;

						// zero flag
						if(aluOut==32'd0)
							Z = 1'b1;
						else
							Z = 1'b0;

					end

			2'b11:  //for  ror
					begin
			  			temp = {aluIn2, aluIn2} >> aluIn1;
			  			aluOut = temp[31:0];

			  			// carry flag ???
						if(temp[32]==1'b1)
							C = 1'b1;
						else
							C = 1'b0;

						// negative flag
						if(aluOut<32'd0)
							N = 1'b1;
						else
							N = 1'b0;

						// zero flag
						if(aluOut==32'd0)
							Z = 1'b1;
						else
							Z = 1'b0;

					end
		endcase
	end
endmodule

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

		// Forward D
		if ( (MEM_WB_RegWrite2 == 1'b1) && (MEM_WB_rd_2 != 1'b0) && (MEM_WB_rd_2 == EX_MEM_rd_2) )
			ForwardD2 = 1'b1;
		else
		begin
			ForwardD2 = 1'b0;
		end


		// Forward flag
		if ( MEM_WB_RegWrite2 == 1'b1 )
			n_out = n2;
		else if ( !(MEM_WB_RegWrite2 == 1'b1) &&  (EX_MEM_RegWrite1 == 1'b1) )
			n_out = n1;

		// End forwarding

	end
endmodule

module flag_generator(input clk, input reset, input [7:0] zext_out,
                      output reg inst2NFlagSignal, output reg inst2ZFlagSignal, output reg inst2CFlagSignal, output reg inst2VFlagSignal);
  always @ (clk, reset, zext_out)
  begin
    inst2NFlagSignal = 1'b0;
    inst2ZFlagSignal = 1'b0;
    inst2CFlagSignal = 1'b0;
    inst2VFlagSignal = 1'b0;
    
    if(zext_out[7]==1)
      inst2NFlagSignal = 1'b1;
    if(zext_out == 8'd0)
      inst2ZFlagSignal = 1'b1;
  end
endmodule


module CntrlCkt(input [31:0] IR, output reg regWrite1,output reg regWrite2,
				output reg z1Write,output reg n1Write,output reg c1Write, output reg v1Write, output reg z2Write, output reg n2Write,output reg c2Write,output reg v2Write,
				output reg [1:0]aluOp, output reg branch,output reg PcWrite, output reg [1:0] PcSrc,output reg memRead, output reg memWrite, output reg aluSrcA, output reg aluSrcB			
				);

always@(IR)
	begin
		// for the first instruction
		casex({IR[4:0]})
			5'b01000: 	begin
							   regWrite1 = 1'b1;
    				      		aluSrcA = 1'b0;
    							   aluSrcB = 0;
    							   z1Write=1;
    						    	n1Write=1;
    							   c1Write=1;
    							   v1Write=1;
    							   aluOp=IR[8:7];
    							   PcWrite=1;
    						     end
			5'b00101: 	begin
  							   regWrite1 = 1'b1;
 							   aluSrcA = 1'b1; // for offset
  							   aluSrcB = 1;
  							   z1Write=1;
  							   n1Write=1;
  							   c1Write=1;
  							   v1Write=1;
  							   aluOp=2'b00;
						     PcWrite=1;
						     end
			5'b00000: 	begin//for nop
							   regWrite1 = 0;
							   aluSrcA = 0; // for offset
							   aluSrcB = 0;
							   z1Write=0;
							   n1Write=0;
							   c1Write=0;
							   v1Write=0;
							   aluOp=2'b00;
						     PcWrite=1;
						     end
		endcase				
		// for the second instruction
		casex({IR[20:16]})
			5'b01010: 	begin //load
							   regWrite2 = 1'b1;
							   branch=0;
							   PcSrc=2'b00;
						    	z2Write=1;
							   n2Write=1;
						    	c2Write=0;
						    	v2Write=0;
						    	memRead=1;
							   memWrite=0;
						     end
			5'b01011: 	begin //store
							   regWrite2 = 1'b0;
							   memRead = 1'b0;
							   memWrite = 1'b1;
							   branch = 1'b0;
							   PcSrc=2'b00;
							   z2Write=0;
							   n2Write=0;
							   c2Write=0;
							   v2Write=0;
						     end
			5'b11110: 	begin//jump
							   regWrite2 = 0;
							   branch=0;
							   PcSrc=2'b10;
							   z2Write=0;
							   n2Write=0;
							   c2Write=0;
							   v2Write=0;
							   memRead=0;
						    	memWrite=0;
						     end
			5'b11011:   begin//branch
							    regWrite2 = 0;
							    branch=1;
							    PcSrc=2'b01;
						     	z2Write=0;
						    	n2Write=0;
							   c2Write=0;
							   v2Write=0;
							   memRead=0;
							   memWrite=0;
					       	end
			5'b00000: 	begin//for nop
							   regWrite2 = 0;
							   branch=0;
							   PcSrc=2'b00;
							   z2Write=0;
							   n2Write=0;
							   c2Write=0;
							   v2Write=0;
							   memRead=0;
							   memWrite=0;
						     end
		endcase
	end
endmodule

module IFID_pipeline(input clk, input reset, input [63:0] IMOut, input [31:0] PcAdderOut, input IFIDWrite, output [31:0] P1_PcAdderOut, output [16:0] Inst1, output [16:0] Inst2);
  register32bit_normal PcVal01( clk, reset,IFIDWrite,1, PcAdderOut,  P1_PcAdderOut);
  register32bit_abnormal IR01( clk,reset,IFIDWrite, 1, IMOut, Inst1, Inst2);
endmodule

module IDEX_pipeline(input clk, input reset, 
                    input [8:0] Instr1SigOut, input [6:0] Instr2SigOut, 
                     input [31:0] subImmExt, input [2:0] rd1_2, input [2:0] rd1_1, input [2:0] rm1, 
                     input [31:0] Regrm1, input [31:0] Regrd1_1, input [31:0] Regrd1_2, 
                     input [31:0] Regrm2, input [31:0] Regrn2, input [31:0] Regrd2,
                      input [2:0] rm2, input [2:0] rn2, input [2:0] rd2, 
                      output [8:0] P2_Instr1SigOut,output [6:0] P2_Instr2SigOut, output [31:0] P2_subImmExt,
                      output [2:0] P2_rd1_2, output [2:0] P2_rd1_1, output [2:0] P2_rm1,
                      output [31:0] P2_Regrm1, output [31:0] P2_Regrd1_1, output [31:0] P2_Regrd1_2, 
                      output [31:0] P2_Regrm2 , output [31:0] P2_Regrn2, output [31:0] P2_Regrd2,
                      output  [2:0] P2_rm2, output  [2:0] P2_rn2, output [2:0] P2_rd2
                          );

register9bit_normal controlinst1(clk, reset, 1, 1,Instr1SigOut ,P2_Instr1SigOut );
D_ff_normal reg1b01(clk, reset, 1,1, Instr2SigOut[0], P2_Instr2SigOut[0]);
D_ff_normal reg1b02(clk, reset, 1,1, Instr2SigOut[1], P2_Instr2SigOut[1]);
D_ff_normal reg1b03(clk, reset, 1,1, Instr2SigOut[2], P2_Instr2SigOut[2]);
D_ff_normal reg1b04(clk, reset,1,1, Instr2SigOut[3], P2_Instr2SigOut[3]);
D_ff_normal reg1b05(clk, reset, 1,1, Instr2SigOut[4], P2_Instr2SigOut[4]);
D_ff_normal reg1b06(clk, reset, 1,1, Instr2SigOut[5], P2_Instr2SigOut[5]);
register32bit_normal regSubImm01(clk,reset, 1,1,  subImmExt, P2_subImmExt);
register32bit_normal regrm1(clk,reset, 1,1,  Regrm1, P2_Regrm1);
register32bit_normal regrd101(clk,reset, 1,1,  Regrd1_1, P2_Regrd1_1);
register32bit_normal regrd102(clk,reset, 1,1,   Regrd1_2, P2_Regrd1_2);
register32bit_normal regrm2(clk,reset, 1,1,  Regrm2, P2_Regrm2);
register32bit_normal regrn2(clk,reset, 1,1,   Regrn2, P2_Regrn2);
register32bit_normal regrd2(clk,reset, 1,1,  Regrd2, P2_Regrd2);
register3bit_normal rd201(clk, reset, 1,1, rd2, P2_rd2);
register3bit_normal rm201(clk, reset, regWrite, decOut1b, rm2, P2_rm2);
register3bit_normal rn201(clk, reset, regWrite, decOut1b, rn2, P2_rn2);
register3bit_normal rm101(clk, reset, regWrite, decOut1b, rm1, P2_rm1);
register3bit_normal rd101(clk, reset, regWrite, decOut1b, rd1_1, P2_rd1_1);
register3bit_normal rd102(clk, reset, regWrite, decOut1b, rd1_2, P2_rd1_2);
endmodule

module ex_mem(input clk, input reset, input regWrite1, input regWrite2, input muxout,
              input aluOutNFlag, input aluOutZFlag, input aluOutCFlag, input aluOutVFlag,
              input id_exe_regrd2_out,
              input id_exe_rd2_out, input aluOutInput, input adderOut, input memRd_in, input memWt_in,
              output ex_mem_NFlag, output ex_mem_ZFlag, output ex_mem_CFlag, output ex_memVFlag,
              output ex_mem_rd1_out, output ex_mem_rd2_out, output exe_mem_regrd2_out, output exe_mem_aluOutOutput,
              output ex_mem_memAddr_out, output memRd_out, output memWt_out, output P3_RegWrite1, output P3_RegWrite2);
  
  register3bit ex_mem_rd1(clk, reset, 1, 1'b1, muxout, ex_mem_rd1_out);
  
  register32bit_normal ex_mem_aluout(clk, reset, 1'b1, 1'b1, aluOutInput, exe_mem_aluOutOutput);
  
  register1bit ex_mem_inst1NFLag(clk, reset, 1'b1, 1'b1, aluOutNFlag, ex_mem_NFlag);
  register1bit ex_mem_inst1ZFlag(clk, reset, 1'b1, 1'b1, aluOutZFlag, ex_mem_ZFlag);
  register1bit ex_mem_inst1CFlag(clk, reset, 1'b1, 1'b1, aluOutCFlag, ex_mem_CFlag);
  register1bit ex_mem_inst1VFlag(clk, reset, 1'b1, 1'b1, aluOutVFlag, ex_mem_VFlag);
  
  register32bit_normal memAddr(clk, reset, 1'b1, 1'b1, adderOut, ex_mem_memAddr_out);
  
  register8bit regrd2(clk, reset, 1'b1, 1'b1, id_exe_regrd2_out, exe_mem_regrd2_out);  
    
  register3bit ex_mem_rd2(clk, reset, 1, 1'b1, id_exe_rd2_out, ex_mem_rd2_out);
  register1bit regwr1(clk, reset, 1'b1, 1'b1, regWrite1,P3_RegWrite1);
  register1bit regwr2(clk, reset, 1'b1, 1'b1, regWrite2,P3_RegWrite2);
  register1bit memRd(clk, reset, 1'b1, 1'b1, memRd_in, memRd_out);
  register1bit memWt(clk, reset, 1'b1, 1'b1, memWt_in, memWt_out);
endmodule

module MEM_WB(input clk, input reset, input regWrite1, input regWrite2, input ex_mem_rd1_out, input ex_mem_aluout,
              input ex_mem_NFlag, input ex_mem_ZFlag, input ex_mem_CFlag, input ex_mem_VFlag,
              input inst2NFlagSignal,input inst2ZFlagSignal, input inst2CFlagSignal, input inst2VFlagSignal,
              input ex_mem_rd2_out,input zext_out, output DestReg1, output WriteData1,
              output inst1NFlagVal, output inst1ZFlagVal, output inst1CFlagVal, output inst1VFlagVal,
              output inst2NFlagVal, output inst2ZFlagVal, output inst2CFlagVal, output inst2VFlagVal,
              output WriteData2, output DestReg2, output P4_regWrite1, output P4_regWrite2);
  
  register3bit mem_wb_rd1(clk, reset, 1, 1'b1, ex_mem_rd1_out, DestReg1);
  
  register32bit_normal aluOutReg(clk, reset,1, 1'b1, ex_mem_aluout, WriteData1);
  
  register1bit mem_wb_inst1NFlag(clk, reset, 1'b1, 1'b1, ex_mem_NFlag, inst1NFlagVal);
  register1bit mem_wb_inst1ZFlag(clk, reset, 1'b1, 1'b1, ex_mem_ZFlag, inst1ZFlagVal);
  register1bit mem_wb_inst1CFlag(clk, reset, 1'b1, 1'b1, ex_mem_CFlag, inst1CFlagVal);
  register1bit mem_wb_inst1VFlag(clk, reset, 1'b1, 1'b1, ex_mem_VFlag, inst1VFlagVal);
  
  register32bit memOut(clk, reset, 1, 1'b1, zext_out, WriteData2);
  
  register1bit mem_wb_inst2NFlag(clk, reset, 1'b1, 1'b1, inst2NFlagSignal, inst2NFlagVal);
  register1bit mem_wb_inst2ZFlag(clk, reset, 1'b1, 1'b1, inst2ZFlagSignal, inst2ZFlagVal);
  register1bit mem_wb_inst2CFlag(clk, reset, 1'b1, 1'b1, inst2CFlagSignal, inst2CFlagVal);
  register1bit mem_wb_inst2VFlag(clk, reset, 1'b1, 1'b1, inst2VFlagSignal, inst2VFlagVal);
  register1bit regwr1(clk, reset, 1'b1, 1'b1, regWrite1, P4_regWrite1);
  register1bit regwr2(clk, reset, 1'b1, 1'b1, regWrite2, P4_regWrite2);
  register3bit mem_wb_rd2(clk, reset, 1, 1'b1, ex_mem_rd2_out, DestReg2);
endmodule




module TopModule(input clk, input reset);
//related to EXMEM Pipeline
wire P3_C,P3_N,P3_V,P3_Z,P3_MemRead, P3_MemWrite, P3_RegWrite1, P3_RegWrite2;
wire [2:0] P3_rd1, P3_rd2;
wire [31:0]  P3_aluOut, P3_MemAdderOut;
wire [7:0] P3_RegRd2;
//////
///// related to MEM WB pipeline
wire [2:0] P4_rd1, P4_rd2;
wire [31:0] P4_aluOut, P4_MemOut;
wire P4_C, P4_N, P4_Z,P4_V, P4_C2, P4_N2, P4_Z2, P4_V2, P4_RegWrite1, P4_RegWrite2;
/////
//EX stage
wire n_out, N, Z, C, V;
wire [1:0] ForwardA1, ForwardA2,ForwardB1,ForwardB2, ForwardC2,ForwardD2;
wire [31:0] aluOut,SrcAMuxOut, FwdB1MuxOut,FwdA1MuxOut,MemAdderOut;
wire[2:0] RdSelMuxOut;
//IF
//wire [31:0] BranchOut, JumpOut,ExceptionAdd
wire PcWrite;
wire [1:0] PcSrc;
wire [31:0] PcMuxOut,PcOut,PcAdderOut;
wire [31:0] IMOut;
mux4to1_32bits pcmux01(PcAdderOut,BranchOut, JumpOut, ExceptionAdd, PcSrc, PcMuxOut);
register32bit_normal pc01( clk,reset, PcWrite, 1, PcMuxOut, PcOut );
adder adderpc01(PcOut, 32'd4, PcAdderOut);
IM_Mem im01(clk,reset,0,1, PcOut, 32'd0, IMOut);

//IF/ID pipeline
wire IFIDWrite;
wire [31:0] P1_PcAdderOut;
wire [15:0] Inst1, Inst2;
IFID_pipeline p1(clk, reset, IMOut, PcAdderOut, IFIDWrite, P1_PcAdderOut,  Inst1, Inst2);

//ID
wire [31:0] BranchSExt,JumpSExt,JumpSExtShiftedValue,BranchSExtShiftedValue,SubSExt;
wire [31:0] writeData1,writeData2;
wire z1Write, Z1flag, Z1out,n1Write, N1flag, N1out,c1Write,C1flag, C1out,v1Write,V1flag, V1out,z2Write,Z2flag, Z2out,n2Write, N2flag, N2out,c2Write,C2flag, C2out,v2Write,V2flag, V2out;
wire [2:0] destReg1,destReg2;
wire [31:0] Regrm1, Regrd1_1, Regrd1_2, Regrm2, Regrn2, Regrd2;
wire regWrite1,regWrite2,branch,memRead, memWrite,aluSrcA, aluSrcB;
wire [1:0]aluOp;
wire [8:0] Instr1SigOut;
wire [6:0] Instr2SigOut;
wire CntrlSel;
wire [8:0] P2_Instr1SigOut;
wire [6:0] P2_Instr2SigOut;
signExt8to32 branchsext01( Inst2[15:8], BranchSExt);
signExt11to32 jumpsext01( Inst2[15:5], JumpSExt);
leftshiftby1 left01(BranchSExt, BranchSExtShiftedValue);
leftshiftby1 left02(JumpSExt, JumpSExtShiftedValue);

adder branchAdder01(P1_PcAdderOut, BranchSExtShiftedValue, BranchAdderOut);

registerFile regfile01(clk, reset,Inst1[15:13], Inst1[12:10], Inst1[7:5],Inst2[15:13], Inst2[12:10], Inst2[9:7],P4_RegWrite1, P4_RegWrite2,P4_rd1, P4_rd2, P4_aluOut, P4_MemOut, Regrm1, Regrd1_1, Regrd1_2, Regrm2, Regrn2, Regrd2);
signExt8to32 subSExt01( Inst1[15:8], SubSExt);

register1bit_normal z1flag01(clk, reset,  z1Write, 1, Z1flag, Z1out);
register1bit_normal n1flag01(clk, reset,  n1Write, 1, N1flag, N1out);
register1bit_normal c1flag01(clk, reset,  c1Write, 1, C1flag, C1out);
register1bit_normal v1flag01(clk, reset,  v1Write, 1, V1flag, V1out);
register1bit_normal z2flag01(clk, reset,  z2Write, 1, Z2flag, Z2out);
register1bit_normal n2flag01(clk, reset,  n2Write, 1, N2flag, N2out);
register1bit_normal c2flag01(clk, reset,  c2Write, 1, C2flag, C2out);
register1bit_normal v2flag01(clk, reset,  v2Write, 1, V2flag, V2out);

HazardDetectionUnit hazard01(branch & n_out, P2_Instr1SigOut[8], IFIDWrite,PcWrite,CntrlSel,P2_Instr2SigOut[6], P3_RegWrite2, P2_Instr2SigOut[4], P2_Rd2, Inst1[15:13], aluSrcB, Inst1[12:10], Inst1[7:5],Inst2[15:13],Inst2[12:10], Inst2[9:7],P3_MemRead);

CntrlCkt cc01({Inst2, Inst1},regWrite1,regWrite2,z1Write, n1Write,c1Write, v1Write,z2Write, n2Write,c2Write,v2Write,aluOp, branch,PcWrite, PcSrc,memRead, memWrite,aluSrcA, aluSrcB);
//2 muxes for control signals
mux2to1_9bits idm1({regWrite1, aluSrcA, aluSrcB, aluOp,z1Write, n1Write,c1Write, v1Write} , 9'd0,CntrlSel, Instr1SigOut);
mux2to1_7bits idm2({regWrite2,memRead, memWrite,z2Write, n2Write,c2Write,v2Write},7'd0,CntrlSel, Instr2SigOut);

//IDEX pipeline

wire [2:0] P2_rd1_2, P2_rd1_1, P2_rm1, P2_rm2, P2_rn2, P2_rd2;
wire [31:0] P2_Regrm1,  P2_Regrd1_1, P2_Regrd1_2, P2_Regrm2 ,  P2_Regrn2, P2_Regrd2,P2_subImmExt;
IDEX_pipeline p2( clk, reset, Instr1SigOut, Instr2SigOut, SubSExt, Inst1[7:5], Inst1[12:10],Inst1[15:13], Regrm1,Regrd1_1,Regrd1_2, 
               Regrm2,Regrn2, Regrd2, Inst2[15:13], Inst2[12:10], Inst2[9:7], P2_Instr1SigOut,P2_Instr2SigOut, P2_subImmExt,
               P2_rd1_2, P2_rd1_1, P2_rm1, P2_Regrm1,  P2_Regrd1_1, P2_Regrd1_2, P2_Regrm2 ,  P2_Regrn2, P2_Regrd2,  P2_rm2, P2_rn2, P2_rd2
              );

//EX stage
//wire n_out, N, Z, C, V;
//wire [1:0] ForwardA1, ForwardA2,ForwardB1,ForwardB2, ForwardC2,ForwardD2;
//wire [31:0] aluOut,SrcAMuxOut, FwdB1MuxOut,FwdA1MuxOut,MemAdderOut;
//wire[2:0] RdSelMuxOut;
ForwardingUnit fu01(P2_rm1,P3_rd1,P4_RegWrite1, P4_rd1,P2_rd1_1,P2_Instr1SigOut[6],P2_rd1_2,P2_Instr1SigOut[8],P2_rm2,P2_Rd2,P2_rn2,P3_RegWrite2,P4_rd2, P3_rd2, P3_N,P4_N2 | P4_N, n_out,ForwardA1,ForwardA2,ForwardB1,ForwardB2, ForwardC2, ForwardD2);
alu alu01( SrcAMuxOut, FwdB1MuxOut, C,  aluOp, aluOut,  N, Z, C,V);
adder lwadder01(FwdA2MuxOut, FwdB2MuxOut, MemAdderOut);
mux4to1_32bits fwda1mux01(P2_Regrm1, P3_aluOut,P4_aluOut,P4_MemOut, ForwardA1, FwdA1MuxOut);
mux2to1_32bits muxalusrcA01(P2_subImmExt, FwdA1MuxOut,aluSrcA,SrcAMuxOut );
mux2to1_32bits muxalusrcB01(P2_Regrd1_1,P2_Regrd1_2,aluSrcB,SrcBMuxOut );
mux4to1_32bits fwdb1mux01(SrcBMuxOut, P4_aluOut, P3_aluOut,P4_MemOut,ForwardB1, FwdB1MuxOut);
mux4to1_32bits fwda2mux01(P2_Regrm2, P4_aluOut, P3_aluOut,P4_MemOut, ForwardA2, FwdA2MuxOut);
mux4to1_32bits fwdb2mux01(P2_Regrn2, P4_aluOut, P3_aluOut,P4_MemOut, ForwardB2, FwdB2MuxOut);
mux4to1_32bits fwdc2mux01(P2_Regrd2, P4_aluOut, P3_aluOut,P4_MemOut, ForwardC2, FwdC2MuxOut);
mux2to1_3bits rd1mux01(P2_rd1_1, P2_Regrd1_2,aluSrcB, RdSelMuxOut);

//EX_MEM pipeline
 
ex_mem p3(clk, reset,   P2_Instr1SigOut[8],  P2_Instr2SigOut[6], RdSelMuxOut, N, Z, C, V, P2_Regrd2[7:0],P2_Rd2, aluOut, MemAdderOut, P2_Instr2SigOut[4], P2_Instr2SigOut[5], 
				P3_N, P3_Z, P3_C, P3_V, P3_rd1, P3_rd2, P3_RegRd2, P3_aluOut,P3_MemAdderOut, P3_MemRead, P3_MemWrite,P3_RegWrite1, P3_RegWrite2);

//MEM stage
wire [7:0] MemDataInput,dataMemOut;
wire [31:0] zeroExtOffset;
wire N2, Z2, C2, V2;
mux2to1_8bits meminmux01(P3_RegRd2, P4_MemOut,ForwardD2, MemDataInput);
Mem dm01( clk, reset,P3_MemWrite,P3_MemRead, P3_aluOut, MemDataInput,dataMemOut );
zeroExt8to32 zext01(dataMemOut, zeroExtOffset);
flag_generator fg01(clk,reset,zeroExtOffset[7:0],N2, Z2, C2, V2);

//MEM WB pipeline

MEM_WB memwb01(clk, reset, P3_RegWrite1, P3_RegWrite2, P3_rd1, P3_aluOut,P3_N, P3_Z, P3_C, P3_V,N2,Z2, C2,V2,P3_rd2, zeroExtOffset, P4_rd1, P4_aluOut,P4_N,P4_Z, P4_C, P4_V, P4_N2, P4_Z2, P4_C2, P4_V2, P4_MemOut, P4_rd2, P4_RegWrite1, P4_RegWrite2);

endmodule



