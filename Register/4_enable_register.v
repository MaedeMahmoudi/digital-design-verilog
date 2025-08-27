
module enabled_register(
    input clk,
    input rst_n,
    input en,
    input [3:0]d,
    output reg [3:0]q
);

always @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        q <= 4'b0000;
    end else if (en) begin
        q <= d;
    end
end

endmodule