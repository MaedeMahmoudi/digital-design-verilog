
module  left_shifter #(parameter WIDTH = 8)(

    input [WIDTH-1:0]in,
    input [3:0]shift,
    output reg [WIDTH-1:0]out

    );

    always @(*) begin
        out = in << shift;
    end
endmodule