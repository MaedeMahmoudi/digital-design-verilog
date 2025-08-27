

module full_adder_beh( a ,b , cin , sum , cout);
    
    input a , b , cin ;
    output reg sum , cout ;

    always @(*) begin

     sum = a ^ b ^ c;
     cout = ( a & b ) | ( b & cin ) | ( a & cin );
        
    end

endmodule