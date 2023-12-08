module seg_display (/*AUTOARG*/
   // Outputs
   an, seg,
   // Inputs
   fastHz,
   turns
   );

`include "seg_definitions.v"

   // Logic
   input [13:0] turns;
  //  input [3:0] blink;      // edge triggered display
   input        fastHz;               // 50 - 700Hz
   output reg [6:0] seg;            // 7-segment display
   output reg [3:0] an;              // 7-segment display anodes
    
   reg [1:0] active_an;             // active anode

   integer active_digit;
   
   initial begin
      active_an = 0;
   end

   always @ (posedge fastHz) begin
     case (active_an)
       2'b00: begin active_digit = (turns/1000)%10; an <= 4'b0111; end
       2'b01: begin active_digit = (turns/100)%10; an <= 4'b1011; end
       2'b10: begin active_digit = (turns/10)%10; an <= 4'b1101; end
       2'b11: begin active_digit = turns%10; an <= 4'b1110; end
      endcase
      seg <= seg_decode(active_digit); 
      // if (blink[active_an] == 0) seg <= 7'b1111111;
      active_an[1:0] <= active_an[1:0] + 1;
   end

   function [6:0] seg_decode;
     input [3:0] in;
     begin
       case (in)
         4'b0000: seg_decode = seg_0;
         4'b0001: seg_decode = seg_1;
         4'b0010: seg_decode = seg_2;
         4'b0011: seg_decode = seg_3;
         4'b0100: seg_decode = seg_4;
         4'b0101: seg_decode = seg_5;
         4'b0110: seg_decode = seg_6;
         4'b0111: seg_decode = seg_7;
         4'b1000: seg_decode = seg_8;
         4'b1001: seg_decode = seg_9;
         default: seg_decode = seg_0;
       endcase
     end
    endfunction

endmodule // seg_display
 