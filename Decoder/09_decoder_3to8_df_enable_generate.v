
module decoder_3to8_enable_generate(

    input [2:0]a,
    input enable,
    output [7:0]d

    );

genvar i;

generate
    for( i=0 ; i<8 ; i=i+1)begin:decoder_gen
        assign d[i] = ( a== i);
    end
endgenerate

endmodule