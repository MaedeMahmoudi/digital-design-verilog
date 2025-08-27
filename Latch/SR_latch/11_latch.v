module latch(

    input D,
    input enable,
    output reg Q
);

always @(enable or D) begin
  
    if (enable)
       Q <= D;
end

endmodule