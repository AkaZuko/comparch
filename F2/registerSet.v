module registerSet( input clk, input reset,
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