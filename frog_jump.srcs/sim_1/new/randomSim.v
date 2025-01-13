`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 04:45:01 PM
// Design Name: 
// Module Name: 4bitCounterSim
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


module randomSim(
  );
  wire [9:0]y0;
  wire [9:0]y1;
  wire [9:0]y2;
  reg [2:0]count0;
  reg  reset, clkin;
  plantRandomizer UUT (.reset(reset), .clk(clkin), .count0(count0[2:0]), .y0(y0[9:0]), .y1(y1[9:0]), .y2(y2[9:0]));
    parameter PERIOD = 10;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 2;

    initial    // Clock process for clkin
    begin
        #OFFSET
		  clkin = 1'b1;
        forever
        begin
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clkin = ~clkin;
        end
    end
   initial
   begin
     // add your (input) stimuli here
	 // to set signal foo to value 0 use
	 // foo = 1'b0;
	 // to set signal foo to value 1 use
	 // foo = 1'b1;
	 //always advance time my multiples of 100ns
	 // to advance time by 100ns use the following line
	 //start state
    reset = 1'b0;
    count0[0] = 1'b0;
    count0[1] = 1'b0;
    count0[2] = 1'b0;
    #1000;
    end
  endmodule
