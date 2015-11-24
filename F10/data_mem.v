//DATA MEMORY
module register_Mem(input clk,input reset,input regWrite,input decOut1b,input [7:0]init, input [7:0] d_in, output [7:0] q_out);
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
	
	register_Mem r0(clk,reset,memWrite,decOut[0],8'b10000001,dataIn,Qout0); //1
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
///DATA MEMORY ENDS