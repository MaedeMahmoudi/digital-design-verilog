
module 4_bit_adder_with_for(

    input[3:0]a,
    input[3:0]b,
    input carryIn,
    output [3:0]sum,
    output carryOut
    
);

reg [3:0]sum_reg;
reg c;
integer i;

always @(*) begin
    
    c = carryIn ;
    for (i = 0 ; i<4 ; i = i+1 ) begin

        sum_reg[i] = a[i] ^ b[i] ^ c;
        c = (a[i]&b[i]) | (b[i]&c) | (a[i]&c) ;
    
    end
    carryOut = c;
end

assign sum = sum_reg;

endmodule