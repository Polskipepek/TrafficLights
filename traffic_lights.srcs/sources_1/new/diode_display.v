`timescale 1ns / 1ps

module diode_display(input wire [2:0] innumber, output wire [2:0] LEDs);
    assign LEDs = innumber;
endmodule
