`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 11:25:15 PM
// Design Name: 
// Module Name: plantCounter
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


module plantCounter(
    input reset,
    input frame,
    input death,
    input start,
    input btnC,
    input [9:0] initx,
    input clk,
    output [9:0]x,
    output counthigh,
    output countlow,
    output Init,
    output Moving,
    output Respawn,
    output Death
    );
    //wire Init, Moving, Respawn, Death;
    wire nextinit, nextmoving, nextrespawn, nextdeath;
    wire enable = 1'b1;
    assign nextinit = Death & btnC | ~start & Init;
    assign nextmoving = Moving & ~death & ~counthigh | Respawn & ~death & start | Init &start;
    assign nextrespawn = Moving & counthigh;
    assign nextdeath = Moving & death | Respawn & death | Death &~btnC;
    
    FDRE #(.INIT(1'b1) ) q_3 (.C(clk), .R(reset), .CE(enable), .D(nextinit), .Q(Init));
    FDRE #(.INIT(1'b0) ) q_2 (.C(clk), .R(reset), .CE(enable), .D(nextmoving), .Q(Moving));
    FDRE #(.INIT(1'b0) ) q_1 (.C(clk), .R(reset), .CE(enable), .D(nextrespawn), .Q(Respawn));
    FDRE #(.INIT(1'b0) ) q_0 (.C(clk), .R(reset), .CE(enable), .D(nextdeath), .Q(Death));
    
    
   // wire [11:0]K;
    //wire Dw = 1'b0;
    //wire [11:0]Din;
   // wire UTC, DTC, load;
   // assign load = counthigh;
   // assign Din[11:10] = {1'b0, 1'b0};
   // assign Din[9:0] = ({10{LD}}&initx[9:0]) ^ ({10{load}} & 10'b0);
   // counterUD12L counter(.clk(clk), .Up(Moving&frame), .Dw(Dw), .LD(LD | load), .reset(reset), .Din(Din[11:0]), .Q(K[11:0]), .UTC(UTC), .DTC(DTC), .counthigh(counthigh), .countlow(countlow));
   // assign x[9:0] = 10'd799-(K[9:0] + K[9:0] + K[9:0] + K[9:0]);
    

    assign counthigh = (~x[9] & ~x[8] & ~x[7] & ~x[6] & ~x[5] & ~x[4] & ~x[3] & x[2] & ~x[1] & ~x[0]) | (~x[9] & ~x[8] & ~x[7] & ~x[6] & ~x[5] & ~x[4] & ~x[3] & x[2] & ~x[1] & x[0]);
    assign countlow = x[9] & x[8] & ~x[7] & ~x[6] & ~x[5] & x[4] & x[3] & x[2] & x[1] & x[0];
    wire [9:0] nextx = ({10{Init}} & initx[9:0]) | ({10{Moving}} & (x[9:0] - 10'd3)) | ({10{Respawn}} & 10'd799) | ({10{Death}} & x[9:0]);
    FDRE #(.INIT(1'b0) ) i9 (.C(clk), .R(reset), .CE(frame), .D(nextx[9]), .Q(x[9]));
    FDRE #(.INIT(1'b0) ) i8 (.C(clk), .R(reset), .CE(frame), .D(nextx[8]), .Q(x[8]));
    FDRE #(.INIT(1'b0) ) i7 (.C(clk), .R(reset), .CE(frame), .D(nextx[7]), .Q(x[7]));
    FDRE #(.INIT(1'b0) ) i6 (.C(clk), .R(reset), .CE(frame), .D(nextx[6]), .Q(x[6]));
    FDRE #(.INIT(1'b0) ) i5 (.C(clk), .R(reset), .CE(frame), .D(nextx[5]), .Q(x[5]));
    FDRE #(.INIT(1'b0) ) i4 (.C(clk), .R(reset), .CE(frame), .D(nextx[4]), .Q(x[4]));
    FDRE #(.INIT(1'b0) ) i3 (.C(clk), .R(reset), .CE(frame), .D(nextx[3]), .Q(x[3]));
    FDRE #(.INIT(1'b0) ) i2 (.C(clk), .R(reset), .CE(frame), .D(nextx[2]), .Q(x[2]));
    FDRE #(.INIT(1'b0) ) i1 (.C(clk), .R(reset), .CE(frame), .D(nextx[1]), .Q(x[1]));
    FDRE #(.INIT(1'b0) ) i0 (.C(clk), .R(reset), .CE(frame), .D(nextx[0]), .Q(x[0]));
endmodule
