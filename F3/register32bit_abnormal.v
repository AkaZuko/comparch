module register32bit_abnormal( input clk, input reset, input regWrite, input decOut1b, input [31:0] writeData, output  [15:0] outR1, output [15:0] outR2 );
  //assuming inst1 is in MSW
  register16bit_normal r16bn01(clk, reset, regWrite,decOut1b, writeData[31:16], outR1);
  register16bit_normal r16bn02(clk, reset, regWrite, decOut1b, writeData[15:0], outR2 );
endmodule