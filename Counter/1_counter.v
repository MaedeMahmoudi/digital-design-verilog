
module counter(
    input wire clk,
    input wire rst,
    input wire enable,
    input wire load,
    input wire [3:0] data_in,
    output reg [3:0] count
);

always @(posedge clk or posedge rst)begin
    if(rst)begin
        count <= 4'b0000;
    end else if(load)begin
        count <= data_in;
    end else if(enable)begin
        count <= count + 1 ;
    end
end
endmodule
    