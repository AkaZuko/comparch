module FIFO(input clk, input reset, input[2:0] lineIndex, input hit, output reg setNo);
  
  wire[7:0] decOut;
  
  wire[7:0] set1Out, set2Out;
  reg updateSet1, updateSet2;
  
  wire setNo1, setNo2;
  
  decoder3to8 dec(lineIndex, decOut);
  
  FIFO_set set1(clk, reset, hit, decOut, updateSet1, set1Out);
  FIFO_set set2(clk, reset, hit, decOut, updateSet2, set2Out);
  
  mux8to1_1bit m1(set1Out[0], set1Out[1],set1Out[2],set1Out[3],set1Out[4],set1Out[5],set1Out[6], set1Out[7], lineIndex,setNo1);
  mux8to1_1bit m2(set2Out[0], set2Out[1],set2Out[2],set2Out[3],set2Out[4],set2Out[5],set2Out[6], set2Out[7], lineIndex,setNo2);

  always@(lineIndex or hit or setNo1 or setNo2)
  begin
  	if ( setNo1 == 1'b1 && setNo2 == 1'b0 )
  	begin
  		updateSet1 = 1'b0;
  		updateSet2 = 1'b1;
  		setNo = 1'b1;
  	end
  	else if ( setNo2 == 1'b1 && setNo1 == 1'b0 )
  	begin
  		updateSet1 = 1'b1;
  		updateSet2 = 1'b0;
  		setNo = 1'b0;
  	end
  	else
  	begin
  		updateSet1 = 1'b1;
  		updateSet2 = 1'b0;
  		setNo = 1'b0;
  	end
  end
   
endmodule


module FIFO_set(input clk, input reset, input hit, input[7:0] decOut1b, input inpData, output[7:0] outData);
  register1bit r0(clk,reset, ~hit, decOut1b[0],inpData,  outData[0] );
  register1bit r1(clk,reset, ~hit, decOut1b[1],inpData,  outData[1] );
  register1bit r2(clk,reset, ~hit, decOut1b[2],inpData,  outData[2] );
  register1bit r3(clk,reset, ~hit, decOut1b[3],inpData,  outData[3] );
  register1bit r4(clk,reset, ~hit, decOut1b[4],inpData,  outData[4] );
  register1bit r5(clk,reset, ~hit, decOut1b[5],inpData,  outData[5] );
  register1bit r6(clk,reset, ~hit, decOut1b[6],inpData,  outData[6] );
  register1bit r7(clk,reset, ~hit, decOut1b[7],inpData,  outData[7] );
  
endmodule
//exist
module register1bit(input clk, input reset, input regWrite, input decOut1b, input inpData, output outData);
	
	D_ff_normal Reg1bit_0(clk, reset, regWrite, decOut1b, inpData, outData);

endmodule
//exist
module D_ff_normal (input clk, input reset, input regWrite, input decOut1b, input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1)
		q=0;
	else
		if(regWrite == 1 && decOut1b==1) begin q=d; end
	end
endmodule

//exist
module decoder3to8( input [2:0] destReg, output reg [7:0] decOut);
	always@(destReg)
	begin
		case(destReg)
		3'b000: decOut=8'b00000001;
		3'b001: decOut=8'b00000010;
		3'b010: decOut=8'b00000100;
		3'b011: decOut=8'b00001000;
		3'b100: decOut=8'b00010000;
		3'b101: decOut=8'b00100000;
		3'b110: decOut=8'b01000000;
		3'b111: decOut=8'b10000000;
		endcase
	end
endmodule

//exist
module mux8to1_1bit(input  in1, input  in2, input  in3,input  in4,input  in5, input  in6, input  in7,input  in8, input [2:0] sel, output reg muxout);
	 always@(in1 or in2 or in3 or in4 or in5 or in6 or in7 or in7 or sel)
	 begin
		case(sel)
			3'b000 : muxout = in1;
			3'b001 : muxout = in2;
			3'b010 : muxout = in3;
			3'b011 : muxout = in4;
			3'b100 : muxout = in5;
			3'b101 : muxout = in6;
			3'b110 : muxout = in7;
			3'b111 : muxout = in8;
		endcase
	 end
endmodule