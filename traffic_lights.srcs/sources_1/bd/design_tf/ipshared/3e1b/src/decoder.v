`timescale 1ns / 1ps

module decoder(input [7:0] out_port, input [7:0] port_id, input write_strobe, input clk, input rst, output reg ce, output reg [5:0] greenLightTime);
    
    always@(*) begin
        if(rst) begin
        ce <= 1'b0;
        greenLightTime <= 6'b000000;
        end
        else begin
            if(write_strobe && port_id == 1) ce <= out_port;
            else if(write_strobe && port_id == 2) greenLightTime <= out_port;
        end
    end

endmodule
