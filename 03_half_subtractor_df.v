
module half_sub_df( a , b , difference , borrow );

    input a , b ;
    output difference , borrow ;

    assign difference = a ^ b;
    assign borrow = (~a) & b ;

endmodule

    