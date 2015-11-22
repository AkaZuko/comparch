
module leftshiftby1(input [31:0] offset, output reg[31:0] shiftedValue);
  always@(offset)
  begin
    shiftedValue=offset<<1;
  end
endmodule