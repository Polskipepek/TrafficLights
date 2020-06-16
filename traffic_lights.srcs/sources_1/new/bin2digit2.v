`timescale 1ns / 1ps

module bin2digit2(input [6:0] timeleftbin, output [7:0] timeleft);    
    assign timeleft [3:0] = timeleftbin % 10;
    assign timeleft [7:4] = timeleftbin / 10;   
endmodule
