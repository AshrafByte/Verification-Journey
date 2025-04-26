`timescale 1ns/1ns
module vga_controller_tb ();
// clk freq = 40 MHz ---> clk = 25 ns.
localparam T = 25;
reg clk , reset_n ;
reg [2:0] switches;
wire hsync,vsync,video_on ;
wire [2:0] RGB;
wire [10:0] pixel_x , pixel_y;

vga_controller uut (
	.clk(clk),
	.reset_n(reset_n),
	.switches(switches),
	
	.vsync(vsync),
	.hsync(hsync),
	.RGB(RGB),
	.video_on(video_on),
	.pixel_x(pixel_x),
	.pixel_y(pixel_y)
);

always #(T/2) clk = ~clk;
always #20 switches = switches + 1;

initial 
	begin
		switches = 0;
		clk = 0;
		reset_n = 0;
		#1 reset_n = 1;
	end
	
endmodule
