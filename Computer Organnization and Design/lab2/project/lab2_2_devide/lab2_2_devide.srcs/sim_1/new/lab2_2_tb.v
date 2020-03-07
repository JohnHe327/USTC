`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/29 15:08:03
// Design Name: 
// Module Name: lab2_2_tb
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


module lab2_2_tb(
    );
    reg [3:0]X,y;
    reg rst,clk;
    wire [3:0]q,r;
    wire err,done;
    
    lab2_2 DUT (X,y,rst,clk,q,r,err,done);
    initial
    begin
     clk=1;
        forever #5 clk=~clk;
    end
    
    initial
    begin
        rst=0;
        #3 rst=1;
        #5 rst=0;
    end
    
    initial
    begin
        X=4'd15;
        y=4'd4;
    end
endmodule
