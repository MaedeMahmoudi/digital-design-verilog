
module full_sub_tb;
  reg a;
  reg b;
  reb borrowIn;
  wire difference;
  wire borrowOut;

  full_sub_str uut(

    .a(a),
    .b(b),
    .borrowIn(borrowIn),
    .difference(difference),
    .borrowOut(borrowOut)
  );

  initial begin

    a = 0 ;
    b = 0 ;
  
end

always #4 a = a + 1'b1 ;
always #2 b = b + 1'b1;
always #1 borrowIn = borrowIn + 1'b1;

#20 $finish

endmodule