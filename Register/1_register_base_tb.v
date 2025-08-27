
module tb_basic_register_no_reset;
    reg clk;
    reg [3:0]d;
    wire [3:0]q;

    basic_register_no_reset DUT(.*);

    always #5 clk = ~clk;

    initial begin
        clk = 0 ; d = 4'b0000;

        #10 d = 4'b0001;
        #10 d = 4'b0010;
        #10 d = 4'b0100;
        #10 d = 4'b1111;

        #20 $finish;
    end

endmodule