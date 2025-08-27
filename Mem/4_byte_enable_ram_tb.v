
module tb_byte_ram;

    reg clk;
    reg we;
    reg [1:0] byte_en;
    reg [15:0] data_in;
    reg [2:0] addr;

    wire [15:0] data_out;

    byte_enable_ram uut(
        .clk(clk),
        .we(we),
        .byte_en(byte_en),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        we = 0;
        byte_en = 2'b00;
        addr = 3'b000;
        data_in = 16'h0000;
        #10;

        we = 1;
        byte_en = 2'b01;
        addr = 3'b010;
        data_in = 16'h1234;
        #10;

        //read different addr
        we = 0;
        addr = 3'b001;
        #10;
        addr = 3'b010;
        #10;
        addr = 3'b011;
        #10;

        //read whole memory
        we = 0;
        for(int i = 0 ;i<8 ; i++)begin
            addr = i;
            #10;
        end
        #20 $finish;

    end
endmodule
    