
module shifter #(

    parameter WIDTH = 8 ;

)
(
    input [WIDTH-1:0]in;
    input [2:0]shift_amount,
    input direction,// 0 for shift left & 1 for shift right
    output reg [WIDTH-1:0]out

    );

    generate
        genvar i;

        always @(*) begin
            if ( direction == 0) begin

                out = in<<shift_amount;

            end
            else begin
                out = in >> shift_amount;
            end
        end
    endgenerate
endmodule