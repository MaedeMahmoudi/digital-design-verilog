
module simple_fsm(
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [1:0] state_out
);

//state definitions
parameter IDEL = 2'b00;
parameter RUN = 2'b01;
parameter DONE = 2'b10;

reg [1:0] current_state;
reg [1:0] next_state;

//state register
always @(posedge clk or posedge reset)begin
    if(reset)begin
        current_state <= IDEL;
    end else begin
        current_state <= next_state;
    end
end

//next state logic
always @(*)begin
    case(current_state)
        IDEL: next_state = enable ? RUN : IDEL;
        RUN : next_state = DONE;
        DONE : next_state = IDEL;
        default: next_state = IDEL;
    endcase
end

//output logic
always @(*)begin
    state_out = current_state;
end
endmodule
        
        
