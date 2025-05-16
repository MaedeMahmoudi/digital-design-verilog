
module half_str_tb;

    reg a;
    reg b;
    wire s;
    wire c;

half_str_tb uut(

    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
);


initial begin
     
    #2 a = 1'b0; b = 1'b1;
    #2 a = 1'b1; b = 1'b0;
    #2 a = 1'b1; b = 1'b1;

    #10 $finish

end

endmodule
