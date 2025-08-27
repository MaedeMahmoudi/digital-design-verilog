
module mux2to1(

    input  in0, in1 , select , 
    output out

);

assign out = select ? in1 : in0 ;

endmodule

module mux8to1(

    input [7:0]in,
    input [2:0]select,
    output out

);

wire [3:0]mux1_out;
wire [1:0]mux2_out;

//first level 

mux2to1 mux1_0( .in0(in[0]) , .in1(in[1]) , .select(select[0]) , .out(mux1_out[0]));
mux2to1 mux1_1( .in0(in[2]) , .in1(in[3]) , .select(select[0]) , .out(mux1_out[1]));
mux2to1 mux1_2( .in0(in[4]) , .in1(in[5]) , .select(select[0]) , .out(mux1_out[2]));
mux2to1 mux1_2( .in0(in[6]) , .in1(in[7]) , .select(select[0]) , .out(mux1_out[3]));

//second level

mux2to1 mux2_0( .in0(mux1_out[0]) , in1(mux1_out[1]) , .select(select[1]) , .out(mux2_out[0]));
mux2to1 mux2_1( .in0(mux1_out[2]) , .in1(mux1_out[3]) , .select(select[1]) , .out(mux2_out[1]));

//second level

mux2to1 mux3_0( .in0(mux2_out[0]) , in1(mux2_out[1]) , .select(second[2]) , .out(out));

endmodule