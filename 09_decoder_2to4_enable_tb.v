
module decoder_2to4_en;

    reg [1:0]a;
    reg enable;
    wire [3:0]d;

    decoder_2to4_en_str uut(

    .a(a),
    .en(en),
    .d(d)

    );

    initial begin
        
        enable = 0;
        a = 2'b00; #10;
        a = 2'b01; #10;
        a = 2'b10; #10;
        a = 2'b11; #10;
        
        enable = 1;
        a = 2'b00; #10;
        a = 2'b01; #10;
        a = 2'b10; #10;
        a = 2'b11; #10;
        
        repeat(5)begin
            enable = $random;
            a = $random;
            #10
        end
        $finish;
    end
endmodule