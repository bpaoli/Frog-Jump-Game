`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 10:27:50 PM
// Design Name: 
// Module Name: frogCounter
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


module frogCounter(
    input Up,
    input Dw,
    input clk,
    input reset,
    output Frame32,
    output Frame0,
    output [9:0]Q
    );
    wire UTC;
    wire[3:0]Din = {4{1'b0}};
    wire LD = 1'b0;
    wire UTC2;
    wire upper = Up & UTC;
    wire [1:0] dtc;
    wire downer = Dw & dtc[0];
    assign Frame0 = ~Q[9]& ~Q[8]& ~Q[7]& ~Q[6]& ~Q[5]& ~Q[4]& ~Q[3]& ~Q[2]& ~Q[1]& Q[0];
    assign Frame32 = ~Q[9]& ~Q[8]& ~Q[7]& ~Q[6]& ~Q[5]& Q[4]& Q[3]& Q[2]& Q[1]& Q[0];
    countUD4L count1 (.clk(clk), .Up(upper), .Dw(downer), .LD(LD), .reset(reset), .Din(Din), .Q(Q[7:4]), .UTC(UTC2), .DTC(dtc[1]));
    countUD4L count0 (.clk(clk), .Up(Up), .Dw(Dw), .LD(LD), .reset(reset), .Din(Din), .Q(Q[3:0]), .UTC(UTC), .DTC(dtc[0]));
    assign Q[9:8] = {2{1'b0}};
    
endmodule
