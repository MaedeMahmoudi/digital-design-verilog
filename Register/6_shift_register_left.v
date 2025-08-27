
module shift_register_left(
    input clk,
    input rst_n,
    input shift_en,
    input ser_in,
    output reg [7:0]q,
    output ser_out

);

assign ser_out = q[7];

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        q <= 8'b00000000;
    end else if(shift_en)begin
        q <= {q[6:0] , ser_in};
end
end

endmodule
    