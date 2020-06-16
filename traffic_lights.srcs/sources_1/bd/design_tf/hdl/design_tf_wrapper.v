//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Mon Jun 15 13:04:53 2020
//Host        : DESKTOP-1D942U8 running 64-bit major release  (build 9200)
//Command     : generate_target design_tf_wrapper.bd
//Design      : design_tf_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_tf_wrapper
   (LEDs0,
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
    enable,
    greenLightTime,
    rst);
  output [2:0]LEDs0;
  output [2:0]LEDs1;
  output [2:0]LEDs2;
  output [2:0]LEDs3;
  output [1:0]anode0;
  output [1:0]anode1;
  output [1:0]anode2;
  output [1:0]anode3;
  output [7:0]cathode0;
  output [7:0]cathode1;
  output [7:0]cathode2;
  output [7:0]cathode3;
  input ce;
  input clk;
  input enable;
  input [5:0]greenLightTime;
  input rst;

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
  wire ce;
  wire clk;
  wire enable;
  wire [5:0]greenLightTime;
  wire rst;

  design_tf design_tf_i
       (.LEDs0(LEDs0),
        .LEDs1(LEDs1),
        .LEDs2(LEDs2),
        .LEDs3(LEDs3),
        .anode0(anode0),
        .anode1(anode1),
        .anode2(anode2),
        .anode3(anode3),
        .cathode0(cathode0),
        .cathode1(cathode1),
        .cathode2(cathode2),
        .cathode3(cathode3),
        .ce(ce),
        .clk(clk),
        .enable(enable),
        .greenLightTime(greenLightTime),
        .rst(rst));
endmodule
