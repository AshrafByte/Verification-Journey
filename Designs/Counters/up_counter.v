module up_counter
(
	input clk , reset,
	output reg [2:0]Q
);
	always @(posedge clk , posedge reset) begin
		if (reset)
			Q <= 'b0;
		else
			Q <= Q + 1;
	end
endmodule