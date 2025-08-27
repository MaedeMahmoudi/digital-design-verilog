
module moore_fsm(
    input wire clk,
    input wire reset,
    input wire in_bit,

    output reg out_bit
); 

//state definitions
typedef enum logic [1:0]{
    s0 = 2'b00,
    s1 = 2'b01,
    s2 = 2'b10
} state_t;

//state register
state_t current_state, next_state;

always_ff @(posedge clk or posedge reset)begin
    if(reset)begin
        current_state <= s0;
    end else begin
        current_state <= next_state;
    end
end

always_comb begin
    case(current_state)
        s0: next_state = in_bit ? s1 : s0;
        s1: next_state = in_bit ? s2 : s0;
        s2: next_state = in_bit ? s2 : s0;
        default: next_state = s0;
    endcase
end

        