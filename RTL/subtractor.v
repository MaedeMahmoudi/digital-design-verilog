
module sequential_subtractor (
    input clk,           // سیگنال کلاک
    input reset,         // سیگنال ریست
    input start,         // سیگنال شروع عملیات
    input [15:0] a,      // عدد اول (کاهش‌دهنده)
    input [15:0] b,      // عدد دوم (کاهش‌یافته)
    output reg [15:0] result, // نتیجه تفریق
    output reg borrow,   // سیگنال قرض
    output reg done,     // سیگنال اتمام عملیات
    output reg underflow // سیگنان زیرریز (نتایج منفی)
);

// ================== تعریف حالت‌های FSM با parameter ==================
parameter IDLE    = 2'b00;  // حالت انتظار
parameter SUBTRACT = 2'b01;  // حالت انجام تفریق
parameter DONE    = 2'b10;  // حالت اتمام

reg [1:0] current_state, next_state;
reg [4:0] counter;       // شمارنده برای 16 سیکل

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
        IDLE:     next_state = start ? SUBTRACT : IDLE;
        SUBTRACT: next_state = (counter == 5'd16) ? DONE : SUBTRACT;
        DONE:     next_state = IDLE;
        default:  next_state = IDLE;
    endcase
end

// ================== مسیر داده - ثبت‌ها ==================
reg [15:0] reg_a;        // ثبت عدد اول
reg [15:0] reg_b;        // ثبت عدد دوم
reg [15:0] reg_result;   // ثبت نتیجه
reg reg_borrow;          // ثبت قرض

// ================== مسیر داده - منطق عملیات ==================
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // مقداردهی اولیه همه ثبات‌ها
        reg_a <= 16'b0;
        reg_b <= 16'b0;
        reg_result <= 16'b0;
        reg_borrow <= 1'b0;
        result <= 16'b0;
        borrow <= 1'b0;
        counter <= 5'b0;
        done <= 1'b0;
        underflow <= 1'b0;
    end else begin
        case (current_state)
            IDLE: begin
                if (start) begin
                    // بارگذاری اعداد ورودی
                    reg_a <= a;
                    reg_b <= b;
                    reg_result <= 16'b0;
                    reg_borrow <= 1'b0;
                    counter <= 5'b0;
                    done <= 1'b0;
                    underflow <= 1'b0;
                end
            end
            
            SUBTRACT: begin
                // تفریق بیت به بیت با در نظر گیری borrow
                reg_result[counter] = reg_a[counter] ^ reg_b[counter] ^ reg_borrow;
                reg_borrow = (~reg_a[counter] & reg_b[counter]) | 
                            (~reg_a[counter] & reg_borrow) | 
                            (reg_b[counter] & reg_borrow);
                
                counter <= counter + 1;
            end
            
            DONE: begin
                // ذخیره نتیجه نهایی
                result <= reg_result;
                borrow <= reg_borrow;
                // بررسی زیرریز (اگر a < b باشد)
                underflow <= reg_borrow;
                done <= 1'b1;
            end
        endcase
    end
end

endmodule