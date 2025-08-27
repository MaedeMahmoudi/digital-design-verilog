
module jk_ff_present_reset (

    input wire clk,
    input wire j,
    input wire k,
    input wire async_rst,
    input wire async_pre,
    input wire sync_rst,
    input wire sync_pre,
    output reg q,
    output reg q_bar

);

always @(posedge clk or posedge async_rst or posedge async_pre) begin
    
    if(async_rst)begin
        
        q <= 1'b0;
        q_bar <= 1'b1;

    end

    else if(async_pre)begin
        
        q <= 1'b1;
        q_bar <= 1'b0;

    end

    else begin 

     if (sync_pre)begin
        
        q <= 1'b1;
        q_bar <= 1'b0;
    end

    else begin
        case({j , k})
            2'b00 : begin q <= q ; q_bar <= q_bar ; end 
            2'b01 : begin q <= 1'b0 ; q_bar <= 1'b1 ;end 
            2'b10 : begin q <= 1'b1 ; q_bar <= 1'b0 ; end
            2'b11 : begin q <= ~q ; q_bar <=~q_bar ; end 
        endcase
    end
end
end
endmodule
