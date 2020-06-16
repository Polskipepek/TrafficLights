`timescale 1ns / 1ps

module mux2_1(
    input clk,
    input rst,
    input [7:0] port_id,
    input ce,
    input [5:0] greenLightTime,
    output reg [7:0] in_port
    );

    always@(*) begin
        if(rst) in_port  = 8'b00000000;
        else begin
            if(port_id == 1)
                in_port <= ce;
            else if(port_id == 2)
                in_port <= greenLightTime;
        end
    end
endmodule
