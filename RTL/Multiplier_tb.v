module tb_multiplier();
    reg clk, reset, start;
    reg [7:0] a, b;
    wire [15:0] product;
    wire done;
    
    // ایجاد نمونه از ضرب کننده
    sequential_multiplier uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .a(a),
        .b(b),
        .product(product),
        .done(done)
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
        
        // تست ۱: ۵ × ۳ = ۱۵
        #10 a = 8'd5; b = 8'd3; start = 1;
        #10 start = 0;
        wait(done);
        $display("5 * 3 = %d (Expected: 15)", product);
        
        // تست ۲: ۱۰ × ۲۰ = ۲۰۰
        #20 a = 8'd10; b = 8'd20; start = 1;
        #10 start = 0;
        wait(done);
        $display("10 * 20 = %d (Expected: 200)", product);
        
        // تست ۳: ۱۵ × ۱۵ = ۲۲۵
        #20 a = 8'd15; b = 8'd15; start = 1;
        #10 start = 0;
        wait(done);
        $display("15 * 15 = %d (Expected: 225)", product);
        
        $finish;
    end
endmodule