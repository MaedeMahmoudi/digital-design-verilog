
module half_beh( a , b , sum , carry );

    input a,b ;
    output reg sum , carry ;

    always @(*) begin
        
        sum = a^b;
        carry = a&b;

    end
endmodule

