`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2022 03:16:20 PM
// Design Name: 
// Module Name: plantRandomizer
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


module plantRandomizer(
    input clk,
    input [2:0]count0,
    input reset,
    output[9:0]y0,
    output[9:0]y1,
    output[9:0]y2
    );
    wire [9:0] int;
    wire [7:0] out;
    LFSR random (.clk(clk), .reset(reset), .ST((~count0[0] & ~count0[1] & ~count0[2])), .Q(out[7:0]));
    assign int[9:5] = 1'b0;
    assign int[4] = out[4];
    assign int[3] = out[3];
    assign int[2] = out[2];
    assign int[1:0] = 1'b0;
    wire[9:0]D = ({10{out[5]}} & (10'd239 + int[9:0])) | ({10{~out[5]}} & (10'd239 - int[9:0]));
    
    FDRE #(.INIT(1'b0) ) y09 (.C(clk), .R(reset), .CE(count0[0]), .D(D[9]), .Q(y0[9]));
    FDRE #(.INIT(1'b0) ) y08 (.C(clk), .R(reset), .CE(count0[0]), .D(D[8]), .Q(y0[8]));
    FDRE #(.INIT(1'b1) ) y07 (.C(clk), .R(reset), .CE(count0[0]), .D(D[7]), .Q(y0[7]));
    FDRE #(.INIT(1'b1) ) y06 (.C(clk), .R(reset), .CE(count0[0]), .D(D[6]), .Q(y0[6]));
    FDRE #(.INIT(1'b1) ) y05 (.C(clk), .R(reset), .CE(count0[0]), .D(D[5]), .Q(y0[5]));
    FDRE #(.INIT(1'b0) ) y04 (.C(clk), .R(reset), .CE(count0[0]), .D(D[4]), .Q(y0[4]));
    FDRE #(.INIT(1'b1) ) y03 (.C(clk), .R(reset), .CE(count0[0]), .D(D[3]), .Q(y0[3]));
    FDRE #(.INIT(1'b1) ) y02 (.C(clk), .R(reset), .CE(count0[0]), .D(D[2]), .Q(y0[2]));
    FDRE #(.INIT(1'b1) ) y01 (.C(clk), .R(reset), .CE(count0[0]), .D(D[1]), .Q(y0[1]));
    FDRE #(.INIT(1'b1) ) y00 (.C(clk), .R(reset), .CE(count0[0]), .D(D[0]), .Q(y0[0]));
    
    FDRE #(.INIT(1'b0) ) y19 (.C(clk), .R(reset), .CE(count0[1]), .D(D[9]), .Q(y1[9]));
    FDRE #(.INIT(1'b0) ) y18 (.C(clk), .R(reset), .CE(count0[1]), .D(D[8]), .Q(y1[8]));
    FDRE #(.INIT(1'b1) ) y17 (.C(clk), .R(reset), .CE(count0[1]), .D(D[7]), .Q(y1[7]));
    FDRE #(.INIT(1'b1) ) y16 (.C(clk), .R(reset), .CE(count0[1]), .D(D[6]), .Q(y1[6]));
    FDRE #(.INIT(1'b1) ) y15 (.C(clk), .R(reset), .CE(count0[1]), .D(D[5]), .Q(y1[5]));
    FDRE #(.INIT(1'b0) ) y14 (.C(clk), .R(reset), .CE(count0[1]), .D(D[4]), .Q(y1[4]));
    FDRE #(.INIT(1'b1) ) y13 (.C(clk), .R(reset), .CE(count0[1]), .D(D[3]), .Q(y1[3]));
    FDRE #(.INIT(1'b1) ) y12 (.C(clk), .R(reset), .CE(count0[1]), .D(D[2]), .Q(y1[2]));
    FDRE #(.INIT(1'b1) ) y11 (.C(clk), .R(reset), .CE(count0[1]), .D(D[1]), .Q(y1[1]));
    FDRE #(.INIT(1'b1) ) y10 (.C(clk), .R(reset), .CE(count0[1]), .D(D[0]), .Q(y1[0]));
  
    FDRE #(.INIT(1'b0) ) y29 (.C(clk), .R(reset), .CE(count0[2]), .D(D[9]), .Q(y2[9]));
    FDRE #(.INIT(1'b0) ) y28 (.C(clk), .R(reset), .CE(count0[2]), .D(D[8]), .Q(y2[8]));
    FDRE #(.INIT(1'b1) ) y27 (.C(clk), .R(reset), .CE(count0[2]), .D(D[7]), .Q(y2[7]));
    FDRE #(.INIT(1'b1) ) y26 (.C(clk), .R(reset), .CE(count0[2]), .D(D[6]), .Q(y2[6]));
    FDRE #(.INIT(1'b1) ) y25 (.C(clk), .R(reset), .CE(count0[2]), .D(D[5]), .Q(y2[5]));
    FDRE #(.INIT(1'b0) ) y24 (.C(clk), .R(reset), .CE(count0[2]), .D(D[4]), .Q(y2[4]));
    FDRE #(.INIT(1'b1) ) y23 (.C(clk), .R(reset), .CE(count0[2]), .D(D[3]), .Q(y2[3]));
    FDRE #(.INIT(1'b1) ) y22 (.C(clk), .R(reset), .CE(count0[2]), .D(D[2]), .Q(y2[2]));
    FDRE #(.INIT(1'b1) ) y21 (.C(clk), .R(reset), .CE(count0[2]), .D(D[1]), .Q(y2[1]));
    FDRE #(.INIT(1'b1) ) y20 (.C(clk), .R(reset), .CE(count0[2]), .D(D[0]), .Q(y2[0]));
    
endmodule
