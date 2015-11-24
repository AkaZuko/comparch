module mux2to1_1bit(input inp1, input inp2, input sel, output reg outp);
always@(inp2 or inp1 or sel)
	if(sel==1'b0)
		outp = inp1;
	else begin
		outp = inp2;
	end
endmodule