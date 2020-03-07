`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/21 20:10:57
// Design Name: 
// Module Name: lab1_3_3
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


module lab1_3_3(
    input [3:0]a,
    input [3:0]b,
    input clk,
    input rst,
    output reg [15:0]y
    );
    reg [15:0] y0;
    reg [15:0] y1;
    
    always @(posedge rst or posedge clk)
    begin
        if(rst)
        begin
            y0=b;
            y1=a+b;
            y=0;
        end
        else
        begin
            y=y1;
            y1=y+y0;
            y0=y;
        end
    end
endmodule
