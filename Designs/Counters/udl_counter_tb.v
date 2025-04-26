`timescale 1ns/1ns
module udl_counter_tb();
	reg reset, clk, L, En, up ;
	reg [2:0] D;
	wire [2:0]Q ;
	//
	udl_counter uut (
		.reset(reset),
		.clk(clk),
		.D(D),
		.En(En),
		.up(up),
		.L(L),
		.Q(Q)
	);
	//
	initial begin
		#200 $stop ;
	end
	localparam T = 10;
	always begin
			clk = 1'b0;
			#(T/2);
			clk = 1'b1;
			#(T/2);
	end
	
	initial begin
			En = 1'b1;
			up = 1'b1;
			reset = 1'b1;
			#5 
			reset = 1'b0;
			#25 
			En = 1'b0;
			#25
			En = 1'b1;
			L = 1'b1;
			D = 3'b111;
			#20
			L = 1'b0;
			up = 1'b0;
			#50;
	end
endmodule
