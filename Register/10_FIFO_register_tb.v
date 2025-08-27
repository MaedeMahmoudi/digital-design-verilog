
module_tb_fifo_register;
      reg clk;
      reg rst_n;
      reg wr_en;
      reg rd_en;
      reg [7:0] data_in;
      wire [7:0] data_out;
      wire full;
      wire empty;

      fifo_register #(8 , 8) dut(
        .clk(clk),
        .rst_n(rst_n),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
      );

      always #5 clk = ~clk;

      
      initial begin
        clk = 0;
        rst_n = 0;
        wr_en = 0;
        rd_en = 0;
        data_in = 8'h00;

        #15 rst_n = 1;

        //write data until full
        #10 wr_en = 1;
        for(int i = 0; i< 10 ; i = i+1)begin
            data_in = i;
            #10
        end
        wr_en = 0;

        //read data until empty
        #10 rd_en = 1;
        #80 rd_en = 0;

        //simulataneous read and write
        #10 wr_en = 1;
        rd_en = 1;
        for(int i = 20; i<30 ; i =i +1)begin
            data_in = i;
            #10
        end
        wr_en = 0;
        rd_en = 0;

        #50 $finish;
      end 

      