
module seq_detector_moore(
    input wire clk,
    input wire rst_n,
    input wire din,

    output reg detect
);

parameter s0 = 3'b000;//initial state
parameter s1 = 3'b001;//received '1'
parameter s2 = 3'b010;//received '10'
parameter s3 = 3'b001;//received '100'
parameter s4 = 3'b100;//received '1000' detection state

reg [2:0] current_state, next_state;

always @(posedge clk or negedge rst_n)begin
    if(!rst_n)
       current_state <= s0;
    else 
        current_state <= next_state;
end

always @(*)begin
    case(current_state)
        s0: next_state = (din == 1'b1) ? s1 ‌‌: s0 ;
        s1: next_state = (din == 1'b0) ? s2 : s1 ;
        s2: next_state = (din == 1'b0) ? s3 : s2 ;
        s3: next_state = (din == 1'b0) ? s4 : s1 ;
        s4: next_state = (din == 1'b1) ? s1 : s0 ;
        default: next_state = s0;
    endcase
end

always @(*) begin
    detect = (current_state == s4) ? 1'b1 : 1'b0;
end
endmodule

