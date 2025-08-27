
module Upcounter(
    input wire clk,
    input wire rst,
    input wire enable,
    input wire load,
    input wire [3:0] data_in,
    output reg [3:0] count,
    output reg overflow
);

always @(posedge clk or posedge rst )begin
    if(rst)begin
        count <= 4'b0000;
        overflow <= 1'b0;
    end else if(load) begin
        count <= data_in;
        overflow <= 1'b0;
    end else if(enable) begin
        if(count == 4'b1111)begin
            count <= 4'b0000;
            overflow <= 1'b0;
        end 
    end else begin
        count <= count + 1;
        overflow <= 1'b0;
    end else begin
    overflow <= 1'b0;
end
end
endmodule

    
    
