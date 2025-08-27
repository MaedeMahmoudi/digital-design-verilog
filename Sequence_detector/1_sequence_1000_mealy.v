//sequence 1000 mealy

module seq_detector_mealy(
    input wire clk,
    input wire rst_n,
    input wire din,
    output reg detect
);

//define states
parameter s0 = 2'b00;//initial state
parameter s1 = 2'b01;//received '1'
parameter s2 = 2'b10;//received '10'
parameter s3 = 2'b11;//received '100'

reg [1:0] current_state, next_state;


//state register
always @(negedge rst_n or posedge clk) begin
    if(!rst_n)
        current_state <= s0;
    else 
    current_state <= next_state;
end

//next state logic
always @(*)begin
    case(current_state)
        s0: next_state = (din == 1'b1) ? s1 : s0;
        s1: next_state = (din == 1'b0) ? s2 : s1;
        s2: next_state = (din == 1'b0) ? s3 : s1;
        s3: next_state = (din == 1'b0) ? s0 : s1;
        default: next_state = s0;
    endcase
end

//output logic (combinational) - Mealy output depeands on state and onput
always @(*)begin
    case(current_state)
        s3: detect = (din == 1'b0) ? 1'b1 : 1'b0;
        default: detect = 1'b0;
    endcase
end
endmodule
