
module safe_srLatch(

    input s,
    input r,
    output reg q,
    output qn

);

always @(*) begin
    
    if( s == 1'b1 && r == 1'b1 )begin
      
     q = 1'bX;
     qn = 1'bX;

    end 
    
    else if ( s == 1'b0 && r == 1'b0)begin

    end

    else if ( s == 1'b1 && r == 1'b0)begin
      q = 1'b1;
      qn = 1'b0;
    end
     
    else if ( s == 1'b0 && r == 1'b1)begin
        q = 1'b0;
        qn = 1'b1;
    end
end

endmodule