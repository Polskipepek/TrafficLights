//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Mon Jun 15 13:04:53 2020
//Host        : DESKTOP-1D942U8 running 64-bit major release  (build 9200)
//Command     : generate_target design_tf.bd
//Design      : design_tf
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_tf,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_tf,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=16,numReposBlks=16,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=5,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_tf.hwdef" *) 
module design_tf
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst, CLK_DOMAIN design_tf_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk;
  input enable;
  input [5:0]greenLightTime;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst;

  wire [5:0]TrafficLights_0_lights;
  wire [6:0]TrafficLights_0_timeLeftEW;
  wire [6:0]TrafficLights_0_timeLeftNS;
  wire [7:0]bin2digit2_0_timeleft;
  wire [7:0]bin2digit2_1_timeleft;
  wire ce_1;
  wire clk_1;
  wire decoder_0_ce;
  wire [5:0]decoder_0_greenLightTime;
  wire enable_1;
  wire [5:0]greenLightTime_1;
  wire [11:0]kcpsm6_0_address;
  wire [7:0]kcpsm6_0_out_port;
  wire [7:0]kcpsm6_0_port_id;
  wire kcpsm6_0_write_strobe;
  wire [2:0]lightstoleds_0_lightEW;
  wire [2:0]lightstoleds_0_lightNS;
  wire [7:0]mux2_1_0_in_port;
  wire [17:0]pamiec_procesora_0_instruction;
  wire rst_1;
  wire [1:0]top_7LED_0_anode;
  wire [7:0]top_7LED_0_cathode;
  wire [1:0]top_7LED_1_anode;
  wire [7:0]top_7LED_1_cathode;
  wire [1:0]top_7LED_2_anode;
  wire [7:0]top_7LED_2_cathode;
  wire [1:0]top_7LED_3_anode;
  wire [7:0]top_7LED_3_cathode;
  wire [2:0]top_diode_0_LEDs;
  wire [2:0]top_diode_1_LEDs;
  wire [2:0]top_diode_2_LEDs;
  wire [2:0]top_diode_3_LEDs;

  assign LEDs0[2:0] = top_diode_0_LEDs;
  assign LEDs1[2:0] = top_diode_1_LEDs;
  assign LEDs2[2:0] = top_diode_2_LEDs;
  assign LEDs3[2:0] = top_diode_3_LEDs;
  assign anode0[1:0] = top_7LED_2_anode;
  assign anode1[1:0] = top_7LED_0_anode;
  assign anode2[1:0] = top_7LED_1_anode;
  assign anode3[1:0] = top_7LED_3_anode;
  assign cathode0[7:0] = top_7LED_0_cathode;
  assign cathode1[7:0] = top_7LED_2_cathode;
  assign cathode2[7:0] = top_7LED_1_cathode;
  assign cathode3[7:0] = top_7LED_3_cathode;
  assign ce_1 = ce;
  assign clk_1 = clk;
  assign enable_1 = enable;
  assign greenLightTime_1 = greenLightTime[5:0];
  assign rst_1 = rst;
  design_tf_TrafficLights_0_0 TrafficLights_0
       (.ce(decoder_0_ce),
        .clk(clk_1),
        .greenLightTime(decoder_0_greenLightTime),
        .lights(TrafficLights_0_lights),
        .rst(rst_1),
        .timeLeftEW(TrafficLights_0_timeLeftEW),
        .timeLeftNS(TrafficLights_0_timeLeftNS));
  design_tf_bin2digit2_0_0 bin2digit2_0
       (.timeleft(bin2digit2_0_timeleft),
        .timeleftbin(TrafficLights_0_timeLeftNS));
  design_tf_bin2digit2_0_1 bin2digit2_1
       (.timeleft(bin2digit2_1_timeleft),
        .timeleftbin(TrafficLights_0_timeLeftEW));
  design_tf_decoder_0_0 decoder_0
       (.ce(decoder_0_ce),
        .clk(clk_1),
        .greenLightTime(decoder_0_greenLightTime),
        .out_port(kcpsm6_0_out_port),
        .port_id(kcpsm6_0_port_id),
        .rst(rst_1),
        .write_strobe(kcpsm6_0_write_strobe));
  design_tf_kcpsm6_0_0 kcpsm6_0
       (.address(kcpsm6_0_address),
        .clk(clk_1),
        .in_port(mux2_1_0_in_port),
        .instruction(pamiec_procesora_0_instruction),
        .interrupt(1'b0),
        .out_port(kcpsm6_0_out_port),
        .port_id(kcpsm6_0_port_id),
        .reset(rst_1),
        .sleep(1'b0),
        .write_strobe(kcpsm6_0_write_strobe));
  design_tf_lightstoleds_0_0 lightstoleds_0
       (.lightEW(lightstoleds_0_lightEW),
        .lightNS(lightstoleds_0_lightNS),
        .lights(TrafficLights_0_lights));
  design_tf_mux2_1_0_0 mux2_1_0
       (.ce(ce_1),
        .clk(clk_1),
        .greenLightTime(greenLightTime_1),
        .in_port(mux2_1_0_in_port),
        .port_id(kcpsm6_0_port_id),
        .rst(rst_1));
  design_tf_pamiec_procesora_0_2 pamiec_procesora_0
       (.address(kcpsm6_0_address),
        .clk(clk_1),
        .enable(enable_1),
        .instruction(pamiec_procesora_0_instruction));
  design_tf_top_7LED_0_4 top_7LED_0
       (.anode(top_7LED_0_anode),
        .cathode(top_7LED_0_cathode),
        .clk(clk_1),
        .switch(bin2digit2_0_timeleft));
  design_tf_top_7LED_1_1 top_7LED_1
       (.anode(top_7LED_1_anode),
        .cathode(top_7LED_1_cathode),
        .clk(clk_1),
        .switch(bin2digit2_1_timeleft));
  design_tf_top_7LED_2_1 top_7LED_2
       (.anode(top_7LED_2_anode),
        .cathode(top_7LED_2_cathode),
        .clk(clk_1),
        .switch(bin2digit2_0_timeleft));
  design_tf_top_7LED_3_1 top_7LED_3
       (.anode(top_7LED_3_anode),
        .cathode(top_7LED_3_cathode),
        .clk(clk_1),
        .switch(bin2digit2_1_timeleft));
  design_tf_top_diode_0_0 top_diode_0
       (.LEDs(top_diode_0_LEDs),
        .clk(clk_1),
        .light(lightstoleds_0_lightNS));
  design_tf_top_diode_1_0 top_diode_1
       (.LEDs(top_diode_1_LEDs),
        .clk(clk_1),
        .light(lightstoleds_0_lightEW));
  design_tf_top_diode_2_0 top_diode_2
       (.LEDs(top_diode_2_LEDs),
        .clk(clk_1),
        .light(lightstoleds_0_lightNS));
  design_tf_top_diode_3_0 top_diode_3
       (.LEDs(top_diode_3_LEDs),
        .clk(clk_1),
        .light(lightstoleds_0_lightEW));
endmodule
