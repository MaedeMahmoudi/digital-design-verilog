
`timescale 1ns/1ps

module tb_d_ff_async_reset();

    reg clk , reset , d;
    wire q;

    d_ff_async_reset uut( .clk(clk) , .reset(reset) , .d(d) ,.q(q));

    initial begin
        
        clk = 0;
        forever #10 clk = ~clk;

    end

    initial begin
        
        reset = 1;
        d = 0;

        #15 reset = 0;

        #5 d =1;
        #20 d = 0;

        #50 $finish;

    end
endmodule