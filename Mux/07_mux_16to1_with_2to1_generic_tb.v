
module mux16_1_generate_tb;

    reg [15:0]in;
    reg [3:0]select;
    wire y;

    mux16_1_generate uut(

    .in(in),
    .select(select),
    .y(y)

    );

    initial begin
        in = 16'hA5A5;
        select = 4'b0000;

        for( integer i=0 ; i<16 ; i=i+1 )begin
            in = 16'hA5A5 ^ i;
            select = i[3:0];
            #10;

            end

            $finish
    end

    endmodule
