module vga_controller //SVGA Signal 800 x 600 @ 60 Hz
(
	input clk , reset_n, // asynchrous active low reset.
	input [2:0]	switches,
	output hsync , vsync , video_on,
	output [2:0] RGB ,
	output reg [10:0] pixel_x,pixel_y // both signals are generated usng counters.
);
	// X parameters unit : pixel , Y parameters unit : line
	localparam visibleAreaX = 	11'd 800 ;
	localparam visibleAreaY = 	11'd 600 ;
	localparam frontPorchX 	= 	11'd 40 ;
	localparam frontPorchY 	= 	11'd 1 ;
	localparam syncPulseX 	= 	11'd 128 ; // Polarity of horizontal sync pulse is positive.
	localparam syncPulseY 	= 	11'd 4 ;   // Polarity of vertical sync pulse is positive.
	localparam backPorchX 	= 	11'd 88 ;
	localparam backPorchY 	= 	11'd 23 ;
	localparam wholeLine 	= 	11'd 1056;
	localparam wholeFrame 	= 	11'd 628;
	
// vga_sync

	// x_pixels (responsible for generating pixels in each line)  
	always @(posedge clk , negedge reset_n)
		if (!reset_n)
			pixel_x <= 0 ;
		else if (pixel_x == wholeLine - 1)
			pixel_x <= 0 ;
		else
			pixel_x <= pixel_x + 1 ;
			
	assign hsync = (pixel_x >= visibleAreaX + frontPorchX - 1   &&  pixel_x < visibleAreaX + frontPorchX + syncPulseX - 1 );  
			
	// y_pixels (responsible for generating lines in the whole frame)
	always @(posedge clk , negedge reset_n)
		if (!reset_n)
			pixel_y <= 0 ;
		else if (pixel_x == wholeLine - 1 && pixel_y == wholeFrame - 1)
			pixel_y <= 0 ;
		else if (pixel_x == wholeLine - 1)
			pixel_y <= pixel_y + 1 ;
			
		assign vsync = ( pixel_y >= visibleAreaY + frontPorchY - 1   &&  pixel_y < visibleAreaY + frontPorchY + syncPulseY - 1 );
		
	// video on signal (high when we are in the visible area)
		assign video_on = ( pixel_x < visibleAreaX  && pixel_y < visibleAreaY );
	
// RBG generator	(assign colors using switches when the screen is in video_on mode and it turn the screen off otherwise)  
		assign RGB = video_on ? switches : 3'b000 ;	
	
endmodule