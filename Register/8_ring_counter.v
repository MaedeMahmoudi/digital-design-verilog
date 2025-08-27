
module ring_counter(
    input clk,
    input rst_n,
    input en,
    input load,
    input [7:0]init_val,
    output reg [7:0]q
);

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        q <= 8'b00000001;//default pattern
    end else if(load) begin
        q <= init_val;
    end else if (en) begin
        q <= {q[6:0] , q[7]}; //rotate left
    end
end
endmodule