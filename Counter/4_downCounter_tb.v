module tb_down_counter;
    reg clk;
    reg reset;
    reg enable;
    wire [3:0] count;

    // نمونه‌سازی ماژول
    down_counter dut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

    // تولید کلاک
    always #5 clk = ~clk;

    // تست موارد
    initial begin
        clk = 0;
        reset = 1;
        enable = 0;

        #10 reset = 0;
        enable = 1;

        #100 enable = 0;
        #20 enable = 1;

        #200 $finish;
    end

    // مانیتورینگ خروجی
    initial begin
        $monitor("Time = %0t, Count = %b (%0d)", $time, count, count);
    end
endmodule
