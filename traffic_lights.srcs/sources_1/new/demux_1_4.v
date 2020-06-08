`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.06.2020 21:08:15
// Design Name: 
// Module Name: demux_1_4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module demux_1_4(
    input [5:0] lights,
    input sel,
    output [2:0] de_out_0,
    output [2:0] de_out_1,
    output [2:0] de_out_2,
    output [2:0] de_out_3
    );
    
    reg de_out_0;
    reg de_out_1;
    reg de_out_2;
    reg de_out_3;
    
    always @(lights) begin
        case(sel)
            1'b0 : begin
                de_out_0 =  lights;
                de_out_1 =  0;
                de_out_2 =  lights;
                de_out_3 =  0;
            end
            1'b1 : begin
                de_out_0 =  0;
                de_out_1 =  lights;
                de_out_2 =  0;
                de_out_3 =  lights;                 
            end 
        endcase 
    end
endmodule
