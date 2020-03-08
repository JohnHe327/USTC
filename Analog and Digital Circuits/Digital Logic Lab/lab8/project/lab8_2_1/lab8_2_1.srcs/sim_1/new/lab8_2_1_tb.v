`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/18 00:20:36
// Design Name: 
// Module Name: lab8_2_1_tb
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


module lab8_2_1_tb(
    );
    reg CLK100MHZ,rst;
    wire [7:0]AN;
    wire [6:0]seg;
    
     lab8_2_1 UUT (.rst(rst),.CLK100MHZ(CLK100MHZ),.AN(AN),.seg(seg));
     
    initial
    begin
    rst=1;
    #50 rst=0;
    end
    
   initial
   begin
   CLK100MHZ=0;
   forever
   begin
   #5 CLK100MHZ=1;
   #5 CLK100MHZ=0;
   end
   end
endmodule
