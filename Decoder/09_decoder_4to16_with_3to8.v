
module decoder_4to16(

    input [3:0]a,
    input enable,
    output [15:0]d

  );

  wire enable_high = enable & a[3];
  wire enable_low = enable & ~a[3];

  
  decoder_3to8 decoder_low(

  .a(a[2:0]),
  .enable(enable_low),
  .d(d[7:0])

  );
  
  decoder_3to8 decoder_high(

  .a(a[2:0]),
  .enable(enable_high),
  .d(d[15:8])

  );

endmodule

