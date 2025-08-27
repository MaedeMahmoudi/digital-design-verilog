module parameterized_up_down_counter #(
    parameter WIDTH = 8,
    parameter INIT_VALUE = 0
)(
    input wire clk,
    input wire reset,
    input wire enable,
    input wire up_down, // 1: Up, 0: Down
    output reg [WIDTH-1:0] count,
    output wire max_count, // Signal when max value reached
    output wire min_count  // Signal when min value reached
);

// محاسبه مقادیر ماکزیمم و مینیمم
localparam MAX_VAL = (2**WIDTH) - 1;
localparam MIN_VAL = 0;

assign max_count = (count == MAX_VAL) && up_down;
assign min_count = (count == MIN_VAL) && !up_down;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= INIT_VALUE;
    end else if (enable) begin
        if (up_down) begin
            // Count up with rollover
            if (count == MAX_VAL) begin
                count <= MIN_VAL;
            end else begin
                count <= count + 1;
            end
        end else begin
            // Count down with rollunder
            if (count == MIN_VAL) begin
                count <= MAX_VAL;
            end else begin
                count <= count - 1;
            end
        end
    end
end

endmodule
