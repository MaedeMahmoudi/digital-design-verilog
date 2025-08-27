
module tb_shift_register_right;
    reg clk, rst_n , shift_en , ser_in;
    wire [7:0]q;
    wire ser_out;

    shift_register_right DUT(.*);
    always #5 clk = ~clk;

    initial begin
        clk = 0 ; rst_n = 0 ; shift_en = 0 ; ser_in = 0;
        #10 rst_n = 1;

        //load data by shifting
        shift_en = 1 ;
        ser_in = 1 ;#10;
        ser_in = 0; #10;
        ser_in = 1 ;#10;
        ser_in = 0; #10;
        ser_in = 1 ;#10;
        ser_in = 1; #10;
        ser_in = 0 ;#10;
        ser_in = 1; #10;
        
        shift_en = 0;
        #20;

        //shift out
        shift_en = 1;
        ser_in = 0;
        repeat(8) #10;

        #20 $finish;
        
    end

endmodule