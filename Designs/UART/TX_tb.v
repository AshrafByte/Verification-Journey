`timescale 1ns / 1ns
module TX_tb ();

	reg clk , reset;
	wire tx;
	
	TX2 uut 
	(
		.clk(clk),
		.reset(reset),
		.tx(tx)
	);
	
	localparam T = 10;
	always begin
		clk = 1'b1;
		# (T/2) 
		clk = 1'b0;
		# (T/2);
	end
	initial begin
		#2000 $stop;
	end
	initial begin
		reset = 1'b1;
		#0.1
		reset = 1'b0;
	end
endmodule
