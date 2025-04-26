module seq 
(
	input D, reset, clear, clk, // reset -> async , clear -> sync
	output Q
);
	reg Q_reg , Q_next;
	assign Q = Q_reg;
	
	always @(D,clear) begin
		if (clear)
			Q_next = 1'b0;
		else
			Q_next = D ;
	end
	
	always @(posedge clk , posedge reset) begin
		if (reset)
			Q_reg <= 1'b0;
		else
			Q_reg <= Q_next ;
	end
	
endmodule
