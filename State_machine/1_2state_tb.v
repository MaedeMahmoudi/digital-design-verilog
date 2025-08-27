
module tb_simple_fsm;
    reg clk;
    reg reset;
    reg enable;

    wire [1:0] state_out;

    simple_fsm uut(
        .clk(clk),
        .reset(reset),
        .enable(enable),
        ,state_out(state_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        enable = 0;

        reset = 0;

        repeat (3) begin
            enable = 1;
            #10;//RUN
            #10;//DONE
            #10;//IDEL
            
        end
    end
endmodule
    
