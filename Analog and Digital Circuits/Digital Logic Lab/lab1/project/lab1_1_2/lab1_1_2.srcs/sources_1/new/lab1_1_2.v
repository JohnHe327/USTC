`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/12 12:46:59
// Design Name: 
// Module Name: lab1_1_2
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


module lab1_1_2(
    input x[1:0],
    input y[1:0],
    input s,
    output m[1:0]
    );
   
    wire [1:0] a,b;
    wire snot;
    
    not(snot,s);
    and(a[0],x[0],snot);
    and(a[1],x[1],snot);
    and(b[0],y[0],s);
    and(b[1],y[1],s);
    or(m[0],a[0],b[0]);
    or(m[1],a[1],b[1]);
    
endmodule
