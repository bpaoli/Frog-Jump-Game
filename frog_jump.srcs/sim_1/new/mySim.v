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


module mySim(
  );
  wire [3:0] vgaRed;
  wire [3:0] vgaBlue;
  wire [3:0] vgaGreen;
  wire [6:0]seg;
  wire [3:0]an;
  wire[15:0] led;
  wire dp, hsync, vsync;
  reg  btnU, btnD, btnR, btnC, clkin;
  topLevel UUT (.btnU(btnU), .btnD(btnD), .btnR(btnR), .btnC(btnC), .clkin(clkin), .hsync(hsync), .vsync(vsync), .vgaRed(vgaRed[3:0]), .vgaBlue(vgaBlue[3:0]),.vgaGreen(vgaGreen[3:0]), .dp(dp), .seg(seg[7:0]), .an(an[3:0]), .led(led[15:0]));
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
    btnR = 1'b0;
    btnD = 1'b0;
    btnC = 1'b1;
    btnU = 1'b0;
    #1000;
    end
  endmodule
