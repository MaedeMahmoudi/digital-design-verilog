
module tb_daul_port_ram;
    reg clk, we;
    reg [2:0] addr_a,addr_b;
    wire [7:0] data_out_a,data_out_b;

    dual_port_ram dut(clk , we , addr_a , addr_b , data_out_a , data_out_b);

    always #5 clk = ~clk;

    initial begin
        clk = 0 ; we = 0 ; addr_a = 0 ; addr_b = 0 ; data_in = 0;
        #10;

        //write from port a 
        we = 1;
        for(int i=0 ; i<8 ; i++)begin
            addr_a = i;
            data_in = i*8 + 32;
            #10;
        end
        we =0;

        //read simaltanious from 2 ports
        for(int i=0 ; i<8 ; i++)begin
            addr_a = i;
            addr_b = 7-i;
            #10;
        end
        #20 $finish;


end
endmodule
    
