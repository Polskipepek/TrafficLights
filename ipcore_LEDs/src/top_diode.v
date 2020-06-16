`timescale 1ns / 1ps

module top_diode(input clk, input [2:0] light, output [2:0] LEDs);
    clock_divider diode_divider_wrapper(.clk(clk), .refresh_clock(counter)/*10khz*/);
    diode diode_wrapper(.counter(counter), .light(light), .o_number(LEDs));
endmodule
