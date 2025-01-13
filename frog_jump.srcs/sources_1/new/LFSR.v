`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 01:50:32 PM
// Design Name: 
// Module Name: randum_number_generator
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


module LFSR(
    input clk,
    input reset,
    input ST,
    output [7:0] Q
    );
    wire enable, in;
    assign enable =  ST;
    FDRE #(.INIT(1'b0) ) q_7 (.C(clk), .R(reset), .CE(enable), .D(Q[6]), .Q(Q[7]));
    FDRE #(.INIT(1'b0) ) q_6 (.C(clk), .R(reset), .CE(enable), .D(Q[5]), .Q(Q[6]));
    FDRE #(.INIT(1'b0) ) q_5 (.C(clk), .R(reset), .CE(enable), .D(Q[4]), .Q(Q[5]));
    FDRE #(.INIT(1'b0) ) q_4 (.C(clk), .R(reset), .CE(enable), .D(Q[3]), .Q(Q[4]));
    FDRE #(.INIT(1'b0) ) q_3 (.C(clk), .R(reset), .CE(enable), .D(Q[2]), .Q(Q[3]));
    FDRE #(.INIT(1'b0) ) q_2 (.C(clk), .R(reset), .CE(enable), .D(Q[1]), .Q(Q[2]));
    FDRE #(.INIT(1'b0) ) q_1 (.C(clk), .R(reset), .CE(enable), .D(Q[0]), .Q(Q[1]));
    FDRE #(.INIT(1'b1) ) q_0 (.C(clk), .R(reset), .CE(enable), .D(in), .Q(Q[0]));
    assign in = (Q[0]^Q[5]^Q[6]^Q[7]); //| Q[7];
endmodule
