module mux2to1_8bits(input [7:0] in1, input [7:0] in2,input sel, output reg [7:0] mout);
  always@(in1 or in2 or sel)
    begin
      case(sel)
        1'b0: mout=in1;
        1'b1: mout=in2;
      endcase
  end
endmodule   