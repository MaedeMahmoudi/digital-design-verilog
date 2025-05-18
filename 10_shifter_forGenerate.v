
module multi_shifters(

    input [7:0]in8,
    input [15:0]in16,
    input [3:0]shift,
    output [7:0]out8,
    output [15:0]out16

);

genvar i;

generate
    for ( i=0 ; i<1 ; i=i+1 ) begin:shifter8
        
        left_shifter #(8) s1(

        .in(in8),
        .shift(shift),
        .out(out8)

        );

    end
endgenerate

generate
    for ( i=0 ; i<1 ; i=i+1 ) begin
        
        left_shifter #(16) s2(

        .in(in16),
        .shift(shift),
        .out(out16)

        );
    end
endgenerate

endmodule