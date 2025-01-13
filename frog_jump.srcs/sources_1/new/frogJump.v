`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 03:50:54 PM
// Design Name: 
// Module Name: frogJump
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


module frogJump(
    input reset,
    input btnC,
    input clk,
    input frame,
    input dive,
    input jump,
    input death,
    output [9:0]starty,
    output Init,
    output Dive,
    output Diveup,
    output Jump,
    output Jumpdown,
    output Death
    );
    wire [9:0] Q;
    wire Frame0, Frame32;
    //wire Init, Dive, Diveup, Jump, Jumpdown, Death;
    wire nextinit, nextdive, nextdiveup, nextjump, nextjumpdown, nextdeath;
    wire enable = 1'b1;
    
    assign nextinit = ~dive & ~jump & ~death & Init | Diveup & Frame0 | Jumpdown & Frame0 | Death & btnC;
    assign nextdive = ~Frame32 & Dive & ~death | dive & Init;
    assign nextdiveup = Diveup & ~Frame0 & ~death | Dive & Frame32;
    assign nextjump = Init & jump | ~Frame32 & Jump & ~death;
    assign nextjumpdown = Jumpdown & ~Frame0 & ~death | Jump & Frame32;
    assign nextdeath = Init & death | Dive & death | Diveup & death | Jump & death | Jumpdown & death | Death & ~btnC;
    
    FDRE #(.INIT(1'b0) ) q_5 (.C(clk), .R(reset), .CE(enable), .D(nextdeath), .Q(Death));
    FDRE #(.INIT(1'b0) ) q_4 (.C(clk), .R(reset), .CE(enable), .D(nextjumpdown), .Q(Jumpdown)); 
    FDRE #(.INIT(1'b0) ) q_3 (.C(clk), .R(reset), .CE(enable), .D(nextjump), .Q(Jump));
    FDRE #(.INIT(1'b0) ) q_2 (.C(clk), .R(reset), .CE(enable), .D(nextdiveup), .Q(Diveup));
    FDRE #(.INIT(1'b0) ) q_1 (.C(clk), .R(reset), .CE(enable), .D(nextdive), .Q(Dive));
    FDRE #(.INIT(1'b1) ) q_0 (.C(clk), .R(reset), .CE(enable), .D(nextinit), .Q(Init));
    wire countup = (Dive | Jump) & ~Death;
    wire countdw = (Diveup | Jumpdown) & ~Death;
    frogCounter counter (.Up(countup & frame), .Dw(countdw & frame), .clk(clk), .reset(reset), .Frame32(Frame32), .Frame0(Frame0), .Q(Q[9:0]));
    wire Diver,Jumper;
    FDRE #(.INIT(1'b0) ) q_7 (.C(clk), .R(reset), .CE(nextjump | nextdive), .D(nextjump), .Q(Jumper));
    FDRE #(.INIT(1'b0) ) q_6 (.C(clk), .R(reset), .CE(nextjump|nextdive), .D(nextdive), .Q(Diver));
    assign starty[9:0] = ({10{Death}} & (({10{Jumper}} & 10'd239 - (Q[9:0]+Q[9:0]+Q[9:0])) | ({10{Diver}} & 10'd239 + (Q[9:0]+Q[9:0]+Q[9:0])) | ({10{~Jumper}} & {10{~Diver}} & 10'd239))) | ({10{~Death}} & (10'd239 & {10{~Dive}} & {10{~Diveup}} & {10{~Jump}} & {10{~Jumpdown}}) | (({10{Jump}}|{10{Jumpdown}}) & (10'd239 - (Q[9:0]+Q[9:0]+Q[9:0]))) | (({10{Dive}}|{10{Diveup}}) & (10'd239 + (Q[9:0]+Q[9:0]+Q[9:0]))));
endmodule
