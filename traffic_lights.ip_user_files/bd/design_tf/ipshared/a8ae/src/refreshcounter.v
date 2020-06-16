`timescale 1ns / 1ps

module refreshcounter(
    input refresh_clock,
    output reg refresh_counter
    );
    
    initial begin
        refresh_counter = 0;
    end
    
    always @(posedge refresh_clock) 
        refresh_counter <= refresh_counter + 1;
endmodule
