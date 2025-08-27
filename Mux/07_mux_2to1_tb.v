
`timescale 1ps/1ps

module tb_mux_2to1;

    rea a , b , select ;
    wire out;

mux_2to1_str uut(

.a(a),
.b(b),
.select(select)
.out(out)

);

initial begin 

    a = 0 ; b = 0 ; select = 0 ;
    #10;
    a = 0 ; b = 1 ; select = 1;
    #10
    a = 0 ; b = 1 ; select = 1;
    #10
    a = 1 ; b = 0 ; select = 1;
    #10

    $finish
end

endmodule