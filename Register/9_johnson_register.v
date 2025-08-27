
module johnson_counter(
    input wire clk,
    input wire rst_n,
    input wire en,
    output reg [3:0]count
);

always @(posedge clock or negedge rst_n) begin
    if(!rst_n)begin
        count <= 4'b0000;
    end else if (en) begin
        count <= {~count[0] , count[3:1]};
    end
end
endmodule

