module register 
(
	input [3:0] I ,
	input load , clk ,
	output reg [3:0] Q
);
	always @(posedge clk)
		if(load)
			Q <= I ;
endmodule
