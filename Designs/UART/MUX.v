module MUX
(
	input [9:0] in,
	input [3:0] sel,
	output out
);
	assign out = in[sel];
endmodule