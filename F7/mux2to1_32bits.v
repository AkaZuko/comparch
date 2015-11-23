module mux2to1_32bits(input [31:0] in1, input [31:0] in2,input sel, output reg [31:0] mout);
 always@(in1, in2)
    begin
      case(sel)
        1'b0: mout=in1;
        1'b1: mout=in2;
      endcase
  end
endmodule 