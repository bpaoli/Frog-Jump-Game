`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 01:51:32 PM
// Design Name: 
// Module Name: time_counter
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


module scoreCounter(
    input qsec,
    input enable,
    input reset,
    input clk,
    output [15:0] out
    );
    wire [3:0]utcBus;
    wire [3:0] monitor;
    wire [3:0]up;
    assign up[0] = qsec & utcBus[0];
    assign up[1] = qsec& utcBus[1] & utcBus[0];
    assign up[2] = qsec & utcBus[1] & utcBus[2] & utcBus[0];
    assign up[3] = qsec & utcBus[1] & utcBus[2] & utcBus[3] & utcBus[0];
    
    
    fourBitCounter full3 (.Up(up[3]), .clk(clk), .enable(enable), .reset(reset), .Q());
    fourBitCounter full2 (.Up(up[2]), .clk(clk), .enable(enable), .reset(reset), .Q(out[15:12]), .UTC(utcBus[3]));
    fourBitCounter full1 (.Up(up[1]), .clk(clk), .enable(enable), .reset(reset), .Q(out[11:8]), .UTC(utcBus[2]));
    fourBitCounter full0 (.Up(up[0]), .clk(clk), .enable(enable), .reset(reset), .Q(out[7:4]), .UTC(utcBus[1]));
    fourBitCounter quarter (.Up(qsec), .clk(clk), .enable(enable), .reset(reset), .Q(out[3:0]), .UTC(utcBus[0]));
endmodule
