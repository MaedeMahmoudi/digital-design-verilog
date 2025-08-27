
module universal_shift_register(
    input clk,
    input rst_n,
    input [1:0]mode,//00:hold , 01:shift right , 10:shift left , 11:parallel load
    input ser_in_right,
    input ser_in_left,
    input [7:0]par_in,
    output reg [7:0]q ,
    output ser_out_right,
    output ser_out_left
);

assign ser_out_right = q[0];
assign ser_out_left = q[7];

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        q<= 8'b00000000;
    end else begin
        case(mode)
            2'b00: q <= q; //hold
            2'b01: q <={ser_in_left , q[7:1]};//shift right
            2'b10: q <={q[6:0] , ser_in_right}//shift left
            2'b11: q <= par_in;
        endcase
    end
end

endmodule