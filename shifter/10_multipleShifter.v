
// right & left shifter for various lenght

module multi_shifter #(

    parameter WIDTH1 = 8,
    parameter WIDTH2 = 16

    )

    (
        input [WIDTH1-1 :0]in1,
        input [WIDTH2-1:0]in2,
        input [2:0]shift_amount1,
        input [2:0]shift_amount2,
        input dir1,dir2,
        output [WIDTH1-1:0] out1,
        output [WIDTH2-1:0] out2
        
    );

    generate
        if(WIDTH1 == 8)begin
            assign out1 = (dir1 == 0) ? (in1 << shift_amount1) : (in1 >> shift_amount1);
        end
        if(WIDTH2 == 16)begin
            assign out2 = (dir2 == 0) ? (in2 << shift_amount2) : (in2 << shift_amount2);
        end
    endgenerate
endmodule
