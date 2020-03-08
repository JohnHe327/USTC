`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/01 22:38:56
// Design Name: 
// Module Name: lab4_3_2_tb
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


module lab4_3_2_tb(
    );
    reg A,G1,G2;
    lab4_3_2 UUT(.A(A),.G1(G1),.G2(G2));
    initial
    begin
    A=0;G1=0;G2=1;
        #40 A=1;
        #20 G1=1;
        #20 G2=0;
        #20 A=0;
        #20 G1=0;
        #20 G2=1;
    end
endmodule
