
module async_reset_register(
    input clk,
    input rst_n,//active low reset
    input [7:0]d,
    output reg [7:0]q
);

always @(posedge clk or rst_n) begin
    if(!rst_n)begin
        q <= 8'b00000000;
    end else begin
        q <= d;
    end
end

endmodule