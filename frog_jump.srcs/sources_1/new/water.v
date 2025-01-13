`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 06:14:01 PM
// Design Name: 
// Module Name: water
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


module water(
    input [9:0]x,
    input [9:0]y,
    output blue
    );
    assign blue = y[9:0]>=10'd240 & y[9:0]<= 10'd479 & x[9:0]<= 10'd639;
endmodule
