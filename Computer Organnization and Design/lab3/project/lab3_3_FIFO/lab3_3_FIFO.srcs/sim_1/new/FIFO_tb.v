`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/11 19:01:51
// Design Name: 
// Module Name: FIFO_tb
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


module FIFO_tb(
    );
    reg en_out,en_in;
    reg [3:0] in;
    reg rst,CLK100MHZ;
    wire [15:0] display;
    wire [3:0] out;
    wire empty,full;
    wire clk;
    
    initial begin
      CLK100MHZ=0;
        forever #5 CLK100MHZ=~CLK100MHZ;
    end
    initial begin
      rst=0;
        #3 rst=1;
        #3 rst=0;
    end
    
endmodule
