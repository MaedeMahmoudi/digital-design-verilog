
module decoder_2to4_en_str(

    input [1:0]a,
    input enable,
    output [3:0]d

    );

  wire a0_not , a1_not;

  not u1( a0_not , a[0] );
  not u2( a1_not , a[1] );

  wire t0 , t1 , t2 , t3;

  and u3( t0 , a1_not , a0_not );
  and u4( t1 , a1_not , a[0] );
  and u5( t2 , a[0] , a0_not );
  and u6( t3 , a[1] , a[0] );
  
  and g1(d[0] , t0 , enable );
  and g2(d[1] , t1 , enable );
  and g3(d[2] , t2 , enable );
  and g4(d[3] , t3 , enable );

endmodule
