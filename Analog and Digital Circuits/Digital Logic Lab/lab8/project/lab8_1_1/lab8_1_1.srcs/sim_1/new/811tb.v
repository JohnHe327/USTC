`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/16 15:00:17
// Design Name: 
// Module Name: 811tb
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


module lab811tb(
    );
    reg rst,clk100;
    wire Q,lock;
    lab8_1_1 DUT (rst,clk100,Q,lock);
    initial
    begin
    clk100=0;
    forever
    begin
    #1000 clk100=1;
    #1000 clk100=0;
    end
    end
    
    initial
    begin
    rst=1;
    #5 rst=0;
    #5 rst=1;
    end
endmodule
