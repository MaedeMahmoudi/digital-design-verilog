
module Upcounter_tb;
    reg clk;
    reg rst;
    reg enable;
    reg load;
    reg [3:0] data_in;
    wire [3:0] count;
    wire overflow;

    Upcounter uut(
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .load(load),
        .data_in(data_in),
        .count(count),
        .overflow(overflow)
    );

    always #5 clk = ~clk;

    clk = 0;
    rst = 1;
    enable = 0;
    load = 0;
    data_in = 4'b0000;

    #10 rst = 0;
    #10;

    #50 $finish;
endmodule
