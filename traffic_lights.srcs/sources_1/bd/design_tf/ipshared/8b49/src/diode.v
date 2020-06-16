`timescale 1ns / 1ps

module diode(input counter/*25mhz*/, input [2:0] light, output[2:0] o_number);
    reg[2:0] o_number;
    
    initial begin
        o_number = 3'b000;
    end
    
    always@(posedge counter) begin
        o_number <= light;
    end
endmodule
