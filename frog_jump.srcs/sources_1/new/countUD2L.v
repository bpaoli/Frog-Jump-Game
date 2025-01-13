`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 01:55:28 PM
// Design Name: 
// Module Name: countUD4L
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


module countUD2L(
    input Up,
    input clk,
    input reset,
    output [1:0] Q,
    output UTC
    );
    wire enable;
    assign enable = Up;
    wire [1:0] inD;
    assign inD[1] = ~Up&Q[1] | Q[1]&~Q[0] | Up&~Q[1]&Q[0];
    assign inD[0] = Up ^ Q[0];
    FDRE #(.INIT(1'b0) ) q_1 (.C(clk), .R(reset), .CE(enable), .D(inD[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0) ) q_0 (.C(clk), .R(reset), .CE(enable), .D(inD[0]), .Q(Q[0]));
    assign UTC = Q[1] & Q[0];
endmodule
