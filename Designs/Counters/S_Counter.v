module S_Counter
(
	input clk , reset,
	output [2:0]Q
);
		wire [2:0] T;
		assign T[0] = 1'b1;
		T_FF FF0 
		(
			.clk(clk),
			.reset(reset),
			.T(T[0]),
			.Q(Q[0])
		);
		assign T[1] = T[0] & Q[0];
		T_FF FF1 
		(
			.clk(clk),
			.reset(reset),
			.T(T[1]),
			.Q(Q[1])
		);
		assign T[2] = T[1] & Q[1];
		T_FF FF2 
		(
			.clk(clk),
			.reset(reset),
			.T(T[2]),
			.Q(Q[2])
		);
endmodule