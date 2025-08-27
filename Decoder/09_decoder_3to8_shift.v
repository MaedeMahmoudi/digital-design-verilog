 
 module decoder_3to8_df_shift(

    input [2:0]a,
    output [7:0]d
 
    );

    assign d = ( 1 << a);

 endmodule
