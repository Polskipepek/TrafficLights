`timescale 1ns / 1ps

module TrafficLights(clk, rst, ce, lights, greenLightTime, timeLeftNS, timeLeftEW);

    parameter   _lightsWidth = 6,
                _counterWidth = 6,
                _greenLightTimeWidth = 6,
                _timeLeftWidth = 7;
                
    input   clk;
    input   rst;
    input   ce;
    output lights;

    wire [_lightsWidth-1:0]     lights;
    wire [_counterWidth-1:0]    counter;
    
    input wire [_greenLightTimeWidth-1:0] greenLightTime;
    output wire [_timeLeftWidth-1:0] timeLeftNS;
    output wire [_timeLeftWidth-1:0] timeLeftEW;
    
    CounterDesign zegar(.clk(clk), .rst(rst), .ce(ce), .up_down(up_down), .counter(counter));
    TrafficLightsDesign swiatla(.counter(counter), .rst(rst),.ce(ce), .lights(lights), .greenLightTime(greenLightTime), .timeLeftNS(timeLeftNS),.timeLeftEW(timeLeftEW));

endmodule
