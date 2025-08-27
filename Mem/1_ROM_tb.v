
module tb_simple_rom;
    reg [2:0] addr;
    wire [7:0] data;

    simple_rom dut(addr , data);

    initial begin
        for(int i=0 ; i<8 ; i++)begin
            addr = i;
            #10;
        end
        #10 $finish;
    end
endmodule

    