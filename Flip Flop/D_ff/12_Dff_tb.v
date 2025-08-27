
`timescale 1ns/1ps

module d_ff_tb();

    reg clk , data;
    wire q;

  d_ff uut( .clk(clk) , .data(data) , .q(q));


  initial begin

    clk = 0;
    forever #10 clk = ~clk;

  end

  initial begin
     
    data = 0;

    #15 data = 1;
    #20 data = 0;
    #20 data = 1;

    #50 $finish;

  end

endmodule