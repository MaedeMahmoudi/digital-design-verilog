
module mux_2to1_beh( 

    input a,
    input b,
    input select,
    output reg out

);


always @(*) begin
    
    if(select)
      out = b;
    else
    out = a;
    
end

endmodule