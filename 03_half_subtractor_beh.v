
module half_sub_beh( a , b , difference , borrow );

    input a ,b ;
    output reg difference , borrow ;

always @(*) begin
    
    difference = a ^ b;
    borrow = (~a) & b ;

end
endmodule
