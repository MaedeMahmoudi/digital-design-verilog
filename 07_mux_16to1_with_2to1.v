
module mux2_1(

    input a , b , select,
    output y

);

assign y = select ? b : a ;

endmodule

module mux4_1(

    input [3:0]in ,
    input [1:0]select , 
    output y

);

wire y0 , y1 ;

mux2_1 mux0( .a(in[0]) , .b(in[1]) , .select(select[0]) , .y(y0)) ;
mux2_1 mux1( .a(in[2]) , .b(in[3]) , .select(select[0]) , .y(y1)) ;
mux2_1 mux2( .a(y0) , .b(y1) , .select(select[1]) , .y(y)) ;

endmodule

module mux16_1(

    input [15:0]in,
    input [3:0]select,
    output y
);

wire y0 , y1 , y2 ,y3 ;

mux4_1 mux0( .in(in[3:0]) , .select(select[1:0]) , .y(y0));
mux4_1 mux1( .in(in[7:4]) , .select(select[1:0]) , .y(y1));
mux4_1 mux2( .in(in[11:8]) , .select(select[1:0]) , .y(y2));
mux4_1 mux3( .in(in[15:12]) , .select(select[1:0]) , .y(y3));

mux4_1 mux4( .in({y3 , y2 , y1 ,y0 }) , .select(select[3:2]) , .y(y)) ;

endmodule