module Comparator(input [19:0] index1, input [19:0] index2, output reg equal);
  
  always@(index1,index2 )
  begin
  if(index1 ==index2)
    begin
      equal = 1'b1;
    end
  else
    equal = 1'b0;
end
endmodule
