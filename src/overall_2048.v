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

// VGA display interconnect
wire [3:0] red_game, green_game, blue_game;
wire [3:0] red_win, green_win, blue_win;
wire [3:0] red_lose, green_lose, blue_lose;
wire won, lost;

wire vsync_game, hsync_game;
wire vsync_win, hsync_win;
// 7-segment display interconnect
wire [13:0] turns;

// disable the 7-segment decimal points
assign dp = 1;

// reg  [0:16*16-1] board_state;

// initial begin
// 	board_state = 32'h00010007;
// 	$display("board_state = %b", board_state);

// end
wire [0:4*16-1] board_state;


// generate 7-segment clock & display clock
clockdiv U0(
	.clk(clk),
	.clr(clr),
	.segclk(segclk),
	.dclk(dclk)
	);

// 2048 game controller
logic_2048 U1(
	.clk(segclk),
	.btnL(btnL),
	.btnR(btnR),
	.btnU(btnU),
	.btnD(btnD),
	.board_out(board_state),
    .turns(turns),
    .won(won),
    .lost(lost)
	);

// 7-segment display controller
seg_display U2(
	.fastHz(segclk),
	.turns(turns),
	.seg(seg),
	.an(an)
	);

// VGA controller
vga_small640x480 U3(
	.dclk(dclk),
	.clr(clr),
	.board_state(board_state),
	.hsync(hsync_game),
	.vsync(vsync_game),
	.red(red_game),
	.green(green_game),
	.blue(blue_game)
	);

// winning screen
// ysqd640x480 U4(
//     .dclk(dclk),
//     .clr(clr),
//     .hsync(hsync_win),
//     .vsync(vsync_win),
//     .red(red_win),
//     .green(green_win),
//     .blue(blue_win)
//     );
vga640x480 U4(
    .dclk(dclk),
    .clr(clr),
    .win(won),
    .hsync(hsync_win),
    .vsync(vsync_win),
    .red(red_win),
    .green(green_win),
    .blue(blue_win)
    );
// assign red_win = 4'b0000;
// assign green_win = 4'b1111;
// assign blue_win = 4'b0000;

// losing screen
// TODO
// assign red_lose = 4'b1111;
// assign green_lose = 4'b0000;
// assign blue_lose = 4'b0000;

// mux for VGA output
// assign red = (won) ? red_win : (lost) ? red_lose : red_game;
// assign green = (won) ? green_win : (lost) ? green_lose : green_game;
// assign blue = (won) ? blue_win : (lost) ? blue_lose : blue_game;

// assign hsync = (won) ? hsync_win : (lost) ? hsync_win : hsync_game;
// assign vsync = (won) ? vsync_win : (lost) ? vsync_win : vsync_game;
assign hsync = (won || lost) ? hsync_win : hsync_game;
assign vsync = (won || lost) ? vsync_win : vsync_game;

assign red = (won || lost) ? red_win : red_game;
assign green = (won || lost) ? green_win : green_game;
assign blue = (won || lost) ? blue_win : blue_game;
endmodule
