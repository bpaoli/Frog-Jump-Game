`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 05:29:48 PM
// Design Name: 
// Module Name: plants
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


module plants(
    input [9:0] x,
    input [9:0] y,
    input [9:0]startx,
    input [9:0] starty,
    output [9:0]leftx,
    output [9:0]topy,
    output [9:0]bottomy,
    output plant
    );
    assign leftx[9:0] = startx[9:0] - 10'd39;
    assign bottomy[9:0] = starty[9:0] + 10'd48;
    assign topy[9:0] = starty[9:0] - 10'd48;
    wire int1 = (((startx[9:0] > leftx[9:0]) & (x[9:0]<= startx[9:0] & x[9:0]>= leftx[9:0])) | ((startx[9:0] < leftx[9:0])) & (x[9:0] <=startx[9:0] & x[9:0] <=leftx[9:0]));
    wire int2 =(y[9:0]>= (starty[9:0] - 10'd48) & y[9:0]<=(starty[9:0] + 10'd48));
    assign plant = int1 & int2;
    
endmodule
