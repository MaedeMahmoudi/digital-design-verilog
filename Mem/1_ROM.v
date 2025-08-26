
//in rom we can just read data
module simple_rom(
    input wire [2:0] addr,
    output reg [7:0] data
);

always @(*)begin
    case(addr)
        3'b000: data = 8'h12;
        3'b001: data = 8'h34;
        3'b010: data = 8'h56;
        3'b011: data = 8'h78;
        3'b100: data = 8'h9A;
        3'b101: data = 8'BC;
        3'b110: data = 8'hDE;
        3'b111: data = 8'hF0;
    endcase

end

endmodule
