`timescale 1ns / 1ps

module clock_divider(
    input clk, //100Mhz
    output refresh_clock //25khz
    );
    

    reg refresh_clock;
    
    localparam div_value = 4999; //10khz
    //wartosc = 100Mhz/(2*docelowa czestotliwosc) - 1 => 1Hz =>49999999
    
    integer counter_value = 0; //32 bit wide reg bus
    
    initial begin 
        refresh_clock = 0;
    end
    
    always@(posedge clk) begin
        if (counter_value == div_value) counter_value <= 0;
        else counter_value <= counter_value + 1;
    end
    
    always@(posedge clk) begin
        if (counter_value == div_value) refresh_clock <= ~refresh_clock;
        else refresh_clock <= refresh_clock;
    end
endmodule
