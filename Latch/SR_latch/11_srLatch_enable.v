
module sr_latch_with_enable(

    input s , r ,c ,
    output reg q ,qn

);

always @(*) begin
    
    if( c == 1 )begin
        if( s==1 && r == 0)begin
            q <= 1;
            qn <=0;
        end else if ( s == 0 && r == 1)begin
            q <= 0;
            qn <= 1;

        end else if ( s == 0 && r == 0)begin
            

        end else if ( s == 1 && r == 1)begin
            q <= 1'bX;
            qn <= 1'bX;
        end
    end

end

endmodule