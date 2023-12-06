`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:28:25 03/19/2013 
// Design Name: 
// Module Name:    NERP_demo_top 
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
module overall_2048(
	input wire clk,			//master clock = 100MHz
	input wire clr,			//right-most pushbutton for reset
	input wire btnL,
	input wire btnR,
	input wire btnU,
	input wire btnD,
	output wire [6:0] seg,	//7-segment display LEDs
	output wire [3:0] an,	//7-segment display anode enable
	output wire dp,			//7-segment display decimal point
	output wire [3:0] red,	//red vga output - 4 bits
	output wire [3:0] green,//green vga output - 4 bits
	output wire [3:0] blue,	//blue vga output - 4 bits
	output wire hsync,		//horizontal sync out
	output wire vsync			//vertical sync out

	);

// 7-segment clock interconnect
wire segclk;

// VGA display clock interconnect
wire dclk;

// disable the 7-segment decimal points
assign dp = 1;

// reg  [0:16*16-1] board_state;

// initial begin
// 	board_state = 32'h00010007;
// 	$display("board_state = %b", board_state);

// end
wire [0:16*16-1] board_state;


// generate 7-segment clock & display clock
clockdiv U0(
	.clk(clk),
	.clr(clr),
	.segclk(segclk),
	.dclk(dclk)
	);

// 2048 game controller
board U1(
	.clk(segclk),
	.btn_L(btnL),
	.btn_R(btnR),
	.btn_U(btnU),
	.btn_D(btnD),
	.board_out(board_state)
	);

// 7-segment display controller
segdisplay U2(
	.segclk(segclk),
	.clr(clr),
	.seg(seg),
	.an(an)
	);

// VGA controller
vga_small640x480 U3(
	.dclk(dclk),
	.clr(clr),
	.board_state(board_state),
	.hsync(hsync),
	.vsync(vsync),
	.red(red),
	.green(green),
	.blue(blue)
	);

endmodule
