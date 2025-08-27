module tb_up_down_counter;
    reg clk;
    reg reset;
    reg enable;
    reg up_down;
    wire [3:0] count;

    // Instantiate the counter
    up_down_counter dut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .up_down(up_down),
        .count(count)
    );

    // Clock generation (100MHz)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize
        clk = 0;
        reset = 1;
        enable = 0;
        up_down = 1;

        // Release reset and test
        #20 reset = 0;
        enable = 1;

        // Count up for 10 cycles
        #100 up_down = 0; // Switch to down counting

        // Count down for 10 cycles
        #100 enable = 0; // Disable counting

        // Wait and re-enable
        #50 enable = 1;
        up_down = 1; // Count up again

        #100 $finish;
    end

    // Monitoring
    initial begin
        $monitor("Time=%0t, Enable=%b, Mode=%s, Count=%d",
                 $time, enable, (up_down) ? "UP" : "DOWN", count);
    end

    // Waveform dumping
    initial begin
        $dumpfile("up_down_counter.vcd");
        $dumpvars(0, tb_up_down_counter);
    end
endmodule
