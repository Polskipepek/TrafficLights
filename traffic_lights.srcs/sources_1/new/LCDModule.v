`timescale 1ns / 1ps

module LCDModule(
    input clk,
    input [2:0]rx,

    output lcd_rs,
    output lcd_rw,
    output lcd_e,
    output [7:0] lcd_databus
    );
    
    
    wire RxD_data_ready;
    wire [7:0] RxD_data;
    //async_receiver deserializer(.clk(clk), .RxD(RxD), .RxD_data_ready(RxD_data_ready), .RxD_data(RxD_data));
    assign LCD_RS = RxD_data[7];
    assign LCD_DataBus = {1'b0, RxD_data[6:0]};   // sends only 7 bits to the module, padded with a '0' in front to make 8 bits
    
    assign LCD_RW = 0;
endmodule
