`timescale 1ns / 1ps

module TrafficLights_TestBench;

    reg clk;
    reg rst;
    reg ce;
    reg up_down;
    
    wire [5:0] lights;
    wire [5:0]  counter;
    reg [5:0] greenLightTime;
    wire [6:0] timeLeftNS;
    wire [6:0] timeLeftEW;

    CounterDesign clock(clk, rst, ce, up_down, counter);
    TrafficLightsDesign trafficLights(counter,rst,ce,lights, greenLightTime, timeLeftNS, timeLeftEW);
    
    initial clk = 1'b0;
    
    always #5 clk = ~clk;
    
    initial begin 
        rst = 1'b0;
        ce = 1'b0;
        up_down = 1'b0;

        greenLightTime = 5'b11111;
        #10 rst = 1'b0;
        #1000 rst = 1'b1;
        #5 ce = 1'b1;
        #5 rst = 1'b0;
    end
endmodule
