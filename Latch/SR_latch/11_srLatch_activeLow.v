
module sr_activeLow(

    input s,
    input r ,
    output reg q ,
    output reg qn

);

always @(*) begin
    
    q <= ~( s & qn );
    qn <= ~( r & q );

end
endmodule