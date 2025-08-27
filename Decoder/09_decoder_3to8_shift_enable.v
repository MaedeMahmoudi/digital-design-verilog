
module decoder_3to8_en_df(

    input [2:0]a,
    input enable,
    output [7:0]d

    );

    assign d = enable ? ( 1<<a ) : 8'b00000000;

endmodule