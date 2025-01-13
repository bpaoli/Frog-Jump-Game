`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 06:30:33 PM
// Design Name: 
// Module Name: disp_ring_counter
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


module ringCounter(
    input Advance,
    input clk,
    input reset,
    output [3:0] Q  
    );
    wire enable;
    assign enable = Advance;
    FDRE #(.INIT(1'b0) ) q_3 (.C(clk), .R(reset), .CE(enable), .D(Q[2]), .Q(Q[3]));
    FDRE #(.INIT(1'b0) ) q_2 (.C(clk), .R(reset), .CE(enable), .D(Q[1]), .Q(Q[2]));
    FDRE #(.INIT(1'b0) ) q_1 (.C(clk), .R(reset), .CE(enable), .D(Q[0]), .Q(Q[1]));
    FDRE #(.INIT(1'b1) ) q_0 (.C(clk), .R(reset), .CE(enable), .D(Q[3]), .Q(Q[0]));
endmodule
