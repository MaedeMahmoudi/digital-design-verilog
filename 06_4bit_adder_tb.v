
module 4_bit_adder_tb;

    reg [3:0] a ,b ;
    reg carryIn ;
    wire [3:0]sum;
    wire carryOut;

add_4_bit uut(

.a(a),
.b(b),
.carryIn(carryIn),
.sum(sum),
.carryOut(carryOut)

);

initial begin
    
    integer i, j , k ;// i for a , j for b , k for carryIn

    for (i = 0 ; i<16  ; i = i+1 ) begin
        for( j = 0 , j<16 , j = j+1 )begin
            for( k = 0 ; k<=1 , k=k+1 )begin//carryIn can be 0 or 1
                
                a = i[3:0];
                b = j[3:0];
                carryIn = k ;
                #10 

            end
         end
     end

    $finish

end

endmodule
