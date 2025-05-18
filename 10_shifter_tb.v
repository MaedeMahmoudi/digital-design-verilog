
module shifter_tb;

    reg [7:0]in;
    reg [3:0]shift;
    wire [7:0]out;

    left_shifter #(8) uut(

    .in(in),
    .shift(shift),
    .out(out)

    );

    initial begin
        in = 8'b00001111; shift = 0;
        #10 shift = 1;
        #10 shift = 2;
        #10 shift = 4; 
        #10;

    end
endmodule