
module tb_counter;
    reg clk;
    reg rst;
    reg enable;
    reg load;
    reg [3:0] data_in;
    wire [3:0] count;

    counter uut(
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .load(load),
        .data_in(data_in),
        .count(count) 
           
        );

    always #5 clk = ~clk;

    clk = 0;
    rst = 0;
    enable = 0;
    load = 0;
    data_in = 4'b0000;

    rst = 1;
    #10;
    rst = 0;
    #20;


    load = 1;
    data_in = 4'b1010;
    #10;
    load = 0;
    enable = 1;
    #50;

    repeat(3)begin
        load = 1;
        data_in = data_in + 2;
        #10;
        load = 0;
        enable = 1;
        #30;
        enable = 0;
        #10;
    end 
endmodule
