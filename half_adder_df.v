
module half( sum , carry , a , b);

    input a , b;
    output carry , sum ;

    assign sum = a^b ;
    assign carry = a&b ;

endmodule