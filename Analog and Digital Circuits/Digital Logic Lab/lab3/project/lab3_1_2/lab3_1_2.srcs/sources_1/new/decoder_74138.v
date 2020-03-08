`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/25 21:03:36
// Design Name: 
// Module Name: decoder_74138
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


module decoder_74138(
    input [2:0]x,
    input g1,
    input g2a,
    input g2b,
    output [7:0] y
    );
    
    assign y[0]=~(x==3'b000 && {g1,g2a,g2b}==3'b100);
    assign y[1]=~(x==3'b001 && {g1,g2a,g2b}==3'b100);
    assign y[2]=~(x==3'b010 && {g1,g2a,g2b}==3'b100);
    assign y[3]=~(x==3'b011 && {g1,g2a,g2b}==3'b100);
    assign y[4]=~(x==3'b100 && {g1,g2a,g2b}==3'b100);
    assign y[5]=~(x==3'b101 && {g1,g2a,g2b}==3'b100);
    assign y[6]=~(x==3'b110 && {g1,g2a,g2b}==3'b100);
    assign y[7]=~(x==3'b111 && {g1,g2a,g2b}==3'b100);
endmodule