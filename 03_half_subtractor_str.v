
module half_sub_str( a , b , difference , borrow );

    input a , b;
    output difference , borrow ;
    wire abar;

    xor u1( difference , a , b);
    not u2( abar , a );
    and u3( borrow ,abar , b );

endmodule

