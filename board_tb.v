module tb_board;
    reg clk;
    reg btn_L;
    reg btn_R;
    reg btn_U;
    reg btn_D;
    reg integer board_in [0:15];
    wire integer board_out [0:15];

    integer random_num;
    integer i;
    
    board dut (
        .clk(clk),
        .btn_L(btn_L),
        .btn_R(btn_R),
        .btn_U(btn_U),
        .btn_D(btn_D),
        .board_in(board_in),
        .board_out(board_out)
    );

    initial begin
        clk = 0;
        btn_L = 0;
        btn_R = 0;
        btn_U = 0;
        btn_D = 0;
        #133;
        btn_R = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("===================Right==================");
        #133
        btn_R = 0;
        #182;

        btn_L = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("===================Left==================");
        #133
        btn_L = 0;
        #182;

        btn_U = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("==================UP==================");
        #133
        btn_U = 0;
        #182;

        btn_D = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("=================Down====================");
        #133
        btn_D = 0;

        btn_R = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("===================Right==================");
        #133
        btn_R = 0;
        #182;

        btn_L = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("===================Left==================");
        #133
        btn_L = 0;
        #182;

        btn_U = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("==================UP==================");
        #133
        btn_U = 0;
        #182;

        btn_D = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("=================Down====================");
        #133
        btn_D = 0;
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);

        



        btn_R = 1;
        $display("===================Right==================");
        #133
        btn_R = 0;
        #182;

        btn_L = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("===================Left==================");
        #133
        btn_L = 0;
        #182;

        btn_U = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("==================UP==================");
        #133
        btn_U = 0;
        #182;

        btn_D = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("=================Down====================");
        #133
        btn_D = 0;
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);




        btn_R = 1;
        $display("===================Right==================");
        #133
        btn_R = 0;
        #182;

        btn_L = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("===================Left==================");
        #133
        btn_L = 0;
        #182;

        btn_U = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("==================UP==================");
        #133
        btn_U = 0;
        #182;

        btn_D = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("=================Down====================");
        #133
        btn_D = 0;
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);


        btn_R = 1;
        $display("===================Right==================");
        #133
        btn_R = 0;
        #182;

        btn_L = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("===================Left==================");
        #133
        btn_L = 0;
        #182;

        btn_U = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("==================UP==================");
        #133
        btn_U = 0;
        #182;

        btn_D = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("=================Down====================");
        #133
        btn_D = 0;
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);


        btn_R = 1;
        $display("===================Right==================");
        #133
        btn_R = 0;
        #182;

        btn_L = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("===================Left==================");
        #133
        btn_L = 0;
        #182;

        btn_U = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("==================UP==================");
        #133
        btn_U = 0;
        #182;

        btn_D = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("=================Down====================");
        #133
        btn_D = 0;
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);


        btn_R = 1;
        $display("===================Right==================");
        #133
        btn_R = 0;
        #182;

        btn_L = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("===================Left==================");
        #133
        btn_L = 0;
        #182;

        btn_U = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("==================UP==================");
        #133
        btn_U = 0;
        #182;

        btn_D = 1;
        //display four number in one line, and four lines in total 4*4=16 numbers
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);
        $display("=================Down====================");
        #133
        btn_D = 0;
        $display(board_out[0], board_out[1], board_out[2], board_out[3]);
        $display(board_out[4], board_out[5], board_out[6], board_out[7]);
        $display(board_out[8], board_out[9], board_out[10], board_out[11]);
        $display(board_out[12], board_out[13], board_out[14], board_out[15]);



        $dumpfile("tb_board.vcd");
        $dumpvars(0, tb_board);
        $finish;

        $finish;
    end

    always #5 clk = ~clk;


endmodule