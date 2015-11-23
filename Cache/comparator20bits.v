module Comparator20bits(input [19:0] index1, input [19:0] index2, input enable, output reg equal);
  
  always@(index1,index2, enable )
  begin
  if(enable==1'b1)
  begin
  if(index1 ==index2)
    begin
      equal = 1'b1;
    end
  else
    begin
    equal = 1'b0;
  	end
  end
end
endmodule
