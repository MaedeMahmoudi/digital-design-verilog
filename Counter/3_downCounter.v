module down_counter (
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [3:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 4'b1111; // مقدار اولیه
    end else if (enable) begin
        count <= count - 1; // کاهش مقدار
    end
end

endmodule
