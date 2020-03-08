`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/18 14:07:07
// Design Name: 
// Module Name: lab2_1_1
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


module lab2_1_1(
    output [7:0] an,
    output [6:0] seg
    );
        integer x=4'd5;
        /*wire [3:0] x;
        
        DtoB(i,x);*/
        assign an=8'b11111110;
        assign seg[0] = (~x[3] & x[2]&~x[1]&~x[0]) | (~x[3] & ~x[2] & ~x[1] & x[0]);
        assign seg[1] = (~x[3] & x[2] & x[1] & ~x[0]) | (~x[3] & x[2] & ~x[1] & x[0]);
        assign seg[2] = ~x[3] & ~x[2] & x[1] & ~x[0];
        assign seg[3] = (~x[3] & ~x[2] & ~x[1] & x[0]) | (~x[3] & x[2] & ~x[1] & ~x[0]) | (~x[3] & x[2] & x[1] & x[0]);
        assign seg[4] = x[0] | (~x[3] & x[2] & ~x[1]);
        assign seg[5] = (x[1] & x[0]) | (~x[3] & ~x[2] & x[1]) | (~x[3] & ~x[2] & x[0]);
        assign seg[6] = (~x[3] & ~x[2] & ~x[1])| (x[2] & x[1] & x[0]);
endmodule
