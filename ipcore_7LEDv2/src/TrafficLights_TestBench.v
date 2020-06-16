`timescale 1ns / 1ps

module TrafficLights_TestBench;

    /*reg clk;
    reg rst;
    reg ce;

    wire [5:0] lights;
    //wire [5:0]  counter;
    reg [5:0] greenLightTime;
    wire [6:0] timeLeftNS;
    wire [6:0] timeLeftEW;*/

  wire [2:0]LEDs0;
  wire [2:0]LEDs1;
  wire [2:0]LEDs2;
  wire [2:0]LEDs3;
  wire [1:0]anode0;
  wire [1:0]anode1;
  wire [1:0]anode2;
  wire [1:0]anode3;
  wire [7:0]cathode0;
  wire [7:0]cathode1;
  wire [7:0]cathode2;
  wire [7:0]cathode3;
  reg ce;
  reg clk;
  reg [5:0]greenLightTime;
  reg rst;


    design_tf_wrapper designUUT (
    LEDs0,
    LEDs1,
    LEDs2,
    LEDs3,
    anode0,
    anode1,
    anode2,
    anode3,
    cathode0,
    cathode1,
    cathode2,
    cathode3,
    ce,
    clk,
    greenLightTime,
    rst);

    //TrafficLights trafficLights(clk, rst, ce, lights, greenLightTime, timeLeftNS, timeLeftEW);

    initial begin
        clk = 1'b0;
        ce =0;
        greenLightTime = 5'b00000;
        rst =0;

    end
        
    always #5 clk = ~clk;
    
    initial begin 
        #20 rst = 1'b1;
        ce = 1'b0;

        #100 greenLightTime = 5'b01111;
        #10 rst = 1'b0;
        #1000 rst = 1'b1;
        #5 ce = 1'b1;
        #5 rst = 1'b0;
    end
endmodule
