module flag_generator(input clk, input reset, input [7:0] zext_out,
                      output reg inst2NFlagSignal, output reg inst2ZFlagSignal, output reg inst2CFlagSignal, output reg inst2VFlagSignal);
  always @ (clk, reset, zext_out)
  begin
    inst2NFlagSignal = 1'b0;
    inst2ZFlagSignal = 1'b0;
    inst2CFlagSignal = 1'b0;
    inst2VFlagSignal = 1'b0;
    
    if(zext_out[7]==1'b1)
      inst2NFlagSignal = 1'b1;
    if(zext_out == 8'd0)
      inst2ZFlagSignal = 1'b1;
  end
endmodule