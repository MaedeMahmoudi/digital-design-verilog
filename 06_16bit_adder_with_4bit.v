
module add_16_bit(

    input[15:0]a,
    input[15:0]b,
    input carryIn,
    output [15:0]sum,
    output carryOut

);

wire c1,c2,c3;

add_4_bit adder0( .a(a[3:0]) , .b(b[3:0]) , .carryIn(carryIn) , .sum(sum[3:0]) , .carryOut(c1) );
add_4_bit adder1(.a(a[7:4]) , .b(b[7:4]) , .carryIn(c1) , .sum(sum[7:4]) , .carryOut(c2));
add_4_bit adder2(.a(a[11:8]) , .b(b[11:8]) , .carryIn(c2) , .sum(sum[11:8]) , .carryOut(c3));
add_4_bit adder3(.a(a[15:12]) , .b(b[15:12]) , .carryIn(c3) , .sum(sum[15:12]) , .carryOut(carryOut));

endmodule