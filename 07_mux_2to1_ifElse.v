
module mux_if(

    input [1:0]in,
    input s,
    output reg out

);

always @(*) begin

    if( s== 1'b0 )
       out = in[0];
    else
    out = in[1];
    
end

endmodule