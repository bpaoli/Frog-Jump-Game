`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2022 09:21:44 PM
// Design Name: 
// Module Name: frog
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


module frog(
    input [9:0]x,
    input [9:0]y,
    input [9:0]startx,
    input [9:0]starty,
    input flash,
    output color,
    output [9:0]lowerx,
    output [9:0]lowery,
    output [9:0]upperx,
    output[9:0] uppery
    );
    assign lowerx[9:0] = startx[9:0] - 10'd8;
    assign upperx[9:0] = startx[9:0] + 10'd7;
    assign uppery[9:0] = starty[9:0] - 10'd8;
    assign lowery[9:0] = starty[9:0] + 10'd7;
    assign color = ~flash & ((x[9:0]>=lowerx[9:0]) & (x[9:0]<=upperx[9:0]) & (y[9:0]<=lowery[9:0]) & (y[9:0]>=uppery[9:0]));
    
    
    
endmodule
