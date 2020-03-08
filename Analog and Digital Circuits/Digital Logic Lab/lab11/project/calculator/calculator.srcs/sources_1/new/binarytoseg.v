`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/07 17:15:58
// Design Name: 
// Module Name: binarytoseg
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


module bitoseg(
    input [7:0]in1,
    input [7:0]in2,
    input t,
    output [7:0]seg0,
    output [7:0]seg1,
    output [7:0]seg2,
    output reg [7:0]seg3
    );
    reg [3:0] d0,d1,d2;
    always @ *
    if(t==1)
    begin
        seg3<=8'b01111001;
        d0<=in1%10;
        d1<=in1/10%10;
        d2<=in1/100;
    end
    else
    begin
        seg3<=8'b00100100;
        d0<=in2%10;
        d1<=in2/10%10;
        d2<=in2/100;
    end
    
    bcdtoseg b2s0(d0,seg0);
    bcdtoseg b2s1(d1,seg1);
    bcdtoseg b2s2(d2,seg2);
    
endmodule

module bcdtoseg(
    input [3:0]x,
    output [7:0] seg0
    );
    assign seg0[0] = x==4'd1 || x==4'd4;
    assign seg0[1] = x==4'd5 || x==4'd6;
    assign seg0[2] = x==4'd2;
    assign seg0[3] = x==4'd1 || x==4'd4 || x==4'd7;
    assign seg0[4] = x==4'd1 || x==4'd3 || x==4'd4 || x==4'd5 || x==4'd7 || x==4'd9;
    assign seg0[5] = x==4'd1 || x==4'd2 || x==4'd3 || x==4'd7;
    assign seg0[6] = x==4'd1 || x==4'd7 || x==4'd0;
    assign seg0[7] = 1;
endmodule
