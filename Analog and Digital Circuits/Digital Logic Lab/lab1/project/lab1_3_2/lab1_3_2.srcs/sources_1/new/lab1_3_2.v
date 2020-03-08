`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/12 15:49:01
// Design Name: 
// Module Name: lab1_3_2
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


module lab1_3_2(
    input [1:0] x,
    input [1:0] y,
    input s,
    output reg [1:0]m
    );
    
    always @ (x or y or s)
    begin
        if(s==0)
        begin
            m[0]=x[0];
            m[1]=x[1];
        end
        else
        begin
            m[0]=y[0];
            m[1]=y[1];
        end
    end
endmodule
