
module tb_adder();
    reg clk, reset, start;
    reg [15:0] a, b;
    wire [16:0] sum;
    wire done, overflow;
    
    // ایجاد نمونه از جمع کننده
    sequential_adder uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .a(a),
        .b(b),
        .sum(sum),
        .done(done),
        .overflow(overflow)
    );
    
    // تولید سیگنال کلاک
    always #5 clk = ~clk;
    
    // تست موارد مختلف
    initial begin
        // مقداردهی اولیه
        clk = 0;
        reset = 1;
        start = 0;
        a = 0;
        b = 0;
        
        // ریست سیستم
        #10 reset = 0;
        
        // تست ۱: ۱۰۰ + ۲۰۰ = ۳۰۰
        #10 a = 16'd100; b = 16'd200; start = 1;
        #10 start = 0;
        wait(done);
        $display("100 + 200 = %d (Expected: 300)", sum);
        
        // تست ۲: ۳۲۷۶۷ + ۱ = ۳۲۷۶۸ (بدون سرریز)
        #20 a = 16'd32767; b = 16'd1; start = 1;
        #10 start = 0;
        wait(done);
        $display("32767 + 1 = %d, Overflow: %b (Expected: 32768, 0)", sum, overflow);
        
        // تست ۳: ۳۲۷۶۷ + ۳۲۷۶۷ = ۶۵۵۳۴ (با سرریز)
        #20 a = 16'd32767; b = 16'd32767; start = 1;
        #10 start = 0;
        wait(done);
        $display("32767 + 32767 = %d, Overflow: %b (Expected: 65534, 1)", sum, overflow);
        
        // تست ۴: ۶۵۵۳۵ + ۱ = ۰ (سرریز کامل)
        #20 a = 16'd65535; b = 16'd1; start = 1;
        #10 start = 0;
        wait(done);
        $display("65535 + 1 = %d, Overflow: %b (Expected: 0, 1)", sum, overflow);
        
        $finish;
    end
    
    // مانیتورینگ سیگنال‌ها
    initial begin
        $monitor("Time=%0t, State=%b, Counter=%d, Carry=%b, Done=%b", 
                 $time, uut.current_state, uut.counter, uut.carry, done);
    end
endmodule