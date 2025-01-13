`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2022 01:31:58 PM
// Design Name: 
// Module Name: stateMachine
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


module stateMachine(
    input start,
    input twoSecs,
    input dead,
    input reset,
    input clk,
    output blink,
    output timeStart,
    output resetScreen,
    output timeReset,
    output scoreStart,
    output scoreReset,
    output LD,
    output plantstart,
    output deader
    );
    wire beginer, blinking, run, death;
    wire nextBegin, nextBlink, nextRun, nextDeath;
    wire enable;
    
    assign enable = 1'b1;
    
    assign nextBegin = beginer & ~start | death & reset;
    assign nextBlink = blinking  & ~twoSecs | beginer & start | death & start;
    assign nextRun = run & ~dead | blinking & twoSecs;
    assign nextDeath = death & ~start | run & dead;
    
    assign blink = blinking | death;
    assign timeStart = blinking;
    assign resetScreen = death & start;
    assign timeReset = beginer| death;
    assign scoreStart = run;
    assign scoreReset = death & start;
    assign LD = blinking| beginer;
    assign deader = death;
    
    FDRE #(.INIT(1'b0) ) q_3 (.C(clk), .R(reset), .CE(enable), .D(nextDeath), .Q(death));
    FDRE #(.INIT(1'b0) ) q_2 (.C(clk), .R(reset), .CE(enable), .D(nextRun), .Q(run));
    FDRE #(.INIT(1'b0) ) q_1 (.C(clk), .R(reset), .CE(enable), .D(nextBlink), .Q(blinking));
    FDRE #(.INIT(1'b1) ) q_0 (.C(clk), .R(reset), .CE(enable), .D(nextBegin), .Q(beginer));
endmodule
