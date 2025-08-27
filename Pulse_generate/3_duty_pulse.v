
module VariableDutyPulse #(
    parameter PERIOD = 10,
    parameter DUTY_MIN = 1,
    parameter DUTY_MAX = 9
)(
    input wire clk,
    input wire reset,
    input wire [3:0] duty_cycle,
    output reg pulse
);

reg [7:0] counter;

always @(posedge clk or  posedge reset) begin
    if (reset) begin
        counter <= 0;
        pulse <= 0;
    end else begin
        if(counter == PERIOD-1)
           counter <= 0;
    else 
        counter <= counter + 1;

    pulse <= (counter < duty_cycle) ? 1:0;
    end
end
endmodule
