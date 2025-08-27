
`timescale  1ns/1ps
module add_16_bit_tb;

    reg [15:0]a;
    reg  [15:0]b;
    reg carryIn;
    wire [15:0]sum;
    wire carryOut;

add_16_bit uut(

.a(a),
.b(b),
.carryIn(carryIn),
.sum(sum),
.carryOut(carryOut)

);

initial begin
    a = 16'h0001; b = 16'h0001 ; carryIn = 0;
    #10;
    a = 16'hF0F0; b = 16'h0001 ; carryIn = 0;
    #10;
    a = 16'h0005; b = 16'h0001 ; carryIn = 1;
    #10;
    
    $finish;
    
end

endmodule