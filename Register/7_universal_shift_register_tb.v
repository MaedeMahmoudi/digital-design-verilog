
module tb_universal_shift_register;
    reg clk , rst_n;
    reg [1:0]mode;
    reg ser_in_right , ser_in_left;
    reg [7:0]par_in;
    wire [7:0]q;
    wire ser_in_right, ser_in_left;

    universal_shift_register DUT(.*);

    always #5 clk = ~clk;

    initial begin
        clk = 0 ; rst_n = 0;
        mode = 2'b00 ; ser_in_right = 0 ; ser_in_left = 0 ; par_in = 8'h00;
        #10 rst_n = 1;

        //test parallel load
        mode = 2'b11 ; par_in = 8'b11001100;
        #10;

        //test shift right
        mode = 2'b10 ; ser_in_left = 1;
        repeat(4) #10;

        //test shift left
        mode = 2'b10 ; ser_in_right = 0;
        repeat(4) #10;

        //test hold
        mode = 2'b00;
        #20;

        //test parallel load again
        mode = 2'b11 ; par_in = 8'b10101010;
        #10

        //test complex sequence 
        mode = 2'b01 ; ser_in_left = 1;#10;
        mode = 2'b01 ; ser_in_left = 0 ;#10 ;
        mode = 2'b10 ; ser_in_right = 1 ;#10 ;
        mode = 2'b10 ; ser_in_right = 0; #10 ;
        mode = 2'b00 ; #10;

        #20 $finish;

    end
endmodule