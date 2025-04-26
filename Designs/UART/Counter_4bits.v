module Counter_4bits
(
	input reset,clk,
	output en,
	output reg [3:0] Q
);
	always @(posedge clk ,negedge reset)
		if (!reset) begin
			Q <= 4'd0;
			end
		else if (Q == 4'd9) begin
			Q <= 4'd0;
			end
		else begin
			Q <= Q + 4'd1;
			end
	assign en = (Q == 9);
endmodule
