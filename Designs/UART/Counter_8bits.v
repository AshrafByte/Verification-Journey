module Counter_8bits
(
	input reset,clk,
	output reg [7:0] Q
);
	always @(posedge clk , negedge reset)
		if (!reset)
			Q <= 8'd0;
		else
			Q <= Q + 8'd1 ;
endmodule