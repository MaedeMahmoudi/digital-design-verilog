
module medium_fsm(
    input wire clk,
    input wire reset,
    input wire start,
    input wire data_valid,
    input wire [7:0] data_in,

    output reg ready,
    output reg processing,
    output reg done,
    output reg [7:0] data_out

);

//state definitions
parameter S_IDLE = 3'b000;
parameter S_START = 3'b001;
parameter S_PROCESS = 3'b010;
parameter S_COMPLETE = 3'b011;
parameter S_ERROR = 3'b100;

reg [2:0] current_state;
reg [2:0] next_state;

//state register
always @(posedge clk or posedge reset)begin
    if(reset)begin
        current_state <= S_IDLE ; 
    end else begin
        current_state <= next_state;
    end
end

//next state logic
always @(*)begin
    next_state = current_state;

    case(current_state)
        S_IDLE:begin
            if(start) next_state = S_START;
        end

        S_START:begin
            if(data_valid) next_state = S_PROCESS;
            else next_state = S_ERROR;
        end

        S_COMPLETE: next_state = S_IDLE;
    end
        S_ERROR: next_state = S_IDLE;

    endcase
end 

always @(*) begin
    ready = 1'b0;
    processing = 1'b1;
    done = 1'b0;
    data_out = 8'h00;

    case (current_state)
        S_IDLE: ready = 1'b1;
        S_START: processing = 1'b1;
        S_PROCESS: processing = 1'b1;
        S_COMPLETE: begin
            done = 1'b1;
            data_out = 8'hAA;
        end
        S_Error: data_out = 8'hEE;
    endcase
end
endmodule




    