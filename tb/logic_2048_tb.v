module tb_logic_2048;
    reg clk;
    reg btnL;
    reg btnR;
    reg btnU;
    reg btnD;
    // reg integer board_in [0:15];
    wire [0:4*16-1] board_out_flat;
    integer board_out [0:15];

    integer random_num;
    integer i;
    
    logic_2048 dut (
        .clk(clk),
        .btnL(btnL),
        .btnR(btnR),
        .btnU(btnU),
        .btnD(btnD),
        //.board_in(board_in),
        .board_out(board_out_flat)
    );


    initial begin
        clk = 0;
        btnL = 0;
        btnR = 0;
        btnU = 0;
        btnD = 0;
        #133;
        btnR = 1;
        for (i = 0; i < 16; i = i + 1) begin
            board_out[i] = board_out_flat[i*4+:4];
        end
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("===================Right==================");
        #133
        btnR = 0;
        #182;

        for (i = 0; i < 16; i = i + 1) begin
            board_out[i] = board_out_flat[i*4+:4];
        end
        btnL = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("===================Left==================");
        #133
        btnL = 0;
        #182;

        for (i = 0; i < 16; i = i + 1) begin
            board_out[i] = board_out_flat[i*4+:4];
        end
        btnL = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("==================LEFT==================");
        #133
        btnL = 0;
        #182;


        for (i = 0; i < 16; i = i + 1) begin
            board_out[i] = board_out_flat[i*4+:4];
        end
        btnD = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("=================Down====================");
        #133
        btnD = 0;

        
        for (i = 0; i < 16; i = i + 1) begin
            board_out[i] = board_out_flat[i*4+:4];
        end

        btnR = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("===================Right==================");
        #133
        btnR = 0;
        #182;

        
        for (i = 0; i < 16; i = i + 1) begin
            board_out[i] = board_out_flat[i*4+:4];
        end
        btnL = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("===================Left==================");
        #133
        btnL = 0;
        #182;

        
        for (i = 0; i < 16; i = i + 1) begin
            board_out[i] = board_out_flat[i*4+:4];
        end
        btnU = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("==================UP==================");
        #133
        btnU = 0;
        #182;

        // btnD = 1;
        // //display four number in one line, and four lines in total 4*4=16 numbers
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        // $display("=================Down====================");
        // #133
        // btnD = 0;
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);

        



        // btnR = 1;
        // $display("===================Right==================");
        // #133
        // btnR = 0;
        // #182;

        // btnL = 1;
        // //display four number in one line, and four lines in total 4*4=16 numbers
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        // $display("===================Left==================");
        // #133
        // btnL = 0;
        // #182;

        // btnU = 1;
        // //display four number in one line, and four lines in total 4*4=16 numbers
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        // $display("==================UP==================");
        // #133
        // btnU = 0;
        // #182;

        // btnD = 1;
        // //display four number in one line, and four lines in total 4*4=16 numbers
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        // $display("=================Down====================");
        // #133
        // btnD = 0;
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);




        // btnR = 1;
        // $display("===================Right==================");
        // #133
        // btnR = 0;
        // #182;

        // btnL = 1;
        // //display four number in one line, and four lines in total 4*4=16 numbers
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        // $display("===================Left==================");
        // #133
        // btnL = 0;
        // #182;

        // btnU = 1;
        // //display four number in one line, and four lines in total 4*4=16 numbers
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        // $display("==================UP==================");
        // #133
        // btnU = 0;
        // #182;

        // btnD = 1;
        // //display four number in one line, and four lines in total 4*4=16 numbers
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        // $display("=================Down====================");
        // #133
        // btnD = 0;
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);


        // btnR = 1;
        // $display("===================Right==================");
        // #133
        // btnR = 0;
        // #182;

        // btnL = 1;
        // //display four number in one line, and four lines in total 4*4=16 numbers
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        // $display("===================Left==================");
        // #133
        // btnL = 0;
        // #182;

        // btnU = 1;
        // //display four number in one line, and four lines in total 4*4=16 numbers
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        // $display("==================UP==================");
        // #133
        // btnU = 0;
        // #182;

        // btnD = 1;
        // //display four number in one line, and four lines in total 4*4=16 numbers
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        // $display("=================Down====================");
        // #133
        // btnD = 0;
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);


        // btnR = 1;
        // $display("===================Right==================");
        // #133
        // btnR = 0;
        // #182;

        // btnL = 1;
        // //display four number in one line, and four lines in total 4*4=16 numbers
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        // $display("===================Left==================");
        // #133
        // btnL = 0;
        // #182;

        // btnU = 1;
        // //display four number in one line, and four lines in total 4*4=16 numbers
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        // $display("==================UP==================");
        // #133
        // btnU = 0;
        // #182;

        // btnD = 1;
        // //display four number in one line, and four lines in total 4*4=16 numbers
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        // $display("=================Down====================");
        // #133
        // btnD = 0;
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);


        // btnR = 1;
        // $display("===================Right==================");
        // #133
        // btnR = 0;
        // #182;

        // btnL = 1;
        // //display four number in one line, and four lines in total 4*4=16 numbers
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        // $display("===================Left==================");
        // #133
        // btnL = 0;
        // #182;

        // btnU = 1;
        // //display four number in one line, and four lines in total 4*4=16 numbers
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        // $display("==================UP==================");
        // #133
        // btnU = 0;
        // #182;

        // btnD = 1;
        // //display four number in one line, and four lines in total 4*4=16 numbers
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        // $display("=================Down====================");
        // #133
        // btnD = 0;
        // $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        // $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        // $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        // $display(board_out[12], board_out[13], board_out[14], board_out[15]);

        $finish;
    end

    always #5 clk = ~clk;


endmodule