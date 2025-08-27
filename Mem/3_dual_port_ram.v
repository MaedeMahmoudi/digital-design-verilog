
//each port can read and also write

module dual_port_ram(
    input wire clk,
    input wire we,//write enable
    input wire [2:0] addr_a,//port A addr
    input wire [2:0] addr_b,//port B addr
    input wire [7:0] data_in,//common entrance data
    input reg [7:0] data_out_a,
    input reg [7:0] data_out_b
);

reg [7:0] mem [0:7];

always @(posedge clk) begin
    if(we)begin
        mem[addr_a] <= data_in;// we just write from port a
    end
    data_out_a <= mem[addr_a];//read from port a
    data_out_b <= mem[addr_b];//read from port b
end
endmodule
