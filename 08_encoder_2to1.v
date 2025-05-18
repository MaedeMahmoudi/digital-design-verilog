
module encoder_2to1(

    input in0,in1,
    output reg out,
    ooutput reg var

);

always @(*) begin
    if(in1 && in0)begin
        out = 1'bx;//unknown 
        val = 1'bx;

    end

    elseif(in1)begin
        out = 1'b1;
        val = 1'b1;
    end

    elseif(in0)begin
        out = 1'b0;
        var = 1'b0;
    end
    else begin//enable all inputs
        out = 1'bx;
        val = 1'bx;
    end
end

endmodule