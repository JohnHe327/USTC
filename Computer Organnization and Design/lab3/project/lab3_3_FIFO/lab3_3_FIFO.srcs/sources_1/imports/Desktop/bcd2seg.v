`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/07 17:54:31
// Design Name: 
// Module Name: bi2seg_r
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


module bcd2seg(
    input [3:0]x,
    output [6:0] seg0
    );
    assign seg0[0] = x==4'd1 || x==4'd4;
    assign seg0[1] = x==4'd5 || x==4'd6;
    assign seg0[2] = x==4'd2;
    assign seg0[3] = x==4'd1 || x==4'd4 || x==4'd7;
    assign seg0[4] = x==4'd1 || x==4'd3 || x==4'd4 || x==4'd5 || x==4'd7 || x==4'd9;
    assign seg0[5] = x==4'd1 || x==4'd2 || x==4'd3 || x==4'd7;
    assign seg0[6] = x==4'd1 || x==4'd7 || x==4'd0;
endmodule
