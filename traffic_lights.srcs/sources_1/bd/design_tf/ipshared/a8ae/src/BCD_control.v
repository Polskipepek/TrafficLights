`timescale 1ns / 1ps

module BCD_control(
    input [3:0] digit_1,
    input [3:0] digit_2,
    output reg [3:0] digit,
    input refresh_counter
    );
    
    initial digit = 4'b0000;
    
    always@(refresh_counter)begin
        case (refresh_counter)
            0: digit = digit_1; //cyfra po prawej
            1: digit = digit_2; //cyfra po lewej
        endcase
    end
endmodule
