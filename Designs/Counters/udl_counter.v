module udl_counter
(
	input L , clk , En , up, reset,
	input [2:0] D,
	output reg [2:0] Q
);
	always @(posedge clk , posedge reset) begin
		if (reset)
			Q <= 3'd0;
		else if (En)
			casex({L,up})
				2'b00: Q <= Q-1;
				2'b01: Q <= Q+1; 
				2'b1x: Q <= D;
			endcase
	end
endmodule