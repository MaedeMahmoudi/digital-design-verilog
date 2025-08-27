module parameterized_down_counter #(
    parameter WIDTH = 8,
    parameter INIT_VALUE = 255
)(
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [WIDTH-1:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= INIT_VALUE; // مقدار اولیه قابل تنظیم
    end else if (enable) begin
        if (count == 0) begin
            count <= INIT_VALUE; // بازگشت به مقدار اولیه
        end else begin
            count <= count - 1; // کاهش مقدار
        end
    end
end

endmodule
