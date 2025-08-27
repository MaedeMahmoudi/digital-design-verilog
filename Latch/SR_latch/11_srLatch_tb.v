
module srLatch_tb;

reg s,r;
wire q , qn;

srLatch sr(.s(s) , .r(r) , .q(q) , .qn(qn) );

initial begin
    
    s = 0; r = 0; #10;
    s = 1; r = 0 ;#10;
    s =0 ; r = 0 ;#10;

    $finish;

end

endmodule