module D_ff_Mem (input clk, input reset, input regWrite, input decOut1b,input init, input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1)
		q=init;
	else
		if(regWrite == 1 && decOut1b==1) begin q=d; end
	end
endmodule


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



