
module tb_enabled_register;
    reg clk,rst_n,en;
    reg [3:0]d;
    wire [3:0]q;

    enabled_register DUT(.*);
     
    always #5 clk = ~clk;

    initial begin
        clk = 0 ; rst_n = 0 ; en = 0; d = 4'b0000;
        #10 rst_n = 1;

        en = 1;
        d = 4'b1100;
        #10;
        d = 4'b0011;
        #10;

        en = 0;
        d = 4'b1111;
        #10;

        #20 $finish;
        
    end