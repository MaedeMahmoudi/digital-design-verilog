
module full_adder_str( a , b , cin , sum , cout);

    input a , b , cin;
    output sum , cout;
    wire xor_ab , and_ab , and_axb , and_bcin , or1;
    
    xor u1( xor_ab , a, b );
    xor u2( sum , xor_ab , cin );
    and u3(and_ab , a , b );
    and u4( and_axb , xor_ab , cin );
    or u5( cout , and_ab , and_axb );

endmodule
