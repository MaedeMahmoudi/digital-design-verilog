
module tb_async_reset_register;
    reg clk, rst_n;
    reg [7:0]d;
    wire [7:0]q;

    async_reset_register DUT(.*);

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst_n = 0 ; d = 8'h00;
        #15 rst_n = 1;

        d = 8'h12;
        #10
        d = 8'h34;
        #10

        #3 rst_n = 0;
        #7 rst_n = 1;

        d = 8'h56;
        #10;
        d = 8'h78;
        #10;

        #20 $finish;

    end

endmodule