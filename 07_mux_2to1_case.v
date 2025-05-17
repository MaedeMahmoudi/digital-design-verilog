
module mux_case(

    input [1:0]in,
    input s,
    output reg out;

);

always @(*) begin
    
    casex @(*)
        1'b0 : out = in[0] ;
        1'b1 : out = in[1] ; 
        default: out = 1'bx ;
    endcase
end 

endmodule