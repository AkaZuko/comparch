module IFID_pipeline(input clk, input reset, input decOut1b, input [31:0] IMOut, input [31:0] PcAdderOut, input IFIDWrite, output [31:0] P1_PcAdderOut, output [15:0] Inst1, output [15:0] Inst2);

  register32bit_normal PcVal01( clk, reset, IFIDWrite, decOut1b,  PcAdderOut,  P1_PcAdderOut);
  register32bit_abnormal IR01( clk, reset, IFIDWrite, decOut1b,  IMOut, Inst2, Inst1);
endmodule