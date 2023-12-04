`timescale 1ns / 1ps

module top_2048_tb;

  // Inputs
  reg clk;
  reg clr;

  // Outputs
  wire [6:0] seg;
  wire [3:0] an;
  wire dp;
  wire [3:0] red;
  wire [3:0] green;
  wire [3:0] blue;
  wire hsync;
  wire vsync;

  // Instantiate the module under test
  top_2048 UUT (
    .clk(clk),
    .clr(clr),
    .seg(seg),
    .an(an),
    .dp(dp),
    .red(red),
    .green(green),
    .blue(blue),
    .hsync(hsync),
    .vsync(vsync)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Reset sequence
  initial begin
    clr = 1; // Assert reset
    #10;
    clr = 0; // De-assert reset
    #10;
    // Add other initializations if needed
  end

  // Add your test scenarios here

  // End simulation after a specific duration
  initial #1000 $finish;

endmodule
