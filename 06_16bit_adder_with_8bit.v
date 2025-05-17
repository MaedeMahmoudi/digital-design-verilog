
module add_16_bit(

    input [15:0]a,
    input [15:0]b;
    input carryIn,
    output [15:0]sum,
    output carryOut

);

wire c1;

add_8_bit adder0(.a(a[7:0]) , .b(b[7:0]) , .carryIn(carryIn) , .sum(sum[7:0]) , .carryOut(c1));
add_8_bit adder1(.a(a[15:8]) , .b(b[15:8]) , .carryIn(c1) , .sum(sum[15:8]) , .carryOut(carryOut));

endmodule