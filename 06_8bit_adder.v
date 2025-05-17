
module add_8_bit(

    input [7:0]a,
    input[7:0]b,
    input carryIn ,
    output [7:0]sum,
    output carryOut

);

wire c1 , c2 , c3 , c4 , c5 , c6 , c7 ; 

full_adder fa0(.a(a[0]) , .b(b[0]) , .carryIn(carryIn) , .sum(sum[0]) , carryOut(c1) );
full_adder fa1(.a(a[1]) , .b(b[1]) , .carryIn(c1) , .sum(sum[1]) , carryOut(c2) );
full_adder fa2(.a(a[2]) , .b(b[2]) , .carryIn(c2) , .sum(sum[2]) , carryOut(c3) );
full_adder fa3(.a(a[3]) , .b(b[3]) , .carryIn(c3) , .sum(sum[3]) , carryOut(c4) );
full_adder fa4(.a(a[4]) , .b(b[4]) , .carryIn(c4) , .sum(sum[4]) , carryOut(c5) );
full_adder fa5(.a(a[5]) , .b(b[5]) , .carryIn(c5) , .sum(sum[5]) , carryOut(c6) );
full_adder fa6(.a(a[6]) , .b(b[6]) , .carryIn(c6) , .sum(sum[6]) , carryOut(c7) );
full_adder fa7(.a(a[7]) , .b(b[7]) , .carryIn(c7) , .sum(sum[7]) , carryOut(carryOut) );

endmodule