`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/18 18:54:05
// Design Name: 
// Module Name: lab2_2_1_partA
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


module lab2_2_1_partA(
    input [3:0] v,
    output z,
    output [6:0] seg,
    output [7:0] an
    );
    wire [2:0] t;
    wire [3:0] m;
    comparator_dataflow U1 (v,z);
    lab2_circuitA_dataflow U2 (v[2:0],t[2:0]);
    mux_2to1 U3 (v[3],0,z,m[3]);
    mux_2to1 U4 (v[2],t[2],z,m[2]);
    mux_2to1 U5 (v[1],t[1],z,m[1]);
    mux_2to1 U6 (v[0],t[0],z,m[0]);
    bcdto7 U7 (m,an,seg);
endmodule

module comparator_dataflow(
    input [3:0] v,
    output z
    );
    
    assign z = v[3] & (v[2] | v[1]);
endmodule

module lab2_circuitA_dataflow(
    input [2:0] v,
    output [2:0] M
    );
    
    assign M[2]=v[2]&v[1];
    assign M[1]=&v[2]&~v[1];
    assign M[0]=v[0];
endmodule

module mux_2to1(
    input x,
    input y,
    input s,
    output m
    );
    
    wire a,b,snot;
    
    not(snot,s);
    and(a,x,snot);
    and(b,y,s);
    or(m,a,b);
endmodule

module bcdto7(
    input [3:0] x,
    output [7:0] an,
    output [6:0] seg
    );
    
        assign an[7]=1;
        assign an[6]=1;
        assign an[5]=1;
        assign an[4]=1;
        assign an[3]=1;
        assign an[2]=1;
        assign an[1]=1;
        assign an[0]=0;
        assign seg[0] = (~x[3] & x[2]&~x[1]&~x[0]) | (~x[3] & ~x[2] & ~x[1] & x[0]);
        assign seg[1] = (~x[3] & x[2] & x[1] & ~x[0]) | (~x[3] & x[2] & ~x[1] & x[0]);
        assign seg[2] = ~x[3] & ~x[2] & x[1] & ~x[0];
        assign seg[3] = (~x[3] & ~x[2] & ~x[1] & x[0]) | (~x[3] & x[2] & ~x[1] & ~x[0]) | (~x[3] & x[2] & x[1] & x[0]);
        assign seg[4] = x[0] | (~x[3] & x[2] & ~x[1]);
        assign seg[5] = (x[1] & x[0]) | (~x[3] & ~x[2] & x[1]) | (~x[3] & ~x[2] & x[0]);
        assign seg[6] = (~x[3] & ~x[2] & ~x[1])| (x[2] & x[1] & x[0]);
endmodule
