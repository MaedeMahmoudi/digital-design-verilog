
module byte_enable_ram(
    input wire clk,
    input wire we,//signal for write
    input wire [1:0] byte_en,//control byte en
    input wire [2:0] addr,//3 bit address
    input wire [15:0] data_in,
    output  reg [15:0] data_out
);

reg [15:0] mem [0:7];

always @(posedge clk)begin
    if(we)begin
       if(byte_en[0]) mem[addr][7:0] <= data_in[7:0];
       if(byte_en[1]) mem[addr][15:8] <=data_in[15:8];
    end
    data_out <= mem[addr];
end
endmodule