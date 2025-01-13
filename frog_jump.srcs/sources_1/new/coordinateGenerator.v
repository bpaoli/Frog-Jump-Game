`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2022 04:17:51 PM
// Design Name: 
// Module Name: coordinateGenerator
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


module coordinateGenerator(
    input pixelClock,
    input reset,
    output [9:0] x,
    output [9:0] y,
    output hsync,
    output vsync,
    output frame
    );
    wire [7:0] utc;
    wire [8:0] up;
    wire resetH, resetV;
    assign up[0] = 1'b1;
    assign up[1] = up[0] & utc[0];
    assign up[2] = up[0] & utc[0] & utc[1];
    assign up[3] = up[0] & utc[0] & utc[1] & utc[2];
    assign up[4] = up[0] & utc[0] & utc[1] & utc[2] & utc[3];
    assign resetH = x[9] & x[8] & ~x[7] & ~x[6] & ~x[5] & x[4] & x[3] & x[2] & x[1] & x[0];
    countUD2L h4 (.Up(up[4]), .clk(pixelClock), .reset(reset | resetH), .Q(x[9:8]), .UTC());
    countUD2L h3 (.Up(up[3]), .clk(pixelClock), .reset(reset | resetH), .Q(x[7:6]), .UTC(utc[3]));
    countUD2L h2 (.Up(up[2]), .clk(pixelClock), .reset(reset | resetH), .Q(x[5:4]), .UTC(utc[2]));
    countUD2L h1 (.Up(up[1]), .clk(pixelClock), .reset(reset | resetH), .Q(x[3:2]), .UTC(utc[1]));
    countUD2L h0 (.Up(up[0]), .clk(pixelClock), .reset(reset | resetH), .Q(x[1:0]), .UTC(utc[0]));
    
    assign up[5] = resetH & utc[4];
    assign up[6] = resetH & utc[4] & utc[5];
    assign up[7] = resetH & utc[4] & utc[5] & utc[6];
    assign up[8] = resetH & utc[4] & utc[5] & utc[6] & utc[7];
    assign resetV = y[9] & ~y[8] & ~y[7] & ~y[6] & ~y[5] & ~y[4] & y[3] & y[2] & ~y[1] & ~y[0] & x[9] & x[8] & ~x[7] & ~x[6] & ~x[5] & x[4] & x[3] & x[2] & x[1] & x[0];
    countUD2L v4 (.Up(up[8]), .clk(pixelClock), .reset(reset | resetV), .Q(y[9:8]), .UTC());
    countUD2L v3 (.Up(up[7]), .clk(pixelClock), .reset(reset | resetV), .Q(y[7:6]), .UTC(utc[7]));
    countUD2L v2 (.Up(up[6]), .clk(pixelClock), .reset(reset | resetV), .Q(y[5:4]), .UTC(utc[6]));
    countUD2L v1 (.Up(up[5]), .clk(pixelClock), .reset(reset | resetV), .Q(y[3:2]), .UTC(utc[5]));
    countUD2L v0 (.Up(resetH), .clk(pixelClock), .reset(reset | resetV), .Q(y[1:0]), .UTC(utc[4]));
    
    
    //calculating hsync and vsync
    assign hsync = ~(10'd655 <= x[9:0] & x[9:0] <= 10'd750);
    assign vsync = ~(10'd489 <= y[9:0] & y[9:0] <= 10'd490);
    assign frame = x[9] &x[8] &~x[7] &~x[6] &~x[5] &x[4] &x[3] &x[2] &x[1] &x[0] &y[9] &~y[8] &~y[7] &~y[6] &~y[5] &~y[4] &y[3] &y[2] &~y[1] &~y[0];
endmodule
