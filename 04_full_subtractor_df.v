
module full_sub_df( a , b , borrowIn ,difference , borrowOut );

    assign difference = a^b^borrowIn ;
    assign borrowOut = ( ((~a)&b) | (~(a^b)&borrowIn) );

endmodule