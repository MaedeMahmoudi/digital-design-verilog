
module sequential_multiplier(
    input clk,
    input reset,
    input start,
    input [7:0]a,
    input [7:0]b,
    output reg [15:0] product,
    output reg done
);

parameter IDLE = 2'b00;//wait
parameter MULT = 2'b01;//mult
parameter DONE = 2'b10;//done

reg [1:0] current_state, next_state;
reg [3:0] counter;//counter for 8 period

always @(posedge clk or posedge reset)begin
    if(reset)begin
        current_state <= IDLE;// with reset go to first state
    end else begin
        current_state <= next_state;//at each posedge clk change state
    end
end

always @(*)begin
    case(current_state)
        IDLE: next_state = start ? MULT : IDLE;
        MULT: next_state = (counter == 4'd8) ? DONE : MULT;//if become 8 time finish it
        DONE: next_state = IDLE;
        defualt : next_state = IDLE;
    endcase
end

reg [7:0] multiplcand;//hold first num
reg [7:0] multiplier;//hold second num
reg [15:0] acc;//middle result

always @(posedge clk or posedge reset)begin
    if(reset)begin
        multiplcand <= 8'b0;
        multiplier <= 8'b0;
        acc <= 16'b0;
        counter <= 4'b0;
        product <= 16'b0;
        done <= 1'b0;
        current_state <= IDLE;
    end else begin
        case (current_state)
            IDLE: begin
                if (start) begin
                    // بارگذاری اعداد ورودی در ثبات‌ها
                    multiplicand <= a;
                    multiplier <= b;
                    acc <= 16'b0;  // اکومولاتور را صفر کن
                    counter <= 4'b0; // شمارنده را صفر کن
                    done <= 1'b0;   // سیگنال done را غیرفعال کن
                end
            end
            
            MULT: begin
                if (multiplier[0] == 1'b1) begin
                    // اگر بیت کم‌اهمیت مضروب‌فیه 1 باشد
                    acc <= acc + multiplicand; // مضروب را به اکومولاتور اضافه کن
                end
                // عمل شیفت راست برای مضروب‌فیه
                multiplier <= multiplier >> 1;
                // عمل شیفت چپ برای مضروب
                multiplicand <= multiplicand << 1;
                // افزایش شمارنده
                counter <= counter + 1;
            end
            
            DONE: begin
                // ذخیره نتیجه نهایی
                product <= acc;
                // فعال کردن سیگنال اتمام
                done <= 1'b1;
            end
        endcase
    end
end

endmodule
        






