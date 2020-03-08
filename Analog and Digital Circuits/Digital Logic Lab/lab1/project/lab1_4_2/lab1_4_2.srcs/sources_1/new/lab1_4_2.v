`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/12 16:08:56
// Design Name: 
// Module Name: bcdto7segment_dataflow
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


module bcdto7segment_dataflow(
    input x[3:0],
    output reg an[7:0],
    output reg seg[6:0]
    );
    
    always @ (x)
    begin
        an[7]=1;
        an[6]=1;
        an[5]=1;
        an[4]=1;
        an[3]=1;
        an[2]=1;
        an[1]=1;
        an[0]=0;
        seg[0] = (~x[3] & x[2]&~x[1]&~x[0]) | (~x[3] & ~x[2] & ~x[1] & x[0]);
        seg[1] = (~x[3] & x[2] & x[1] & ~x[0]) | (~x[3] & x[2] & ~x[1] & x[0]);
        seg[2] = ~x[3] & ~x[2] & x[1] & ~x[0];
        seg[3] = (~x[3] & ~x[2] & ~x[1] & x[0]) | (~x[3] & x[2] & ~x[1] & ~x[0]) | (~x[3] & x[2] & x[1] & x[0]);
        seg[4] = x[0] | (~x[3] & x[2] & ~x[1]);
        seg[5] = (x[1] & x[0]) | (~x[3] & ~x[2] & x[1]) | (~x[3] & ~x[2] & x[0]);
        seg[6] = (~x[3] & ~x[2] & ~x[1])| (x[2] & x[1] & x[0]);
    end
endmodule
