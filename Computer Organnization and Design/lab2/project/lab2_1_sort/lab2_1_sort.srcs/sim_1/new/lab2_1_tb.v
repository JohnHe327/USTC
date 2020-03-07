`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/29 13:53:34
// Design Name: 
// Module Name: lab2_1_tb
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


module lab2_1_tb(
    );
    reg [3:0]x0,x1,x2,x3;
    reg clk,rst;
    wire [3:0] s0,s1,s2,s3;
    wire done;
    
    lab2_1 DUT (x0,x1,x2,x3,clk,rst,s0,s1,s2,s3,done);
    
    initial
    begin
     clk=0;
        forever #5 clk=~clk;
    end
    initial
    begin
        x0=4'd9;
        x1=4'd15;
        x2=4'd3;
        x3=4'd5;
    end 
    initial
    begin
        #3 rst=1;
        #5 rst=0;
    end
endmodule
