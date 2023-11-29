function [11:0] get_pixel;
    input wire [9:0] hc;
    input wire [9:0] vc;
    input integer square_size;
    input integer boarder_top;
    input integer boarder_width;
    input integer boarder_left;
    input integer vbp;
    input integer hbp;

    input integer board_state [0:15];
    input reg [3:0] m_red [0:80*80*11-1];
    input reg [3:0] m_green [0:80*80*11-1];
    input reg [3:0] m_blue [0:80*80*11-1];

    reg [3:0] idx;
    integer row, col, r_offset, c_offset, val;
    begin
        row = (vc - vbp - boarder_top) / (square_size + boarder_width);
        col = (hc - hbp - boarder_left) / (square_size + boarder_width);
        r_offset = (vc - vbp - boarder_top) % (square_size + boarder_width);
        c_offset = (hc - hbp - boarder_left) % (square_size + boarder_width);
        idx = row * 4 + col;

        // part of boarder or empty
        if (r_offset < 10 || c_offset < 10 || board_state[idx] == 0)
        begin
            get_pixel = 12'b000000000000;
        end
        // out of bound
        else if (row < 0 || row > 3 || col < 0 || col > 3)
        begin
            get_pixel = 12'b000000000000;
        end
        
        else
        begin
            val = board_state[idx];
            get_pixel = {
                m_red[val*square_size*square_size+r_offset*square_size+c_offset], 
                m_green[val*square_size*square_size+r_offset*square_size+c_offset],
                m_blue[val*square_size*square_size+r_offset*square_size+c_offset]
            };

        end


    end



endfunction