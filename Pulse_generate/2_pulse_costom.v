
module PulseGenerator(
    input wire clk,
    input wire reset,
    output reg pulse
);

parameter PERIOD = 10;//clock priod
parameter WIDTH = 2;//pulse width 

reg [31:0] counter;//count period

always @(posedge clk or posedge reset) begin
    if(reset)begin
        counter <= 0;
        pulse <= 0;
    end else begin
        if(counter == PERIOD-1)begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
        
        if(counter < WIDTH)begin
            pulse <= 1;
        end else begin
            pulse <= 0;
        end
    end
    
end
endmodule

