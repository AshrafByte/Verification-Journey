module TX2
(
	input clk , reset,
	output tx
);
 //4_bit counter
	reg [3:0] Q4;
	wire en;
	always @(posedge clk , negedge reset)
		if (~reset)
			Q4 <= 4'd0;
		else if (Q4 == 4'd9)
			Q4 <= 4'd0;
		else
			Q4 <= Q4 + 4'd1;
			
	assign en = (Q4 == 9) ;
	
	//8_bit counter
	reg [7:0] Q8;
	always @(posedge en , negedge reset)
		if (~reset)
			Q8 <= 8'd0;
		else
			Q8 <= Q8 + 8'd1;
	// MUX
	wire [0:9] frame ;
	assign frame = {1'b1,Q8[7:0],1'b0};
	assign tx = frame[Q4];
endmodule