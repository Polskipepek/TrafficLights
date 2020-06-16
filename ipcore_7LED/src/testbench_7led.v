`timescale 1ns / 1ps

module testbench_7led;
    reg [7:0] switch = 0;
    reg system_clk_100mhz = 0;
    wire [7:0] cathode;
    wire [1:0] anode;
    
    top_7LED UUT (switch, system_clk_100mhz, cathode, anode);
    
    always #5 system_clk_100mhz = !system_clk_100mhz;
    
    initial begin
        #100 switch[3:0] = 4;
        #400 switch [7:4] = 8;
    end   
endmodule
