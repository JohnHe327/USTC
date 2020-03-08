`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/30 13:17:34
// Design Name: 
// Module Name: lab10_1_1_tb
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


module lab10_1_1_tb(
    );
    reg Clk,rst,xin;
    wire yout;
    wire [3:0]cnt;
    lab10_1_1 DUT (Clk,rst,xin,yout,cnt);
    
    initial
    begin
      Clk=0;
        forever
        begin
            #5 Clk=1;
            #5 Clk=0;
        end
    end
    
    initial
    begin
    xin=0;
    #40 xin=1;
    #20 xin=0;
    #60 xin=1;
    #40 xin=0;
    #20 xin=1;
    end
    
    initial
    begin
    rst=1;
    #20 rst=0;
    #170 rst=1;
    end
endmodule
