
module tb_simple_ram;
    reg clk, we;
    reg [2:0] addr;
    reg [7:0] data_in;
    wire [7:0] data_out;

    simple_ram dut(clk,we,addr,data_in,data_out);

    always #5 clk = ~clk;

    initial begin
        clk = 0; we = 0; addr = 0; data_in = 0;
        #10;

        we =1;
        for (int i=0; i<8 , i++)begin
            addr = i;
            data_in = i*8 +16;
            #10;
        end
        we =0;

        //read
        for(int i=0 , i<8 ; i++)begin
            addr = i;
            #10;
        end
        #20 $finish;
        
    end
endmodule
    