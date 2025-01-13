`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 04:58:34 PM
// Design Name: 
// Module Name: fourBitCounter
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


module fourBitCounter(
    input clk,
    input Up,
    input enable,
    
    input reset,
    output [3:0] Q,
    output UTC
    
    );
    wire [3:0] inD;
    assign inD[3] =Up&((Q[3] & ~Q[0]) | (Q[3] & ~Q[1]) | (Up& ~Q[3] & Q[2] & Q[1] & Q[0]) | (Q[3] & ~Q[2]) | (~Up & Q[3]));
    assign inD[2] =Up&((Q[2] & ~Q[0]) | (Q[2] & ~Q[1]) | (~Up & Q[2]) | (Up & ~Q[2] & Q[1] & Q[0]));
    assign inD[1] =Up&((Q[1] & ~Q[0]) | (Up & ~Q[1] & Q[0]) | (~Up & Q[1]));
    assign inD[0] =Up&((Up & ~Q[0]) | (~Up & Q[0]));
    FDRE #(.INIT(1'b0) ) q_3 (.C(clk), .R(reset), .CE(enable & Up), .D(inD[3]), .Q(Q[3]));
    FDRE #(.INIT(1'b0) ) q_2 (.C(clk), .R(reset), .CE(enable & Up), .D(inD[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0) ) q_1 (.C(clk), .R(reset), .CE(enable & Up), .D(inD[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0) ) q_0 (.C(clk), .R(reset), .CE(enable & Up), .D(inD[0]), .Q(Q[0]));
    assign UTC = Q[3] & Q[2] & Q[1] & Q[0];
endmodule
