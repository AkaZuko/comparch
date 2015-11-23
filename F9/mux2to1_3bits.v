module mux2to1_3bits(input [2:0] in1, input [2:0] in2,input sel, output reg [2:0] mout);
 always@(in1 or in2 or sel)
    begin
      case(sel)
        1'b0: mout=in1;
        1'b1: mout=in2;
      endcase
  end
endmodule  