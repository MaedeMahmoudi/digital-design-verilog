
module tb_PulseGenerator;
    reg clk,reset;
    wire pulse;

    PulseGenerator #(
        .PERIOD(10),
        .WIDTH(2)
    )uut(
        .clk(clk),
        .reset(reset),
        .pulse(pulse)
    );

    initial begin
        reset = 1;
        #10 reset = 0;
        #100 $finish;
    end
endmodule