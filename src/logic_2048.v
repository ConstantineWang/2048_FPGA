module logic_2048 (
    input wire clk,
    input wire btnL,
    input wire btnR,
    input wire btnU,
    input wire btnD,
    // input integer board_in[0:15],
    output reg [0:NUM_WIDTH*16-1] board_out,
    output reg [13:0] turns = 0,
    output reg won = 0,
    output reg lost = 0
);
    parameter NUM_WIDTH = 4;
    wire [3:0] random_num;
    reg [3:0] random_tmp;
    integer i;
    integer j;
    reg [10:0] screen_timer = 0;
    parameter screen_timer_max = 1200;

    integer idx;
    integer last_num;
    reg [0:NUM_WIDTH*16-1] board = 0;
    integer random_count;

    // parameter LEFT = 0;
    // parameter RIGHT = 1;
    // parameter UP = 2;
    // parameter DOWN = 3;

    // reg [0:63] dir_x = 64'hFFFF000100000000;
    // reg [0:63] dir_y = 64'h000000000001FFFF;

    reg last_btnR = 0;
    reg last_btnL = 0;
    reg last_btnU = 0;
    reg last_btnD = 0;

    
    random_num rdm (
        .clk(clk),
        .num(random_num)
    );

    task spawn_random;
        reg added;
        begin
            random_tmp = random_num;
            added = 0;
            for (i = 0; i < 16; i = i + 1) begin
                if (!added && !board[random_tmp*NUM_WIDTH+:NUM_WIDTH]) begin
                    board[random_tmp*NUM_WIDTH+:NUM_WIDTH] = 1;
                    added = 1;
                end
                random_tmp = random_tmp + 1;
            end
        end
    endtask

    task check_win;
        begin
            won = 0;
            for (i = 0; i < 4; i = i + 1) begin
                for (j = 0; j < 4; j = j + 1) begin
                    if (board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH] == 11) begin
                        won = 1;
                    end
                end
            end
        end
    endtask

    task check_lose;
    begin
        lost = 0;
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                    if (board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH] == 0) begin
                        disable check_lose;
                    end
                    if (j < 3 && board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH] == board[(i*4+(j+1))*NUM_WIDTH+:NUM_WIDTH]) begin
                        disable check_lose;
                    end
                    if (i < 3 && board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH] == board[((i+1)*4+j)*NUM_WIDTH+:NUM_WIDTH]) begin
                        disable check_lose;
                    end
                end
            end
        lost = 1;
        end
    endtask

    always @ (board) begin
        board_out = board;
    end

    always @ (posedge clk) begin
        if ((won || lost) && screen_timer < screen_timer_max) begin
            screen_timer = screen_timer + 1;
        end
        else if (won || lost) begin
            screen_timer = 0;
            won = 0;
            lost = 0;
            board = 0;
            turns = 0;
        end
        else begin
            // screen_timer = 0;
            // move right
            if (btnR && !last_btnR) begin
                turns = turns + 1;
                for (i = 0; i < 4; i = i + 1) begin
                    // keep track of last active number
                    idx = 3;
                    last_num = board[(i*4+idx)*NUM_WIDTH+:NUM_WIDTH];

                    // start from right
                    //      if 0, go left
                    //      otherwise, scan left until there is a number
                    //          if same, merge
                    //          otherwise, move the new number to the right

                    for (j = 2; j >= 0; j = j - 1) begin
                        // $display("last_num = %d, idx = %d, current = %d", last_num, idx, board[(i*4+j)*4+:4]);

                        // 2 1 1 0
                        // last_num = 0, idx = 3
                        // last_num = 1, idx = 2
                        // last_num = 2; idx = 1
                        // last_num = 2; idx = 1

                        if (board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH]) begin
                            if (last_num == board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH]) begin
                                board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH] = 0;
                                board[(i*4+idx)*NUM_WIDTH+:NUM_WIDTH] = last_num + 1;
                                idx = idx - 1;
                                last_num = 0;
                            end
                            else begin
                                if (last_num) 
                                    idx = idx - 1;
                                last_num = board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH];
                                board[(i*4+idx)*NUM_WIDTH+:NUM_WIDTH] = board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH];
                                if (idx != j)
                                    board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH] = 0;
                            end
                        end

                    end
                end
                spawn_random();
                check_win();
                check_lose();
            end
            last_btnR = btnR;

            if (btnL && !last_btnL) begin
                turns = turns + 1;
                for (i = 0; i < 4; i = i + 1) begin
                    // keep track of last active number
                    idx = 0;
                    last_num = board[(i*4+idx)*NUM_WIDTH+:NUM_WIDTH];

                    // start from left
                    //      if 0, go right
                    //      otherwise, scan right until there is a number
                    //          if same, merge
                    //          otherwise, move the new number to the left

                    for (j = 1; j < 4; j = j + 1) begin
                        $display("last_num = %d, idx = %d, current = %d", last_num, idx, board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH]);
                        if (board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH]) begin
                            if (last_num == board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH]) begin
                                board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH] = 0;
                                board[(i*4+idx)*NUM_WIDTH+:NUM_WIDTH] = last_num + 1;
                                idx = idx + 1;
                                last_num = 0;
                            end
                            else begin
                                if (last_num) 
                                    idx = idx + 1;
                                last_num = board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH];
                                board[(i*4+idx)*NUM_WIDTH+:NUM_WIDTH] = board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH];
                                if (idx != j)
                                    board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH] = 0;
                            end
                        end
                    end
                end
                spawn_random();
                check_win();
                check_lose();
            end
            last_btnL = btnL;
            if (btnU && !last_btnU) begin
                turns = turns + 1;
                for (j = 0; j < 4; j = j + 1) begin
                    // keep track of last active number
                    idx = 0;
                    last_num = board[(idx*4+j)*NUM_WIDTH+:NUM_WIDTH];

                    // start from top
                    //      if 0, go down
                    //      otherwise, scan down until there is a number
                    //          if same, merge
                    //          otherwise, move the new number to the top

                    for (i = 1; i < 4; i = i + 1) begin
                        if (board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH]) begin
                            if (last_num == board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH]) begin
                                board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH] = 0;
                                board[(idx*4+j)*NUM_WIDTH+:NUM_WIDTH] = last_num + 1;
                                idx = idx + 1;
                                last_num = 0;
                            end
                            else begin
                                if (last_num) 
                                    idx = idx + 1;
                                last_num = board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH];
                                board[(idx*4+j)*NUM_WIDTH+:NUM_WIDTH] = board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH];
                                if (idx != i)
                                    board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH] = 0;
                            end
                        end
                    end
                end
                spawn_random();
                check_win();
                check_lose();
            end
            last_btnU = btnU;

            if (btnD && !last_btnD) begin
                turns = turns + 1;
                for (j = 0; j < 4; j = j + 1) begin
                    // keep track of last active number
                    idx = 3;
                    last_num = board[(idx*4+j)*NUM_WIDTH+:NUM_WIDTH];

                    // start from bottom
                    //      if 0, go up
                    //      otherwise, scan up until there is a number
                    //          if same, merge
                    //          otherwise, move the new number to the bottom

                    for (i = 2; i >= 0; i = i - 1) begin
                        if (board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH]) begin
                            if (last_num == board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH]) begin
                                board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH] = 0;
                                board[(idx*4+j)*NUM_WIDTH+:NUM_WIDTH] = last_num + 1;
                                idx = idx - 1;
                                last_num = 0;
                            end
                            else begin
                                if (last_num) 
                                    idx = idx - 1;
                                last_num = board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH];
                                board[(idx*4+j)*NUM_WIDTH+:NUM_WIDTH] = board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH];
                                if (idx != i)
                                    board[(i*4+j)*NUM_WIDTH+:NUM_WIDTH] = 0;
                            end
                        end
                    end
                end
                spawn_random();
                check_win();
                check_lose();
            end
            last_btnD = btnD;

        end
    end
    
     
endmodule
