
//مداری طراحی کنید که با هر لبه ی بالارونده ی سیگنال کلاک یک پالس به عرض یک سیکل کلاک تولید کند

module SinglePulseGenerator(
    input wire clk,
    input wire reset,
    input wire trigger,
    output reg pulse
);

reg trigger_prev;

always @(posedge clk or posedge reset) begin
    if(reset)begin
        trigger_prev <= 0;
        pulse <= 0;
    end else begin
        trigger_prev <= trigger;
        pulse <= trigger && !trigger_prev;
    end
end

endmodule
