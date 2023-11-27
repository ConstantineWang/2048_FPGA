module random_num (
  input wire clk,
  output reg [3:0] num
);

  reg [3:0] count;

  initial count = 4'b0000;
  initial num = 4'b0000;

  always @(posedge clk) begin
    
    if (count == 4'b1111) begin
      count <= 4'b0000;
      num <= 4'b0001;
    end
    else begin
      count <= count + 1;
      num <= num + 1;
    end
  end


endmodule

