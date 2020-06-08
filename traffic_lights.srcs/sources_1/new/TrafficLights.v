`timescale 1ns / 1ps

module TrafficLights(clk, rst, ce, lights);

    parameter   _counterWidth = 6,
                _lightsWidth = 6;
    input   clk;
    input   rst;
    input   ce;
    output lights;

    wire [_lightsWidth-1:0]     lights;
    wire [_counterWidth-1:0]    counter;
    
    CounterDesign zegar(.clk(clk), .rst(rst), .ce(ce), .up_down(up_down), .counter(counter));
    TrafficLightsDesign swiatla(.counter(counter), .rst(rst),.ce(ce), .lights(lights));

endmodule
