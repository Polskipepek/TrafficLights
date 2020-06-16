`timescale 1ns / 1ps

module CounterDesign(clk, rst, ce, up_down, counter);
    parameter COUNTER_WIDTH = 6;
    
    input clk;
    input rst;
    input  ce;
    input up_down;
    output counter;
    
    reg [COUNTER_WIDTH-1:0] counter = {COUNTER_WIDTH{1'b0}};
    wire up_down;


    always @(posedge clk) begin
        if (rst)
            counter <= {COUNTER_WIDTH{1'b0}};
        else
            if (up_down)
                counter <= counter + 1'b1;
            else 
                counter <= counter - 1'b1; 
    end
endmodule

