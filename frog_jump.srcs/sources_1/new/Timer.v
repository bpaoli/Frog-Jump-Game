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


module Timer(
    input qsec,
    input enable,
    input reset,
    input clk,
    output [3:0] out,
    output twoSecs,
    output onesec,
    output flashsig
    );
    wire utcBus;
    wire [3:0] monitor;
    wire upCount, up;
    assign up = qsec& ((~monitor[3] & ~monitor[2] & monitor[1] & monitor[0]) | (monitor[0] & monitor[1] & monitor[2] & ~monitor[3]) | (monitor[0] & monitor[1] & ~monitor[2] & monitor[3]) | (monitor[0] & monitor[1] & monitor[2] & monitor[3]));
    assign onesec = up;
    assign twoSecs = ~out[3] & ~out[2] & out[1] & ~out[0];
    fourBitCounter full0 (.Up(up), .clk(clk), .enable(enable), .reset(reset), .Q(out[3:0]), .UTC(utcBus));
    fourBitCounter quarter (.Up(qsec), .clk(clk), .enable(enable), .reset(reset), .Q(monitor[3:0]), .UTC(upCount));
endmodule
