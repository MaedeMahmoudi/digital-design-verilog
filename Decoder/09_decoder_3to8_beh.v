
module decoder_3to8_beh(

    input [2:0]a,
    output [7:0]d,
    
);

integer i;

always @(a) begin
    for (i = 0 ; i<8 ; i=i+1 ) begin
        d[i] = (a == i)
    end
end

endmodule