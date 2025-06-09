
module d_ff(

    input clk,
    input data, //d
    output reg q

);

always @(posedge clk) begin
    
    q <= data;

end

endmodule