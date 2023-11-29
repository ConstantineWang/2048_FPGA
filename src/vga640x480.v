`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:38 03/19/2013 
// Design Name: 
// Module Name:    vga640x480 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module vga640x480(
	input wire dclk,			//pixel clock: 25MHz
	input wire clr,			//asynchronous reset
	output wire hsync,		//horizontal sync out
	output wire vsync,		//vertical sync out
	output reg [3:0] red,	//red vga output
	output reg [3:0] green, //green vga output
	output reg [3:0] blue	//blue vga output
	);

`include "vga_definition.v"

// video structure constants
parameter hpixels = 800;// horizontal pixels per line
parameter vlines = 521; // vertical lines per frame
parameter hpulse = 96; 	// hsync pulse length
parameter vpulse = 2; 	// vsync pulse length
parameter hbp = 144; 	// end of horizontal back porch
parameter hfp = 784; 	// beginning of horizontal front porch
parameter vbp = 31; 		// end of vertical back porch
parameter vfp = 511; 	// beginning of vertical front porch
// active horizontal video is therefore: 784 - 144 = 640
// active vertical video is therefore: 511 - 31 = 480

// registers for storing the horizontal & vertical counters
reg [9:0] hc;
reg [9:0] vc;

integer square_size = 80;
integer boarder_width = 10;
integer boarder_left;
// integer boarder_right = 640 - boarder_left;
integer boarder_top = 80;


initial begin
	boarder_left = (640 - 5*boarder_width - 4*square_size) / 2;
end
// Horizontal & vertical counters --
// this is how we keep track of where we are on the screen.
// ------------------------
// Sequential "always block", which is a block that is
// only triggered on signal transitions or "edges".
// posedge = rising edge  &  negedge = falling edge
// Assignment statements can only be used on type "reg" and need to be of the "non-blocking" type: <=
always @(posedge dclk or posedge clr)
begin
	// reset condition
	if (clr == 1)
	begin
		hc <= 0;
		vc <= 0;
	end
	else
	begin
		// keep counting until the end of the line
		if (hc < hpixels - 1)
			hc <= hc + 1;
		else
		// When we hit the end of the line, reset the horizontal
		// counter and increment the vertical counter.
		// If vertical counter is at the end of the frame, then
		// reset that one too.
		begin
			hc <= 0;
			if (vc < vlines - 1)
				vc <= vc + 1;
			else
				vc <= 0;
		end
		
	end
end

// generate sync pulses (active low)
// ----------------
// "assign" statements are a quick way to
// give values to variables of type: wire
assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;
// display 100% saturation colorbars
// ------------------------
// Combinational "always block", which is a block that is
// triggered when anything in the "sensitivity list" changes.
// The asterisk implies that everything that is capable of triggering the block
// is automatically included in the sensitivty list.  In this case, it would be
// equivalent to the following: always @(hc, vc)
// Assignment statements can only be used on type "reg" and should be of the "blocking" type: =
always @(*)
begin
	// first check if we're within vertical active video range
	if (vc >= vbp && vc < vfp)
	begin
		// display boarder
			// we use 80x80 squares for the 2048 blocks, and width 10 boarder
		// horizontal, 135-145, 225-235, 315-325, 405-415, 495-505
		if (hc >= (hbp+boarder_left) && hc < (hbp+boarder_left+boarder_width))
		begin
			red = vga_boarder_r;
			green = vga_boarder_g;
			blue = vga_boarder_b;
		end
		else if (hc >= (hbp+boarder_left+boarder_width+square_size) && 
				 hc < (hbp+boarder_left+boarder_width+square_size+boarder_width))
		begin
			red = vga_boarder_r;
			green = vga_boarder_g;
			blue = vga_boarder_b;
		end
		else if (hc >= (hbp+boarder_left+2*boarder_width+2*square_size) && 
				 hc < (hbp+boarder_left+2*boarder_width+2*square_size+boarder_width))
		begin
			red = vga_boarder_r;
			green = vga_boarder_g;
			blue = vga_boarder_b;
		end
		else if (hc >= (hbp+boarder_left+3*boarder_width+3*square_size) && 
				 hc < (hbp+boarder_left+3*boarder_width+3*square_size+boarder_width))
		begin
			red = vga_boarder_r;
			green = vga_boarder_g;
			blue = vga_boarder_b;
		end
		else if (hc >= (hbp+boarder_left+4*boarder_width+4*square_size) && 
				 hc < (hbp+boarder_left+4*boarder_width+4*square_size+boarder_width))
		begin
			red = vga_boarder_r;
			green = vga_boarder_g;
			blue = vga_boarder_b;
		end

		// vertical, 30-40, 110-120, 190-200, 270-280, 350-360, 430-440, 510-520
		else if (vc >= (vbp+boarder_top) && vc < (vbp+boarder_top+boarder_width))
		begin
			red = vga_boarder_r;
			green = vga_boarder_g;
			blue = vga_boarder_b;
		end
		else if (vc >= (vbp+boarder_top+boarder_width+square_size) && 
				 vc < (vbp+boarder_top+boarder_width+square_size+boarder_width))
		begin
			red = vga_boarder_r;
			green = vga_boarder_g;
			blue = vga_boarder_b;
		end
		else if (vc >= (vbp+boarder_top+2*boarder_width+2*square_size) && 
				 vc < (vbp+boarder_top+2*boarder_width+2*square_size+boarder_width))
		begin
			red = vga_boarder_r;
			green = vga_boarder_g;
			blue = vga_boarder_b;
		end
		else if (vc >= (vbp+boarder_top+3*boarder_width+3*square_size) && 
				 vc < (vbp+boarder_top+3*boarder_width+3*square_size+boarder_width))
		begin
			red = vga_boarder_r;
			green = vga_boarder_g;
			blue = vga_boarder_b;
		end
		else if (vc >= (vbp+boarder_top+4*boarder_width+4*square_size) && 
				 vc < (vbp+boarder_top+4*boarder_width+4*square_size+boarder_width))
		begin
			red = vga_boarder_r;
			green = vga_boarder_g;
			blue = vga_boarder_b;
		end
		// // display yellow bar
		// else if (hc >= (hbp+80) && hc < (hbp+160))
		// begin
		// 	red = 3'b111;
		// 	green = 3'b111;
		// 	blue = 3'b000;
		// end
		// // display cyan bar
		// else if (hc >= (hbp+160) && hc < (hbp+240))
		// begin
		// 	red = 3'b000;
		// 	green = 3'b111;
		// 	blue = 3'b111;
		// end
		// // display green bar
		// else if (hc >= (hbp+240) && hc < (hbp+320))
		// begin
		// 	red = 3'b000;
		// 	green = 3'b111;
		// 	blue = 3'b000;
		// end
		// // display magenta bar
		// else if (hc >= (hbp+320) && hc < (hbp+400))
		// begin
		// 	red = 3'b111;
		// 	green = 3'b000;
		// 	blue = 3'b111;
		// end
		// // display red bar
		// else if (hc >= (hbp+400) && hc < (hbp+480))
		// begin
		// 	red = 3'b111;
		// 	green = 3'b000;
		// 	blue = 3'b000;
		// end
		// // display blue bar
		// else if (hc >= (hbp+480) && hc < (hbp+560))
		// begin
		// 	red = 3'b000;
		// 	green = 3'b000;
		// 	blue = 3'b111;
		// end
		// // display black bar
		// else if (hc >= (hbp+560) && hc < (hbp+640))
		// begin
		// 	red = 4'b000;
		// 	green = 4'b000;
		// 	blue = 4'b000;
		// end
		// // we're outside active horizontal range so display black
		// else
		else
		begin
			red = vga_blank_r;
			green = vga_blank_g;
			blue = vga_blank_b;
		end

		if (hc < (hbp+boarder_left) || hc >= (hbp+boarder_left+5*boarder_width+4*square_size) ||
			vc < (vbp+boarder_top) || vc >= (vbp+boarder_top+5*boarder_width+4*square_size))
		begin
			red = vga_blank_r;
			green = vga_blank_g;
			blue = vga_blank_b;
		end
		
	end
	// we're outside active vertical range so display black
	else
	begin
		red = vga_blank_r;
		green = vga_blank_g;
		blue = vga_blank_b;
	end
end

endmodule
