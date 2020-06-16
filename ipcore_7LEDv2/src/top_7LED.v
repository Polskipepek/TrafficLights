`timescale 1ns / 1ps

module top_7LED(
    input [7:0] switch,
    input clk,
    output wire [7:0] cathode,
    output wire [1:0] anode
    );
    
    wire refresh_clock;
    wire refresh_counter;
    wire [3:0] digit;
    
    clock_divider refreshclock_generator(.clk(clk), .refresh_clock(refresh_clock)/*10khz*/);
    
    refreshcounter refreshcounter_wrapper(.refresh_clock(refresh_clock), .refresh_counter(refresh_counter));
    
    anode_control anode_control_wrapper(.refresh_counter(refresh_counter), .anode(anode));
    
    BCD_control BCD_control_wrapper (.digit_1(switch[3:0]), .digit_2(switch[7:4]), .refresh_counter(refresh_counter), .digit(digit));
    
    BCD_to_cathodes BCD_to_cathodes_wrapper(.digit(digit), .cathode(cathode));
endmodule
