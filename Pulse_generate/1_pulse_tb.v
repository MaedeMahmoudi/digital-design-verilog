
module tb_PulseGenerator;
    reg clk;
    reg x;
    wire pulse;

    PulseGenerator uut(
        .clk(clk),
        .x(x),
        .pluse(pluse)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        x = 1;

        #20 x = 0;
        #30 x = 1;
        #20 x = 0;
        #30 x = 1;
        
        #20 $finish;
    end
    
endmodule