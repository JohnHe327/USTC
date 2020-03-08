`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/18 21:43:33
// Design Name: 
// Module Name: lab2_2_1
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


module bcdto7(
    input x[3:0],
    output an[7:0],
    output seg[6:0]
    );
    
        assign an[7]=1;
        assign an[6]=1;
        assign an[5]=1;
        assign an[4]=1;
        assign an[3]=1;
        assign an[2]=1;
        assign an[1]=1;
        assign an[0]=0;
        assign seg[0] = (~x[3] & x[2]&~x[1]&~x[0]) | (~x[3] & ~x[2] & ~x[1] & x[0]);
        assign seg[1] = (~x[3] & x[2] & x[1] & ~x[0]) | (~x[3] & x[2] & ~x[1] & x[0]);
        assign seg[2] = ~x[3] & ~x[2] & x[1] & ~x[0];
        assign seg[3] = (~x[3] & ~x[2] & ~x[1] & x[0]) | (~x[3] & x[2] & ~x[1] & ~x[0]) | (~x[3] & x[2] & x[1] & x[0]);
        assign seg[4] = x[0] | (~x[3] & x[2] & ~x[1]);
        assign seg[5] = (x[1] & x[0]) | (~x[3] & ~x[2] & x[1]) | (~x[3] & ~x[2] & x[0]);
        assign seg[6] = (~x[3] & ~x[2] & ~x[1])| (x[2] & x[1] & x[0]);
endmodule
