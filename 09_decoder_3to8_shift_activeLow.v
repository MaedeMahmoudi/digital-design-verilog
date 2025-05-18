
module decoder_3to8_select(

    input [2:0]a,
    input activeLow_enable,
    output [7:0]d

);

assign d = ~activeLow_enable ? ( 1 << a ) : 8'b00000000;

endmodule