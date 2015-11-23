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

	decoder4to16 dec0( pc[5:2], decOut);

	register_IM_Mem r0(clk,reset,memWrite,decOut[0],32'b1101011001101010_0000000000000000,dataIn,Qout0); //nop , r6 : 

	register_IM_Mem r1(clk,reset,memWrite,decOut[1],32'b1000000100011011_0000000000000000,dataIn,Qout1);
	
	register_IM_Mem r2(clk,reset,memWrite,decOut[2],32'b0000000000000000_0000000000000000,dataIn,Qout2);

	register_IM_Mem r3(clk,reset,memWrite,decOut[3],32'b0000000000000000_0000000000000000,dataIn,Qout3);

	register_IM_Mem r4(clk,reset,memWrite,decOut[4],32'b0000000000000000_0000000000000000,dataIn,Qout4);

	register_IM_Mem r5(clk,reset,memWrite,decOut[5],32'b0000000000000000_0000000000000000,dataIn,Qout5);

	register_IM_Mem r6(clk,reset,memWrite,decOut[6],32'b0000000000000000_0000000000000000,dataIn,Qout6);

	register_IM_Mem r7(clk,reset,memWrite,decOut[7],32'b0000000000000000_11110011_100_00101,dataIn,Qout7);

	// Reg File initialization over

	register_IM_Mem r8(clk,reset,memWrite,decOut[8],32'b0000000000000000_0000000000000000,dataIn,Qout8);

	register_IM_Mem r9(clk,reset,memWrite,decOut[9],32'b0000000000000000_0000000000000000,dataIn,Qout9);

	register_IM_Mem r10(clk,reset,memWrite,decOut[10],32'b0000000000000000_0000000000000000,dataIn,Qout10);

	register_IM_Mem r11(clk,reset,memWrite,decOut[11],32'b0000000000000000_0000000000000000,dataIn,Qout11);

	register_IM_Mem r12(clk,reset,memWrite,decOut[12],32'b0000000000000000_0000000000000000,dataIn,Qout12);

	register_IM_Mem r13(clk,reset,memWrite,decOut[13],32'b0000000000000000_0000000000000000,dataIn,Qout13);

	register_IM_Mem r14(clk,reset,memWrite,decOut[14],32'b0000000000000000_0000000000000000,dataIn,Qout14);

	register_IM_Mem r15(clk,reset,memWrite,decOut[15],32'b0000000000000000_0000000000000000,dataIn,Qout15);

	mux16to1_IM mMem (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,pc[5:2],IR);
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