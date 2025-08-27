
module sync_reset_register(
    input clk,
    input rst,
    input [7:0]d,
    output reg [7:0]q
);

always @(posedge clk) begin
    if(rst)begin
        q <= 8'b00000000;
    end else begin
        q <= d;
    end
end

endmodule 