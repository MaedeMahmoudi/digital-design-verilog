
module half_str( sum , carry , a ,b )

    input a ,b ;
    output sum ,carry ;
    
    xor u1( sum , a , b );
    and u2( carry , a , b );

endmodule
