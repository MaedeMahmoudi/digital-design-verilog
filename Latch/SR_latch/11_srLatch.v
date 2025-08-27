
module srLatch(

    input s,
    input r,
    input reg  q;
    input reg qn

);

always @(*) begin
    
    q <= ~( qn | r )
    qn <= ~( s | q )

end
endmodule
