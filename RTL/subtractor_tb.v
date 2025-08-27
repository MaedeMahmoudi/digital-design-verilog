
module tb_subtractor();
    reg clk, reset, start;
    reg [15:0] a, b;
    wire [15:0] result;
    wire borrow, done, underflow;
    
    // ایجاد نمونه از تفریق کننده
    sequential_subtractor uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .a(a),
        .b(b),
        .result(result),
        .borrow(borrow),
        .done(done),
        .underflow(underflow)
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
        
        // تست ۱: ۲۰۰ - ۱۰۰ = ۱۰۰
        #10 a = 16'd200; b = 16'd100; start = 1;
        #10 start = 0;
        wait(done);
        $display("200 - 100 = %d, Borrow: %b, Underflow: %b (Expected: 100, 0, 0)", 
                 result, borrow, underflow);
        
        // تست ۲: ۱۰۰ - ۲۰۰ = -۱۰۰ (زیرریز)
        #20 a = 16'd100; b = 16'd200; start = 1;
        #10 start = 0;
        wait(done);
        $display("100 - 200 = %d, Borrow: %b, Underflow: %b (Expected: 65436, 1, 1)", 
                 result, borrow, underflow);
        
        // تست ۳: ۰ - ۱ = -۱ (زیرریز)
        #20 a = 16'd0; b = 16'd1; start = 1;
        #10 start = 0;
        wait(done);
        $display("0 - 1 = %d, Borrow: %b, Underflow: %b (Expected: 65535, 1, 1)", 
                 result, borrow, underflow);
        
        // تست ۴: ۶۵۵۳۵ - ۱ = ۶۵۵۳۴
        #20 a = 16'd65535; b = 16'd1; start = 1;
        #10 start = 0;
        wait(done);
        $display("65535 - 1 = %d, Borrow: %b, Underflow: %b (Expected: 65534, 0, 0)", 
                 result, borrow, underflow);
        
        // تست ۵: ۳۲۷۶۸ - ۳۲۷۶۷ = ۱
        #20 a = 16'd32768; b = 16'd32767; start = 1;
        #10 start = 0;
        wait(done);
        $display("32768 - 32767 = %d, Borrow: %b, Underflow: %b (Expected: 1, 0, 0)", 
                 result, borrow, underflow);
        
        $finish;
    end
    
    // مانیتورینگ سیگنال‌ها
    initial begin
        $monitor("Time=%0t, State=%b, Counter=%d, Borrow=%b, Done=%b", 
                 $time, uut.current_state, uut.counter, uut.reg_borrow, done);
    end
endmodule