
module tb_seq_detector_mealy();
    reg clk;
    reg rst_n;
    reg din;
    wire detect;

    seq_detector_mealy uut(
        .clk(clk),
        .rst_n(rst_n),
        .din(din),
        .detect(detect)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        din = 0;

        #10;
        rst_n = 1;

        #10 din = 1;
        #10 din = 0;
        #10 din = 0;
        #10 din = 0;
        #10 din = 1;
        #10 din = 1;
        #10 din = 0;
        #10 din = 0;
        #10 din = 0;
        #10 din = 0;
        
        #20 $finish;
    end
endmodule