`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2022 01:21:29 AM
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


module countUD4L(
    input clk,
    input Up,
    input Dw,
    input LD,
    input reset,
    input [3:0] Din,
    output [3:0] Q,
    output UTC,
    output DTC
    );
    wire enable;
    wire [3:0] inD;
    assign enable = LD | (Up^Dw);
    assign inD[3] = (LD & Din[3]) ^ (~LD&(Up&((Q[3] & ~Q[0]) | (Q[3] & ~Q[1]) | (Up& ~Q[3] & Q[2] & Q[1] & Q[0]) | (Q[3] & ~Q[2]) | (~Up & Q[3]))     |     Dw&((Q[3] & Q[2]) | (Q[3] & Q[0]) | (Q[3] & Q[1]) | (~Dw & Q[3]) | (Dw & ~Q[3] & ~Q[2] & ~Q[1] & ~Q[0]))));
    assign inD[2] = (LD & Din[2]) ^ (~LD&(Up&((Q[2] & ~Q[0]) | (Q[2] & ~Q[1]) | (~Up & Q[2]) | (Up & ~Q[2] & Q[1] & Q[0]))     |     Dw&((Q[2] & Q[1]) | (Q[2] & Q[0]) | (~Dw & Q[2]) | (Dw & ~Q[2] & ~Q[1] & ~Q[0]))));
    assign inD[1] = (LD & Din[1]) ^ (~LD&(Up&((Q[1] & ~Q[0]) | (Up & ~Q[1] & Q[0]) | (~Up & Q[1]))     |     Dw&((Q[1] & Q[0]) | (~Dw & Q[1]) | (Dw & ~Q[1] & ~Q[0]))));
    assign inD[0] = (LD & Din[0]) ^ (~LD&(Up&((Up & ~Q[0]) | (~Up & Q[0]))     |     Dw&((Dw & ~Q[0]) | (~Dw & Q[0]))));
    FDRE #(.INIT(1'b0) ) q_3 (.C(clk), .R(reset), .CE(enable), .D(inD[3]), .Q(Q[3]));
    FDRE #(.INIT(1'b0) ) q_2 (.C(clk), .R(reset), .CE(enable), .D(inD[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0) ) q_1 (.C(clk), .R(reset), .CE(enable), .D(inD[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0) ) q_0 (.C(clk), .R(reset), .CE(enable), .D(inD[0]), .Q(Q[0]));
    assign UTC = Q[3] & Q[2] & Q[1] & Q[0];
    assign DTC = ~Q[3] & ~Q[2] & ~Q[1] & ~Q[0];
endmodule