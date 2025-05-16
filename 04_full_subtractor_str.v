
module full_sub_str( a , b , borrowIn , difference , borrowOut);

    input a , b , borrowIn ;
    output difference , borrowOut;
    wire abar , axb_bar , axb , abar_b , axb_borrowIn;

    not u1( abar , a );
    not u2( axb_bar , axb );
    xor u3(axb , a , b );
    xor u4(difference , axb , borrowIn );
    and u5(abar_b , abar , b );
    and u6(axb_borrowIn , axb_bar , borrowIn );
    or  u7(borrowOut , axb_borrowIn , abar_b );

endmodule



