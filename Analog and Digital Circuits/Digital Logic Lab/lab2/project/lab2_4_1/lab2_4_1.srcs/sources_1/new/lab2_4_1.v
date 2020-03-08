`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/19 12:22:47
// Design Name: 
// Module Name: lab2_4_1
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

module lab2_4_1(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
    );
    wire [3:0] p;
    wire [3:0] g;
    
    fulladder(a[0],b[0],p[0],g[0]);
    fulladder(a[1],b[1],p[1],g[1]);
    fulladder(a[2],b[2],p[2],g[2]);
    fulladder(a[3],b[3],p[3],g[3]);
    CLA(cin,p,g,sum,cout);
endmodule

module fulladder(
    input a,
    input b,
    output p,
    output g
    );
    
    assign p=a^b;
    assign g=a&b;
endmodule

module CLA(
    input cin,
    input [3:0] p,
    input [3:0] g,
    output [3:0] s,
    output cout
    );
    wire [2:0] c;
    
    assign s[0]=cin^p[0];
    assign c[0]=g[0] | p[0]&cin;
    assign s[1]=c[0]^p[1];
    assign c[1]=g[1] | p[1]&c[0];
    assign s[2]=c[1]^p[2];
    assign c[2]=g[2] | p[2]&c[1];
    assign s[3]=c[2]^p[3];
    assign cout=g[3] | p[3]&c[2];
endmodule