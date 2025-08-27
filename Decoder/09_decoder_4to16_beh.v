
module decoder_4to16_beh(

    input [3:0]in,
    output reg [15:0]out

);

always @(in) begin

    out = 16'b0000000000000000;
    out[in] = 1'b1;

end
endmodule