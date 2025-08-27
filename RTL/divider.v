
module sequential_divider (
    input clk,           // سیگنال کلاک
    input reset,         // سیگنال ریست
    input start,         // سیگنال شروع عملیات
    input [7:0] dividend, // مقسوم (عدد要被 تقسیم)
    input [7:0] divisor,  // مقسوم علیه (عدد تقسیم کننده)
    output reg [7:0] quotient, // خارج قسمت (نتیجه تقسیم)
    output reg [7:0] remainder, // باقیمانده
    output reg done,     // سیگنال اتمام عملیات
    output reg error     // سیگنال خطا (تقسیم بر صفر)
);

// ================== تعریف حالت‌های FSM با parameter ==================
parameter IDLE   = 3'b000;  // حالت انتظار
parameter CHECK  = 3'b001;  // حالت بررسی مقسوم علیه
parameter DIVIDE = 3'b010;  // حالت انجام تقسیم
parameter DONE   = 3'b011;  // حالت اتمام
parameter ERROR  = 3'b100;  // حالت خطا

reg [2:0] current_state, next_state;
reg [3:0] counter;       // شمارنده برای ۸ سیکل

// ================== واحد کنترل - ثبت حالت فعلی ==================
always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= IDLE;
    end else begin
        current_state <= next_state;
    end
end

// ================== واحد کنترل - منطق حالت بعدی ==================
always @(*) begin
    case (current_state)
        IDLE:   next_state = start ? CHECK : IDLE;
        CHECK:  next_state = (divisor == 8'b0) ? ERROR : DIVIDE;
        DIVIDE: next_state = (counter == 4'd8) ? DONE : DIVIDE;
        DONE:   next_state = IDLE;
        ERROR:  next_state = IDLE;
        default: next_state = IDLE;
    endcase
end

// ================== مسیر داده - ثبت‌ها ==================
reg [7:0] reg_dividend;   // ثبت مقسوم
reg [7:0] reg_divisor;    // ثبت مقسوم علیه
reg [7:0] reg_quotient;   // ثبت خارج قسمت
reg [7:0] reg_remainder;  // ثبت باقیمانده

// ================== مسیر داده - منطق عملیات ==================
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // مقداردهی اولیه همه ثبات‌ها
        reg_dividend <= 8'b0;
        reg_divisor <= 8'b0;
        reg_quotient <= 8'b0;
        reg_remainder <= 8'b0;
        quotient <= 8'b0;
        remainder <= 8'b0;
        counter <= 4'b0;
        done <= 1'b0;
        error <= 1'b0;
    end else begin
        case (current_state)
            IDLE: begin
                if (start) begin
                    // بارگذاری اعداد ورودی
                    reg_dividend <= dividend;
                    reg_divisor <= divisor;
                    reg_quotient <= 8'b0;
                    reg_remainder <= 8'b0;
                    counter <= 4'b0;
                    done <= 1'b0;
                    error <= 1'b0;
                end
            end
            
            CHECK: begin
                // حالت بررسی - کاری انجام نمی‌دهد
                // منطق حالت بعدی تصمیم می‌گیرد
            end
            
            DIVIDE: begin
                // شیفت چپ باقیمانده و مقسوم
                {reg_remainder, reg_dividend} = {reg_remainder, reg_dividend} << 1;
                
                // اگر باقیمانده >= مقسوم علیه باشد
                if (reg_remainder >= reg_divisor) begin
                    reg_remainder <= reg_remainder - reg_divisor;
                    reg_quotient <= {reg_quotient[6:0], 1'b1}; // قرار دادن 1 در بیت LSB
                end else begin
                    reg_quotient <= {reg_quotient[6:0], 1'b0}; // قرار دادن 0 در بیت LSB
                end
                
                counter <= counter + 1;
            end
            
            DONE: begin
                // ذخیره نتیجه نهایی
                quotient <= reg_quotient;
                remainder <= reg_remainder;
                done <= 1'b1;
            end
            
            ERROR: begin
                // خطای تقسیم بر صفر
                error <= 1'b1;
                done <= 1'b1;
            end
        endcase
    end
end

endmodule