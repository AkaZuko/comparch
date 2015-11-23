module stallModule( input clk, input hit, input [7:0] dataIn, output reg [7:0] dataOut,
					output [31:0] decout, output reg stall);
	
	reg [5:0] count;
	decoder5to32 DECODER(count[4:0], decout);
	// always @( memWrite or hit or dataIn )
	// begin
	// 	if ( memWrite == 1'b1 && hit == 1'b0 )
	// 		cycles = 5'd33;
	// 	else if ( memWrite == 1'b0 && hit == 1'b0 )
	// 		cycles = 5'd33;
	// end

	// always @( memWrite or hit or dataIn )
	// begin
	// 	count = 5'd0;
	// 	while ( count < cycles )
	// 	begin
	// 		stall = 1'b1;
	// 		temp = ((7 * count) + count);
	// 		dataOut[temp : (temp + 1)] = dataIn;
	// 	end
	// 	stall = 1'b0;
	// end

	always @(hit)
	begin
		if ( hit == 1'b0 )
		begin
			count = 5'd31;
			stall = 1'b1;
		end
	end

	always @(negedge clk)
	begin
		dataOut = dataIn;
		count = count - 1;
		if ( count >= 6'd0 && count < 6'd33)
			stall = 1'b1;
		else
			stall = 1'b0;
	end
endmodule

module stallTestBench();
	
	reg hit, clk;
	wire stall;
	reg [7:0] dataIn;
	wire [7:0] dataOut;
	wire [31:0] decOut;

	stallModule mod(clk, hit, dataIn, dataOut, decOut, stall);

	always #5 clk = ~clk;
	initial
	begin
		clk = 0;
		#10 hit = 0; dataIn = 8'h00;
		#10 hit = 0; dataIn = 8'h01;
		#10 hit = 0; dataIn = 8'h01;
		#10 hit = 0; dataIn = 8'h02;

		#10 hit = 0; dataIn = 8'h00;
		#10 hit = 0; dataIn = 8'h01;
		#10 hit = 0; dataIn = 8'h01;
		#10 hit = 0; dataIn = 8'h02;

		#10 hit = 0; dataIn = 8'h00;
		#10 hit = 0; dataIn = 8'h01;
		#10 hit = 0; dataIn = 8'h01;
		#10 hit = 0; dataIn = 8'h02;

		#10 hit = 0; dataIn = 8'h00;
		#10 hit = 0; dataIn = 8'h01;
		#10 hit = 0; dataIn = 8'h01;
		#10 hit = 0; dataIn = 8'h02;

		#10 hit = 0; dataIn = 8'h00;
		#10 hit = 0; dataIn = 8'h01;
		#10 hit = 0; dataIn = 8'h01;
		#10 hit = 0; dataIn = 8'h02;

		#10 hit = 0; dataIn = 8'h00;
		#10 hit = 0; dataIn = 8'h01;
		#10 hit = 0; dataIn = 8'h01;
		#10 hit = 0; dataIn = 8'h02;

		#10 hit = 0; dataIn = 8'h00;
		#10 hit = 0; dataIn = 8'h01;
		#10 hit = 0; dataIn = 8'h01;
		#10 hit = 0; dataIn = 8'h02;

		#10 hit = 0; dataIn = 8'h00;
		#10 hit = 0; dataIn = 8'h01;
		#10 hit = 0; dataIn = 8'h01;
		#10 hit = 0; dataIn = 8'h02;

	end
endmodule