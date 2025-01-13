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


module frogCountsim(
  );

  wire [9:0]starty;
  reg  reset, clkin, dive, jump, death, btnC, frame;
  frogJump UUT (.reset(reset),.frame(frame), .clk(clkin), .btnC(btnC), .dive(dive), .jump(jump), .death(death), .starty(starty[9:0]));
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
    dive = 1'b0;
    jump = 1'b0;
    death = 1'b0;
    btnC = 1'b0;
    frame = 1'b0;
    #1000;
    frame = 1'b1;
    dive = 1'b1;
    #500;
    dive = 1'b0;
    death = 1'b1;
    #100;
    death = 1'b0;
    btnC = 1'b1;
    #100;
    btnC = 1'b0;
    #100;
    end
  endmodule
