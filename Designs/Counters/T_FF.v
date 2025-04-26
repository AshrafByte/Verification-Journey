module T_FF
(
	input T, clk, reset,
	output reg Q
);
	
	always @(posedge clk,posedge reset) begin
		if(reset)
			Q <= 1'b0;
		else
			Q <= T ? ~Q : Q ;
	end
endmodule
