`timescale 1ns / 1ps

module anode_control(
    input refresh_counter, //10khz
    output reg [1:0] anode
    );
    
    always@(refresh_counter)begin
        case (refresh_counter)
            1'b0: anode = 2'b10; //cyfra po prawej
            1'b1: anode = 2'b01; //cyfra po lewej
        endcase
    end
endmodule
