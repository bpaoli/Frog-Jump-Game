`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 05:28:30 PM
// Design Name: 
// Module Name: colorSelector
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


module colorSelector(
    input [9:0]y,
    input [9:0]x,
    input frog,
    input blue,
    input plant,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue
    );
    wire [9:0]int = (y[9:0] - 10'd240) & {10{blue}};
    wire [3:0]int2;
    assign int2[3] = int[7] & blue;
    assign int2[2] = int[6] & blue;
    assign int2[1] = int[5] & blue;
    assign int2[0] = int[4] & blue;
    wire [3:0]var = (4'd15 - int2[3:0]) & {blue, blue, blue, blue};
    wire outrange = x[9:0] > 10'd639;
    assign vgaRed = {frog,frog,frog,frog}&{1'b1, 1'b1, 1'b1, 1'b1}     |     {~frog,~frog,~frog,~frog}&{1'b0, 1'b0, 1'b0, 1'b0};
    assign vgaGreen = ({frog,frog,frog,frog}&{1'b1, 1'b1, 1'b1, 1'b1}     |     {~frog,~frog,~frog,~frog}&({plant, plant, plant, plant}&{1'b1, 1'b1, 1'b1, 1'b1} | {~plant & ~plant & ~plant & ~plant}&{1'b0, 1'b0, 1'b0, 1'b0})) & (~{4{outrange}});
    assign vgaBlue = ({4{frog}}&{4{1'b1}})     |     ({4{~frog}} & (({4{plant}} & {4{1'b0}}) | ({4{~plant}} & ({4{blue}} & var[3:0]))));
endmodule
