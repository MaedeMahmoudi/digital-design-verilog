
module full_adder_df( a ,b , cin , sum , cout);
    
    input a , b , cin ;
    output sum , cout ;

    assign sum = a ^ b ^ c;
    assign cout = ( a & b ) | ( b & cin ) | ( a & cin );

endmodule