
module decoder_2to4_gate(

    input [1:0]a,
    output [3:0]d

);

wire a0_not , a1_not ;

not u1(a0_not , a[0]);
not u2(a1_not , a[1]);

and u3( d[0] , a0_not , a1_not );
and u4( d[1] , a[0] , a1_not );
and u5( d[2] , a[1] , a0_not );
and u6( d[3] , a[1] , a[0] );

endmodule