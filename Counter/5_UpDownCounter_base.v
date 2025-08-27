module up_down_counter (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire up_down, // 1: Up, 0: Down
    output reg [3:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 4'b0000; // Reset to zero
    end else if (enable) begin
        if (up_down) begin
            count <= count + 1; // Count up
        end else begin
            count <= count - 1; // Count down
        end
    end
end

endmodule
