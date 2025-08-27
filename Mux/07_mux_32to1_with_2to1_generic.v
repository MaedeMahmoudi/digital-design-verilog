
module mux2_1(

    input a,
    input b,
    input select,
    output y

);

assign y = select ? b : a;

endmodule

module 32_1(

    input [31:0]in,
    input [4:0]select,
    output y

);

//first level
//16 mux2to1

wire [15:0]stage1_out;
genvar i ;

generate
    for( i=0 ; i<16 ; i=i+1 )begin:stage1
        mux2_1 mux(

        .a(in[2*i]),
        .b(in[2*i+1]),
        .select(select[0]),
        .y(stage_out[i])

        );
    end

endgenerate

//second level
//8 mux2to1

wire [7:0]stage2_out
generate
    for( i=0 ; i<8 ; i=i+1 )begin:stage2
        mux2_1 mux(

            .a(stage1_out[2*i]),
            .b(stage1_out[2*i+1]),
            .select(select[1]),
            .y(stage2_out[i])

        );
    end
endgenerate

//third level
//4 mux2to1

wire [3:0]stage3_out;

generate
    for( i=0 ; i<4 ; i=i+1 )begin:stage3
        mux2_1 mux(

            .a(stage2_out[2*i]),
            .b(stage2_out[2*i+1]),
            .select(select[2]),
            .y(stage3_out[i])

        );
    end
endgenerate

//level 4
//2 mux2to1

wire [1:0]stage4_out;
generate
    for ( i=0 ; i<2 ; i=i+1 ) begin:stage4
        mux2_1 mux(

        .a(stage3_out[2*i]),
        .b(stage3_out[2*i+1]),
        .select(select[3]),
        .y(stage4_out[i])

        );
        
    end
endgenerate

//level 5

mux2_1 final_mux(
   
   .a(stage4_out[0]),
   .b(stage4_out[1]),
   .select(select[4]),
   .y(y)
);

endmodule



