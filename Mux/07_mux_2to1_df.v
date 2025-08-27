
module mux_2to1_df(

    input a,
    input b,
    input select , 
    output out 

);

assign out = select ? b : a ;

endmodule