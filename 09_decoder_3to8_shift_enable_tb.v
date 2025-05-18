
module decoder_3to8_tb;

    reg [2:0]a;
    reg enable;
    wire [7:0]d;

    decoder_3to8_en_df uut(

    .a(a),
    .enable(enable),
    .d(d)

    );

    initial begin
        
        enable = 0;
        for (int i=0 ; i<8 ;i=i+1 ) begin
            a = i; #10;
        end 

        enable = 1;
        for ( i=0 ; i<8 ; i=i+1 ) begin
            a = i; #10;
        end

        $finish;

    end
endmodule

