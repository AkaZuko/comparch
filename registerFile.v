module registerFile(input clk, input reset,
					input [2:0] rm1, input [2:0] rd1,
					input [2:0] rm2, input [2:0] rn2, input [2:0] rd2,
					input regWrite1, input regWrite2,
					input [2:0] destReg1, input [2:0] destReg2,
					input [31:0] writeData1,input [31:0] writeData2,
					output [31:0] Regrm1, Regrd1, Regrm2, Regrn2, Regrd2);

	wire [7:0] decOut1, decOut2;
	wire [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7;
	reg decIn;

	registerSet( clk, reset, regWrite1, regWrite2, decOut1, decOut2, writeData1, writeData2, outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7);

	decoder3to8 Decoder1(destReg1, decOut1);
	decoder3to8 Decoder2(destReg2, decOut2);

	mux8to1_32bits MUX0(outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, rm1, Regrm1);
	mux8to1_32bits MUX1(outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, rd1, Regrd1);

	mux8to1_32bits MUX2(outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, rm2, Regrm2);
	mux8to1_32bits MUX3(outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, rn2, Regrn2);
	mux8to1_32bits MUX4(outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, rd2, Regrd2);
	
endmodule