`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 10:27:50 PM
// Design Name: 
// Module Name: frogCounter
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


module QSEC(
    input Up,
    input clk,
    input reset,
    output qsec
    );
    wire [7:0]Q;
    wire enable = 1'b1;
    wire UTC;
    wire upper = Up & UTC;
    //assign qsec = ~Q[7]& ~Q[6]& Q[5]& Q[4]& Q[3]& Q[2]& Q[1]& Q[0];
    assign qsec = UTC;
    fourBitCounter count1 (.clk(clk), .Up(upper), .reset(reset|qsec), .enable(enable), .Q(Q[7:4]), .UTC());
    fourBitCounter count0 (.clk(clk), .Up(Up), .enable(enable), .reset(reset|qsec), .Q(Q[3:0]), .UTC(UTC));
    
endmodule
