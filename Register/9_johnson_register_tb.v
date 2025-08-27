
module tb_johnson_counter;
    reg clk;
    reg rst_n;
    reg en;
    wire [3:0]count;

    johnson_counter dut(
        .clk(clk),
        .rst_n(rst_n),
        en(en),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        en = 0;

        #15 rst_n = 1;
        #10 en = 1;

        #100 $finish;
    end
endmodule
    