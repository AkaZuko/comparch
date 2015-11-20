module Comparator(input [3:0] inputTag, input [3:0] haltTag, output reg equal);
  
  always@(inputTag,haltTag )
  begin
  if(inputTag ==haltTag)
    begin
      equal = 1'b1;
    end
  else
    equal = 1'b0;
end
endmodule

module mux16to1 ( input [7:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31, input [4:0] Sel, output reg [7:0] outBus );
	always@(outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or outR12 or outR13 or outR14 or outR15 or outR16 or outR17 or outR18 or outR19 or outR20 or outR21 or outR22 or outR23 or outR24 or outR25 or outR26 or outR27 or outR28 or outR29 or outR30 or outR31 or Sel)
	case (Sel)
		  5'b00000: outBus = outR0;
			5'b00001: outBus = outR1;
			5'b00010: outBus = outR2;
			5'b00011: outBus = outR3;
			5'b00100: outBus = outR4;
			5'b00101: outBus = outR5;
			5'b00110: outBus = outR6;
			5'b00111: outBus = outR7;
			5'b01000: outBus = outR8;
			5'b01001: outBus = outR9;
			5'b01010: outBus = outR10;
			5'b01011: outBus = outR11;
			5'b01100: outBus = outR12;
			5'b01101: outBus = outR13;
			5'b01110: outBus = outR14;
			5'b01111: outBus = outR15;
			
			5'b10000: outBus = outR16;
			5'b10001: outBus = outR17;
			5'b10010: outBus = outR18;
			5'b10011: outBus = outR19;
			5'b10100: outBus = outR20;
			5'b10101: outBus = outR21;
			5'b10110: outBus = outR22;
			5'b10111: outBus = outR23;
			5'b11000: outBus = outR24;
			5'b11001: outBus = outR25;
			5'b11010: outBus = outR26;
			5'b11011: outBus = outR27;
			5'b11100: outBus = outR28;
			5'b11101: outBus = outR29;
			5'b11110: outBus = outR30;
			5'b11111: outBus = outR31;

	endcase
endmodule