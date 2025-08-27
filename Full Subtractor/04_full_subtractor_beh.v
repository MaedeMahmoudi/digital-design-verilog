
module full_adder_beh( a , b , borrowIn , difference , borrowOut);

    input a , b , borrowIn;
    output reg difference , borrowOut ;

    always @(*) begin
        
        difference = a^b^borrowIn ;
        borrowOut = ( ((~a)&b) | (~(a^b)&borrowIn) );
    end

endmodule
