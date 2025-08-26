
// in ram we can read and write
module simple_ram(
    input wire clk,
    input wire we,//write enable
    input wire [2:0] addr,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

reg [7:0] mem [0:7];

always @(posedge clk) begin
    if(we)begin
        mem[addr] <= data_in;
    end
    data_out <= mem[addr];
end

endmodule
