
module decoder_2to4_en(

    input [1:0]a,
    input enable,
    output reg [3:0]d

);

always @(a or enable) begin

    if (enable) begin
        case (a)

            2'b00 : d = 4'b0001
            2'b01 : d = 4'b0010;
            2'b10 : d = 4'b0100;
            2'b11 : d = 4'b1000;

            default: d = 4'b0000;
        endcase
    end
    else begin
        d = 4'b0000;
    end
end

endmodule