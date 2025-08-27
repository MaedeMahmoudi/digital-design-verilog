module simple_fifo #(
    parameter WIDTH = 8,
    parameter DEPTH = 4
)(
    input wire clk,
    input wire rst,
    input wire wr_en,
    input wire rd_en,
    input wire [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out,
    output reg full,
    output reg empty 
   );

   reg [WIDTH-1:0] mem[0:DEPTH-1];
   reg [1:0] wr_ptr , rd_ptr;
   reg [2:0] count;

   always @(posedge clk or posedge rst)begin
    if(rst)begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        count <= 0 ;
        empty <=1;
    end else begin
        if(wr_en && !full)begin
            mem[wr_ptr] <= data_in;
            wr_ptr <= wr_ptr + 1;
            count <= count - 1;
        end

        full <= (count == DEPTH);
        empty <= (count == 0);
    end
end 
endmodule
