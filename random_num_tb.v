
module random_num_tb;

  reg clk;
  wire [3:0] num;

  random_num dut (
    .clk(clk),
    .num(num)
  );

  always #5 clk = ~clk;

  // Stimulus generation
  initial begin
    clk = 0;
    #1;

    // Test case 1
    #1;
    $display("num = %b", num);

    // Test case 2
    #100;
    $display("num = %b", num);

    // Test case 3
    #10;
    $display("num = %b", num);

    // Test case 4
    #10;
    $display("num = %b", num);

    // Test case 5
    #1;
    $display("num = %b", num);

    // End simulation
    #10;
    $finish;
  end

endmodule