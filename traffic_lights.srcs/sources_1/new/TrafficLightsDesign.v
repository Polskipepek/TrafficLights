`timescale 1ns / 1ps

module TrafficLightsDesign(counter, rst, ce, lights, greenLightTime, timeLeftNS, timeLeftEW);  

    parameter   _lightsWidth = 6,
                _counterWidth = 6,
                _greenLightTimeWidth = 6,
                _timeLeftWidth = 7;
  
    input wire [_greenLightTimeWidth-1:0] greenLightTime;
    input wire [_counterWidth-1:0] counter;
    input wire rst;
    input wire ce;
    
    reg[2:0] state;
    reg[2:0] state_ce;
    reg[5:0] count;
    
    output reg [_lightsWidth-1:0] lights;
    output reg [_timeLeftWidth-1:0] timeLeftNS;
    output reg [_timeLeftWidth-1:0] timeLeftEW;

    parameter S0 = 3'b000, S1 =3'b001, S2 = 3'b010,
              S3 = 3'b011, S4 = 3'b100, S5 = 3'b101,
              S6 = 3'b110, S7 = 3'b111;
              
    parameter CE0 = 3'b000, CE1 = 3'b010;
     
    parameter SEC5 = 5'b01111, SEC1 = 5'b00011, SEC6_5 = 5'b10100; 
    
    initial begin
        lights <= 6'b000000;
        timeLeftNS <= 0;
        timeLeftEW <= 0;
    end
       
    always @(posedge counter)begin
        if (ce) begin
            if (rst == 1)begin
                state <= S0;
                count <= 0;
                timeLeftNS <= 0;
                end
            else
                case(state)
                    S0: if(count < SEC1) begin
                        state <= S0;
                        count <= count + 1;
                        timeLeftNS <= timeLeftNS - 1;
                        timeLeftEW <= timeLeftEW - 1;
                        end
                    else begin
                        state <= S1;
                        count <= 0;
                        timeLeftNS <= timeLeftNS - 1;
                        timeLeftEW <= greenLightTime;
                    end
                    S1: if(count < greenLightTime) begin
                        state <= S1;
                        count <= count + 1;
                        timeLeftNS <= timeLeftNS - 1;
                        timeLeftEW <= timeLeftEW - 1;
                        end
                    else begin
                        state <= S2;
                        count <= 0;
                    	timeLeftNS <= timeLeftNS - 1;
                        timeLeftEW <= 0;
                        end
                    S2: if(count < SEC1) begin
                        state <= S2;
                        count <= count + 1;
                        timeLeftNS <= timeLeftNS - 1;
                        timeLeftEW <= 0;
                        end
                    else begin
                        state <= S3;
                        count <= 0;
                        timeLeftNS <= timeLeftNS - 1;
                        timeLeftEW <= greenLightTime + SEC6_5 ;
                        end 
                    S3: if(count < SEC1) begin
                        state <= S3;
                        count <= count + 1;
                        timeLeftNS <= timeLeftNS - 1;
                        timeLeftEW <= timeLeftEW - 1;
                        end
                    else begin
                        state <= S4;
                        count <= 0;
                        timeLeftNS <= timeLeftNS - 1;
                        timeLeftEW <= timeLeftEW - 1;
                        end
                    S4: if(count < SEC1) begin
                        state <= S4;
                        count <= count + 1;
                   	    timeLeftNS <= timeLeftNS - 1;
	                    timeLeftEW <= timeLeftEW - 1;
                        end 
                    else begin
                        state <= S5;
                        count <= 0;
                        timeLeftNS <= greenLightTime;
                        timeLeftEW <= timeLeftEW - 1;
                        end
                    S5: if(count < greenLightTime)
                        begin
                        state <= S5;
                        count <= count + 1;
                        timeLeftNS <= timeLeftNS - 1;
                        timeLeftEW <= timeLeftEW - 1;
                        end
                    else begin
                        state <= S6;
                        count <= 0;
                        timeLeftNS <= 0;
                        timeLeftEW <= timeLeftEW - 1;
                        end
                    S6: if(count < SEC1)
                        begin
                        state <= S6;
                        count <= count + 1;
                        timeLeftNS <= 0;
                        timeLeftEW <= timeLeftEW - 1;
                        end
                    else begin
                        state <= S7;
                        count <= 0;
                        timeLeftNS <= greenLightTime + SEC6_5 ;
                        timeLeftEW <= timeLeftEW - 1;
                            end
                    S7: if(count < SEC1)
                        begin
                        state <= S7;
                        count <= count + 1;
                        timeLeftNS <= timeLeftNS - 1;
                        timeLeftEW <= timeLeftEW - 1;
                        end
                    else begin
                        state <= S0;
                        count <= 0;
                        timeLeftNS <= timeLeftNS - 1;
                        timeLeftEW <= timeLeftEW - 1;
                        end 
                    default state <= S0;
                
            endcase
        end
        else
            case(state_ce) 
                CE0: if(count < SEC1) begin
                    state_ce <= CE0;
                    count <= count +1;
                    end 
                else begin
                    state_ce <= CE1;
                    count <= 0;
                    end
                CE1: if(count < SEC1)begin
                    state_ce <= CE1;   
                    count <= count +1; 
                    end
                else begin
                    state_ce <= CE0;
                    count <=0;
                    end
                default state_ce <= CE0;
            endcase
        end
         
    always @(*) begin
         case(state)
             S0: lights = 6'b100110;
             S1: lights = 6'b100001;
             S2: lights = 6'b100010;
             S3: lights = 6'b100100;
             S4: lights = 6'b110100;
             S5: lights = 6'b001100;
             S6: lights = 6'b010100;
             S7: lights = 6'b100100;
             default lights = 6'b100001;
         endcase
     end 
     always @(*) begin
         case(state_ce)
             CE0: lights = 6'b000000;
             CE1: lights = 6'b010010;
         endcase
     end
endmodule