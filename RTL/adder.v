
module sequential_adder (
    input clk,           // سیگنال کلاک
    input reset,         // سیگنال ریست
    input start,         // سیگنال شروع عملیات
    input [15:0] a,      // عدد اول 16 بیتی
    input [15:0] b,      // عدد دوم 16 بیتی
    output reg [16:0] sum, // حاصل جمع 17 بیتی (با در نظر گیری carry)
    output reg done,     // سیگنال اتمام عملیات
    output reg overflow  // سیگنال سرریز
);

// ================== تعریف حالت‌های FSM با parameter ==================
parameter IDLE   = 2'b00;  // حالت انتظار
parameter ADD    = 2'b01;  // حالت انجام جمع
parameter DONE   = 2'b10;  // حالت اتمام

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
        IDLE: next_state = start ? ADD : IDLE;
        ADD:  next_state = (counter == 5'd16) ? DONE : ADD;
        DONE: next_state = IDLE;
        default: next_state = IDLE;
    endcase
end

// ================== مسیر داده - ثبت‌ها ==================
reg [15:0] reg_a;        // ثبت عدد اول
reg [15:0] reg_b;        // ثبت عدد دوم
reg [16:0] reg_sum;      // ثبت حاصل جمع
reg carry;               // ثبت رقم نقلی

// ================== مسیر داده - منطق عملیات ==================
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // مقداردهی اولیه همه ثبات‌ها
        reg_a <= 16'b0;
        reg_b <= 16'b0;
        reg_sum <= 17'b0;
        carry <= 1'b0;
        sum <= 17'b0;
        counter <= 5'b0;
        done <= 1'b0;
        overflow <= 1'b0;
    end else begin
        case (current_state)
            IDLE: begin
                if (start) begin
                    // بارگذاری اعداد ورودی
                    reg_a <= a;
                    reg_b <= b;
                    reg_sum <= 17'b0;
                    carry <= 1'b0;
                    counter <= 5'b0;
                    done <= 1'b0;
                    overflow <= 1'b0;
                end
            end
            
            ADD: begin
                // جمع بیت به بیت با در نظر گیری carry
                {carry, reg_sum[counter]} = reg_a[counter] + reg_b[counter] + carry;
                
                counter <= counter + 1;
            end
            
            DONE: begin
                // ذخیره نتیجه نهایی
                sum <= reg_sum;
                // بررسی سرریز
                overflow <= carry; // اگر carry نهایی 1 باشد، سرریز اتفاق افتاده
                done <= 1'b1;
            end
        endcase
    end
end

endmodule