`timescale 1ns/1ns
module Counter_tb();
	reg reset , clk ;
	wire [2:0]Q ;
	//
	S_Counter uut (
		.reset(reset),
		.clk(clk),
		.Q(Q)
	);
	//
	initial begin
		#100 $stop ;
	end
	localparam T = 10;
	always begin
			clk = 1'b0;
			#(T/2);
			clk = 1'b1;
			#(T/2);
	end
	
	initial begin
			reset = 1'b1;
		#2 reset = 1'b0;
	end
endmodule
