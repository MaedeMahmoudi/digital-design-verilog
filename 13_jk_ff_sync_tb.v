

module jk_ff_sync_rst_tb;
    reg clk , j , k ,rst ;
    wire q , q_bar;

    jk_ff_sync_rst uut(clk , j ,k , rst , q , q_bar );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1 ; j = 0 ; k = 0 ; #12;
        rst = 0;
    
    j = 1 ; k = 0 ; #8 ;
    rst = 1 ; #10;
    rst = 0;

    j = 0 ; k= 0 ; #10;
    j = 0 ; k= 1 ; #10;
    j = 1 ; k= 1 ; #20;
    
    $finish ;

end

endmodule

