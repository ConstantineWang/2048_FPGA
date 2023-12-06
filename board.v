module board (
    input wire clk,
    input wire btn_L,
    input wire btn_R,
    input wire btn_U,
    input wire btn_D,
    // input integer board_in[0:15],
    output reg [0:16*16-1] board_out
);

    wire [3:0] random_num;
    reg [3:0] random_tmp;
    integer i;
    integer j;
    integer times;
    reg [15:0] board [0:15];
    integer random_count;
    
    random_num rdm (
        .clk(clk),
        .num(random_num)
    );


    initial begin
        $readmemh("zeroboard.mem", board);
        // board[random_num] = 1;
    end

    always @ (board[0] or board[1] or board[2] or board[3] or board[4] or board[5] or board[6] or board[7] or board[8] or board[9] or board[10] or board[11] or board[12] or board[13] or board[14] or board[15]) begin
        for (i = 0; i < 16; i = i + 1) begin
            board_out[i*16+:16] = board[i];
        end
    end

    always @ (posedge btn_R) begin
        // Shift all tiles to the right
        for (times = 0; times < 4; times = times + 1) begin
            for (i = 0; i < 4 ; i = i + 1) begin
                for (j = 3; j >= 0; j = j - 1) begin
                    if (board[i * 4 + j] == 0) begin
                        if(j != 0) begin
                            board[i * 4 + j] = board[i * 4 + j - 1];
                            board[i * 4 + j - 1] = 0;
                        end
                    end
                end
            end
        end

        // Merge tiles
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 3; j >= 1; j = j - 1) begin
                if (board[i * 4 + j] && board[i * 4 + j] == board[i * 4 + j - 1]) begin
                    board[i * 4 + j] = board[i * 4 + j] + 1;
                    board[i * 4 + j - 1] = 0;
                end
            end
        end

        for (times = 0; times < 4; times = times + 1) begin
            for (i = 0; i < 4 ; i = i + 1) begin
                for (j = 3; j >= 0; j = j - 1) begin
                    if (board[i * 4 + j] == 0) begin
                        if(j != 0) begin
                            board[i * 4 + j] = board[i * 4 + j - 1];
                            board[i * 4 + j - 1] = 0;
                        end
                    end
                end
            end
        end
        
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 3; j >= 1; j = j - 1) begin
                if (board[i * 4 + j] && board[i * 4 + j] == board[i * 4 + j - 1]) begin
                    board[i * 4 + j] = board[i * 4 + j] + 1;
                    board[i * 4 + j - 1] = 0;
                end
            end
        end

        for (times = 0; times < 4; times = times + 1) begin
            for (i = 0; i < 4 ; i = i + 1) begin
                for (j = 3; j >= 0; j = j - 1) begin
                    if (board[i * 4 + j] == 0) begin
                        if(j != 0) begin
                            board[i * 4 + j] = board[i * 4 + j - 1];
                            board[i * 4 + j - 1] = 0;
                        end
                    end
                end
            end
        end

        times = 0;
        random_tmp = random_num;
        random_count = 0;
        while (board[random_tmp] != 0 && random_count != 16) begin
            random_count = random_count + 1;
            random_tmp = random_tmp + 1;
            if (random_tmp == 16) begin
                random_tmp = 0;
            end
        end
        if (random_count != 16)
            board[random_tmp] = 1;
    end

    always @ (posedge btn_L) begin
        // Shift all tiles to the left
        for (times = 0; times < 4; times = times + 1) begin
            for (i = 0; i < 4 ; i = i + 1) begin
                for (j = 0; j < 4; j = j + 1) begin
                    if (board[i * 4 + j] == 0) begin
                        if(j != 3) begin
                            board[i * 4 + j] = board[i * 4 + j + 1];
                            board[i * 4 + j + 1] = 0;
                        end
                    end
                end
            end
        end

        // Merge tiles
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 3; j = j + 1) begin
                if (board[i * 4 + j] && board[i * 4 + j] == board[i * 4 + j + 1]) begin
                    board[i * 4 + j] = board[i * 4 + j] + 1;
                    board[i * 4 + j + 1] = 0;
                end
            end
        end

        for (times = 0; times < 4; times = times + 1) begin
            for (i = 0; i < 4 ; i = i + 1) begin
                for (j = 0; j < 4; j = j + 1) begin
                    if (board[i * 4 + j] == 0) begin
                        if(j != 3) begin
                            board[i * 4 + j] = board[i * 4 + j + 1];
                            board[i * 4 + j + 1] = 0;
                        end
                    end
                end
            end
        end
        
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 3; j = j + 1) begin
                if (board[i * 4 + j] && board[i * 4 + j] == board[i * 4 + j + 1]) begin
                    board[i * 4 + j] = board[i * 4 + j] + 1;
                    board[i * 4 + j + 1] = 0;
                end
            end
        end

        for (times = 0; times < 4; times = times + 1) begin
            for (i = 0; i < 4 ; i = i + 1) begin
                for (j = 0; j < 4; j = j + 1) begin
                    if (board[i * 4 + j] == 0) begin
                        if(j != 3) begin
                            board[i * 4 + j] = board[i * 4 + j + 1];
                            board[i * 4 + j + 1] = 0;
                        end
                    end
                end
            end
        end

        times = 0;
        random_tmp = random_num;
        random_count = 0;
        while (board[random_tmp] != 0 && random_count != 16) begin
            random_count = random_count + 1;
            random_tmp = random_tmp + 1;
            if (random_tmp == 16) begin
                random_tmp = 0;
            end
        end
        if (random_count != 16)
            board[random_tmp] = 1;
    end

    always @ (posedge btn_U) begin
        // Shift all tiles to the up
        for (times = 0; times < 4; times = times + 1) begin
            for (j = 0; j < 4 ; j = j + 1) begin
                for (i = 0; i < 4; i = i + 1) begin
                    if (board[i * 4 + j] == 0) begin
                        if(i != 3) begin
                            board[i * 4 + j] = board[(i + 1) * 4 + j];
                            board[(i + 1) * 4 + j] = 0;
                        end
                    end
                end
            end
        end

        // Merge tiles
        for (j = 0; j < 4; j = j + 1) begin
            for (i = 0; i < 3; i = i + 1) begin
                if (board[i * 4 + j] && board[i * 4 + j] == board[(i + 1) * 4 + j]) begin
                    board[i * 4 + j] = board[i * 4 + j] + 1;
                    board[(i + 1) * 4 + j] = 0;
                end
            end
        end

        for (times = 0; times < 4; times = times + 1) begin
            for (j = 0; j < 4 ; j = j + 1) begin
                for (i = 0; i < 4; i = i + 1) begin
                    if (board[i * 4 + j] == 0) begin
                        if(i != 3) begin
                            board[i * 4 + j] = board[(i + 1) * 4 + j];
                            board[(i + 1) * 4 + j] = 0;
                        end
                    end
                end
            end
        end
        
        for (j = 0; j < 4; j = j + 1) begin
            for (i = 0; i < 3; i = i + 1) begin
                if (board[i * 4 + j] && board[i * 4 + j] == board[(i + 1) * 4 + j]) begin
                    board[i * 4 + j] = board[i * 4 + j] + 1;
                    board[(i + 1) * 4 + j] = 0;
                end
            end
        end

        for (times = 0; times < 4; times = times + 1) begin
            for (j = 0; j < 4 ; j = j + 1) begin
                for (i = 0; i < 4; i = i + 1) begin
                    if (board[i * 4 + j] == 0) begin
                        if(i != 3) begin
                            board[i * 4 + j] = board[(i + 1) * 4 + j];
                            board[(i + 1) * 4 + j] = 0;
                        end
                    end
                end
            end
        end

        times = 0;
        random_tmp = random_num;
        random_count = 0;
        while (board[random_tmp] != 0 && random_count != 16) begin
            random_count = random_count + 1;
            random_tmp = random_tmp + 1;
            if (random_tmp == 16) begin
                random_tmp = 0;
            end
        end
        if (random_count != 16)
            board[random_tmp] = 1;
    end

    always @ (posedge btn_D) begin
        // Shift all tiles to the down
        for (times = 0; times < 4; times = times + 1) begin
            for (j = 0; j < 4 ; j = j + 1) begin
                for (i = 3; i >= 0; i = i - 1) begin
                    if (board[i * 4 + j] == 0) begin
                        if(i != 0) begin
                            board[i * 4 + j] = board[(i - 1) * 4 + j];
                            board[(i - 1) * 4 + j] = 0;
                        end
                    end
                end
            end
        end

        // Merge tiles
        for (j = 0; j < 4; j = j + 1) begin
            for (i = 3; i >= 1; i = i - 1) begin
                if (board[i * 4 + j]  && board[i * 4 + j] == board[(i - 1) * 4 + j]) begin
                    board[i * 4 + j] = board[i * 4 + j] + 1;
                    board[(i - 1) * 4 + j] = 0;
                end
            end
        end

        for (times = 0; times < 4; times = times + 1) begin
            for (j = 0; j < 4 ; j = j + 1) begin
                for (i = 3; i >= 0; i = i - 1) begin
                    if (board[i * 4 + j] == 0) begin
                        if(i != 0) begin
                            board[i * 4 + j] = board[(i - 1) * 4 + j];
                            board[(i - 1) * 4 + j] = 0;
                        end
                    end
                end
            end
        end
        
        for (j = 0; j < 4; j = j + 1) begin
            for (i = 3; i >= 1; i = i - 1) begin
                if (board[i * 4 + j] && board[i * 4 + j] == board[(i - 1) * 4 + j]) begin
                    board[i * 4 + j] = board[i * 4 + j] + 1;
                    board[(i - 1) * 4 + j] = 0;
                end
            end
        end

        for (times = 0; times < 4; times = times + 1) begin
            for (j = 0; j < 4 ; j = j + 1) begin
                for (i = 3; i >= 0; i = i - 1) begin
                    if (board[i * 4 + j] == 0) begin
                        if(i != 0) begin
                            board[i * 4 + j] = board[(i - 1) * 4 + j];
                            board[(i - 1) * 4 + j] = 0;
                        end
                    end
                end
            end
        end

        times = 0;
        random_tmp = random_num;
        random_count = 0;
        while (board[random_tmp] != 0 && random_count != 16) begin
            random_count = random_count + 1;
            random_tmp = random_tmp + 1;
            if (random_tmp == 16) begin
                random_tmp = 0;
            end
        end
        if (random_count != 16)
            board[random_tmp] = 1;
    end    
  
endmodule
