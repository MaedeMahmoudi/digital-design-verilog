
module tb_medium_fsm();
    reg clk;
    reg reset;
    reg start;
    reg data_valid;
    reg [7:0] data_in;

    wire ready;
    wire processing;
    wire done;
    wire [7:0] data_out;

    medium_fsm(
        .clk(clk),
        .reset(reset),
        .start(start),
        .data_valid(data_valid),
        .data_in(data_in),
        .ready(ready),
        .processing(processing),
        .done(done),
        .data_out(data_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        start = 0;
        data_valid = 0;
        data_in = 8'h00;

        #10 reset = 0;

        #10;

        #10 start = 1;
        #10 start =0;
    end
    