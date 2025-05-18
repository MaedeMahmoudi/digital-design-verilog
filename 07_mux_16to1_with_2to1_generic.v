
module mux2_1(

    input a, b , select ,
    output y

);

assign y = select ? b :a ;

endmodule

module mux16_1_generate(

    input [15:0]in,
    input [3:0]select,
    output y

);

wire [15:0] stage_wire [3:0]; //instance for 4 level
genvar i ;

//first level
//8 mux2to1

generate
    for( i=0 ; i<8 ; i = i+1 )begin : stage1
        mux2_1 mux_inst(

        .a(in[2*i]),
        .b(in[2*i+1]),
        .select(select[0]),
        .y(stage_wire[0][i])

        );
        
    end
endgenerate

//second level
//4 mux2to1

generate
    for( i=0 ; i<4 ; i=i+1 )begin:stage2
        mux2_1 mux_inst(

        .a(stage_wire[0][2*i]),
        .b(stage_wire[0][2*i+1]),
        .select(select[1]),
        .y(stage_wire[1][i])

        );

    end

endgenerate

//third level
//1 mux2to1

mux2_1 mux_final(

.a(stage_wire[2][0]),
.b(stage_wire[2][1]),
.select(select[3]),
.y(y)

);

endmodule