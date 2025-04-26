module TX
(
	input reset, clk,
	output tx
);
	wire [3:0] Q4;
	wire [7:0] Q8;
	wire [0:9]frame;
	assign frame = {1'b1,Q8,1'b0};
	MUX mux1 
	(
		.in(frame),
		.sel(Q4),
		.out(tx)
	);
	
	Counter_4bits count4
	(
		.reset(reset),
		.clk(clk),
		.en(en),
		.Q(Q4)
	);
	Counter_8bits count8
	(
		.reset(reset),
		.clk(en),
		.Q(Q8)
	);
endmodule