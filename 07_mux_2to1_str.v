
module mux_2to1_str(

    input a,
    input b,
    input select,
    output out

    );

wire not_select , and1 , and2 ;

not u1( not_select , select );
and u2( and1 , a , not_sel );
and u3( and2 , b , sel );
or  u4(out , and1 , and2 );

endmodule