
module decoder_3to8_str(

    input [2:0]a,
    output [7:0]d

    );

    wire a0_not , a1_not , a2_not ;

    not u1(a0_not , a[0]);
    not u2(a1_not , a[1]);
    not u3(a2_not , a[2]);

    and g1(d[0] , a2_not ,a1_not , a0_not );
    and g2(d[1] , a2_not , a1_not , a[0] );
    and g3(d[2] , a2_not , a[1] , a0_not );
    and g4(d[3] , a2_not , a[1] , a[0] );
    and g5(d[4] , a[2] , a1_not , a0_not );
    and g6(d[5] , a[2] , a1_not , a[0] );
    and g7(d[6] , a[2] , a[1] , a0_not );
    and g8(d[7] , a[2] , a[1] , a[0] );

endmodulee