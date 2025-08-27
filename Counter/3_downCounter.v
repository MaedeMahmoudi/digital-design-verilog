
module DownCounter(
    input wire clk,
    input wire rst,
    input wire enable,
    input wire load,
    input wire [3:0] data_in,
    output reg [3:0] count,
    output reg underflow
);

always @(posedge clk or posedge rst)begin
    if(rst)begin
        count <= 