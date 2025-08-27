
module add_8_bit(

    input [7:0]a,
    input [7:0]b,
    input carryIn,
    output [7:0]sum,
    output carryOut

);

wire[7:0]carry;

genvar i;

generate
    for (i = 0 ; i<8 ; i = i+1 ) begin : gen_adder
        if(i == 0)begin
            full_adder fa(
                .a(a[i]),
                .b(b[i]),
                .carryIn(carryIn),
                .sum(sum[i]),
                .carryOut(carry[i])
            );
        end
        else begin
            full_adder fa(
                .a(a[i]),
                .b(b[i]),
                .carryIn(carry[i-1]),
                .sum(sum[i]),
                .carryOut(carry[i])
            );
            end
    end

endgenerate

assign carryOut = carry[7];

endmodule