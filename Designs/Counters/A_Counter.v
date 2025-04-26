module A_Counter
(
	input reset , clk,
	output [2:0]Q
);
	T_FF FF0 
	(
		.clk(clk),
		.reset(reset),
		.T(1'b1),
		.Q(Q[0])
	);
	T_FF FF1 
	(
		.clk(~Q[0]),
		.reset(reset),
		.T(1'b1),
		.Q(Q[1])
	);
	T_FF FF2 
	(
		.clk(~Q[1]),
		.reset(reset),
		.T(1'b1),
		.Q(Q[2])
	);

endmodule
