
module tb_simple_fifo;
    reg clk, rst ,wr_en , rd_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty;

    simple_fifo  uut(
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    //clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0 ; rst = 1; wr_en = 0; rd_en = 0; data_in = 0;
        #20; rst = 0;

        //write until full
        for(int i=1 ; i<=5 ; i = i+1)begin
            wr_en = 1 ;
            data_in = i;
            #10;

            if(full)begin
                wr_en = 0;
                break;
        end
    end

    //read until empty
    wr_en = 0; rd_en = 1;
    #50;
    rd_en = 0;  
    
   //simultaneous read/write
    fork
        begin
            // write process
            for(int i=10 ; i<15 ; i = i+1)begin
                @(negedge clk);
                wr_en = 1;data_in = i;
        end
        begin
            // read process
            #15;
            for(int i = 0; i<5 ; i=i+1)begin
                @(negedge clk);
                rd_en = 1;
            end
            rd_en = 0;
        end
    join
end
    endmodule
     