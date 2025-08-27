
module PulseGenerator(
    input wire clk,
    input wire x,
    output reg pulse
);

    reg x_prev;

    always @(posedge clk)begin
        if(x==0 && x_prev==1)
           pluse <= 1'b1;
        else 
           pluse <= 1'b0;

        x_prev <= x;

    end
endmodule
