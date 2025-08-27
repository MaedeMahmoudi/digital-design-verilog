
module half_sub_tb;

    reg a;
    reg b;
    wire difference;
    wire borrow;

half_sub_str uut(

   .a(a),
   .b(b),
   .difference(difference),
   .borrow(borrow)

);

initial begin
    a = 0 ;
    b = 0 ;

#2 a = 1'b0; b = 1'b1;
#2 a = 1'b1; b = 1'b0;
#2 a = 1'b0; b = 1'b1;

#8 $finish;

end 
endmodule

