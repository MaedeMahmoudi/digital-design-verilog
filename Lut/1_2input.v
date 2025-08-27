
module LUT2(input [1:0] addr, output reg out);

    always @(*)begin
        case(addr)
            2'b00: out = 1'b0;
            2'b01: out = 1'b1;
            2'b10: out = 1'b1;
            2'b11: out = 1'b0;
        endcase 
    end
endmodule
    