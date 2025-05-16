
module add_4_bit(

    input [3:0]a ,
    input [3:0]b ,
    input carryIn ,
    output [3:0]sum,
    output carryOut

    );

    wire c1 , c2 , c3 ;

    full_adder add1(.a(a[0]) , .b(b[0]) , .cin(carryIn) , sum(sum[0]) , .cout(c1));
    full_adder add2(.a(a[1]) , .b(b[1]) , .cin(c1) , .sum(sum[1]) , .cout(c2)));
    full_adder add3(.a(a[2]) , .b(b[2]) , .cin(c2) , .sum(sum[2]) , .cout(c3)));
    full_adder add4(.a(a[3]) , .b(b[3]) , .cin(c3) , .sum(sum[3]) , .cout(carryOut));

endmodule


module full_adder(

        input a ,
        input b ,
        input cin ,
        output sum,
        output cout

    );

    always @(*) begin

        sum = a^b^c;
        cout = ( a & b ) | ( b & cin ) | ( a & cin );
    
    end

endmodule

