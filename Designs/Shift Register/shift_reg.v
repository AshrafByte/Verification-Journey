module shift_reg 
(
	input SI,
	input clk,
	output SO 
);
	reg [3:0]Q;
	always @(posedge clk) begin
		Q <= {SI,Q[3:1]} ;
	end
	assign SO = Q[0];
endmodule