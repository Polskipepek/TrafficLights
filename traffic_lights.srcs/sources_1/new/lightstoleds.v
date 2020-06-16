`timescale 1ns / 1ps

module lightstoleds(
    input [5:0] lights,
    output [2:0] lightNS,
    output [2:0] lightEW
    );
    
    assign lightNS = lights[2:0];
    assign lightEW = lights[5:3];

endmodule
