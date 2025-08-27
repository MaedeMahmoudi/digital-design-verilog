
module tb_divider();
    reg clk, reset, start;
    reg [7:0] dividend, divisor;
    wire [7:0] quotient, remainder;
    wire done, error;
    
    // ایجاد نمونه از تقسیم کننده
    sequential_divider uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .dividend(dividend),
        .divisor(divisor),
        .quotient(quotient),
        .remainder(remainder),
        .done(done),
        .error(error)
    );
    
    // تولید سیگنال کلاک
    always #5 clk = ~clk;
    
    // تست موارد مختلف
    initial begin
        // مقداردهی اولیه
        clk = 0;
        reset = 1;
        start = 0;
        dividend = 0;
        divisor = 0;
        
        // ریست سیستم
        #10 reset = 0;
        
        // تست ۱: ۱۵ ÷ ۳ = ۵ (باقیمانده ۰)
        #10 dividend = 8'd15; divisor = 8'd3; start = 1;
        #10 start = 0;
        wait(done);
        $display("15 / 3 = %d, Remainder = %d (Expected: 5, 0)", quotient, remainder);
        
        // تست ۲: ۲۰ ÷ ۶ = ۳ (باقیمانده ۲)
        #20 dividend = 8'd20; divisor = 8'd6; start = 1;
        #10 start = 0;
        wait(done);
        $display("20 / 6 = %d, Remainder = %d (Expected: 3, 2)", quotient, remainder);
        
        // تست ۳: ۱۰ ÷ ۰ = خطا
        #20 dividend = 8'd10; divisor = 8'd0; start = 1;
        #10 start = 0;
        wait(done);
        if (error) 
            $display("10 / 0 = Error (Division by zero)");
        
        // تست ۴: ۲۵۵ ÷ ۸ = ۳۱ (باقیمانده ۷)
        #20 dividend = 8'd255; divisor = 8'd8; start = 1;
        #10 start = 0;
        wait(done);
        $display("255 / 8 = %d, Remainder = %d (Expected: 31, 7)", quotient, remainder);
        
        $finish;
    end
    
    // مانیتورینگ سیگنال‌ها
    initial begin
        $monitor("Time=%0t, State=%b, Counter=%d, Done=%b, Error=%b", 
                 $time, uut.current_state, uut.counter, done, error);
    end
endmodule

/*توضیح الگوریتم تقسیم:
مراحل کار:
حالت IDLE: منتظر سیگنال start

حالت CHECK: بررسی می‌کند آیا مقسوم علیه صفر است یا نه

حالت DIVIDE: در هر سیکل:

باقیمانده و مقسوم را به چپ شیفت می‌دهد

اگر باقیمانده ≥ مقسوم علیه باشد:

مقسوم علیه را از باقیمانده کم می‌کند

بیت 1 به خارج قسمت اضافه می‌کند

در غیر این صورت:

بیت 0 به خارج قسمت اضافه می‌کند

حالت DONE: ذخیره نتیجه و فعال کردن done

حالت ERROR: اگر تقسیم بر صفر باشد

تفاوت‌های اصلی با ضرب کننده:
حالت CHECK اضافه: برای بررسی تقسیم بر صفر

حالت ERROR اضافه: برای مدیریت خطا

منطق تفریق: به جای جمع استفاده می‌شود

شیفت متفاوت: همزمان روی باقیمانده و مقسوم عمل شیفت انجام می‌شود

خروجی اضافه: remainder برای باقیمانده */